unit Ttn.Test.TtnObj;

interface
uses
  DUnitX.TestFramework, Ttn.Interfaces;

type

  [TestFixture]
  TTestTtnObj = class(TObject)
  private
    FTtnObj: ITtnObj;
    property TtnObj: ITtnObj read FTtnObj;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure TestAsText;
    [Test]
    procedure TestAsText_BoundaryConditions;
  end;

implementation

uses
  Ttn.Registration, Ttn.Errors, System.SysUtils;

procedure TTestTtnObj.Setup;
begin
  FTtnObj := TTtnResolver.Resolve<ITtnObj>;
end;

procedure TTestTtnObj.TearDown;
begin
  FTtnObj := nil;
end;

procedure TTestTtnObj.TestAsText;
const
  text_obj = '7;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;0.001;780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24.06.1987"';
begin
  TtnObj.AsText := text_obj;
  Assert.AreEqual(
    text_obj,
    TtnObj.AsText
  );
end;

procedure TTestTtnObj.TestAsText_BoundaryConditions;

  function AsTextDelegate(const AText: string): TTestLocalMethod;
  begin
    Result :=
      procedure()
      begin
        TtnObj.AsText := AText;
      end
  end;

const
  converter_errors: array [0..7] of string = (
    '1A;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;0.001;780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24.06.1987"',
    '4;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0,001;0.001;0.001;780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24.06.1987"',
    '5;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0.001;A0.001;0.001;780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24.06.1987"',
    '6;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;zzz;780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24.06.1987"',
    '7;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;0.001;*780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24.06.1987"',
    '10;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;0.001;780.00;"USD";"eu";1A;"BY";"030";"RU";"140";"24.06.1987"',
    '151;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;0.001;780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24.-.1987"',
    '153;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;0.001;780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24/06/1987"'
  );
  empty_data_errors: array [0..1] of string = (
    '1;"";"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;0.001;780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24.06.1987"',
    '2;;"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;0.001;780.00;"USD";"eu";1;"BY";"030";"RU";"140";"24.06.1987"'
  );

var
  text_obj: string;
begin
  Assert.WillRaise(AsTextDelegate(''), ETtnObjAsTxtNotEnoughFields);
  Assert.WillRaise(AsTextDelegate('7;"3926909709";"опнвхе вюярх окюярлюяянбше а/с";0.001;0.001;0.001;780.00'), ETtnObjAsTxtNotEnoughFields);
  for text_obj in converter_errors do
    Assert.WillRaise(AsTextDelegate(text_obj), EConvertError, text_obj);
  for text_obj in empty_data_errors do
    Assert.WillRaise(AsTextDelegate(text_obj), ETtnObjAsTxtFieldIsEmpty, text_obj);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnObj);
end.
