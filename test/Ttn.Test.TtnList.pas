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
  end;

implementation

uses
  Ttn.Registration, System.Classes;

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

initialization
  TDUnitX.RegisterTestFixture(TTestTtnList);
end.
