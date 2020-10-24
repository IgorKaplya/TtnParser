unit Ttn.Test.Document;

interface
uses
  DUnitX.TestFramework, Ttn.Interfaces;

type

  [TestFixture]
  TTestTtnDocument = class(TObject)
  private
    FTtnDoc: ITtnDocument;
  public
    property TtnDoc: ITtnDocument read FTtnDoc;
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure Test_AsText;
    [Test]
    procedure TestAsText_BoundaryConditions;
  end;

implementation

uses
  Ttn.Registration, Ttn.Errors, System.SysUtils;

procedure TTestTtnDocument.Setup;
begin
  FTtnDoc := TTtnResolver.Resolve<ITtnDocument>;
end;

procedure TTestTtnDocument.TearDown;
begin
  FTtnDoc := nil;
end;

procedure TTestTtnDocument.Test_AsText;
const
  doc_as_text = '1;12/25AA;PP_qq;15.01.2000';
begin
  TtnDoc.AsText := doc_as_text;
  Assert.AreEqual(
    doc_as_text,
    TtnDoc.AsText
  );
end;

procedure TTestTtnDocument.TestAsText_BoundaryConditions;

  function AsTextDelegate(const AText: string): TTestLocalMethod;
  begin
    Result :=
      procedure()
      begin
        TtnDoc.AsText := AText;
      end
  end;

const
  converter_errors: array [0..2] of string = (
    '1A;"3926909709";"œ–Œ◊»≈ ◊¿—“» œÀ¿—“Ã¿——Œ¬€≈ ¡/”";"24.06.1987"',
    '151;"3926909709";"œ–Œ◊»≈ ◊¿—“» œÀ¿—“Ã¿——Œ¬€≈ ¡/”";"24.-.1987"',
    '153;"3926909709";"œ–Œ◊»≈ ◊¿—“» œÀ¿—“Ã¿——Œ¬€≈ ¡/”";"24/06/1987"'
  );
  empty_data_errors: array [0..3] of string = (
    ';12/25AA;PP_qq;15.01.2000',
    '2;;PP_qq;15.01.2000',
    '3;12/25AA;;15.01.2000',
    '4;12/25AA;PP_qq;'
  );

var
  text_obj: string;
begin
  Assert.WillRaise(AsTextDelegate(''), ETtnDocAsTxtNotEnoughFields);
  Assert.WillRaise(AsTextDelegate('7;"3926909709";"œ–Œ◊»≈ ◊¿—“» œÀ¿—“Ã¿——Œ¬€≈ ¡/”"'), ETtnDocAsTxtNotEnoughFields);
  for text_obj in converter_errors do
    Assert.WillRaise(AsTextDelegate(text_obj), EConvertError, text_obj);
  for text_obj in empty_data_errors do
    Assert.WillRaise(AsTextDelegate(text_obj), ETtnDocAsTxtFieldIsEmpty, text_obj);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnDocument);
end.
