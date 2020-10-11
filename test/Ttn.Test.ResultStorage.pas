unit Ttn.Test.ResultStorage;

interface

uses
  DUnitX.TestFramework,
  Ttn.Interfaces,
  System.Classes;

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
    [Test]
    procedure TestCRUD;
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

procedure TTtnTestResultStorage.TestCRUD;

  function DoCreate(const AFile: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ResultStorage.CreateResult(AFile)
      end
    );
  end;

  function DoDelete(const AFile: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ResultStorage.DeleteResult(AFile)
      end
    );
  end;

  function DoUpdate(const AFile, AText: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ResultStorage.UpdateResult(AFile, AText);
      end
    );
  end;

const
  file_to_test_crud = '.\_TestData\TestResultsStorage\CRUD\CRUD_Result.csv';
  file_payload1 = '1 тест CRUD для ResultsStorage';
  file_payload2 = '2 тест CRUD для ResultsStorage';
var
  checkPayload: TStringList;
begin
  Assert.WillRaise(DoCreate('AbraCadabra\AbraCadabra.csv'), EDirectoryNotFoundException);
  Assert.WillRaise(DoDelete('AbraCadabra\AbraCadabra.csv'), EDirectoryNotFoundException);
  Assert.WillRaise(DoUpdate('AbraCadabra\AbraCadabra.csv','AbraCadabra'), EDirectoryNotFoundException);

  Assert.WillNotRaise(DoCreate(file_to_test_crud));
  Assert.IsTrue(FileExists(file_to_test_crud),' File wasn`t created: '+file_to_test_crud);

  Assert.WillNotRaise(DoUpdate(file_to_test_crud, file_payload1));
  Assert.WillNotRaise(DoUpdate(file_to_test_crud, file_payload2));
  checkPayload := TStringList.Create();
  try
    checkPayload.LoadFromFile(file_to_test_crud, TEncoding.UTF8);
    Assert.AreEqual(
      file_payload1+sLineBreak+file_payload2+sLineBreak,
      checkPayload.Text,
      'File wasn`t updated '+file_to_test_crud
    );
  finally
    checkPayload.Free();
  end;

  Assert.WillNotRaise(DoDelete(file_to_test_crud));
  Assert.IsFalse(FileExists(file_to_test_crud),' File wasn`t deleted: '+file_to_test_crud);
end;

initialization
  TDUnitX.RegisterTestFixture(TTtnTestResultStorage);
end.
