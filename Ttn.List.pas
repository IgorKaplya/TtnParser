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
    procedure Load(const AFile: string); overload;
    procedure Load(const AStrings: TStrings); overload;
  end;

implementation

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
    AStrings.Add(obj.AsText);
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

procedure TTtnList.Load(const AFile: string);
var
  fileLoad: TStringList;
begin
  fileLoad := TStringList.Create();
  try
    fileLoad.LoadFromFile(AFile);
    Load(fileLoad);
  finally
    fileLoad.Free();
  end;
end;

procedure TTtnList.Load(const AStrings: TStrings);
var
  line: string;
  obj: ITtnObj;
begin
  Clear();
  for line in AStrings do
  begin
    obj := Add();
    obj.AsText := line;
  end;
end;

end.

