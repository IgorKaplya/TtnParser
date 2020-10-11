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
  public
    property NumberObj: Integer read GetNumberObj write SetNumberObj;
    property DocumentCode: string read GetDocumentCode write SetDocumentCode;
    property DocumentNumber: string read GetDocumentNumber write SetDocumentNumber;
    property DocumentDate: TDate read GetDocumentDate write SetDocumentDate;
  end;

implementation

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

end.
