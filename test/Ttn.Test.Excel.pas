unit Ttn.Test.Excel;

interface

uses
  DUnitX.TestFramework, Ttn.Interfaces, Ttn.Excel;

type
  [TestFixture]
  TTestTtnExcel = class(TObject)
  private
    FExcel: TExcelAppender;
    property Excel: TExcelAppender read FExcel;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure Test_;
  end;

implementation

uses
  System.Classes;

{ TTestTtnExcel }

procedure TTestTtnExcel.Setup;
begin
  FExcel := TExcelAppender.Create();
end;

procedure TTestTtnExcel.TearDown;
begin
  FExcel.Free;
  FExcel := nil;
end;

procedure TTestTtnExcel.Test_;
var
  sl: TStringList;
begin
  sl := TStringList.Create();
  try
    sl.Text := '001;Text;1;3.14;24.06.1987';
    Excel.Append('.\_TestData\TestExcel\Append\123.xlsx', sl);
    sl.Clear;
    Excel.Load('.\_TestData\TestExcel\Append\123.xlsx', sl);
    Assert.AreEqual('001;Text;1;3.14;24.06.1987',sl[0]);
  finally
    sl.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnExcel);

end.
