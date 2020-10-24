unit frmTtnParser;

interface

uses
  Forms,IniFiles, Vcl.Controls, Vcl.StdCtrls, System.Classes, Vcl.ActnList, Vcl.StdActns, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ImgList,
  Vcl.ToolWin, Ttn.Interfaces, VirtualTrees, Vcl.Graphics, Types, Vcl.Menus,
  System.ImageList, System.Actions, Vcl.WinXPanels, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.WinXCalendars, Vcl.WinXPickers;

type
  TfrmTtnParserMain = class(TForm)
    alMain: TActionList;
    FileOpenInp: TFileOpen;
    lblInpFile: TLabel;
    tlbMain: TToolBar;
    btnInp: TToolButton;
    imlMain: TImageList;
    btnSettings: TToolButton;
    vstTtn: TVirtualStringTree;
    actSettings: TAction;
    actRefresh: TAction;
    btnRefresh: TToolButton;
    FileSaveAs: TFileSaveAs;
    btnFileSaveAs: TToolButton;
    actAddKod: TAction;
    ppmTtn: TPopupMenu;
    mniAddKod: TMenuItem;
    pnlWait: TPanel;
    vstResultStorage: TVirtualStringTree;
    cpResultStorage: TCardPanel;
    crdActiveResultNone: TCard;
    crdActiveResult: TCard;
    cpMain: TCardPanel;
    crdMainWait: TCard;
    crdMainResults: TCard;
    crdMainParse: TCard;
    medtShipmentRegion: TMaskEdit;
    edtShipmentCountry: TEdit;
    imgShipment: TImage;
    edtDeliveryCountry: TEdit;
    medtDeliveryRegion: TMaskEdit;
    gpnlActiveResult: TGridPanel;
    vstActiveDocuments: TVirtualStringTree;
    pnlChooseDateAndGo: TPanel;
    imlMain32: TImageList;
    btnProceed: TButton;
    cpNewResultDate: TCalendarPicker;
    pnlActiveDocuments: TPanel;
    stpActiveDocumentTools: TStackPanel;
    btnDelActiveResultDocument: TButton;
    btnAddResultDocument: TButton;
    actActiveResultDocumentAdd: TAction;
    actActiveResultDocumentDelete: TAction;
    btnvstActiveDocumentsEdit: TButton;
    actActiveResultDocumentEdit: TAction;
    ppmActiveResultsDocuments: TPopupMenu;
    mniActiveResultDocumentAdd: TMenuItem;
    mniActiveResultDocumentDelete: TMenuItem;
    mniActiveResultDocumentEdit: TMenuItem;
    pnlResultStorage: TPanel;
    stpResultStorageTools: TStackPanel;
    btnResultStorageAdd: TButton;
    btnResultStorageDelete: TButton;
    actResultStorageAdd: TAction;
    actResultStorageDelete: TAction;
    procedure actAddKodExecute(Sender: TObject);
    procedure actAddKodUpdate(Sender: TObject);
    procedure actActiveResultDocumentAddExecute(Sender: TObject);
    procedure actActiveResultDocumentDeleteExecute(Sender: TObject);
    procedure actActiveResultDocumentDeleteUpdate(Sender: TObject);
    procedure actActiveResultDocumentEditExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actResultStorageAddExecute(Sender: TObject);
    procedure actResultStorageDeleteExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure cpNewResultDateChange(Sender: TObject);
    procedure edtDeliveryCountryChange(Sender: TObject);
    procedure edtShipmentCountryChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileOpenInpAccept(Sender: TObject);
    procedure FileSaveAsAccept(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure medtDeliveryRegionChange(Sender: TObject);
    procedure medtShipmentRegionChange(Sender: TObject);
    procedure vstActiveDocumentsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType:
        TVSTTextType; var CellText: string);
    procedure vstActiveDocumentsNewText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; NewText: string);
    procedure vstResultStorageChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
    procedure vstResultStorageGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex; TextType:
        TVSTTextType; var CellText: string);
    procedure vstTtnDrawText(Sender: TBaseVirtualTree; TargetCanvas: TCanvas; Node:
        PVirtualNode; Column: TColumnIndex; const Text: string; const CellRect:
        TRect; var DefaultDraw: Boolean);
    procedure vstTtnGetHint(Sender: TBaseVirtualTree; Node: PVirtualNode; Column:
        TColumnIndex; var LineBreakStyle: TVTTooltipLineBreakStyle; var HintText:
        string);
    procedure vstTtnGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column:
        TColumnIndex; TextType: TVSTTextType; var CellText: string);
  private
    FIniFile: TMemIniFile;
    FInited: Boolean;
    FInpFile: string;
    FParser: ITtnParser;
    FTtn: ITtnList;
    FValuta: string;
    FProcessor: ITtnProcessor;
    FResultStorage: ITtnResultStorage;
    procedure ClearUnNames;
    function CurTtnObj(out obj: ITtnObj): Boolean;
    procedure SetInpFile(const Value: string);
    property IniFile: TMemIniFile read FIniFile;
    property Inited: Boolean read FInited;
    property Parser: ITtnParser read FParser;
    property Valuta: string read FValuta;
    property Processor: ITtnProcessor read FProcessor;
    property ResultStorage: ITtnResultStorage read FResultStorage;
  public
    procedure ProcessInpFile;
    procedure StartUp;
    property InpFile: string read FInpFile write SetInpFile;
    property Ttn: ITtnList read FTtn;
  end;

