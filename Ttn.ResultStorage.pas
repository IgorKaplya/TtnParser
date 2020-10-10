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

function TTtnResultStorage.GetActiveResult: ITTnResult;
begin
  Result := FActiveResult;
end;

function TTtnResultStorage.Load(const AFolder: string): Boolean;
begin
  //todo:
end;

procedure TTtnResultStorage.SetActiveResult(const Value: ITTnResult);
begin
  FActiveResult := Value;
end;

end.
