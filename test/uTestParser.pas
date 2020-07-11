unit uTestParser;

interface

uses
  DUnitX.TestFramework, uIntfTtnParser;

type
  [TestFixture]
  TTestParser = class(TObject)
    [Test]
    [TestCase('ConfigureAbsentFile','Abrcacadabra.csv')]
    procedure TestParseAbsentFile(const AFile: string);
    [Test]
    [TestCase]
    procedure TestParseWrongLineColumns;
  private
    FParser: ITtnObjParser;
    property Parser: ITtnObjParser read FParser;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase]
    procedure TestConfigure;
    [Test]
    [TestCase]
    procedure TestConfigureEmpty();
    [Test]
    [TestCase]
    procedure TestConfigureWrongConfigMarker;
    [Test]
    [TestCase]
    procedure TestConfigureWrongHeader;
  end;

implementation

uses
  System.Classes, System.SysUtils;

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
    '#MOTOR'+sLineBreak+
    'sign;name;cost;quant;weight'+sLineBreak+
    ';Автомагнитола;1 260.00;1;0.002'+sLineBreak+
    ';страна происхождения-Соединенные Штаты;;;';
  C_File_Type_AutoStrong =
    '#ASTRONG'+sLineBreak+
    'sign;name;;;;;;;;;;;;;;;;;quant;;;cost;;;;weight;;;;;;;;;;;;;;;;;;;;'+sLineBreak+
    '; Бампер в сборе *Республика Корея;;;;;;;;;;;;;;шт;;;3;;;983.94;;;;2 951.82;;;;;0';
  C_Samples: array[TTtnParserConfiguration] of string = ('', C_File_Type_Motor, C_File_Type_AutoStrong);
var
  SampleInput: TStringList;
  ParserConfigurationOnTest: TTtnParserConfiguration;
begin
  SampleInput := TStringList.Create();
  try
    for ParserConfigurationOnTest := tpcMotor to High(ParserConfigurationOnTest) do
    begin
      SampleInput.Text := C_Samples[ParserConfigurationOnTest];
      Parser.Configure(SampleInput);
      Assert.AreEqual(ParserConfigurationOnTest, Parser.Configuration);
    end;
  finally
    SampleInput.Free();
  end;
end;

procedure TTestParser.TestParseWrongLineColumns;

  function callParseContext(const AFile: TStrings): TTestLocalMethod;
  begin
    Result :=
      procedure
      begin
        Parser.Parse(AFile)
      end;
  end;

const
  C_File_Type_Motor =
    '#MOTOR'+sLineBreak+
    'sign;name;cost;quant;weight'+sLineBreak+
    'wrong;columns;motor'+sLineBreak;
  C_File_Type_AutoStrong =
    '#ASTRONG'+sLineBreak+
    'sign;name;;;;;;;;;;;;;;;;;quant;;;cost;;;;weight;;;;;;;;;;;;;;;;;;;;'+sLineBreak+
    'wrong;columns;astromg'+sLineBreak;
  C_Sample_Input: array[TTtnParserConfiguration] of string = ('', C_File_Type_Motor, C_File_Type_AutoStrong);
  C_Expected_Exceptions: array[TTtnParserConfiguration] of ExceptClass = (ETtnParserEmptyInput, ETtnParserWrongLineColumns, ETtnParserWrongLineColumns);
var
  testConfiguration: TTtnParserConfiguration;
  SampleInput: TStringList;
begin
  SampleInput := TStringList.Create();
  try
    for testConfiguration in C_All_Parser_Configurations do
    begin
      SampleInput.Text := C_Sample_Input[testConfiguration];
      assert.WillRaise(callParseContext(SampleInput), C_Expected_Exceptions[testConfiguration]);
    end;
  finally
    SampleInput.Free();
  end;
end;

procedure TTestParser.TestParseAbsentFile(const AFile: string);

  function CallerContext(): TTestLocalMethod;
  begin
    Result :=
      procedure
      begin
        Parser.Parse(AFile)
      end;
  end;

begin
  Assert.WillRaise(CallerContext(), EFOpenError);
end;

procedure TTestParser.TestConfigureEmpty;

  function CallConfigure(const ALinesCount: Byte): TTestLocalMethod;
  begin
    Result :=
      procedure
      var
        sl: TStringList;
        i: Integer;
      begin
        sl := TStringList.Create();
        try
          for i := 0 to ALinesCount-1 do
            sl.Add(i.ToString());
          Parser.Configure(sl);
        finally
          sl.Free();
        end;
      end;
  end;

var
  i: Integer;
begin
  for i := 0 to C_Input_Minimal_Lines -1 do
    Assert.WillRaise(CallConfigure(i), ETtnParserEmptyInput);
end;

procedure TTestParser.TestConfigureWrongConfigMarker;

  function ConfigureWrongHeader(): TTestLocalMethod;
  begin
    Result :=
      procedure
      var
        sl: TStringList;
      begin
        sl := TStringList.Create();
        try
          sl.Add('Wrong;Config');
          sl.Add('Wrong;Header');
          sl.Add('Wrong;Data');
          Parser.Configure(sl);
        finally
          sl.Free();
        end;
      end;
  end;

begin
  Assert.WillRaise(ConfigureWrongHeader(), ETtnParserWrongConfig);
end;

procedure TTestParser.TestConfigureWrongHeader;

  function ConfigureWrongHeader(const AConfiguration: TTtnParserConfiguration): TTestLocalMethod;
  begin
    Result :=
      procedure
      var
        sl: TStringList;
      begin
        sl := TStringList.Create();
        try
          sl.Add(Config_String_Alias[AConfiguration]);
          sl.Add('Wrong;Header;'+Config_String_Alias[AConfiguration]);
          sl.Add('<..>');
          Parser.Configure(sl);
        finally
          sl.Free();
        end;
      end;
  end;

begin
  Assert.WillRaise(ConfigureWrongHeader(tpcMotor), ETtnParserWrongHeader);
  Assert.WillRaise(ConfigureWrongHeader(tpcAutoStrong), ETtnParserWrongHeader);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestParser);

end.
