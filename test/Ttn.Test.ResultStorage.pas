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
  expected_result_files : array[0..1] of string = (
    '_TestData\TestResultsStorage\ValidFolder\Clien1',
    '_TestData\TestResultsStorage\ValidFolder\Clien2'
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
      result.Folder,
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

  function DoLoad(const ARoot: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ResultStorage.Load(ARoot)
      end
    );
  end;

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

  function DoUpdate(const AListTtn: ITtnList): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ResultStorage.ActiveResult := ResultStorage.Last;
        ResultStorage.ActiveResult.Append(AListTtn);
        ResultStorage.ActiveResult.Init();
      end
    );
  end;

const
  folder_root_resultsorage = '.\_TestData\TestResultsStorage\CRUD';
  folder_to_test_crud = 'CRUD Проверка';
var
  listTtn: ITtnList;
begin
  Assert.WillRaise(DoLoad('AbraCadabra\'), EDirectoryNotFoundException);
  Assert.WillRaise(DoCreate(''), ENotSupportedException);

  Assert.WillNotRaise(DoLoad(folder_root_resultsorage));

  Assert.WillNotRaise(DoCreate(folder_to_test_crud));
  Assert.IsTrue(DirectoryExists(folder_root_resultsorage+'\'+folder_to_test_crud),' Storage wasn`t created: '+folder_to_test_crud);
  Assert.AreEqual(1, ResultStorage.Count, 'Results collection wasn`t appended');

  listTtn := TTtnResolver.Resolve<ITtnList>;
  listTtn.Add;
    listTtn.Last.NUMBER := 1;
    listTtn.Last.KOD := '123';
    listTtn.Last.STR_PR := 'Zombie-land';
    listTtn.Last.NAME := 'Name';
    listTtn.Last.QUANTITY := 3;
    listTtn.Last.SIGN := 'O';
    listTtn.Last.VAL := 'Tugr';
    listTtn.Last.WEIGHT1 := 1.14;
    listTtn.Last.WEIGHT2 := 2.14;
    listTtn.Last.WEIGHT3 := 3.14;
    listTtn.Last.DestinationCountry := 'VillaRibo';
    listTtn.Last.DestinationCountryRegion := 'RIB';
    listTtn.Last.DeliveryCountry := 'VillaBadgo';
    listTtn.Last.DeliveryCountryRegion := 'BAD';
    listTtn.Last.COST := 10.0;

  Assert.WillNotRaise(DoUpdate(listTtn));
  Assert.AreEqual(
    listTtn.Last.AsText,
    ResultStorage.ActiveResult.TtnList.Last.AsText,
    'Results were not updated.'
  );

  Assert.WillNotRaise(DoDelete(folder_to_test_crud));
  Assert.IsFalse(DirectoryExists(folder_root_resultsorage+'\'+folder_to_test_crud),' Storage wasn`t deleted: '+folder_to_test_crud);
  Assert.AreEqual(0, ResultStorage.Count, 'Results collection wasn`t emtied');
end;

initialization
  TDUnitX.RegisterTestFixture(TTtnTestResultStorage);
end.
