unit Ttn.Parser;

interface

uses
  System.Classes, Ttn.Errors, Ttn.Interfaces, Ttn.Constants, System.Generics.Collections;

type
  TTtnParser = class(TInterfacedObject, ITtnParser, ITtnParserTestable)
  private
    FConfiguration: TTtnParserConfiguration;
    FParseResult: ITtnList;
    FHeader: TDictionary<string, integer>;
    function GetConfiguration: TTtnParserConfiguration;
    procedure MapHeader(const AHeader: string);
    procedure ParseAStrong(const inpLine: TStrings);
    procedure ParseMotor(const ALineCore, ALineCountry: TStrings);
    procedure ReadConfiguration(const AConfiguration: string);
    function LineDataStr(const ASource: TStrings; AHeaderColumn: string): string;
    function LineDataDbl(const ASource: TStrings; AHeaderColumn: string): Double;
    function LineDataInt(const ASource: TStrings; AHeaderColumn: string): Integer;
    function RemoveWhiteSpace(const AStr: string): string;
    procedure ParseAStrongName(AInput: string; const AObj: ITtnObj);
  public
    constructor Create(ATtnList: ITtnList);
    destructor Destroy; override;
    function ColumnIdx(const AColumnName: string): Integer;
    procedure Parse(const AFile: string); overload;
    procedure Configure(const AFile: TStrings); overload;
    function GetParseResult: ITtnList;
    procedure Parse(const AFile: TStrings); overload;
    property Configuration: TTtnParserConfiguration read GetConfiguration;
    property Header: TDictionary<string, integer> read FHeader;
    property ParseResult: ITtnList read GetParseResult;
  end;

implementation

uses
  System.SysUtils, System.StrUtils, Spring.Container, System.Character;

constructor TTtnParser.Create(ATtnList: ITtnList);
begin
  inherited Create;
  FHeader := TDictionary<string, integer>.Create();
  FParseResult := ATtnList;
end;

destructor TTtnParser.Destroy;
begin
  FreeAndNil(FHeader);
  inherited Destroy;
end;

function TTtnParser.ColumnIdx(const AColumnName: string): Integer;
begin
  ETtnParserColumnNotMapped.Test(Header.TryGetValue(AColumnName, Result), 'A header column is not mapped: %s', [AColumnName]);
end;

procedure TTtnParser.Configure(const AFile: TStrings);
begin
  ETtnParserEmptyInput.Test(AFile.Count >= C_Input_Minimal_Lines, 'Файл данных пуст.');
  ReadConfiguration(AFile[0]);
  MapHeader(AFile[1]);
end;

function TTtnParser.GetConfiguration: TTtnParserConfiguration;
begin
  Result := FConfiguration;
end;

function TTtnParser.GetParseResult: ITtnList;
begin
  Result := FParseResult;
end;

function TTtnParser.LineDataDbl(const ASource: TStrings; AHeaderColumn: string): Double;
begin
  Result := RemoveWhiteSpace(LineDataStr(ASource, AHeaderColumn)).ToDouble();
end;

function TTtnParser.LineDataInt(const ASource: TStrings; AHeaderColumn: string): Integer;
begin
  Result := RemoveWhiteSpace(LineDataStr(ASource, AHeaderColumn)).ToInteger();
end;

function TTtnParser.LineDataStr(const ASource: TStrings; AHeaderColumn: string): string;
var
  idxMappedColumn: integer;
begin
  ETtnParserColumnNotMapped.Test(Header.TryGetValue(AHeaderColumn, idxMappedColumn), 'Неизвестное поле данных: %s', [AHeaderColumn]);
  ETtnParserColumnExceedInput.Test(idxMappedColumn < ASource.Count, 'В строке нет достаточного количества полей для "%s".', [AHeaderColumn]);
  Result := ASource[idxMappedColumn];
end;

procedure TTtnParser.MapHeader(const AHeader: string);
var
  InputHeader: TStringList;
  field: string;
  i: Integer;
  idxField: integer;
