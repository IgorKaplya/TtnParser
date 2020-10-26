unit Ttn.ResultStorage;

interface

uses
  Ttn.Interfaces,
  Ttn.Enum.EnumerableList;

type
  TTtnResultStorage = class(TTtnEnumerableList<ITTnResult>, ITtnResultstorage)
  private
    FActiveResult: ITTnResult;
    FRootFolder: string;
    function GetActiveResult: ITTnResult;
    function Load(const ARootFolder: string): Boolean;
    procedure SetActiveResult(const Value: ITTnResult);
    procedure DeleteResult(const AResult: ITTnResult);
    procedure CreateResult(const AName: string);
    function FindStrorage(const AStoragePath: string; out idx: Integer): Boolean;
    property RootFolder: string read FRootFolder;
  end;

implementation

uses
  System.IOUtils, System.Types, System.SysUtils, System.Classes, Ttn.Constants;

function TTtnResultStorage.GetActiveResult: ITTnResult;
begin
  Result := FActiveResult;
end;

function TTtnResultStorage.Load(const ARootFolder: string): Boolean;
var
  resultsArray: TStringDynArray;
  oneResult: string;
  newResult: ITTnResult;
begin
  resultsArray := TDirectory.GetDirectories(ARootFolder);
  FRootFolder := ARootFolder;
  for oneResult in resultsArray do
  begin
    newResult := Add();
    newResult.Folder := oneResult;
  end;
end;

procedure TTtnResultStorage.SetActiveResult(const Value: ITTnResult);
begin
  FActiveResult := Value;
end;

procedure TTtnResultStorage.CreateResult(const AName: string);
var
  iDummy: Integer;
  newStorage: string;
  newResult: ITTnResult;
begin
  if not AName.IsEmpty then
  begin
    newStorage :=  TPath.Combine(RootFolder, AName);
    TDirectory.CreateDirectory(newStorage);
    if not FindStrorage(newStorage, iDummy) then
    begin
      newResult := Add();
      newResult.Folder := newStorage;
      newResult.Save();
    end;
  end;
end;

procedure TTtnResultStorage.DeleteResult(const AResult: ITTnResult);
var
  i: Integer;
begin
  TDirectory.Delete(AResult.Folder, True);
  for i := Count-1 downto 0 do
    if Items[i]=AResult then
      Delete(i);
end;

function TTtnResultStorage.FindStrorage(const AStoragePath: string; out idx: Integer): Boolean;
begin
  idx := Count;
  repeat
    Dec(idx);
  until (idx<0) or SameText(Items[idx].Folder, AStoragePath);
  Result := idx >= 0;
end;

end.

