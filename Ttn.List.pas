unit Ttn.List;

interface

uses
  Ttn.Interfaces
  , System.Classes
  , System.Generics.Collections
  , System.SysUtils
  , Spring.Container.Common
  , System.Generics.Defaults
  , Ttn.Enum.EnumerableList
  ;

type
  TTtnList = class(TTtnEnumerableList<ITtnObj>, ITtnList)
  private
  public
    constructor Create(ATtnObjFactory: ITtnFactory<ITtnObj>);
    procedure Save(const AStrings: TStrings);
    procedure Sort;
  end;

implementation

uses
  Ttn.Constants;

constructor TTtnList.Create(ATtnObjFactory: ITtnFactory<ITtnObj>);
begin
  inherited Create(ATtnObjFactory);
end;

procedure TTtnList.Save(const AStrings: TStrings);
var
  obj: ITtnObj;
begin
  AStrings.Clear();
  for obj in FItems do
    AStrings.Add(
      Format('%d;"%s";"%s";%.3f;%.3f;%.3f;%.2f;"%s";"%s";%d;"%s";"%s";"%s";"%s";"%s"',[
        obj.NUMBER,
        obj.KOD ,
        obj.NAME ,
        obj.WEIGHT1 ,
        obj.WEIGHT2 ,
        obj.WEIGHT3 ,
        obj.COST ,
        obj.VAL ,
        obj.STR_PR ,
        obj.QUANTITY,
        obj.DestinationCountry,
        obj.DestinationCountryRegion,
        obj.DeliveryCountry,
        obj.DeliveryCountryRegion,
        FormatDateTime(C_Date_Tovar_Format, obj.DateTtn)
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

