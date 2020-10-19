unit Ttn.ResultStorage;

interface

uses
  Ttn.Interfaces,
  Ttn.Enum.EnumerableList;

type
  TTtnResultStorage = class(TTtnEnumerableList<ITTnResult>, ITtnResultstorage)
    procedure CreateResult(const AName: string);
  private
    FActiveResult: ITTnResult;
    function GetActiveResult: ITTnResult;
    function Load(const ARootFolder: string): Boolean;
    procedure SetActiveResult(const Value: ITTnResult);
    procedure DeleteResult(const AName: string);
    procedure UpdateResult(const AName, AText: string);
  end;

implementation

uses
  System.IOUtils, System.Types, System.SysUtils, System.Classes;

function TTtnResultStorage.GetActiveResult: ITTnResult;
begin
  Result := FActiveResult;
end;

function TTtnResultStorage.Load(const ARootFolder: string): Boolean;
var
  fileArray: TStringDynArray;
  oneFile: string;
  newResult: ITTnResult;
begin
  fileArray := TDirectory.GetFiles(ARootFolder, '*.csv', TSearchOption.soAllDirectories);
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

procedure TTtnResultStorage.CreateResult(const AName: string);
begin
  TFile.WriteAllText(AName, '', TEncoding.UTF8);
end;

procedure TTtnResultStorage.DeleteResult(const AName: string);
begin
  TFile.Delete(AName);
end;

procedure TTtnResultStorage.UpdateResult(const AName, AText: string);
var
  fileWriter: TStreamWriter;
begin
  fileWriter := TFile.AppendText(AName);
  try
    fileWriter.WriteLine(AText);
  finally
    fileWriter.Free();
  end;
end;

end.
