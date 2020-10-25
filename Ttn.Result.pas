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
    FTtnList: ITtnList;
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
    function ResultsFileName: string;
    function DocumentsFileName: string;
    function GetTtnList: ITtnList;
    procedure Load;
    procedure Save;
  public
    constructor Create(ADocuments: ITtnDocumentList; ATtnList: ITtnList);
    destructor Destroy; override;
    property DestinationCountry: string read GetDestinationCountry write SetDestinationCountry;
    property DestinationCountryRegion: StringCountryRegion read GetDestinationCountryRegion write SetDestinationCountryRegion;
    property ShipmentCountry: string read GetShipmentCountry write SetShipmentCountry;
    property ShipmentCountryRegion: StringCountryRegion read GetShipmentCountryRegion write SetShipmentCountryRegion;
    property DateTtn: TDate read GetDateTtn write SetDateTtn;
    property Documents: ITtnDocumentList read GetDocuments;
    property Folder: string read GetFolder write SetFolder;
    property TtnList: ITtnList read GetTtnList;
    procedure Append(const ANewTtn: ITtnList; const ADocumentsDescription: TArray<ITtnDocumentDescription>);
  end;

implementation

uses
  System.Classes, System.IOUtils;

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

constructor TTtnResult.Create(ADocuments: ITtnDocumentList; ATtnList: ITtnList);
begin
  inherited Create;
  FDocuments := ADocuments;
  FTtnList := ATtnList;
end;

destructor TTtnResult.Destroy;
begin
  FDocuments := nil;
  inherited Destroy;
end;

procedure TTtnResult.Append(const ANewTtn: ITtnList; const ADocumentsDescription: TArray<ITtnDocumentDescription>);
var
  newObj, appendObj: ITtnObj;
  newDoc: ITtnDocument;
  descrDoc: ITtnDocumentDescription;
  iLastNumber: Integer;
begin
  if TtnList.Count>0 then
    iLastNumber := TtnList.Last.NUMBER
  else
    iLastNumber := 0;
  iLastNumber := TtnList.Last.NUMBER;
  for newObj in ANewTtn do
  begin
    appendObj := TtnList.Add();
      appendObj.NUMBER := newObj.NUMBER + iLastNumber;
      appendObj.COST := newObj.COST;
      appendObj.KOD := newObj.KOD;
      appendObj.NAME := newObj.NAME;
      appendObj.QUANTITY := newObj.QUANTITY;
      appendObj.SIGN := newObj.SIGN;
      appendObj.STR_PR := newObj.STR_PR;
      appendObj.VAL := newObj.VAL;
      appendObj.WEIGHT1 := newObj.WEIGHT1;
      appendObj.WEIGHT2 := newObj.WEIGHT2;
      appendObj.WEIGHT3 := newObj.WEIGHT3;
      appendObj.DestinationCountry := DestinationCountry;
      appendObj.DestinationCountryRegion := DestinationCountryRegion;
      appendObj.DeliveryCountry := ShipmentCountry;
      appendObj.DeliveryCountryRegion := ShipmentCountryRegion;
      appendObj.DateTtn := DateTtn;
    for descrDoc in ADocumentsDescription do
    begin
      newDoc := Documents.Add();
      newDoc.DocumentCode := descrDoc.DocumentCode;
      newDoc.DocumentNumber := descrDoc.DocumentNumber;
      newDoc.DocumentDate := descrDoc.DocumentDate;
      newDoc.NumberObj := appendObj.NUMBER;
    end;
  end;
end;

function TTtnResult.ResultsFileName: string;
begin
  Result := TPath.Combine(Folder, 'Results.csv');
end;

function TTtnResult.DocumentsFileName: string;
begin
  Result := TPath.Combine(Folder, 'Documents.csv');
end;

function TTtnResult.GetTtnList: ITtnList;
begin
  Result := FTtnList;
end;

procedure TTtnResult.Load;
begin
  TtnList.Load(ResultsFileName);
  Documents.Load(DocumentsFileName);
  if TtnList.Count>0 then
  begin
    DestinationCountry := TtnList.Last.DestinationCountry;
    ShipmentCountry := TtnList.Last.DeliveryCountry;
    DestinationCountryRegion := TtnList.Last.DestinationCountryRegion;
    ShipmentCountryRegion := TtnList.Last.DeliveryCountryRegion;
  end;
end;

procedure TTtnResult.Save;
begin
  TtnList.Save(ResultsFileName);
  Documents.Save(DocumentsFileName);
end;


end.