var
  frmTtnParserMain: TfrmTtnParserMain;

implementation

uses
  Dialogs, SysUtils, Ttn.Errors, dmMain, System.Variants, DB, frmTtnSettings, System.Math, frmAddCod, Ttn.Registration,
  Ttn.Constants;

const
  column_doc_date = 2;
  column_doc_code = 1;
  column_doc_number = 0;
  C_ERR_NO_KOD = '�� ������ ���';
  C_COL_NUMBER      = 0;
  C_COL_KOD         = 1;
  C_COL_NAME        = 2;
  C_COL_WEIGHT1     = 3;
  C_COL_WEIGHT2     = 4;
  C_COL_WEIGHT3     = 5;
  C_COL_COST        = 6;
  C_COL_VAL         = 7;
  C_COL_STR_PR      = 8;
  C_COL_QUANTITY    = 9;
  C_COL_STRAN_OTPR  = 10;
  C_COL_ATD_OTPR    = 11;
  C_COL_STRAN_NAZN  = 12;
  C_COL_ATD_NAZN    = 13;
  C_COL_DATE_TOVAR  = 14;

{$R *.dfm}

procedure TfrmTtnParserMain.FormCreate(Sender: TObject);
begin
  FParser := TTtnResolver.Resolve<ITtnParser>;
  FTtn := Parser.ParseResult;
  FProcessor := TTtnResolver.Resolve<ITtnProcessor>;
  FResultStorage := TTtnResolver.Resolve<ITtnResultStorage>;
end;

procedure TfrmTtnParserMain.FormDestroy(Sender: TObject);
begin
  dm.conMain.Close();
  FreeAndNil(FIniFile);
end;

procedure TfrmTtnParserMain.actAddKodExecute(Sender: TObject);
{���������� ���� � ���� ����� �� ������}
var
  obj: ITtnObj;
begin
  try
  TestErr(dm.tblKod.State=dsBrowse,'������� ����� � ��������� ��������������. ��������� ��� �������� ���������');
  TestErr(CurTtnObj(obj),'�� ������ ������� �� �������� �������� ���');
  frmAddCode.CodTxt:=obj.NAME;
  frmAddCode.CodSign:=obj.SIGN;
  if frmAddCode.ShowModal=mrOk then
    begin
    dm.tblKod.Insert;
      dm.tblKod.FieldByName(F_Kod_sign).AsString:=Trim(frmAddCode.CodSign);
      dm.tblKod.FieldByName(F_Kod_txt).AsString:=Trim(frmAddCode.CodTxt);
      dm.tblKod.FieldByName(F_Kod_val).AsString:=Trim(frmAddCode.Cod);
      dm.tblKod.FieldByName(F_Kod_Weight_Standart).AsFloat:=frmAddCode.CodWeight;
      dm.tblKod.FieldByName(F_Kod_Weight_Koef).AsFloat:=frmAddCode.CodKoeff;
    dm.tblKod.Post;
    end;
  except on e: Exception do ShowMessage(format('���������� ����: %s',[e.Message]));
  end;
