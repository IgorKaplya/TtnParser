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
    FExcelAdapter: ITtnExcelAdapter;
    property ExcelAdapter: ITtnExcelAdapter read FExcelAdapter;
  public
    constructor Create(ATtnObjFactory: ITtnFactory<ITtnObj>; AExcelAdapter: ITtnExcelAdapter);
    procedure Save(const AFile: string); overload;
    procedure Save(const AStrings: TStrings); overload;
    procedure Sort;
    procedure Load(const AFile: string); overload;
    procedure Load(const AStrings: TStrings); overload;
    function CountObjWithUniqueNumbers: Integer;
  end;

implementation

constructor TTtnList.Create(ATtnObjFactory: ITtnFactory<ITtnObj>; AExcelAdapter: ITtnExcelAdapter);
begin
  inherited Create(ATtnObjFactory);
  FExcelAdapter := AExcelAdapter;
end;

procedure TTtnList.Save(const AStrings: TStrings);
var
  obj: ITtnObj;
begin
  AStrings.Clear();
  for obj in Self do
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
    ExcelAdapter.Load(AFile, fileLoad);
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
    if not line.IsEmpty then
    begin
      obj := Add();
      obj.AsText := line;
    end;
end;

procedure TTtnList.Save(const AFile: string);
var
  sl: TStringList;
begin
  sl := TStringList.Create();
  try
    Save(sl);
    ExcelAdapter.Save(AFile, sl);
  finally
    sl.Free()
  end;
end;

function TTtnList.CountObjWithUniqueNumbers: Integer;
var
  obj: ITtnObj;
  lastObjNumber: Integer;
begin
  Result := 0;
  lastObjNumber := -1;
  for obj in Self do
    if lastObjNumber <> obj.NUMBER then
    begin
      Inc(Result);
      lastObjNumber := obj.NUMBER;
    end;
end;

end.

