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
    FProcessKod: ITtnKod;
    property Processor: ITtnProcessorTestable read FProcessor;
    property ProcessObject: ITtnObj read FProcessObject;
    property ProcessKod: ITtnKod read FProcessKod;
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
    [TestCase('','1000,1.001,1001')]
    [TestCase('','1000,0.000001,0.001')]
    [TestCase('','1000,0,0')]
    [TestCase('','1000,-3.1415,-3141.5')]
    [TestCase('','1,-3.1415,-3.1415')]
    [TestCase('','2,2,4')]
    [TestCase('','0,1,0')]
    procedure TestProcessWeight(const AWeightMultiplier, AWeight, AWeightExpected: Double);
    [Test]
    procedure TestProcessCountry;
    [Test]
    procedure TestProcessKod;
    [Test]
    procedure TestCheckKodCoeff;
    [Test]
    procedure TestCheckKodWeightStandart;
    [Test]
    [TestCase('','100.0,10,10,1.1,True')]
    [TestCase('','100.0,10,5,1.1,False')]
    procedure TestCheckWeightRangeValid(AWeight: Double; AQuantity: Integer; AWeightStandart, AWeightStandartCoefficient: Double; isOk: Boolean);
  end;

implementation

uses
  dmMain
  , Ttn.Registration
  , System.SysUtils
  , Ttn.Errors
  ;

procedure TTtnTestProcessor.Setup;
begin
  FProcessor := TTtnResolver.Resolve<ITtnProcessorTestable>;
  FProcessObject := TTtnResolver.Resolve<ITtnObj>;
  FProcessKod := TTtnResolver.Resolve<ITtnKod>;
end;

procedure TTtnTestProcessor.TearDown;
begin
  FProcessor := nil;
  FProcessKod := nil;
  FProcessObject := nil;
end;

procedure TTtnTestProcessor.TestProcessWeight(const AWeightMultiplier, AWeight, AWeightExpected: Double);
begin
  ProcessObject.WEIGHT1 := AWeight;
  Processor.WeightMultiplier := AWeightMultiplier;
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

procedure TTtnTestProcessor.TestProcessKod;

  function callProcessKod(const AInputSign, AInputName: String): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ProcessObject.ErrorMsg := '';
        ProcessObject.SIGN := AInputSign;
        ProcessObject.NAME := AInputName;
        Processor.ProcessKod(ProcessObject);
      end
    );
  end;

type
  RKodDescription = record
    Kodsign: string;
    KodTxt: string;
    KodVal: string;
  end;
  RKodTest = record
    inputSign: string;
    inputName: string;
    expectedKod: string;
  end;
const
  given_kodlist: array[0..4] of RKodDescription = (
    (Kodsign: ''; KodTxt:  'Двигатель'; KodVal: '111'),
    (Kodsign: 'Д'; KodTxt: 'Двигатель'; KodVal: '222'),
    (Kodsign: 'Б'; KodTxt: 'Двигатель'; KodVal: '333'),
    (Kodsign: ''; KodTxt:  'Амортизатор капота'; KodVal: '555'),
    (Kodsign: ''; KodTxt:  'Капот'; KodVal: '666')
  );
  valid_input: array[0..7] of RKodTest = (
    (inputSign: ''; inputName:  'Двигатель'; expectedKod: '111'),
    (inputSign: 'Д'; inputName: 'Двигатель'; expectedKod: '222'),
    (inputSign: 'Б'; inputName: 'Двигатель'; expectedKod: '333'),
    (inputSign: 'д'; inputName: 'двигатель'; expectedKod: '222'),
    (inputSign: 'б'; inputName: 'ДвигАтель'; expectedKod: '333'),
    (inputSign: ''; inputName: 'Капот'; expectedKod: '666'),
    (inputSign: ' '; inputName:  ' Двигатель '; expectedKod: '111'),
    (inputSign: ' Д '; inputName: ' Двигатель '; expectedKod: '222')
  );
  wrong_input: array[0..0] of RKodTest = (
    (inputName: 'AbraCadabra'; expectedKod: '')
  );
