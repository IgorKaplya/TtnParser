unit uTestTtnParser;

interface
uses
  DUnitX.TestFramework, System.Classes, frmTtnParser;

type

  [TestFixture]
  TTtnParserTestObject = class(TObject)
  private
    procedure CheckEqualsStrLst(const AActual, AExpected: TStrings; AMsg: string = '');
  public
    [SetupFixture]
    procedure Setup;
    [TearDownFixture]
    procedure TearDown;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('TestParseInputFile','.\_TestData\ParseInputFile\,input.csv,result.csv')]
    procedure TestParseInputFile(const ATstFolder ,AFileInp, AFileRes: string);
  end;

implementation

uses
  System.SysUtils;


procedure TTtnParserTestObject.CheckEqualsStrLst(const AActual, AExpected: TStrings; AMsg: string = '');
var
  i: Integer;
  slDif: TStringList;
begin
if not SameText(AActual.Text,AExpected.Text) then
  begin
  Assert.AreEqual(AActual.Count,AExpected.Count,AMsg+'. Different row count.');
  slDif:=TStringList.Create();
    try
    for i:=0 to AActual.Count-1 do
      if not SameText(AExpected[i],AActual[i]) then
        begin
        slDif.Add(i.ToString()+':');
        slDif.Add('  e:'+AExpected[i]);
        slDif.Add('  a:'+AActual[i]);
        end;
    Assert.AreEqual(slDif.Count,0,slDif.Text);
    finally
    FreeAndNil(slDif);
    end;
  end;
end;

procedure TTtnParserTestObject.Setup;
begin

end;

procedure TTtnParserTestObject.TearDown;
begin

end;

procedure TTtnParserTestObject.TestParseInputFile(const ATstFolder ,AFileInp, AFileRes: string);
var
  slTst,slExp: TStringList;
begin
slTst:= TStringList.Create();
slExp:= TStringList.Create();
  try
    frmTtnParserMain.InpFile:=ATstFolder+AFileInp;
    frmTtnParserMain.ProcessInpFile();
    frmTtnParserMain.Ttn.Save(slTst);
    slTst.Text:=slTst.Text;
    slExp.LoadFromFile(ATstFolder+AFileRes);
    CheckEqualsStrLst(slTst,slExp);
  finally
    FreeAndNil(slTst);
    FreeAndNil(slExp);
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTtnParserTestObject);
end.
