unit Ttn.Result.Document.Description;

interface

uses
  Ttn.Interfaces;

type
  TTtnDocumentDescription = class(TInterfacedObject, ITtnDocumentDescription)
  private
    FDocumentCode: string;
    FDocumentDate: TDate;
    FDocumentNumber: string;
    function GetDocumentCode: string;
    function GetDocumentDate: TDate;
    function GetDocumentNumber: string;
    procedure SetDocumentCode(const Value: string);
    procedure SetDocumentDate(const Value: TDate);
    procedure SetDocumentNumber(const Value: string);
  public
    property DocumentCode: string read GetDocumentCode write SetDocumentCode;
    property DocumentDate: TDate read GetDocumentDate write SetDocumentDate;
    property DocumentNumber: string read GetDocumentNumber write SetDocumentNumber;
  end;

implementation

function TTtnDocumentDescription.GetDocumentCode: string;
begin
  Result := FDocumentCode;
end;

function TTtnDocumentDescription.GetDocumentDate: TDate;
begin
  Result := FDocumentDate;
end;

function TTtnDocumentDescription.GetDocumentNumber: string;
begin
  Result := FDocumentNumber;
end;

procedure TTtnDocumentDescription.SetDocumentCode(const Value: string);
begin
  FDocumentCode := Value;
end;

procedure TTtnDocumentDescription.SetDocumentDate(const Value: TDate);
begin
  FDocumentDate := Value;
end;

procedure TTtnDocumentDescription.SetDocumentNumber(const Value: string);
begin
  FDocumentNumber := Value;
end;

end.
