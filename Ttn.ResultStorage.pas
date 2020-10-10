unit Ttn.ResultStorage;

interface

uses
  Ttn.Interfaces,
  Ttn.Enum.EnumerableList;

type
  TTtnResultStorage = class(TTtnEnumerableList<ITTnResult>, ITtnResultstorage)
  private
    FActiveResult: ITTnResult;
    function GetActiveResult: ITTnResult;
    function Load(const AFolder: string): Boolean;
    procedure SetActiveResult(const Value: ITTnResult);
    procedure CreateResult(const AFile: string);
    procedure DeleteResult(const AFile: string);
    procedure UpdateResult(const AFile: string; const AText: string);
  end;

implementation

uses
  System.IOUtils, System.Types, System.SysUtils, System.Classes;

function TTtnResultStorage.GetActiveResult: ITTnResult;
begin
  Result := FActiveResult;
end;

function TTtnResultStorage.Load(const AFolder: string): Boolean;
var
  fileArray: TStringDynArray;
  oneFile: string;
  newResult: ITTnResult;
begin
  fileArray := TDirectory.GetFiles(AFolder, '*.csv', TSearchOption.soAllDirectories);
  for oneFile in fileArray do
  begin
    newResult := Add();
    newResult.FileName := oneFile;
  end;
end;

procedure TTtnResultStorage.SetActiveResult(const Value: ITTnResult);
begin
  FActiveResult := Value;
end;

procedure TTtnResultStorage.CreateResult(const AFile: string);
begin
  TFile.WriteAllText(AFile, '', TEncoding.UTF8);
end;

procedure TTtnResultStorage.DeleteResult(const AFile: string);
begin
  TFile.Delete(AFile);
end;

procedure TTtnResultStorage.UpdateResult(const AFile: string; const AText: string);
var
  fileWriter: TStreamWriter;
begin
  fileWriter := TFile.AppendText(AFile);
  try
    fileWriter.WriteLine(AText);
  finally
    fileWriter.Free();
  end;
end;

end.