end;

procedure TfrmTtnParserMain.actAddKodUpdate(Sender: TObject);
var
  obj: ITtnObj;
begin
(Sender as TAction).Enabled:=CurTtnObj(obj) and (Pos(C_ERR_NO_KOD,obj.ErrorMsg)<>0);
end;

procedure TfrmTtnParserMain.actActiveResultDocumentAddExecute(Sender: TObject);
begin
  ResultStorage.ActiveResult.Documents.Add;
  vstActiveDocuments.RootNodeCount := ResultStorage.ActiveResult.Documents.Count;
  vstActiveDocuments.EditNode(vstActiveDocuments.GetLast(), column_doc_number);
end;

procedure TfrmTtnParserMain.actActiveResultDocumentDeleteExecute(Sender: TObject);
var
  n: pVirtualNode;
begin
  n := vstActiveDocuments.GetFirstSelected();
  if Assigned(n) then
  begin
    ResultStorage.ActiveResult.Documents.Delete(n.Index);
    vstActiveDocuments.RootNodeCount := ResultStorage.ActiveResult.Documents.Count;
  end;
end;

procedure TfrmTtnParserMain.actActiveResultDocumentDeleteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := (vstActiveDocuments.SelectedCount > 0);
end;

procedure TfrmTtnParserMain.actActiveResultDocumentEditExecute(Sender: TObject);
begin
  vstActiveDocuments.EditNode(vstActiveDocuments.GetFirstSelected(), vstActiveDocuments.FocusedColumn);
end;

procedure TfrmTtnParserMain.actRefreshExecute(Sender: TObject);
begin
ProcessInpFile();
end;

procedure TfrmTtnParserMain.actRefreshUpdate(Sender: TObject);
begin
(Sender as TAction).Enabled:=Length(InpFile)>0;
end;

procedure TfrmTtnParserMain.actResultStorageAddExecute(Sender: TObject);
var
  newResultStorage: string;
begin
  if InputQuery('����� ����� ��� �����������','������� ���',newResultStorage) then
    ResultStorage.CreateResult(newResultStorage);
end;

procedure TfrmTtnParserMain.actResultStorageDeleteExecute(Sender: TObject);
begin
  ResultStorage.DeleteResult(ResultStorage.ActiveResult.Folder);
end;

procedure TfrmTtnParserMain.actSettingsExecute(Sender: TObject);
begin
if frmSett.Visible then
  frmSett.BringToFront
else
  frmSett.Show;
end;

procedure TfrmTtnParserMain.ClearUnNames;
{����� �������� �������������� �����.}
var
  lnt,nt: Integer;
  i: integer;
  obj: ITtnObj;
begin
  lnt:=-1;
  for i:=0 to Ttn.Count-1 do
    begin
    obj:=ttn[i];
    nt:=obj.NUMBER;
    if lnt<>nt then
      lnt:=obj.NUMBER
    else
      obj.NAME:='';
    end;
end;

procedure TfrmTtnParserMain.cpNewResultDateChange(Sender: TObject);
begin
  ResultStorage.ActiveResult.DateTtn := (Sender as TCalendarPicker).Date;
end;

function TfrmTtnParserMain.CurTtnObj(out obj: ITtnObj): Boolean;
begin
  obj:=nil;
  if vstTtn.SelectedCount=1 then
    obj:=ttn[vstTtn.GetFirstSelected().Index];
  Result := Assigned(obj);
end;

procedure TfrmTtnParserMain.edtDeliveryCountryChange(Sender: TObject);
begin
  ResultStorage.ActiveResult.DestinationCountry := (Sender as TEdit).Text;
end;

procedure TfrmTtnParserMain.edtShipmentCountryChange(Sender: TObject);
begin
  ResultStorage.ActiveResult.ShipmentCountry := (Sender as TEdit).Text;
end;

procedure TfrmTtnParserMain.FileOpenInpAccept(Sender: TObject);
begin
InpFile:=(Sender as TFileOpen).Dialog.FileName;
ProcessInpFile;
end;

procedure TfrmTtnParserMain.FileSaveAsAccept(Sender: TObject);
{���������� ���������� � ����}
var
  sl: TStringList;
