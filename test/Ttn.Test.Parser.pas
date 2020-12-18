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
    procedure TestLineDataStr;
    [Test]
    [TestCase]
    procedure TestLineDataInt;
    [Test]
    [TestCase]
    procedure TestLineDataDbl;
    [Test]
    [TestCase('ConfigureAbsentFile','Abrcacadabra.csv')]
    procedure TestParseAbsentFile(const AFile: string);
    [Test]
    [TestCase('','AAA,A'#$0020#$0009#$000D#$00A0#$0085'AA')]
    procedure TestRemoveWhiteSpace(const  ACleanStr, AStr: string);
    [Test]
    [TestCase]
    procedure TestParseAStrong;
    [Test]
    procedure TestParseAStrongName();
  end;

implementation

uses
  System.Classes, System.SysUtils, Ttn.Errors, Spring.Container, Ttn.Constants, Ttn.Registration;

const
  C_Default_Header = F_sign+';'+F_name+';'+F_cost+';'+F_quant+';'+F_weight;  

procedure TTestParser.Setup;
begin
  FParser := TTtnResolver.Resolve<ITtnParserTestable>;
end;

procedure TTestParser.TearDown;
begin
  FParser := nil;
end;

procedure TTestParser.TestParseMotor;

  function callParseMotor(const AInput: string): TTestLocalMethod;
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
  C_File_Type_Motor_Hdr =
    '#MOTOR'+sLineBreak+
    C_Default_Header+sLineBreak;

  C_Input_Normal =
    '*;Автомагнитола;1260.01;1;0.002'+sLineBreak+';страна происхождения-Соединенные Штаты;;;';

  C_Input_Convert_Error: array[0..2] of string = (
    '*;Автомагнитола;126z0.01;1;0.002'+sLineBreak+';страна происхождения-Соединенные Штаты;;;',
    '*;Автомагнитола;1260.01;1z;0.002'+sLineBreak+';страна происхождения-Соединенные Штаты;;;',
    '*;Автомагнитола;1260.01;1;0.0z02'+sLineBreak+';страна происхождения-Соединенные Штаты;;;'
  );
var
  input: string;
begin
  for input in C_Input_Convert_Error do
    Assert.WillRaise(callParseMotor(C_File_Type_Motor_Hdr + input), ETtnParseLine);
  Assert.WillNotRaise(callParseMotor(C_File_Type_Motor_Hdr + C_Input_Normal));
    Assert.AreEqual(1, Parser.ParseResult.Count, 'Не соотвествует количество элементов.');
    Assert.AreEqual('*', Parser.ParseResult[0].SIGN);
    Assert.AreEqual('Автомагнитола', Parser.ParseResult[0].NAME);
    Assert.AreEqual('1260.01', Parser.ParseResult[0].COST.ToString);
    Assert.AreEqual(1, Parser.ParseResult[0].QUANTITY);
    Assert.AreEqual('0.002',Parser.ParseResult[0].WEIGHT1.ToString);
    Assert.AreEqual('страна происхождения-Соединенные Штаты',Parser.ParseResult[0].STR_PR);
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
    C_Default_Header+sLineBreak+
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

procedure TTestParser.TestLineDataStr;

  function callLineDataGet(const AInput: TStrings; const AColumn: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        Parser.LineDataStr(AInput, AColumn);
      end
    );
  end;


const
  C_Header = C_Default_Header;
  C_Line = 'Sehenswürdigkeiten';
var
  SampleInput: TStringList;
begin
  SampleInput := TStringList.Create();
  try
    SampleInput.Text := C_Line;
    Parser.MapHeader(C_Header);
    Assert.WillRaise(callLineDataGet(SampleInput, 'NotMapped'), ETtnParserColumnNotMapped);
    Assert.WillRaise(callLineDataGet(SampleInput, F_weight), ETtnParserColumnExceedInput);
    Assert.AreEqual(Parser.LineDataStr(SampleInput, F_sign), C_Line);
  finally
    SampleInput.Free();
  end;
end;

procedure TTestParser.TestLineDataInt;
var
  TestResult: Integer;

  function callLineDataGet(const ALineInput: String; const AColumn: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      var
        SampleInput: TStringList;
      begin
        SampleInput := TStringList.Create('"',';', [soStrictDelimiter]);
        try
          SampleInput.DelimitedText := ALineInput;
          TestResult := Parser.LineDataInt(SampleInput, AColumn);
        finally
          SampleInput.Free;
        end;
      end
    );
  end;

type
  RTestRecord = record
    Text: string;
    Value: Integer;
  end;
const
  C_Header = C_Default_Header;
  C_Valid_Input: array[0..7] of RTestRecord = (
    (Text: '-1'; Value: -1),(Text: '0'; Value: 0),(Text: '1'; Value: 1),(Text: '-1 024'; Value: -1024), (Text: '1 024'; Value: 1024),
    (Text: '"-1 024"'; Value: -1024), (Text: '"1 024"'; Value: 1024), (Text: '"0"'; Value: 0)
  );
  C_InValid_Input: array[0..4] of string = (
    '1.01','1#1','Sehenswürdigkeiten','1,01',';'
  );  
var
  inputValid: RTestRecord;
  inputInvalid: string;
begin
  Parser.MapHeader(C_Header);
  for inputValid in C_Valid_Input do
    begin
    Assert.WillNotRaise(callLineDataGet(inputValid.Text, F_sign));
    Assert.AreEqual(inputValid.Value, TestResult);
    end;
  for inputInvalid in C_InValid_Input do
    Assert.WillRaise(callLineDataGet(inputInvalid, F_sign), EConvertError);
end;

procedure TTestParser.TestLineDataDbl;
var
  TestResult: Double;

  function callLineDataGet(const ALineInput: String; const AColumn: string): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      var
        SampleInput: TStringList;
      begin
        SampleInput := TStringList.Create('"',';', [soStrictDelimiter]);
        try
          SampleInput.DelimitedText := ALineInput;
          TestResult := Parser.LineDataDbl(SampleInput, AColumn);
        finally
          SampleInput.Free;
        end;
      end
    );
  end;

type
  RTestRecord = record
    Text: string;
    Value: Double;
  end;
const
  C_Header = C_Default_Header;
  C_Valid_Input: array[0..7] of RTestRecord = (
    (Text: '-1.00'; Value: -1.00),(Text: '0'; Value: 0),(Text: '1.00'; Value: 1.00),(Text: '-1 024.375'; Value: -1024.375), 
    (Text: '1 024.375'; Value: 1024.375), (Text: '"-1 024.125"'; Value: -1024.125), (Text: '"1 024.125"'; Value: 1024.125), (Text: '"0.00"'; Value: 0)
  );
  C_InValid_Input: array[0..3] of string = (
    '1#1','Sehenswürdigkeiten','1,01',';'
  );  
var
  inputValid: RTestRecord;
  inputInvalid: string;
begin
  Parser.MapHeader(C_Header);
  for inputValid in C_Valid_Input do
    begin
    Assert.WillNotRaise(callLineDataGet(inputValid.Text, F_sign));
    Assert.AreEqual(inputValid.Value, TestResult);
    end;
  for inputInvalid in C_InValid_Input do
    Assert.WillRaise(callLineDataGet(inputInvalid, F_sign), EConvertError);
end;

procedure TTestParser.TestRemoveWhiteSpace(const ACleanStr, AStr: string);
begin
  Assert.AreEqual(ACleanStr, Parser.RemoveWhiteSpace(AStr));
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
    '****;Авто *Великобритания;;;;;;;;;;;;;;;;;12 345;;;1.01;;;;24.375;;;;;;;;;;;;;;;;;;;;';

  C_Input_Convert_Error: array[0..2] of string = (
    '****;Авто;;;;;;;;;;;;;;;;;12#45;;;1.01;;;;24.375;;;;;;;;;;;;;;;;;;;;',
    '****;Авто;;;;;;;;;;;;;;;;;1245;;;1.01;;;;;;;;;;;;;;;;;;;;;;;;',
    '****;Авто;;;;;;;;;;;;;;;;;1245;;;1,01;;;;24.375;;;;;;;;;;;;;;;;;;;;'
  );
var
  inputConvertError: string;
begin
  for inputConvertError in C_Input_Convert_Error do
    Assert.WillRaise(callParseAStrong(C_File_Type_AutoStrong_Hdr + inputConvertError), ETtnParseLine);
  Assert.WillNotRaise(callParseAStrong(C_File_Type_AutoStrong_Hdr + C_Input_Normal));
  Assert.AreEqual(1, Parser.ParseResult.Count, 'Не соотвествует количество элементов.');
  Assert.AreEqual('****', Parser.ParseResult[0].SIGN);
  Assert.AreEqual('Авто', Parser.ParseResult[0].NAME);
  Assert.AreEqual(12345, Parser.ParseResult[0].QUANTITY);
  Assert.AreEqual('1.01', Parser.ParseResult[0].COST.ToString);
  Assert.AreEqual('24.375',Parser.ParseResult[0].WEIGHT1.ToString);
  Assert.AreEqual('Великобритания',Parser.ParseResult[0].STR_PR);
end;

procedure TTestParser.TestParseAStrongName;

  function callParseAStrongName(const AInput: string; const AObj: ITtnObj): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        Parser.ParseAStrongName(AInput, AObj);
      end
    );
  end;

const
  Expected_Name = 'Авто';
  Expected_Country = 'Великобритания';
  C_Input_Normal: array[0..5] of string = (
    'Авто *Великобритания',
    'Авто *Инвойс *Великобритания',
    'Авто *Инв*ойс *Великобритания',
    'Авто *Инвойс *Еще что-то *Великобритания',
    '"Авто *Великобритания"','"Авто *Инвойс *Великобритания"'
  );
var
  sInput: string;
  testObj: ITtnObj;
begin
  testObj := TTtnResolver.Resolve<ITtnObj>;
  for sInput in C_Input_Normal do
  begin
    Assert.WillNotRaise(callParseAStrongName(sInput, testObj));
    Assert.AreEqual(Expected_Name, testObj.NAME);
    Assert.AreEqual(Expected_Country, testObj.STR_PR);
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestParser);

end.
