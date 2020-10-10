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
    [Test]
    procedure TestLoadInvalidFolder;
  end;

implementation

uses
  Ttn.Registration, System.SysUtils;

procedure TTtnTestResultStorage.Setup;
begin
  ResultStorage := TTtnResolver.Resolve<ITtnResultStorage>;
end;

procedure TTtnTestResultStorage.TearDown;
begin
  ResultStorage := nil;
end;

procedure TTtnTestResultStorage.TestLoadFolder;
const
  expected_result_files : array[0..9] of string = (
    '_TestData\TestResultsStorage\ValidFolder\Clien1\Result1.csv',
    '_TestData\TestResultsStorage\ValidFolder\Clien1\Result2.csv',
    '_TestData\TestResultsStorage\ValidFolder\Clien2\Result1.csv',
    '_TestData\TestResultsStorage\ValidFolder\Clien2\Result2.csv',
    '_TestData\TestResultsStorage\ValidFolder\Clien2\SubClient1\Result1.csv',
    '_TestData\TestResultsStorage\ValidFolder\Clien2\SubClient1\Result2.csv',
    '_TestData\TestResultsStorage\ValidFolder\Clien2\SubClient2\Result1.csv',
    '_TestData\TestResultsStorage\ValidFolder\Clien2\SubClient2\Result2.csv',
    '_TestData\TestResultsStorage\ValidFolder\Result1.csv',
    '_TestData\TestResultsStorage\ValidFolder\Result2.csv'
  );
var
  result: ITTnResult;
  i: Integer;
  folder: string;
begin
  folder := '_TestData\TestResultsStorage\ValidFolder\';
  ResultStorage.Load(folder);
  Assert.AreEqual(Length(expected_result_files), ResultStorage.Count, 'Failed to load all result files.');
  i := Low(expected_result_files);
  for result in ResultStorage do
  begin
    Assert.AreEqual(
      expected_result_files[i],
      result.FileName,
      'Failed to verify structure.'
    );
    Inc(i);
  end;
end;

procedure TTtnTestResultStorage.TestLoadInvalidFolder;

  function LoadFolder(const AFolder: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ResultStorage.Load(AFolder)
      end
    );
  end;

begin
  Assert.WillRaise(LoadFolder('AbraCadabra'), EDirectoryNotFoundException);
end;

initialization
  TDUnitX.RegisterTestFixture(TTtnTestResultStorage);
end.
