unit Ttn.Test.Excel;

interface

uses
  DUnitX.TestFramework, Ttn.Interfaces, Ttn.Excel;

type
  [TestFixture]
  TTestTtnExcel = class(TObject)
  private
    FExcel: ITtnExcelAdapter;
    function LoadFile(const AFile: string): TTestLocalMethod;
    function SaveFile(const AFile: string): TTestLocalMethod;
    property Excel: ITtnExcelAdapter read FExcel;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure Test_Append;
    [Test]
    procedure FailLoad_IfFileNotExist;
    [Test]
    procedure FailLoad_IfFileLocked;
    [Test]
    procedure FaiSave_IfFileLocked;
    [Test]
    procedure FaiSave_IfPathWrong;
  end;

implementation

uses
  System.Classes,
  Ttn.Registration,
  System.IOUtils;

{ TTestTtnExcel }

procedure TTestTtnExcel.Setup;
begin
  FExcel := TTtnResolver.Resolve<ITtnExcelAdapter>;
end;

procedure TTestTtnExcel.TearDown;
begin
  FExcel := nil;
end;

procedure TTestTtnExcel.Test_Append;
const
  text_obj_array: array[0..1] of string = (
    '"7";"3926909709";"Название";"0.001";"24.06.1987"',
    '"7";"3926909709";"";"0.001";"24.06.1987"'
  );
var
  i: Integer;
  sl: TStringList;
  text: string;
begin
  sl := TStringList.Create();
  try
    for text in text_obj_array do
      sl.Add(text);
    Excel.Save('.\_TestData\TestExcel\Append\123.xlsx', sl);
    sl.Clear;
    Excel.Load('.\_TestData\TestExcel\Append\123.xlsx', sl);
    for i := 0 to sl.Count-1 do
      Assert.AreEqual(text_obj_array[i], sl[i]);
  finally
    sl.Free;
  end;
end;

procedure TTestTtnExcel.FailLoad_IfFileNotExist;
begin
  Assert.WillRaiseAny(LoadFile('Abracadabra.xlsx'));
end;

function TTestTtnExcel.LoadFile(const AFile: string): TTestLocalMethod;
begin
  Result := procedure()
  var
    sl: TStringList;
  begin
    sl := TStringList.Create();
    try
      Excel.Load(AFile, sl);
    finally
      sl.Free
    end;
  end
end;

procedure TTestTtnExcel.FailLoad_IfFileLocked;
const
  test_file = '.\_TestData\TestExcel\LockedFile.xlsx';
var
  fs: TFileStream;
begin
  fs := TFile.Open(test_file, TFileMode.fmOpenOrCreate, TFileAccess.faReadWrite);
  try
    Assert.WillRaiseAny(LoadFile(test_file));
  finally
    fs.Free;
    TFile.Delete(test_file);
  end;
end;

function TTestTtnExcel.SaveFile(const AFile: string): TTestLocalMethod;
begin
  Result := procedure()
  var
    sl: TStringList;
  begin
    sl := TStringList.Create();
    try
      Excel.Save(AFile, sl);
    finally
      sl.Free
    end;
  end
end;

procedure TTestTtnExcel.FaiSave_IfFileLocked;
const
  test_file = '.\_TestData\TestExcel\LockedFile.xlsx';
var
  fs: TFileStream;
begin
  fs := TFile.Open(test_file, TFileMode.fmOpenOrCreate, TFileAccess.faReadWrite);
  try
    Assert.WillRaiseAny(SaveFile(test_file));
  finally
    fs.Free;
    TFile.Delete(test_file);
  end;
end;

procedure TTestTtnExcel.FaiSave_IfPathWrong;
const
  test_file = '_:\_TestData\TestExcel\FaiSave_IfPathWrong.xlsx';
begin
  Assert.WillRaiseAny(SaveFile(test_file));
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnExcel);

end.