begin
sl:=TStringList.Create;
  try
  Ttn.Save(sl);
  sl.SaveToFile((Sender as TFileSaveAs).Dialog.FileName);
  finally
  FreeAndNil(sl);
  end;
end;

procedure TfrmTtnParserMain.FormActivate(Sender: TObject);
begin
  StartUp();
end;

procedure TfrmTtnParserMain.medtDeliveryRegionChange(Sender: TObject);
begin
  ResultStorage.ActiveResult.DestinationCountryRegion := (Sender as TMaskEdit).Text;
end;

procedure TfrmTtnParserMain.medtShipmentRegionChange(Sender: TObject);
begin
  ResultStorage.ActiveResult.ShipmentCountryRegion := (Sender as TMaskEdit).Text;
end;

procedure TfrmTtnParserMain.ProcessInpFile;
{������ �������� �����, ���������� � ����������. �������� ����� ���������}
begin
  cpMain.ActiveCard := crdMainWait;
  try
    vstTtn.Clear;
    Parser.Parse(InpFile);
    Processor.Process(Parser.ParseResult);
    vstTtn.RootNodeCount:=Ttn.Count;
  finally
    dm.TablesFirst;
  end;
  cpMain.ActiveCard := crdMainParse;
end;

procedure TfrmTtnParserMain.SetInpFile(const Value: string);
{����� ����� �� ��������� �������}
begin
if FInpFile<>Value then
  try
  TestErr(FileExists(Value),'���� �� ������ '+Value);
  FInpFile:=Value;
  lblInpFile.Caption:='������� ����: '+ExtractFileName(InpFile);
  lblInpFile.Hint:=InpFile;
  except on e: Exception do
    begin
    ShowMessage(Format('�������� ������� ������: %s',[e.Message]));
    FInpFile:='';
    lblInpFile.Caption:='������� ����: ������� ������ �� �������';
    end;
  end;
end;

procedure TfrmTtnParserMain.StartUp;

  procedure IniRead();
  {������ ini � ������}
  var
    sIni: string;
  begin
  sIni:=ExpandFileName('.\TtnParser.ini');
  TestErr(FileExists(sIni),'�� ������ ���� ��������: '+sIni);
  FIniFile:=TMemIniFile.Create(sIni);
  FormatSettings.DecimalSeparator:=IniFile.ReadString('���������','���������������������',FormatSettings.DecimalSeparator)[1];
  FValuta:=IniFile.ReadString('���������','������','');
  Processor.WeightMultiplier := IniFile.ReadFloat('���������','���������_����',1);
  Processor.Currency := Valuta;
  ResultStorage.Load(IniFile.ReadString('����������','����','.'));
  vstResultStorage.RootNodeCount := ResultStorage.Count;
  end;

  procedure DbConnect();
  {���������� � �� �� ADO �� INI}
  begin
  dm.conMain.ConnectionString:=IniFile.ReadString('����������','�����������������Ado','');
  dm.conMain.Open();
  TestErr(dm.conMain.Connected,'�� ����������� ���������� � ����� ������');
  dm.tblKod.Open();
  dm.tblStrPr.Open();
  dm.tblUni.Open();
  end;

  procedure InitTab();
  begin
    cpMain.ActiveCard := crdMainResults;
    cpResultStorage.ActiveCard := crdActiveResultNone;
  end;

begin
  if not Inited then
    try
    IniRead();
    DbConnect();
    InitTab();
    FInited:=True;
    except on e: Exception do
      begin
      ShowMessage(format('������������� ���������: %s',[e.Message]));
      Close();
      end;
    end;
end;

procedure TfrmTtnParserMain.vstActiveDocumentsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
    TextType: TVSTTextType; var CellText: string);
begin
  case Column of
  column_doc_number: CellText := ResultStorage.ActiveResult.Documents[Node.Index].NumberObj.ToString;
  column_doc_code: CellText := ResultStorage.ActiveResult.Documents[Node.Index].DocumentCode;
  column_doc_date: CellText := FormatDateTime(C_Date_Tovar_Format, ResultStorage.ActiveResult.Documents[Node.Index].DocumentDate);
  end;
end;

procedure TfrmTtnParserMain.vstActiveDocumentsNewText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
    NewText: string);
