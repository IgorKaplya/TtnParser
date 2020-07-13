unit Ttn.List;

interface

uses
  Ttn.Interfaces, System.Classes, System.Generics.Collections, System.SysUtils, Spring.Container.Common, System.Generics.Defaults;

type
  TTtnList = class(TInterfacedObject, ITtnList)
  private
    FItems: TList<ITtnObj>;
    FTtnObjFactory: IFactory<ITtnObj>;
  public
    constructor Create(ATtnObjFactory: IFactory<ITtnObj>);
    destructor Destroy; override;
    function Add: ITtnObj;
    procedure Clear;
    function GetCount: Integer;
    function GetItems(Index: Integer): ITtnObj;
    procedure Save(const AStrings: TStrings);
    procedure Sort;
  end;

implementation

constructor TTtnList.Create(ATtnObjFactory: IFactory<ITtnObj>);
begin
  inherited Create();
  FTtnObjFactory := ATtnObjFactory;
  FItems := TList<ITtnObj>.Create();
end;

destructor TTtnList.Destroy;
begin
  Clear();
  FItems.Free;
  inherited;
end;

function TTtnList.Add: ITtnObj;
begin
  Result := FTtnObjFactory();
  FItems.Add(Result);
end;

procedure TTtnList.Clear;
var
  ttnObject: ITtnObj;
begin
  while FItems.Count>0 do
  begin
    ttnObject := FItems[0];
    ttnObject := nil;
    FItems.Delete(0);
  end;
end;

function TTtnList.GetCount: Integer;
begin
  Result := FItems.Count;
end;

function TTtnList.GetItems(Index: Integer): ITtnObj;
begin
  Result := FItems[Index];
end;

procedure TTtnList.Save(const AStrings: TStrings);
var
  obj: ITtnObj;
begin
  AStrings.Clear();
  for obj in FItems do
    AStrings.Add(
      Format('%d;"%s";"%s";%.3f;%.3f;%.3f;%.2f;"%s";"%s";%d;',[
        obj.NUMBER,
        obj.KOD ,
        obj.NAME ,
        obj.WEIGHT1 ,
        obj.WEIGHT2 ,
        obj.WEIGHT3 ,
        obj.COST ,
        obj.VAL ,
        obj.STR_PR ,
        obj.QUANTITY
      ])
    );
end;

procedure TTtnList.Sort;

  function comarerConstruct(): IComparer<ITtnObj>;
  begin
    Result :=  TComparer<ITtnObj>.Construct(
      function(const Left, Right: ITtnObj): Integer
      begin
        if not SameText(Left.KOD,Right.KOD) then
          Result:=CompareStr(Left.KOD,Right.KOD)
        else
          Result:=CompareStr(Left.STR_PR,Right.STR_PR);
      end
    );
  end;

begin
  FItems.Sort(comarerConstruct);
end;

end.

