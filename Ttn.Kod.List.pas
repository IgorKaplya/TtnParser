unit Ttn.Kod.List;

interface

uses
  Ttn.Interfaces,
  Ttn.Enum.EnumerableList;

type

  TTtnKodList = class(TTtnEnumerableList<ITtnKod>, ITtnKodList)
  public
    constructor Create(ATtnKodFactory: ITtnFactory<ITtnKod>);
  end;

implementation

constructor TTtnKodList.Create(ATtnKodFactory: ITtnFactory<ITtnKod>);
begin
  inherited Create(ATtnKodFactory);
end;


end.