var
  fs: TFormatSettings;
begin
  fs := TFormatSettings.Create();
  fs.ShortDateFormat := C_Date_Tovar_Format;
  case Column of
  column_doc_number: ResultStorage.ActiveResult.Documents[Node.Index].NumberObj := NewText.ToInteger();
  column_doc_code: ResultStorage.ActiveResult.Documents[Node.Index].DocumentCode := NewText;
  column_doc_date: ResultStorage.ActiveResult.Documents[Node.Index].DocumentDate := StrToDate(NewText, fs)
  end;
end;

procedure TfrmTtnParserMain.vstResultStorageChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  if not Assigned(Sender.GetFirstSelected()) then
    cpResultStorage.ActiveCard := crdActiveResultNone
  else
  begin
    ResultStorage.ActiveResult := ResultStorage[Sender.GetFirstSelected().Index];
    cpResultStorage.ActiveCard := crdActiveResult;
    edtShipmentCountry.Text := ResultStorage.ActiveResult.ShipmentCountry;
    edtDeliveryCountry.Text := ResultStorage.ActiveResult.DestinationCountry;
    medtShipmentRegion.Text := ResultStorage.ActiveResult.ShipmentCountryRegion;
    medtDeliveryRegion.Text := ResultStorage.ActiveResult.DestinationCountryRegion;
    vstActiveDocuments.RootNodeCount := ResultStorage.ActiveResult.Documents.Count;
    if ResultStorage.ActiveResult.DateTtn = 0 then
      ResultStorage.ActiveResult.DateTtn := Now();
    cpNewResultDate.Date := ResultStorage.ActiveResult.DateTtn;
  end;
end;

procedure TfrmTtnParserMain.vstResultStorageGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
    TextType: TVSTTextType; var CellText: string);
begin
  CellText := ResultStorage[Node.Index].FileName;
end;

procedure TfrmTtnParserMain.vstTtnDrawText(Sender: TBaseVirtualTree;
    TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const
    Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
{��������� ��������� � ��������}
begin
if length(ttn[node.Index].ErrorMsg)>0 then
  TargetCanvas.Font.Color:=clRed;
end;

procedure TfrmTtnParserMain.vstTtnGetHint(Sender: TBaseVirtualTree; Node:
    PVirtualNode; Column: TColumnIndex; var LineBreakStyle:
    TVTTooltipLineBreakStyle; var HintText: string);
{������ � Hint ������}
begin
HintText:=ttn[node.Index].ErrorMsg;
end;

procedure TfrmTtnParserMain.vstTtnGetText(Sender: TBaseVirtualTree; Node:
    PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText:
    string);
{����� ������}
begin
  case Column of
  C_COL_NUMBER: CellText:=IntToStr(ttn[node.Index].NUMBER);
  C_COL_KOD: CellText:=ttn[node.Index].KOD;
  C_COL_NAME: CellText:=ttn[node.Index].NAME;
  C_COL_WEIGHT1: CellText:=format('%.3f',[ttn[node.Index].WEIGHT1]);
  C_COL_WEIGHT2: CellText:=format('%.3f',[ttn[node.Index].WEIGHT2]);
  C_COL_WEIGHT3: CellText:=format('%.3f',[ttn[node.Index].WEIGHT3]);
  C_COL_COST: CellText:=format('%.2f',[ttn[node.Index].Cost]);
  C_COL_VAL: CellText:=ttn[node.Index].VAL;
  C_COL_STR_PR: CellText:=ttn[node.Index].STR_PR;
  C_COL_QUANTITY: CellText:=IntToStr(ttn[node.Index].QUANTITY);
  C_COL_STRAN_OTPR: CellText := ttn[node.Index].DeliveryCountry;
  C_COL_ATD_OTPR: CellText := ttn[node.Index].DeliveryCountryRegion;
  C_COL_STRAN_NAZN: CellText := ttn[node.Index].DestinationCountry;
  C_COL_ATD_NAZN: CellText := ttn[node.Index].DestinationCountryRegion;
  C_COL_DATE_TOVAR: CellText := FormatDateTime(C_Date_Tovar_Format, ttn[node.Index].DateTtn)
  end;
end;

end.

