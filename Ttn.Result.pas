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
    procedure BackupHistory;
    function GetHistoryFolder: string;
    procedure CheckResultFilesWritable;
    procedure AppendDocuments(const appendObj: ITtnObj; const ADocumentsDescription: TArray<ITtnDocumentDescription>);
    function AppendTtnObj(const newObj: ITtnObj; numberOffset: Integer): ITtnObj;
    function AppendObjNumberOffset: Integer;
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
    property HistoryFolder: string read GetHistoryFolder;
    procedure Append(const ANewTtn: ITtnList; const ADocumentsDescription: TArray<ITtnDocumentDescription>);
  end;

implementation

uses
  System.Classes, System.IOUtils, System.Types, System.SysUtils, Ttn.Constants;

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
  newObj, appendedTtnObj: ITtnObj;
  numberOffset: Integer;
begin
  numberOffset := AppendObjNumberOffset;
  for newObj in ANewTtn do
  begin
    appendedTtnObj := AppendTtnObj(newObj, numberOffset);
    AppendDocuments(appendedTtnObj, ADocumentsDescription);
  end;
end;

function TTtnResult.ResultsFileName: string;
begin
  Result := TPath.Combine(Folder, 'Results.xlsx');
end;

function TTtnResult.DocumentsFileName: string;
begin
  Result := TPath.Combine(Folder, 'Documents.xlsx');
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
  CheckResultFilesWritable();
  BackupHistory();
  TtnList.Save(ResultsFileName);
  Documents.Save(DocumentsFileName);
end;

procedure TTtnResult.BackupHistory;

  procedure TrimFiles();
  var
    historyFiles: TStringDynArray;
    i: Integer;
  begin
    historyFiles := TDirectory.GetFiles(HistoryFolder);
    if length(historyFiles)>=C_Max_Files_History then
      for i:=0 to (C_Max_Files_History div 2)-1 do
        TFile.Delete(historyFiles[i]);
  end;

var
  date: string;
begin
  if FileExists(ResultsFileName) then
  begin
    TDirectory.CreateDirectory(HistoryFolder);
    TrimFiles();
    date := FormatDateTime('YYYYMMDD_hhmmss_zzz', Now);
    TFile.Copy(ResultsFileName, TPath.Combine(
      HistoryFolder,
      date+'_'+TPath.GetFileNameWithoutExtension(ResultsFileName)),
      True);
    TFile.Copy(DocumentsFileName, TPath.Combine(
      HistoryFolder,
      date+'_'+TPath.GetFileNameWithoutExtension(DocumentsFileName)),
      True);
  end;
end;

function TTtnResult.GetHistoryFolder: string;
begin
  Result := TPath.Combine(Folder, 'History');;
end;

procedure TTtnResult.CheckResultFilesWritable;
var
  oneFile: string;
  fs: TFileStream;
  AFiles: array[0..1] of string;
begin
  AFiles[0] := ResultsFileName;
  AFiles[1] := DocumentsFileName;
  for oneFile in AFiles do
    if FileExists(oneFile) then
    begin
      fs := nil;
      try
        fs := TFile.OpenWrite(oneFile);
      finally
        FreeAndNil(fs)
      end;
    end;
end;

procedure TTtnResult.AppendDocuments(const appendObj: ITtnObj; const ADocumentsDescription: TArray<ITtnDocumentDescription>);
var
  newDoc: ITtnDocument;
  descrDoc: ITtnDocumentDescription;
  lastDocumentObjNumber: Integer;
begin
  lastDocumentObjNumber := 0;
  if Documents.Count > 0 then
    lastDocumentObjNumber := Documents.Last.NumberObj;
  if lastDocumentObjNumber<>appendObj.NUMBER then
    for descrDoc in ADocumentsDescription do
    begin
      newDoc := Documents.Add();
      newDoc.DocumentCode := descrDoc.DocumentCode;
      newDoc.DocumentNumber := descrDoc.DocumentNumber;
      newDoc.DocumentDate := descrDoc.DocumentDate;
      newDoc.NumberObj := appendObj.NUMBER;
    end;
end;

function TTtnResult.AppendTtnObj(const newObj: ITtnObj; numberOffset: Integer): ITtnObj;
begin
  Result := TtnList.Add();
    Result.NUMBER := newObj.NUMBER + numberOffset;
    Result.COST := newObj.COST;
    Result.KOD := newObj.KOD;
    Result.NAME := newObj.NAME;
    Result.QUANTITY := newObj.QUANTITY;
    Result.SIGN := newObj.SIGN;
    Result.STR_PR := newObj.STR_PR;
    Result.VAL := newObj.VAL;
    Result.WEIGHT1 := newObj.WEIGHT1;
    Result.WEIGHT2 := newObj.WEIGHT2;
    Result.WEIGHT3 := newObj.WEIGHT3;
    Result.DestinationCountry := DestinationCountry;
    Result.DestinationCountryRegion := DestinationCountryRegion;
    Result.DeliveryCountry := ShipmentCountry;
    Result.DeliveryCountryRegion := ShipmentCountryRegion;
    Result.DateTtn := DateTtn;
end;

function TTtnResult.AppendObjNumberOffset: Integer;
begin
  if TtnList.Count>0 then
    Result := TtnList.Last.NUMBER
  else
    Result := 0;
end;


end.
