unit Ttn.Result.Document;

interface

uses
  Ttn.Interfaces;

type
  TTtnDocument = class(TInterfacedObject, ITtnDocument)
  private
    FDocumentCode: string;
    FDocumentDate: TDate;
    FDocumentNumber: string;
    FNumberObj: Integer;
    function GetDocumentCode: string;
    function GetDocumentDate: TDate;
    function GetDocumentNumber: string;
    function GetNumberObj: Integer;
    procedure SetDocumentCode(const Value: string);
    procedure SetDocumentDate(const Value: TDate);
    procedure SetDocumentNumber(const Value: string);
    procedure SetNumberObj(const Value: Integer);
    function GetAsText: string;
    procedure SetAsText(const Value: string);
  public
    property NumberObj: Integer read GetNumberObj write SetNumberObj;
    property DocumentCode: string read GetDocumentCode write SetDocumentCode;
    property DocumentNumber: string read GetDocumentNumber write SetDocumentNumber;
    property DocumentDate: TDate read GetDocumentDate write SetDocumentDate;
    property AsText: string read GetAsText write SetAsText;
  end;

implementation

uses
  System.SysUtils, Ttn.Constants, System.Classes, Ttn.Errors;

function TTtnDocument.GetDocumentCode: string;
begin
  Result := FDocumentCode;
end;

function TTtnDocument.GetDocumentDate: TDate;
begin
  Result := FDocumentDate;
end;

function TTtnDocument.GetDocumentNumber: string;
begin
  Result := FDocumentNumber;
end;

function TTtnDocument.GetNumberObj: Integer;
begin
  Result := FNumberObj;
end;

procedure TTtnDocument.SetDocumentCode(const Value: string);
begin
  FDocumentCode := Value;
end;

procedure TTtnDocument.SetDocumentDate(const Value: TDate);
begin
  FDocumentDate := Value;
end;

procedure TTtnDocument.SetDocumentNumber(const Value: string);
begin
  FDocumentNumber := Value;
end;

procedure TTtnDocument.SetNumberObj(const Value: Integer);
begin
  FNumberObj := Value;
end;

function TTtnDocument.GetAsText: string;
begin
  Result := format('%d;%s;%s;%s', [
    NumberObj,                                          // 0
    DocumentCode,                                       // 1
    DocumentNumber,                                     // 2
    FormatDateTime(C_Date_Tovar_Format, DocumentDate)   // 3
  ]);
end;

procedure TTtnDocument.SetAsText(const Value: string);
const
  doc_min_field_count = 4;
var
  i: Integer;
  sl: TStringList;
  fs: TFormatSettings;
begin
  sl := TStringList.Create();
  try
    fs := TFormatSettings.Create('Windows-1251');
    fs.ShortDateFormat := C_Date_Tovar_Format;
    sl.Delimiter := ';';
    sl.StrictDelimiter := True;
    sl.DelimitedText := Value;
    ETtnDocAsTxtNotEnoughFields.Test(sl.Count >= doc_min_field_count, 'Couldn`t load doc.line "%s". Need %d+ fields.', [Value, doc_min_field_count ]);
    for i := 0 to sl.Count-1 do
    begin
      ETtnDocAsTxtFieldIsEmpty.Test(not sl[i].IsEmpty, 'Couldn`t load line "%s". [%d] field is empty.', [Value, i]);
      case i of
        0: NumberObj := sl[i].ToInteger();
        1: DocumentCode := sl[i];
        2: DocumentNumber := sl[i];
        3: DocumentDate := StrToDate(sl[i], fs);
      end;
    end;
  finally
    sl.Free();
  end;
end;

end.
