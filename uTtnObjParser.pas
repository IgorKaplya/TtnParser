unit uTtnObjParser;

interface

uses
  uIntfTtnParser, System.Classes, TtnParserErrors;

type
  TTtnParser = class(TInterfacedObject, ITtnObjParser)
  private
    FConfiguration: TTtnParserConfiguration;
    function GetConfiguration: TTtnParserConfiguration;
  public
    procedure Configure(const AFile: string); overload;
    procedure Configure(const AFile: TStrings); overload;
    function Parse(const AText: string; const AObj: TObject): Boolean;
    property Configuration: TTtnParserConfiguration read GetConfiguration;
  end;

implementation

uses
  ttnObj, System.SysUtils;

procedure TTtnParser.Configure(const AFile: string);
var
  sl: TStringList;
begin
  sl := TStringList.Create();
  try
    sl.LoadFromFile(AFile);
    Configure(sl);
  finally
    sl.Free();
  end;
end;

procedure TTtnParser.Configure(const AFile: TStrings);
begin
  {
  if AFile.Count <= 1 then
    raise ETtnParserEmptyInput.Create('Файл данных пуст');
  }
  TestErr(AFile.Count > 1, 'Файл данных пуст', ETtnParserEmptyInput);
end;

function TTtnParser.GetConfiguration: TTtnParserConfiguration;
begin
  Result := FConfiguration;
end;

function TTtnParser.Parse(const AText: string; const AObj: TObject): Boolean;
begin
  Result := false;
  try

  except on E: Exception do ;
  end;
end;

end.
