unit Ttn.Test.DocumentList;

interface
uses
  DUnitX.TestFramework, Ttn.Interfaces;

type

  [TestFixture]
  TTestTtnDocumentList = class(TObject)
  private
    FDocList: ITtnDocumentList;
    property DocList: ITtnDocumentList read FDocList;
  public
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

procedure TTestTtnDocumentList.Setup;
begin
  FDocList := TTtnResolver.Resolve<ITtnDocumentList>
end;

procedure TTestTtnDocumentList.TearDown;
begin
  FDocList := nil;
end;

procedure TTestTtnDocumentList.Test1;
begin
  Assert.Pass();
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnDocumentList);
end.
