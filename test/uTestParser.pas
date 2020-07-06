unit uTestParser;

interface

uses
  DUnitX.TestFramework, uIntfTtnParser;

type
  [TestFixture]
  TTestParser = class(TObject)
  private
    FParser: ITtnObjParser;
    property Parser: ITtnObjParser read FParser;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase('ConfigureAbsentFile','Abrcacadabra.csv')]
    procedure TestConfigureAbsentFile(const AFile: string);
    [Test]
    [TestCase('Configure','')]
    procedure TestConfigure;
    [Test]
    [TestCase]
    procedure TestConfigureEmpty;
  end;

implementation

uses
  System.Classes;

procedure TTestParser.Setup;
begin
  FParser := CreateTtnParser();
end;

procedure TTestParser.TearDown;
begin
  FParser := nil;
end;

procedure TTestParser.TestConfigure;
const
  C_File_Type_Motor =
    'sign;name;cost;quant;weight'+sLineBreak+
    ';Автомагнитола;1 260.00;1;0.002'+sLineBreak+
    ';страна происхождения-Соединенные Штаты;;;';
  C_File_Type_AutoStrong =
    'sign;name;;;;;;;;;;;;;;;;;quant;;;cost;;;;weight;;;;;;;;;;;;;;;;;;;;'+sLineBreak+
    '; Бампер в сборе *Республика Корея;;;;;;;;;;;;;;шт;;;3;;;983.94;;;;2 951.82;;;;;0';
  C_Samples: array[TTtnParserConfiguration] of string = ('', C_File_Type_Motor, C_File_Type_AutoStrong);
var
  SampleInput: TStringList;
  ParserConfigurationExpected: TTtnParserConfiguration;
begin
  SampleInput := TStringList.Create();
  try
    for ParserConfigurationExpected := Low(ParserConfigurationExpected) to High(ParserConfigurationExpected) do
    begin
      SampleInput.Text := C_Samples[ParserConfigurationExpected];
      Parser.Configure(SampleInput);
      Assert.AreEqual(ParserConfigurationExpected, Parser.Configuration);
    end;
  finally
    SampleInput.Free();
  end;
end;

procedure TTestParser.TestConfigureAbsentFile(const AFile: string);

  function CallerContext(): TTestLocalMethod;
  begin
    Result :=
      procedure
      begin
        Parser.Configure(AFile)
      end;
  end;

begin
  Assert.WillRaise(CallerContext(), EFOpenError);
end;

procedure TTestParser.TestConfigureEmpty;

  function CallerContext(): TTestLocalMethod;
  begin
    Result :=
      procedure
      var
        sl: TStringList;
      begin
        sl := TStringList.Create();
        try
          Parser.Configure(sl)
        finally
          sl.Free();
        end;
      end;
  end;

begin
  Assert.WillRaise(CallerContext(), ETtnParserEmptyInput);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestParser);

end.
