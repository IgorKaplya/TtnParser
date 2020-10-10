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
  end;

implementation

uses
  System.IOUtils, System.Types;

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

end.
