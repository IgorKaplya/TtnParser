unit uTtnObjParser;

interface

uses
  uIntfTtnParser, System.Classes, TtnParserErrors, System.Generics.Collections;

type
  TTtnParser = class(TInterfacedObject, ITtnObjParser)
  private
    FConfiguration: TTtnParserConfiguration;
    FHeader: TDictionary<string, integer>;
    function GetConfiguration: TTtnParserConfiguration;
    procedure MapHeader(const AHeader: string);
    procedure ReadConfiguration(const AConfiguration: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Parse(const AFile: string); overload;
    procedure Configure(const AFile: TStrings); overload;
    procedure Parse(const AFile: TStrings); overload;
    property Configuration: TTtnParserConfiguration read GetConfiguration;
    property Header: TDictionary<string, integer> read FHeader;
  end;

implementation

uses
  ttnObj, System.SysUtils, System.StrUtils;

constructor TTtnParser.Create;
begin
  inherited Create;
  FHeader := TDictionary<string, integer>.Create();
end;

destructor TTtnParser.Destroy;
begin
  FreeAndNil(FHeader);
  inherited Destroy;
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

procedure TTtnParser.MapHeader(const AHeader: string);
var
  InputHeader: TStringList;
  field: string;
  idxField: integer;
begin
  InputHeader := TStringList.Create();
  try
    InputHeader.StrictDelimiter := True;
    InputHeader.Delimiter := ';';
    InputHeader.DelimitedText := AHeader.ToLower;
    InputHeader.Sorted := True;
    for field in C_Input_FieldNames do
    begin
      ETtnParserWrongHeader.Test(InputHeader.Find(field, idxField), 'Поле "%s" не найдено в заголовке "%s"',[field, AHeader]);
      Header.AddOrSetValue(field, idxField);
    end;
  finally
    InputHeader.Free();
  end;
end;

procedure TTtnParser.Parse(const AFile: TStrings);
var
  i: Integer;
  inpLine: TStringList;
begin
  inpLine := TStringList.Create('"',';',[soStrictDelimiter]);
  try
    Configure(AFile);
    for i := C_Input_First_Data_Line to AFile.Count-1 do
    begin
      inpLine.DelimitedText := AFile[i];
      ETtnParserWrongLineColumns.Test(
        Header.Count = inpLine.Count,
        'Строка %d: Нессответствие столбцов (%d <> %d)', [i, Header.Count, inpLine.Count]
      );
    end;
  finally
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
