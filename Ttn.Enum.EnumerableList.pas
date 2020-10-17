unit Ttn.Enum.EnumerableList;

interface

uses
  Ttn.Interfaces
  ,System.Generics.Collections
  ,System.SysUtils
  ;

type

  TTtnEnumerableList<T> = class(TInterfacedObject, ITtnListBase<T>)
  private
    FItemFactory: ITtnFactory<T>;
    property ItemFactory: ITtnFactory<T> read FItemFactory write FItemFactory;
  protected
    FItems: TList<T>;
    function GetCount: Integer;
    function GetItems(Index: Integer): T;
  public
    constructor Create(AItemFactory: ITtnFactory<T>);
    function GetEnumerator: ITtnEnumerator<T>;
    destructor Destroy; override;
    function Add: T;
    procedure Delete(const Index: Integer);
    procedure Clear; virtual;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: T read GetItems; default;
  end;

implementation

uses
  Ttn.Enum.Enumerator;

function TTtnEnumerableList<T>.Add: T;
begin
  Result := ItemFactory();
  FItems.Add(Result);
end;

constructor TTtnEnumerableList<T>.Create(AItemFactory: ITtnFactory<T>);
begin
  inherited Create();
  FItems := TList<T>.Create();
  FItemFactory := AItemFactory;
end;

function TTtnEnumerableList<T>.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TTtnEnumerableList<T>.GetEnumerator: ITtnEnumerator<T>;
begin
  Result := TTtnEnumerator<T>.Create(FItems);
end;

function TTtnEnumerableList<T>.GetItems(Index: Integer): T;
begin
  Result := FItems[Index];
end;

procedure TTtnEnumerableList<T>.Delete(const Index: Integer);
begin
  FItems.Delete(Index);
end;

destructor TTtnEnumerableList<T>.Destroy;
begin
  Clear();
  FItems.Free();
  FItems := nil;
  inherited Destroy;
end;

procedure TTtnEnumerableList<T>.Clear;
begin
  FItems.Clear();
end;

end.
