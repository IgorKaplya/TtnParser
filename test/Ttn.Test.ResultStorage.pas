unit Ttn.Test.ResultStorage;

interface

uses
  DUnitX.TestFramework,
  Ttn.Interfaces;

type

  [TestFixture]
  TTtnTestResultStorage = class(TObject)
  private
    ResultStorage: ITtnResultStorage;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestLoadFolder;
  end;

implementation

uses
  Ttn.Registration;

procedure TTtnTestResultStorage.Setup;
begin
  ResultStorage := TTtnResolver.Resolve<ITtnResultStorage>;
end;

procedure TTtnTestResultStorage.TearDown;
begin
  ResultStorage := nil;
end;

procedure TTtnTestResultStorage.TestLoadFolder;
begin
end;

initialization
  TDUnitX.RegisterTestFixture(TTtnTestResultStorage);
end.
