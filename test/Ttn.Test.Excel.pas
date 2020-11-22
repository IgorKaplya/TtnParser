unit Ttn.Test.Excel;

interface

uses
  DUnitX.TestFramework, Ttn.Interfaces, Ttn.Excel;

type
  [TestFixture]
  TTestTtnExcel = class(TObject)
  private
    FExcel: ITtnExcelAdapter;
    property Excel: ITtnExcelAdapter read FExcel;
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
  System.Classes,
  Ttn.Registration;

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

initialization
  TDUnitX.RegisterTestFixture(TTestTtnExcel);

end.
