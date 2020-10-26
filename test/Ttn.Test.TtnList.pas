unit Ttn.Test.TtnList;

interface

uses
  DUnitX.TestFramework, Ttn.Interfaces;

type

  [TestFixture]
  TTestTtnList = class(TObject)
  private
    FTtnList: ITtnList;
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
  end;

implementation

uses
  Ttn.Registration, System.Classes, System.SysUtils;

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
  Assert.WillRaise(ListLoadFileDelegate('Abracadabra.csv'),EFOpenError);
end;

procedure TTestTtnList.Test_LoadSave;

  procedure AddItems(const Count: Integer);
  var
    idx: Integer;
  begin
    for idx := 1 to Count do
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
        TtnList.Last.DestinationCountryRegion :='D'+idx.ToString;
        TtnList.Last.DeliveryCountry := 'Dlv '+idx.ToString;
        TtnList.Last.DeliveryCountryRegion :='S'+idx.ToString;
        TtnList.Last.DateTtn := Now;
    end;
  end;

const
  items_count = 5;
var
  sl: TStringList;
begin
  sl := TStringList.Create();
  try
    AddItems(items_count);
    TtnList.Save(sl);
    TtnList.Load(sl);
    Assert.AreEqual(
      items_count,
      TtnList.Count
    );
  finally
    sl.Free();
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnList);
end.
