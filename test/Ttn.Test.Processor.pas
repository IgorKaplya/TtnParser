unit Ttn.Test.Processor;

interface

uses
  DUnitX.TestFramework,
  Ttn.Interfaces;

type

  [TestFixture]
  TTtnTestProcessor = class(TObject)
  private
    FProcessor: ITtnProcessorTestable;
    FProcessObject: ITtnObj;
    property Processor: ITtnProcessorTestable read FProcessor;
    property ProcessObject: ITtnObj read FProcessObject;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('','RUB')]
    [TestCase('','РублЬ')]
    [TestCase('','Sehenswürdigkeiten')]
    procedure TestProcessCurrency(const ACurrencyExpected: string);
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('','1.001,1001')]
    [TestCase('','0.000001,0.001')]
    [TestCase('','0,0')]
    [TestCase('','-3.1415,-3141.5')]
    procedure TestProcessWeight(const AWeight, AWeightExpected: Double);
    [Test]
    procedure TestProcessCountry;
  end;

implementation

uses
  dmMain,
  Ttn.Registration;

procedure TTtnTestProcessor.Setup;
begin
  FProcessor := TTtnResolver.Resolve<ITtnProcessorTestable>;
  FProcessObject := TTtnResolver.Resolve<ITtnObj>;
end;

procedure TTtnTestProcessor.TearDown;
begin
  FProcessor := nil;
end;

procedure TTtnTestProcessor.TestProcessWeight(const AWeight, AWeightExpected: Double);
begin
  ProcessObject.WEIGHT1 := AWeight;
  Processor.ProcessWeight(ProcessObject);
  Assert.AreEqual(AWeightExpected, ProcessObject.WEIGHT1);
  Assert.AreEqual(AWeightExpected, ProcessObject.WEIGHT2);
  Assert.AreEqual(AWeightExpected, ProcessObject.WEIGHT3);
end;

procedure TTtnTestProcessor.TestProcessCurrency(const ACurrencyExpected: string);
begin
  Processor.Currency := ACurrencyExpected;
  Processor.ProcessCurrency(ProcessObject);
  Assert.AreEqual(ACurrencyExpected, ProcessObject.VAL);
end;

procedure TTtnTestProcessor.TestProcessCountry;

  function callProcessCountry(const AInput: String): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ProcessObject.ErrorMsg := '';
        ProcessObject.STR_PR := AInput;
        Processor.ProcessCountry(ProcessObject);
      end
    );
  end;

type
  RCountryTest = record
    input,
    expected: string;
  end;
const
  accepted_as_GB: array[0..1] of string = ('великобритания','unighted kingdom');
  country_Val_GB = 'GB';
  valid_Input: array[0..3] of RCountryTest = (
    (input: 'Великобритания'; expected: country_Val_GB),
    (input: 'Страна происхождения - Великобритания'; expected: country_Val_GB),
    (input: 'Страна происхождения - "Великобритания"'; expected: country_Val_GB),
    (input: 'Unighted Kingdom"'; expected: country_Val_GB)
  );
  wrong_Input: array[0..1] of string = (
    '',
    'Виликабритания АЗАЗАЗА'
  );
var
  testValid: RCountryTest;
  countryKeyGB: string;
  wrongCountry: string;
begin
  for countryKeyGB in accepted_as_GB do
    Processor.CountryList.AddOrSetValue(countryKeyGB, country_Val_GB);
  for testValid in valid_Input do
  begin
    Assert.WillNotRaise(callProcessCountry(testValid.input));
    Assert.AreEqual(testValid.expected, ProcessObject.str_Pr);
    Assert.IsEmpty(ProcessObject.ErrorMsg);
  end;
  for wrongCountry in wrong_Input do
  begin
    Assert.WillNotRaise(callProcessCountry(wrongCountry));
    Assert.AreEqual(wrongCountry, ProcessObject.str_Pr);
    Assert.IsNotEmpty(ProcessObject.ErrorMsg);
  end;

end;

initialization
  TDUnitX.RegisterTestFixture(TTtnTestProcessor);
end.
