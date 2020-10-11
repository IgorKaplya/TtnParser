unit Ttn.Test.Document;

interface
uses
  DUnitX.TestFramework, Ttn.Interfaces;

type

  [TestFixture]
  TTestTtnDocument = class(TObject)
  private
    FTtnDoc: ITtnDocument;
  public
    property TtnDoc: ITtnDocument read FTtnDoc;
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure Test1;
  end;

implementation

uses
  Ttn.Registration;

procedure TTestTtnDocument.Setup;
begin
  FTtnDoc := TTtnResolver.Resolve<ITtnDocument>;
end;

procedure TTestTtnDocument.TearDown;
begin
  FTtnDoc := nil;
end;

procedure TTestTtnDocument.Test1;
begin
  Assert.Pass();
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnDocument);
end.