var
  givenKod: ITtnKod;
  kodDescr: RKodDescription;
  kodTest: RKodTest;
begin
   for kodDescr in given_kodlist do
   begin
     givenKod := Processor.KodList.Add();
     givenKod.KodKey := TGUID.NewGuid;
     givenKod.Kodsign := kodDescr.Kodsign;
     givenKod.KodTxt := kodDescr.KodTxt;
     givenKod.KodVal := kodDescr.KodVal;
     givenKod.KodWeightKoef := 0;
     givenKod.KodWeightStandart := 0;
   end;

   for kodTest in valid_input do
   begin
     Assert.WillNotRaise(callProcessKod(kodTest.inputSign, kodTest.inputName));
     Assert.AreEqual(kodTest.expectedKod, ProcessObject.KOD, Format('[%s/%s]',[kodTest.inputSign, kodTest.inputName]));
   end;

   for kodTest in wrong_input do
   begin
     Assert.WillNotRaise(callProcessKod(kodTest.inputSign, kodTest.inputName));
     Assert.AreEqual(ProcessObject.KOD, '');
   end;
end;

procedure TTtnTestProcessor.TestCheckKodCoeff;

  function callCheckKodHasWeightCoefficient(const AInputCoeff: Double): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ProcessKod.KodWeightKoef := AInputCoeff;
        Processor.CheckKodHasWeightCoefficient(ProcessKod);
      end
    );
  end;

const
  given_valid: array[0..2] of Double = (-1,1,0.275);
  given_invalid: array[0..2] of Double = (-0,0,0.000001);
var
  testCoefficient: Double;
begin
  for testCoefficient in given_valid do
    Assert.WillNotRaiseAny(callCheckKodHasWeightCoefficient(testCoefficient),'valid: '+testCoefficient.ToString);
  for testCoefficient in given_invalid do
    Assert.WillRaise(callCheckKodHasWeightCoefficient(0), ETtnWeightProcessingCoefficientWeightZero, 'invalid: '+testCoefficient.ToString);
end;

procedure TTtnTestProcessor.TestCheckKodWeightStandart;

  function callCheckKodHasStandartWeight(const AInputWeightStandart: Double): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ProcessKod.KodWeightStandart := AInputWeightStandart;
        Processor.CheckKodHasStandartWeight(ProcessKod);
      end
    );
  end;

const
  given_valid: array[0..2] of Double = (-1,1,0.275);
  given_invalid: array[0..2] of Double = (-0,0,0.000001);
var
  testStandartWeight: Double;
begin
  for testStandartWeight in given_valid do
    Assert.WillNotRaiseAny(callCheckKodHasStandartWeight(testStandartWeight),'valid: '+testStandartWeight.ToString);
  for testStandartWeight in given_invalid do
    Assert.WillRaise(callCheckKodHasStandartWeight(testStandartWeight), ETtnWeightProcessingWeightStandartZero, 'invalid: '+testStandartWeight.ToString);
end;

procedure TTtnTestProcessor.TestCheckWeightRangeValid(AWeight: Double; AQuantity: Integer; AWeightStandart,
  AWeightStandartCoefficient: Double; isOk: Boolean);

  function callCheckKodHasStandartWeight(): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      begin
        ProcessObject.WEIGHT1 := AWeight;
        ProcessObject.QUANTITY := AQuantity;

        ProcessKod.KodWeightStandart := AWeightStandart;
        ProcessKod.KodWeightKoef := AWeightStandartCoefficient;

        Processor.CheckWeightRange(ProcessKod, ProcessObject);
      end
    );
  end;

begin
  if isOk then
    Assert.WillNotRaiseAny(callCheckKodHasStandartWeight())
  else
    Assert.WillRaise(callCheckKodHasStandartWeight(), ETtnWeightProcessingWeightViolatesAcceptable);
end;

initialization
  TDUnitX.RegisterTestFixture(TTtnTestProcessor);
end.
