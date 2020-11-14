unit Ttn.Excel;

interface

uses
  System.Classes;

type

  TExcelAppenderErr = procedure(Sender: TObject; AMsg: string) of object;

  TExcelAppender = class(TObject)
  private
    MyExcel: OleVariant;
    FLastError: string;
    FOnError: TExcelAppenderErr;
    function CheckExcelInstalled: Boolean;
    procedure RunExcel(DisableAlerts: Boolean = False; Visible: boolean = false);
    function StopExcel: boolean;
  protected
    procedure DoError(AMsg: string);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Append(AFile: string; const AData: TStrings);
    procedure Load(AFile: string; const AData: TStrings);
    property LastError: string read FLastError;
    property OnError: TExcelAppenderErr read FOnError write FOnError;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, Winapi.ActiveX, System.Win.ComObj,
  System.Variants, System.IOUtils;

type
  EExcelComparerException = Exception;

const ExcelApp = 'Excel.Application';

procedure TestErr(AMustBeTrue: Boolean; AMsg: string);
begin
if not AMustBeTrue then
  raise EExcelComparerException.Create(AMsg);
end;

constructor TExcelAppender.Create;
begin
  inherited;
  MyExcel:= Unassigned;
end;

destructor TExcelAppender.Destroy;
begin
  MyExcel:= Unassigned;
  inherited Destroy;
end;

function TExcelAppender.CheckExcelInstalled: Boolean;
{Searching CLSID OLE Excel}
var
  ClassID: TCLSID;
begin
  Result:=CLSIDFromProgID(PWideChar(WideString(ExcelApp)),ClassID)=S_OK;
  TestErr(Result,'Found no installed MS Excel on this machine.');
end;

procedure TExcelAppender.Append(AFile: string; const AData: TStrings);

  procedure TransferData(const AWorkSheet: OleVariant);
  var
    i,j: Integer;
    iCol,iRow: integer;
    sLine: string;
    val: string;
  begin
    iRow := 1;
    for sLine in AData do
    begin
      iCol := 1;
      for val in sLine.Split([';']) do
      begin
        if val.StartsWith('0') then
          AWorkSheet.Columns[iCol].NumberFormat := AnsiChar('@');
        AWorkSheet.Cells[iRow,iCol].Value2 := val;
        inc(iCol);
      end;
      inc(iRow);
    end;
  end;

var
  WB: OleVariant; //WorkBook
  WS: OleVariant; //WorkSheet
  expandedFile: string;
begin
  FLastError:='';
  RunExcel();
  try
    expandedFile := ExpandFileName(AFile);
    if FileExists(expandedFile) then
      WB := MyExcel.Workbooks.Open(expandedFile)
    else
      WB := MyExcel.Workbooks.Add;
    WS := WB.Sheets[1];
    WS.Cells.Clear;
    TransferData(WS);
    WB.SaveAs(expandedFile);
  except on e: exception do DoError('Appending excel. '+e.Message);
  end;
  StopExcel();
end;

procedure TExcelAppender.Load(AFile: string; const AData: TStrings);

  procedure ReadRange(const ARange: Variant);
  var
    i,j: Integer;
    iCol,iRow: integer;
    sLine: string;
  begin
    iCol:= ARange.Columns.Count;
    iRow:= ARange.Rows.Count;
    for i:=1 to iRow do
    begin
      for j:=1 to iCol do
      begin
        if j = 1 then
          sLine := ARange.Cells[i,j].Text
        else
          sLine := sLine + ';'+ ARange.Cells[i,j].Text
      end;
      AData.Add(sLine);
    end;
  end;

var
  WB: OleVariant; //WorkBook
  WS: OleVariant; //WorkSheet
  Rng: OleVariant;//Used ranges on WorkSheet
begin
  FLastError:='';
  RunExcel();
  try
    WB := MyExcel.Workbooks.Open(ExpandFileName(AFile));
    WS := WB.Sheets[1];
    Rng := WS.UsedRange;
    AData.Clear();
    ReadRange(Rng);
  except on e: exception do DoError('Loading excel. '+e.Message);
  end;
StopExcel();
end;

procedure TExcelAppender.DoError(AMsg: string);
begin
  FLastError:=AMsg;
  if Assigned(FOnError) then
    begin
    FOnError(Self, AMsg);
    end;
end;

procedure TExcelAppender.RunExcel(DisableAlerts: Boolean = False; Visible: boolean = false);
{Just run if installed}
begin
  try
  CheckExcelInstalled();
  MyExcel:=CreateOleObject(ExcelApp);
    MyExcel.Application.EnableEvents:=DisableAlerts;
    MyExcel.Application.DisplayAlerts:= DisableAlerts;
    MyExcel.Visible:=Visible;
  except on e: exception do DoError(format('Starting excel. %s.',[e.Message]));
  end;
end;

function TExcelAppender.StopExcel: boolean;
{Stop if there is assigned one}
begin
Result:=false;
if not VarIsEmpty(MyExcel) then
  try
  if MyExcel.Visible then
    MyExcel.Visible:=false;
  MyExcel.Quit;
  MyExcel:=Unassigned;
  Result:=True;
  except  on e: exception do DoError(format('Stopping excel. %s.',[e.Message]));
  end;
end;

end.
