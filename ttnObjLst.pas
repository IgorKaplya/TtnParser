unit ttnObjLst;

interface

uses
  System.Classes, ttnObj, System.Generics.Collections, System.Generics.Defaults;

type

  // ������������ ���������� TTtnObjLst
  TTtnObjComparer = class(TComparer<TTtnObj>)
    function Compare(const Left, Right: TTtnObj): Integer; override;
  end;

  // ������ �������� ���� TTtnObj.
  TTtnObjLst = class
  private
    FItems: TList<TTtnObj>;
    function GetCount: Integer;
    function GetItems(Index: Integer): TTtnObj;
  public
    constructor Create;
    destructor Destroy; override;
    function Add: TTtnObj;
    procedure Clear;
    procedure Save(const AStrings: TStrings);
    procedure Sort;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: TTtnObj read GetItems; default;
  end;

implementation

uses
  System.SysUtils;

constructor TTtnObjLst.Create;
begin
  FItems:=TList<TTtnObj>.Create();
end;

destructor TTtnObjLst.Destroy;
begin
  Clear;
  FreeAndNil(FItems);
  inherited;
end;

function TTtnObjLst.Add: TTtnObj;
var
  obj: TTtnObj;
begin
  obj:= TTtnObj.Create;
  FItems.Add(obj);
  Result:=obj;
end;

procedure TTtnObjLst.Clear;
var
  i: integer;
  obj: TTtnObj;
begin
for i:=FItems.Count-1 downto 0 do
  begin
  obj:= FItems[i];
  FreeAndNil(obj);
  FItems.Delete(i);
  end;
end;

function TTtnObjLst.GetCount: Integer;
begin
  inherited;
  Result:=0;
  if Assigned(FItems) then
    Result := FItems.Count;
end;

function TTtnObjLst.GetItems(Index: Integer): TTtnObj;
begin
  Result:=nil;
  if (index>=0) and (index<FItems.Count) then
    Result := FItems[Index];
end;

procedure TTtnObjLst.Save(const AStrings: TStrings);
var
  i: Integer;
  obj: TTtnObj;
begin
  AStrings.Clear();
  for i:=0 to Count-1 do
    begin
    obj:=Items[i];
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
end;

procedure TTtnObjLst.Sort;
var
  cmp: TTtnObjComparer;
begin
cmp:=TTtnObjComparer.Create;
  try
  FItems.Sort(cmp);
  finally
  FreeAndNil(cmp);
  end;
end;

{ TTtnObjComparer }
function TTtnObjComparer.Compare(const Left, Right: TTtnObj): Integer;
{���������� �� ����, ����� �� ������ ������������}
begin
if not SameText(Left.KOD,Right.KOD) then
  Result:=CompareStr(Left.KOD,Right.KOD)
else
  Result:=CompareStr(Left.STR_PR,Right.STR_PR);
end;

end.
