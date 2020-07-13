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
    function LineDataGet(const ASource: TStrings; AHeaderColumn: string): string;
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
  ttnObj, System.SysUtils, System.StrUtils, Spring.Container;

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

function TTtnParser.LineDataGet(const ASource: TStrings; AHeaderColumn:
    string): string;
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
  ttn.SIGN := LineDataGet(inpLine, F_sign);
  ttn.NAME := LineDataGet(inpLine, F_name);
  ttn.COST := LineDataGet(inpLine, F_cost).ToDouble();
  ttn.QUANTITY := LineDataGet(inpLine, F_quant).ToInteger();
  ttn.WEIGHT1 := LineDataGet(inpLine, F_weight).ToDouble;
  ttn.STR_PR := ttn.NAME;
end;
procedure TTtnParser.ParseMotor(const ALineCore, ALineCountry: TStrings);
var
  ttn: ITtnObj;
begin
  ttn := ParseResult.Add;
  ttn.SIGN := LineDataGet(ALineCore, F_sign);
  ttn.NAME := LineDataGet(ALineCore, F_name);
  ttn.COST := LineDataGet(ALineCore, F_cost).ToDouble;
  ttn.QUANTITY := LineDataGet(ALineCore, F_quant).ToInteger();
  ttn.WEIGHT1 := LineDataGet(ALineCore, F_weight).ToDouble;
  ttn.STR_PR := LineDataGet(ALineCountry, F_name);
end;

procedure TTtnParser.ReadConfiguration(const AConfiguration: string);
var
  PossibleConfiguration: TTtnParserConfiguration;
begin
  for PossibleConfiguration in C_All_Parser_Configurations do
    if SameText(Config_String_Alias[PossibleConfiguration], AConfiguration) then
    begin
      FConfiguration := PossibleConfiguration;
      Break;
    end;
  ETtnParserWrongConfig.Test(Configuration <> tpcNone, 'Некорректный заголовок файла. %s.', [AConfiguration]);
end;

end.
