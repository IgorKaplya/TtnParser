unit Ttn.Test.TtnList;

interface

uses
  DUnitX.TestFramework, Ttn.Interfaces;

type

  [TestFixture]
  TTestTtnList = class(TObject)
  private
    FTtnList: ITtnList;
    procedure AddItems(const addCount: Integer; duplicatesCount: Integer);
    property TtnList: ITtnList read FTtnList;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure Load_BoundaryConditions;
    [Test]
    procedure Test_LoadSave;
    [Test]
    procedure Test_CountUniqueObj();
    [Test]
    procedure Test_OutputFormat();
  end;

implementation

uses
  Ttn.Registration, System.Classes, System.SysUtils, Ttn.Errors;

procedure TTestTtnList.Setup;
begin
  FTtnList := TTtnResolver.Resolve<ITtnList>;
end;

procedure TTestTtnList.TearDown;
begin
  FTtnList := nil;
end;

procedure TTestTtnList.Load_BoundaryConditions;

  function ListLoadFileDelegate(const AFile: string): TTestLocalMethod;
  begin
    Result :=
      procedure()
      begin
        TtnList.Load(AFile);
      end;
  end;

begin
  Assert.WillRaise(ListLoadFileDelegate('Abracadabra.csv'), ETtnExcelAdapterFOpenError);
end;

procedure TTestTtnList.Test_CountUniqueObj;
begin
  TtnList.Add().NUMBER := 1;
  TtnList.Add().NUMBER := 1;
  TtnList.Add().NUMBER := 2;
  TtnList.Add().NUMBER := 3;
  TtnList.Add().NUMBER := 3;
  TtnList.Add().NUMBER := 3;
  Assert.AreEqual(3, TtnList.CountObjWithUniqueNumbers);
end;

procedure TTestTtnList.Test_LoadSave;
const
  items_count = 5;
  duplicates_count = 2;
var
  sl: TStringList;
begin
  sl := TStringList.Create();
  try
    AddItems(items_count, duplicates_count);
    TtnList.Save(sl);
    TtnList.Load(sl);
    Assert.AreEqual(
      items_count * duplicates_count,
      TtnList.Count
    );
  finally
    sl.Free();
  end;
end;

procedure TTestTtnList.Test_OutputFormat;
const
  items_count = 5;
  duplicates_count = 2;
var
  i: Integer;
  name: string;
  sl: TStringList;
begin
  sl := TStringList.Create();
  try
    AddItems(items_count, duplicates_count);
    TtnList.FormatOutput();
    TtnList.Save(sl);
    for i := 0 to TtnList.Count-1 do
    begin
      name := TtnList[i].NAME;
      if not Odd(i) then
        Assert.IsNotEmpty(name, name)
      else
        Assert.IsEmpty(name, name);
    end;
  finally
    sl.Free();
  end;
end;

procedure TTestTtnList.AddItems(const addCount: Integer; duplicatesCount: Integer);
var
  i: Integer;
  idx: Integer;
begin
  for idx := 1 to addCount do
    for i := 1 to duplicatesCount do
    begin
      TtnList.Add();
        TtnList.Last.COST := idx / 10;
        TtnList.Last.KOD := 'KOD '+ idx.ToString;
        TtnList.Last.NAME := 'Name '+idx.ToString;
        TtnList.Last.NUMBER := idx;
        TtnList.Last.QUANTITY := idx * 10;
        TtnList.Last.SIGN := 'SIGN '+idx.ToString;
        TtnList.Last.STR_PR:= 'STR_PR '+idx.ToString;
        TtnList.Last.VAL:= 'VAL '+idx.ToString;
        TtnList.Last.WEIGHT1 := idx / 10;
        TtnList.Last.WEIGHT2 := idx / 10;
        TtnList.Last.WEIGHT3 := idx / 10;
        TtnList.Last.DestinationCountry := 'Dest '+idx.ToString;
        TtnList.Last.DestinationCountryRegion := StringCountryRegion('D'+idx.ToString);
        TtnList.Last.DeliveryCountry := 'Dlv '+idx.ToString;
        TtnList.Last.DeliveryCountryRegion := StringCountryRegion('S'+idx.ToString);
        TtnList.Last.DateTtn := Now;
    end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnList);
end.
