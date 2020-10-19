unit Ttn.Result;

interface

uses
  Ttn.Interfaces;

type

  TTtnResult = class(TInterfacedObject, ITtnResult)
  private
    FDateTtn: TDate;
    FDestinationCountry: string;
    FDestinationCountryRegion: StringCountryRegion;
    FFolder: string;
    FShipmentCountry: string;
    FShipmentCountryRegion: StringCountryRegion;
    FDocuments: ITtnDocumentList;
    function GetDateTtn: TDate;
    function GetDestinationCountry: string;
    function GetDestinationCountryRegion: StringCountryRegion;
    function GetFolder: string;
    function GetShipmentCountry: string;
    function GetShipmentCountryRegion: StringCountryRegion;
    procedure SetDateTtn(const Value: TDate);
    procedure SetDestinationCountry(const Value: string);
    procedure SetDestinationCountryRegion(const Value: StringCountryRegion);
    procedure SetFolder(const Value: string);
    procedure SetShipmentCountry(const Value: string);
    procedure SetShipmentCountryRegion(const Value: StringCountryRegion);
    function GetDocuments: ITtnDocumentList;
  public
    constructor Create(ADocuments: ITtnDocumentList);
    destructor Destroy; override;
    property DestinationCountry: string read GetDestinationCountry write SetDestinationCountry;
    property DestinationCountryRegion: StringCountryRegion read GetDestinationCountryRegion write SetDestinationCountryRegion;
    property ShipmentCountry: string read GetShipmentCountry write SetShipmentCountry;
    property ShipmentCountryRegion: StringCountryRegion read GetShipmentCountryRegion write SetShipmentCountryRegion;
    property DateTtn: TDate read GetDateTtn write SetDateTtn;
    property Documents: ITtnDocumentList read GetDocuments;
    property Folder: string read GetFolder write SetFolder;
  end;

implementation

function TTtnResult.GetDateTtn: TDate;
begin
  Result := FDateTtn;
end;

function TTtnResult.GetDestinationCountry: string;
begin
  Result := FDestinationCountry;
end;

function TTtnResult.GetDestinationCountryRegion: StringCountryRegion;
begin
  Result := FDestinationCountryRegion;
end;

function TTtnResult.GetFolder: string;
begin
  Result := FFolder;
end;

function TTtnResult.GetShipmentCountry: string;
begin
  Result := FShipmentCountry;
end;

function TTtnResult.GetShipmentCountryRegion: StringCountryRegion;
begin
  Result := FShipmentCountryRegion;
end;

procedure TTtnResult.SetDateTtn(const Value: TDate);
begin
  FDateTtn := Value;
end;

procedure TTtnResult.SetDestinationCountry(const Value: string);
begin
  FDestinationCountry := Value;
end;

procedure TTtnResult.SetDestinationCountryRegion(const Value: StringCountryRegion);
begin
  FDestinationCountryRegion := Value;
end;

procedure TTtnResult.SetFolder(const Value: string);
begin
  FFolder := Value;
end;

procedure TTtnResult.SetShipmentCountry(const Value: string);
begin
  FShipmentCountry := Value;
end;

procedure TTtnResult.SetShipmentCountryRegion(const Value: StringCountryRegion);
begin
  FShipmentCountryRegion := Value;
end;

function TTtnResult.GetDocuments: ITtnDocumentList;
begin
  Result := FDocuments;
end;

constructor TTtnResult.Create(ADocuments: ITtnDocumentList);
begin
  inherited Create;
  FDocuments := ADocuments;
end;

destructor TTtnResult.Destroy;
begin
  FDocuments := nil;
  inherited Destroy;
end;

end.
