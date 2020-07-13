unit Ttn.Test.Parser;

interface

uses
  DUnitX.TestFramework, Ttn.Interfaces;

type
  [TestFixture]
  TTestParser = class(TObject)
  private
    FParser: ITtnParserTestable;
    property Parser: ITtnParserTestable read FParser;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    [TestCase]
    procedure TestParseMotor;
    [Test]
    [TestCase]
    procedure TestConfigureEmpty();
    [Test]
    [TestCase]
    procedure TestConfigureWrongConfigMarker;
    [Test]
    [TestCase]
    procedure TestConfigureWrongHeader;
    [Test]
    [TestCase]
    procedure TestConfigureMotor;
    [Test]
    [TestCase]
    procedure TestConfigureAStrong;
    [Test]
    [TestCase]
    procedure TestLineDataGet;
    [Test]
    [TestCase('ConfigureAbsentFile','Abrcacadabra.csv')]
    procedure TestParseAbsentFile(const AFile: string);
    [Test]
    [TestCase]
    procedure TestParseAStrong;
  end;

implementation

uses
  System.Classes, System.SysUtils, Ttn.Errors, Spring.Container, Ttn.Constants;

procedure TTestParser.Setup;
begin
  FParser := GlobalContainer.Resolve<ITtnParserTestable>;
end;

procedure TTestParser.TearDown;
begin
  FParser := nil;
end;

procedure TTestParser.TestParseMotor;
const
  C_File_Type_Motor =
    '#MOTOR'+sLineBreak+
    'sign;name;cost;quant;weight'+sLineBreak+
    '*;Автомагнитола;1260.01;1;0.002'+sLineBreak+
    ';страна происхождения-Соединенные Штаты;;;';
var
  SampleInput: TStringList;
begin
  SampleInput := TStringList.Create();
  try
    SampleInput.Text := C_File_Type_Motor;
    Parser.Parse(SampleInput);
    Assert.AreEqual(1, Parser.ParseResult.Count, 'Не соотвествует количество элементов.');
    Assert.AreEqual('*', Parser.ParseResult[0].SIGN);
    Assert.AreEqual('Автомагнитола', Parser.ParseResult[0].NAME);
    Assert.AreEqual('1260.01', Parser.ParseResult[0].COST.ToString);
    Assert.AreEqual(1, Parser.ParseResult[0].QUANTITY);
    Assert.AreEqual('0.002',Parser.ParseResult[0].WEIGHT1.ToString);
    Assert.AreEqual('страна происхождения-Соединенные Штаты',Parser.ParseResult[0].STR_PR);
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

procedure TTestParser.TestConfigureMotor;
const
  C_File_Type_Motor =
    '#MOTOR'+sLineBreak+
    'sign;name;cost;quant;weight'+sLineBreak+
    '<...>';
var
  SampleInput: TStringList;
begin
  SampleInput := TStringList.Create();
  try
    SampleInput.Text := C_File_Type_Motor;
    Parser.Configure(SampleInput);
    Assert.AreEqual(tpcMotor, Parser.Configuration);
    Assert.AreEqual(0, Parser.ColumnIdx(F_sign));
    Assert.AreEqual(1, Parser.ColumnIdx(F_name));
    Assert.AreEqual(2, Parser.ColumnIdx(F_cost));
    Assert.AreEqual(3, Parser.ColumnIdx(F_quant));
    Assert.AreEqual(4, Parser.ColumnIdx(F_weight));
  finally
    SampleInput.Free();
  end;
end;

procedure TTestParser.TestConfigureAStrong;
const
  C_File_Type_AutoStrong =
    '#ASTRONG'+sLineBreak+
    'sign;name;;;;;;;;;;;;;;;;;quant;;;cost;;;;weight;;;;;;;;;;;;;;;;;;;;'+sLineBreak+
    '<...>';
var
  SampleInput: TStringList;
begin
  SampleInput := TStringList.Create();
  try
    SampleInput.Text := C_File_Type_AutoStrong;
    Parser.Configure(SampleInput);
    Assert.AreEqual(tpcAutoStrong, Parser.Configuration);
  finally
    SampleInput.Free();
  end;
end;

procedure TTestParser.TestLineDataGet;

  function callLineDataGet(const AInput: TStrings; const AColumn: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        Parser.LineDataGet(AInput, AColumn);
      end
    );
  end;


const
  C_Header = 'sign;name;cost;quant;weight';
  C_Line = '***';
var
  SampleInput: TStringList;
begin
  SampleInput := TStringList.Create();
  try
    SampleInput.Text := C_Line;
    Parser.MapHeader(C_Header);
    Assert.WillRaise(callLineDataGet(SampleInput, 'NotMapped'), ETtnParserColumnNotMapped);
    Assert.WillRaise(callLineDataGet(SampleInput, F_weight), ETtnParserColumnExceedInput);
    Assert.AreEqual(Parser.LineDataGet(SampleInput, F_Sign), C_Line);
  finally
    SampleInput.Free();
  end;
end;

procedure TTestParser.TestParseAStrong;

  function callParseAStrong(const AInput: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      var
        inputTest: TStringList;
      begin
        inputTest := TStringList.Create();
        try
          inputTest.Text := AInput;
          Parser.Parse(inputTest);
        finally
          inputTest.Free;
        end;
      end
    );
  end;

const
  C_File_Type_AutoStrong_Hdr =
    '#ASTRONG'+sLineBreak+
    'sign;name;;;;;;;;;;;;;;;;;quant;;;cost;;;;weight;;;;;;;;;;;;;;;;;;;;'+sLineBreak;
  C_Input_Normal =
    '****;Авто;;;;;;;;;;;;;;;;;12345;;;1.01;;;;24.375;;;;;;;;;;;;;;;;;;;;';
  C_Input_Convert_Error: array[0..2] of string = (
    '****;Авто;;;;;;;;;;;;;;;;;12#45;;;1.01;;;;24.375;;;;;;;;;;;;;;;;;;;;',
    '****;Авто;;;;;;;;;;;;;;;;;1245;;;1.01;;;;;;;;;;;;;;;;;;;;;;;;',
    '****;Авто;;;;;;;;;;;;;;;;;1245;;;1,01;;;;24.375;;;;;;;;;;;;;;;;;;;;'
  );
var
  inputConvertError: string;
begin
  for inputConvertError in C_Input_Convert_Error do
    Assert.WillRaise(callParseAStrong(C_File_Type_AutoStrong_Hdr + inputConvertError), EConvertError);
  Assert.WillNotRaise(callParseAStrong(C_File_Type_AutoStrong_Hdr + C_Input_Normal));
  Assert.AreEqual(1, Parser.ParseResult.Count, 'Не соотвествует количество элементов.');
  Assert.AreEqual('****', Parser.ParseResult[0].SIGN);
  Assert.AreEqual('Авто', Parser.ParseResult[0].NAME);
  Assert.AreEqual(12345, Parser.ParseResult[0].QUANTITY);
  Assert.AreEqual('1.01', Parser.ParseResult[0].COST.ToString);
  Assert.AreEqual('24.375',Parser.ParseResult[0].WEIGHT1.ToString);
  Assert.AreEqual('Авто',Parser.ParseResult[0].STR_PR);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestParser);

end.
