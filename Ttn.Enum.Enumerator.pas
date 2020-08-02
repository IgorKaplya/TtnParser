unit Ttn.Enum.Enumerator;

interface

uses
  Ttn.Interfaces
  , System.Generics.Collections
  , System.SysUtils
  ;

type

  TTtnEnumerator<T> = class(TInterfacedObject, ITtnEnumerator<T>)
  private
    FOwnerList: TList<T>;
    FCurrentIndex: Integer;
    function GetCurrent: T;
    function MoveNext: Boolean;
    procedure Reset;
    property Current: T read GetCurrent;
    property OwnerList: TList<T> read FOwnerList;
    property CurrentIndex: Integer read FCurrentIndex write FCurrentIndex;
  public
    constructor Create(AOwnerList: TList<T>);
  end;

implementation

{ TTtnEnumerator<T> }

constructor TTtnEnumerator<T>.Create(AOwnerList: TList<T>);
begin
  FOwnerList := AOwnerList;
  CurrentIndex := -1;
end;

function TTtnEnumerator<T>.GetCurrent: T;
begin
  Result := OwnerList[CurrentIndex];
end;

function TTtnEnumerator<T>.MoveNext: Boolean;
begin
  CurrentIndex := CurrentIndex + 1;
  Result := CurrentIndex < FOwnerList.Count;
end;

procedure TTtnEnumerator<T>.Reset;
begin
  CurrentIndex := -1;
end;

end.
