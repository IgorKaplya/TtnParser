unit uTestTtnParser;

interface
uses
  DUnitX.TestFramework, System.Classes;

type

  [TestFixture]
  TTtnParserTestObject = class(TObject) 
  private
    procedure CheckEqualsStrLst(const AActual, AExpected: TStrings; AMsg: string = '');
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('TestParseInputFile','input.csv,result.csv')]
    procedure TestParseInputFile(const AFileInp, AFileRes: string);
  end;

implementation

uses
  System.SysUtils, frmTtnParser;


procedure TTtnParserTestObject.CheckEqualsStrLst(const AActual, AExpected: TStrings; AMsg: string = '');
var
  i: Integer;
begin
if not SameText(AActual.Text,AExpected.Text) then
  begin
  Assert.AreEqual(AActual.Count,AExpected.Count,AMsg+'. Different row count.');
  for i:=0 to AActual.Count-1 do
    Assert.AreEqual(AExpected[i],AActual[i],AMsg+Format('. Different row (%d). %s%s', [
      i,
      sLineBreak+'expexcted list:'+sLineBreak+AExpected.Text,
      sLineBreak+'actual list:'+sLineBreak+AActual.Text
    ]));
  end;
end;

procedure TTtnParserTestObject.Setup;
begin
end;

procedure TTtnParserTestObject.TearDown;
begin
end;

procedure TTtnParserTestObject.TestParseInputFile(const AFileInp, AFileRes: string);
var
  slTst,slExp: TStringList;
begin
slTst:= TStringList.Create();
slExp:= TStringList.Create();
  try
    frmTtnParserMain.InpFile:=AFileInp;
    frmTtnParserMain.ProcessInpFile();
    frmTtnParserMain.Ttn.Save(slTst);
    slExp.LoadFromFile(AFileRes);
    CheckEqualsStrLst(slTst,slExp);
  finally
    FreeAndNil(slTst);
    FreeAndNil(slExp);
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTtnParserTestObject);
end.
