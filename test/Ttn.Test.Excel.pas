unit Ttn.Test.Excel;

interface

uses
  DUnitX.TestFramework, Ttn.Interfaces, Ttn.Excel;

type
  [TestFixture]
  TTestTtnExcel = class(TObject)
  private
    FExcel: TExcelAdapter;
    property Excel: TExcelAdapter read FExcel;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure Test_Append;
  end;

implementation

uses
  System.Classes;

{ TTestTtnExcel }

procedure TTestTtnExcel.Setup;
begin
  FExcel := TExcelAdapter.Create();
end;

procedure TTestTtnExcel.TearDown;
begin
  FExcel.Free;
  FExcel := nil;
end;

procedure TTestTtnExcel.Test_Append;
const
  line_count = 10;
  one_line =
    '7;"3926909709";"œ–Œ◊»≈ ◊¿—“» œÀ¿—“Ã¿——Œ¬€≈ ¡/”";0.001;0.001;0.001;780.00;"USD";"eu";1;"BY";030;"RU";"140";"24.06.1987"';
var
  i: Integer;
  sl: TStringList;
begin
  sl := TStringList.Create();
  try
    for i := 1 to line_count do
      sl.Add(one_line);
    Excel.Save('.\_TestData\TestExcel\Append\123.xlsx', sl);
    sl.Clear;
    Excel.Load('.\_TestData\TestExcel\Append\123.xlsx', sl);
    for i := 0 to line_count-1 do
      Assert.AreEqual(one_line,sl[i]);
  finally
    sl.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnExcel);

end.
