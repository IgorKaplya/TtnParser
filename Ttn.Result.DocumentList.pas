unit Ttn.Result.DocumentList;

interface

uses
  Ttn.Interfaces, Ttn.Enum.EnumerableList, System.Classes, System.SysUtils;

type
  TTtnDocumentList = class(TTtnEnumerableList<ITtnDocument>, ITtnDocumentList)
  private
    FListFactory: ITtnFactory<ITtnDocumentList>;
    FExcelAdapter: ITtnExcelAdapter;
    procedure Load(const AFile: string); overload;
    procedure Load(const AStrings: TStrings); overload;
    procedure Save(const AStrings: TStrings); overload;
    procedure Save(const AFile: string); overload;
    function DocumentsForObj(const numberObj: Integer): ITtnDocumentList;
    property ListFactory: ITtnFactory<ITtnDocumentList> read FListFactory;
    property ExcelAdapter: ITtnExcelAdapter read FExcelAdapter;
  public
    constructor Create(AItemFactory: ITtnFactory<ITtnDocument>; AListFactory: ITtnFactory<ITtnDocumentList>; AExcelAdapter:
        ITtnExcelAdapter);
  end;

implementation

procedure TTtnDocumentList.Load(const AFile: string);
var
  listFile: TStringList;
begin
  listFile := TStringList.Create();
  try
    ExcelAdapter.Load(AFile, listFile);
    Load(listFile);
  finally
    listFile.Free();
  end;
end;

procedure TTtnDocumentList.Load(const AStrings: TStrings);
var
  line: string;
begin
  Clear();
  for line in AStrings do
    Add().AsText := line;
end;

procedure TTtnDocumentList.Save(const AStrings: TStrings);
var
  doc: ITtnDocument;
begin
  for doc in Self do
    AStrings.Add(doc.AsText);
end;

procedure TTtnDocumentList.Save(const AFile: string);
var
  listFile: TStringList;
begin
  listFile := TStringList.Create();
  try
    Save(listFile);
    ExcelAdapter.Save(AFile, listFile);
  finally
    listFile.Free();
  end;
end;

function TTtnDocumentList.DocumentsForObj(const numberObj: Integer): ITtnDocumentList;
var
  doc: ITtnDocument;
begin
  Result := ListFactory();
  for doc in Self do
  if doc.NumberObj = numberObj then
  begin
    Result.Add();
    Result.Last.NumberObj := doc.NumberObj;
    Result.Last.DocumentCode := doc.DocumentCode;
    Result.Last.DocumentNumber := doc.DocumentNumber;
    Result.Last.DocumentDate := doc.DocumentDate;
  end;
end;

constructor TTtnDocumentList.Create(AItemFactory: ITtnFactory<ITtnDocument>; AListFactory: ITtnFactory<ITtnDocumentList>;
    AExcelAdapter: ITtnExcelAdapter);
begin
  inherited Create(AItemFactory);
  FListFactory := AListFactory;
  FExcelAdapter := AExcelAdapter;
end;

end.