begin
  InputHeader := TStringList.Create();
  try
    InputHeader.StrictDelimiter := True;
    InputHeader.Delimiter := ';';
    InputHeader.DelimitedText := AHeader.ToLower;
    for i := 0 to InputHeader.Count -1 do
      InputHeader.Objects[i] := Pointer(i);
    InputHeader.Sorted := True;
    for field in C_Input_FieldNames do
    begin
      ETtnParserWrongHeader.Test(InputHeader.Find(field, idxField), 'Поле "%s" не найдено в заголовке "%s"',[field, AHeader]);
      Header.AddOrSetValue(field, Integer(InputHeader.Objects[idxField]));
    end;
  finally
    InputHeader.Free();
  end;
end;

procedure TTtnParser.Parse(const AFile: TStrings);
var
  i: Integer;
  inpLine, inpLineCountry: TStringList;
begin
  inpLine := TStringList.Create('"',';',[soStrictDelimiter]);
  inpLineCountry := TStringList.Create('"',';',[soStrictDelimiter]);
  try
    ParseResult.Clear;
    Configure(AFile);
    i := C_Input_First_Data_Line;
    while i < AFile.Count do
    begin
      inpLine.DelimitedText := AFile[i];
      case Configuration of
      tpcMotor:
        begin
          ETtnParserWrongMotorLines.Test(i < AFile.Count-1, 'Строка %d: Нет страны происхождения ', [i]);
          inpLineCountry.DelimitedText := AFile[i+1];
          ParseMotor(inpLine, inpLineCountry);
          i := i + 2;
        end;
      tpcAutoStrong:
        begin
          ParseAStrong(inpLine);
          Inc(i);
        end;
      else
        ETtnParserWrongConfig.Test(False, 'Неизвестаня конфигурация.');
      end;
    end;
  finally
    inpLineCountry.Free;
    inpLine.Free;
  end;
end;

procedure TTtnParser.Parse(const AFile: string);
var
  sl: TStringList;
begin
  sl := TStringList.Create();
  try
    sl.LoadFromFile(AFile);
    Parse(sl);
  finally
    sl.Free();
  end;
end;

procedure TTtnParser.ParseAStrong(const inpLine: TStrings);
var
  ttn: ITtnObj;
begin
  ttn := ParseResult.Add;
  ttn.SIGN := LineDataStr(inpLine, F_sign);
  ttn.COST := LineDataDbl(inpLine, F_cost);
  ttn.QUANTITY := LineDataInt(inpLine, F_quant);
  ttn.WEIGHT1 := LineDataDbl(inpLine, F_weight);
  ParseAStrongName(LineDataStr(inpLine, F_name), ttn);
end;

procedure TTtnParser.ParseAStrongName(AInput: string; const AObj: ITtnObj);
var
  nameList: TStringList;
begin
  nameList := TStringList.Create('"','*',[soStrictDelimiter]);
  try
    AObj.Name := '';
    AObj.STR_PR := '';
    nameList.DelimitedText := AnsiDequotedStr(AInput, nameList.QuoteChar);
    if nameList.Count > 0 then
    begin
      AObj.Name := Trim(nameList[0]);
      AObj.STR_PR := Trim(nameList[nameList.Count-1]);
    end;
  finally
    nameList.Free();
  end;
end;

procedure TTtnParser.ParseMotor(const ALineCore, ALineCountry: TStrings);
var
  ttn: ITtnObj;
begin
  ttn := ParseResult.Add;
  ttn.SIGN := LineDataStr(ALineCore, F_sign);
  ttn.NAME := LineDataStr(ALineCore, F_name);
  ttn.COST := LineDataDbl(ALineCore, F_cost);
  ttn.QUANTITY := LineDataInt(ALineCore, F_quant);
  ttn.WEIGHT1 := LineDataDbl(ALineCore, F_weight);
  ttn.STR_PR := LineDataStr(ALineCountry, F_name);
end;

procedure TTtnParser.ReadConfiguration(const AConfiguration: string);
var
  PossibleConfiguration: TTtnParserConfiguration;
begin
  for PossibleConfiguration in C_All_Parser_Configurations do
    if AConfiguration.StartsWith(Config_String_Alias[PossibleConfiguration]) then
      FConfiguration := PossibleConfiguration;
  ETtnParserWrongConfig.Test(Configuration <> tpcNone, 'Не удалось определить тип файла. %s.', [AConfiguration]);
end;

function TTtnParser.RemoveWhiteSpace(const AStr: string): string;
var
  charChecked: Char;
begin
  Result := '';
  for charChecked in AStr do
    if not charChecked.IsWhiteSpace then
      Result := Result + charChecked;
end;


end.
