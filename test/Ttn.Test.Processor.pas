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
    // Sample Methods
    // Simple single Test
    [Test]
    procedure Test1;
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('','1.001,1001')]
    [TestCase('','0.000001,0.001')]
    [TestCase('','0,0')]
    [TestCase('','-3.1415,-3141.5')]
    procedure ProcessWeight(const AWeight, AWeightExpected: Double);
    // Test with TestCase Attribute to supply parameters.
    [Test]
    [TestCase('','RUB')]
    [TestCase('','РублЬ')]
    [TestCase('','Sehenswürdigkeiten')]
    procedure ProcessCurrency(const ACurrencyExpected: string);
  end;

implementation

uses
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

procedure TTtnTestProcessor.Test1;
begin
  Assert.Pass();
end;

procedure TTtnTestProcessor.ProcessWeight(const AWeight, AWeightExpected: Double);
begin
  ProcessObject.WEIGHT1 := AWeight;
  Processor.ProcessWeight(ProcessObject);
  Assert.AreEqual(AWeightExpected, ProcessObject.WEIGHT1);
  Assert.AreEqual(AWeightExpected, ProcessObject.WEIGHT2);
  Assert.AreEqual(AWeightExpected, ProcessObject.WEIGHT3);
end;

procedure TTtnTestProcessor.ProcessCurrency(const ACurrencyExpected: string);
begin
  Processor.Currency := ACurrencyExpected;
  Processor.ProcessCurrency(ProcessObject);
  Assert.AreEqual(ACurrencyExpected, ProcessObject.VAL);
end;

initialization
  TDUnitX.RegisterTestFixture(TTtnTestProcessor);
end.
