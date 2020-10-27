unit frmTtnParser;

interface

uses
  Forms,IniFiles, Vcl.Controls, Vcl.StdCtrls, System.Classes, Vcl.ActnList, Vcl.StdActns, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ImgList,
  Vcl.ToolWin, Ttn.Interfaces, VirtualTrees, Vcl.Graphics, Types, Vcl.Menus,
  System.ImageList, System.Actions, Vcl.WinXPanels, Vcl.Mask, Vcl.Imaging.pngimage, Vcl.WinXCalendars, Vcl.WinXPickers,
  System.Generics.Collections;

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
    actProceedParsing: TAction;actResultStorageDelete: TAction;
    hntBaloon: TBalloonHint;
    actSaveResult: TAction;
    procedure actAddKodExecute(Sender: TObject);
    procedure actAddKodUpdate(Sender: TObject);
    procedure actActiveResultDocumentAddExecute(Sender: TObject);
    procedure actActiveResultDocumentDeleteExecute(Sender: TObject);
    procedure actActiveResultDocumentDeleteUpdate(Sender: TObject);
    procedure actActiveResultDocumentEditExecute(Sender: TObject);
    procedure actProceedParsingExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actResultStorageAddExecute(Sender: TObject);
    procedure actResultStorageDeleteExecute(Sender: TObject);
    procedure actResultStorageDeleteUpdate(Sender: TObject);
    procedure actSaveResultExecute(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure cpNewResultDateChange(Sender: TObject);
    procedure edtDeliveryCountryChange(Sender: TObject);
    procedure edtShipmentCountryChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileOpenInpAccept(Sender: TObject);
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
    FDocumentsDescription: TList<ITtnDocumentDescription>;
    procedure ClearUnNames;
    function CurTtnObj(out obj: ITtnObj): Boolean;
    procedure SetInpFile(const Value: string);
    property IniFile: TMemIniFile read FIniFile;
    property Inited: Boolean read FInited;
    property Parser: ITtnParser read FParser;
    property Valuta: string read FValuta;
    property Processor: ITtnProcessor read FProcessor;
    property ResultStorage: ITtnResultStorage read FResultStorage;
    property DocumentsDescription: TList<ITtnDocumentDescription> read FDocumentsDescription;
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
  Ttn.Constants, Winapi.Windows;

const
  column_doc_code = 0;
  column_doc_number = 1;
  column_doc_date = 2;
  C_ERR_NO_KOD = 'не найден код';
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

{$R *.dfm}

procedure TfrmTtnParserMain.FormCreate(Sender: TObject);
begin
  FParser := TTtnResolver.Resolve<ITtnParser>;
  FTtn := Parser.ParseResult;
  FProcessor := TTtnResolver.Resolve<ITtnProcessor>;
  FResultStorage := TTtnResolver.Resolve<ITtnResultStorage>;
  FDocumentsDescription := TList<ITtnDocumentDescription>.Create();
end;

procedure TfrmTtnParserMain.FormDestroy(Sender: TObject);
begin
  FDocumentsDescription.Free;
  dm.conMain.Close();
  FreeAndNil(FIniFile);
end;

procedure TfrmTtnParserMain.actAddKodExecute(Sender: TObject);
{Добавление кода в базу прямо из отчета}
var
  obj: ITtnObj;
begin
  try
  TestErr(dm.tblKod.State=dsBrowse,'Таблица кодов в состоянии редактирования. Сохраните или отмените изменения');
  TestErr(CurTtnObj(obj),'Не выбран элемент по которому добавить код');
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
  except on e: Exception do ShowMessage(format('Добавление кода: %s',[e.Message]));
  end;
end;

procedure TfrmTtnParserMain.actAddKodUpdate(Sender: TObject);
var
  obj: ITtnObj;
begin
(Sender as TAction).Enabled:=CurTtnObj(obj) and (Pos(C_ERR_NO_KOD,obj.ErrorMsg)<>0);
end;

procedure TfrmTtnParserMain.actActiveResultDocumentAddExecute(Sender: TObject);
var
  docDescr: ITtnDocumentDescription;
begin
  docDescr := TTtnResolver.Resolve<ITtnDocument>;
  DocumentsDescription.Add(docDescr);
    vstActiveDocuments.RootNodeCount := DocumentsDescription.Count;
    vstActiveDocuments.ClearSelection();
    vstActiveDocuments.FocusedColumn := column_doc_code;
    vstActiveDocuments.Selected[vstActiveDocuments.GetLast()] := true;
    vstActiveDocuments.EditNode(vstActiveDocuments.GetLast(), column_doc_code);
end;

procedure TfrmTtnParserMain.actActiveResultDocumentDeleteExecute(Sender: TObject);
var
  n: pVirtualNode;
begin
  n := vstActiveDocuments.GetFirstSelected();
  if Assigned(n) then
  begin
    DocumentsDescription.Delete(n.Index);
    vstActiveDocuments.RootNodeCount := DocumentsDescription.Count;
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

procedure TfrmTtnParserMain.actProceedParsingExecute(Sender: TObject);
var
  HintText: string;

  procedure CheckCondition(const AMustBeTrueCondition: Boolean; const AText: string);
  begin
    if not AMustBeTrueCondition then
      if HintText.IsEmpty then
        HintText := AText
      else
        HintText := HintText + sLineBreak+ AText;
  end;

  function AllDocumentsDescribedFine(): Boolean;
  var
    d: ITtnDocumentDescription;
  begin
    for d in DocumentsDescription do
    begin
      Result :=
        not d.DocumentCode.IsEmpty and
        not d.DocumentNumber.IsEmpty and
        (d.DocumentDate <> 0);
      if not Result then
        Break;
    end;
  end;

begin
  HintText := '';

  CheckCondition(not ResultStorage.ActiveResult.DestinationCountry.IsEmpty, 'Не задана страна назначения');
  CheckCondition(not ResultStorage.ActiveResult.ShipmentCountry.IsEmpty, 'Не задана страна отправки');
  CheckCondition(not String(ResultStorage.ActiveResult.DestinationCountryRegion).IsEmpty, 'Не задан регион назначения');
  CheckCondition(not String(ResultStorage.ActiveResult.ShipmentCountryRegion).IsEmpty, 'Не задан регион отправки');
  CheckCondition(DocumentsDescription.Count > 0, 'Не заданы документы');
  CheckCondition(AllDocumentsDescribedFine(), 'Не все документы описаны полностью');
  CheckCondition(ResultStorage.ActiveResult.DateTtn<>0, 'Не выбрана дата ТТН');

  if HintText.IsEmpty then
    cpMain.ActiveCard := crdMainParse
  else
  begin
    hntBaloon.Title := HintText;
    hntBaloon.ShowHint(btnProceed);
  end;
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
  if InputQuery('Новая папка для результатов','Введите имя',newResultStorage) then
  begin
    ResultStorage.CreateResult(newResultStorage);
    vstResultStorage.RootNodeCount := ResultStorage.Count;
  end;
end;

procedure TfrmTtnParserMain.actResultStorageDeleteExecute(Sender: TObject);
var
  code_confirmation_expected, code_confirmation_user: string;
  user_pressed_ok: Boolean;
begin
  Randomize();
  code_confirmation_expected := format('%d%d%d%d%d',[Random(9),Random(9),Random(9),Random(9),Random(9)]);
  code_confirmation_user := '';
  user_pressed_ok := InputQuery(
    'Удаление выбранного хрнилища приведет к потере данных.',
    'Введите код подтверждения: '+code_confirmation_expected,
    code_confirmation_user
    );
  if user_pressed_ok then
    if not code_confirmation_expected.Equals(code_confirmation_user) then
      ShowMessage('Неверно введен код подтверждения удаления')
    else
    begin
      ResultStorage.DeleteResult(ResultStorage.ActiveResult);
      vstResultStorage.RootNodeCount := ResultStorage.Count;
      vstResultStorage.ClearSelection;
    end;
end;

procedure TfrmTtnParserMain.actResultStorageDeleteUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled := Assigned(ResultStorage.ActiveResult);
end;

procedure TfrmTtnParserMain.actSaveResultExecute(Sender: TObject);
begin
  ResultStorage.ActiveResult.Append(
    ttn,
    DocumentsDescription.ToArray()
  );
  ResultStorage.ActiveResult.Save();
  ttn.Clear;
  vstTtn.Clear;
  cpMain.ActiveCard := crdMainResults;
end;

procedure TfrmTtnParserMain.actSettingsExecute(Sender: TObject);
begin
if frmSett.Visible then
  frmSett.BringToFront
else
  frmSett.Show;
end;

procedure TfrmTtnParserMain.ClearUnNames;
{Нужно очистить неиспользуемые имена.}
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
{Разбор входного файла, сортировка и унифткация. Основной метод программы}
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
{Выбор файла со входящими данными}
begin
if FInpFile<>Value then
  try
  TestErr(FileExists(Value),'Файл не найден '+Value);
  FInpFile:=Value;
  lblInpFile.Caption:='Входной файл: '+ExtractFileName(InpFile);
  lblInpFile.Hint:=InpFile;
  except on e: Exception do
    begin
    ShowMessage(Format('Открытие входных данных: %s',[e.Message]));
    FInpFile:='';
    lblInpFile.Caption:='Входной файл: Входные данные не выбраны';
    end;
  end;
end;

procedure TfrmTtnParserMain.StartUp;

  function GetBuildInfo(): string;
  {From Steve Schafer }
  var
    V1, V2, V3, V4: Word;
    VerInfoSize: DWORD;
    VerInfo: pointer;
    VerValueSize: DWORD;
    VerValue: PVSFixedFileInfo;
    Dummy: DWORD;
  begin
    VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
    GetMem(VerInfo, VerInfoSize);
    GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
    VerQueryValue(VerInfo, '\', pointer(VerValue), VerValueSize);
    with VerValue^ do
      begin
        V1 := dwFileVersionMS shr 16;
        V2 := dwFileVersionMS and $FFFF;
        V3 := dwFileVersionLS shr 16;
        V4 := dwFileVersionLS and $FFFF;
      end;
    FreeMem(VerInfo, VerInfoSize);
    Result := Format('%d.%d.%d.%d',[V1, V2, V3, V4])
  end;

  procedure LoadActualFileVersion();
  begin
    Self.Caption := Self.Caption + ' v' + GetBuildInfo();
  end;

  procedure IniRead();
  {Чтение ini в память}
  var
    sIni: string;
  begin
    sIni := ExpandFileName('.\TtnParser.ini');
    TestErr(FileExists(sIni), 'Не найден файл настроек: ' + sIni);
    FIniFile := TMemIniFile.Create(sIni);
    FormatSettings.DecimalSeparator := IniFile.ReadString('Настройки', 'ДесятичныйРазделитель', FormatSettings.DecimalSeparator)
      [1];
    FValuta := IniFile.ReadString('Настройки', 'Валюта', '');
    Processor.WeightMultiplier := IniFile.ReadFloat('Настройки', 'Множитель_веса', 1);
    Processor.Currency := Valuta;
    ResultStorage.Load(IniFile.ReadString('Результаты', 'путь', '.'));
    vstResultStorage.RootNodeCount := ResultStorage.Count;
  end;

  procedure DbConnect();
  {Соединение с БД по ADO из INI}
  begin
    dm.conMain.ConnectionString := IniFile.ReadString('БазаДанных', 'СтрокаПодключенияAdo', '');
    dm.conMain.Open();
    TestErr(dm.conMain.Connected, 'Не установлено соединение с базой данных');
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
    LoadActualFileVersion();
    IniRead();
    DbConnect();
    InitTab();
    FInited := True;
  except
    on e: Exception do
    begin
      ShowMessage(format('Инициализация программы: %s', [e.Message]));
      Close();
    end;
  end;
end;

procedure TfrmTtnParserMain.vstActiveDocumentsGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
    TextType: TVSTTextType; var CellText: string);
begin
  case Column of
  column_doc_code: CellText := DocumentsDescription[Node.Index].DocumentCode;
  column_doc_number: CellText := DocumentsDescription[Node.Index].DocumentNumber;
  column_doc_date: CellText := FormatDateTime(C_Date_Tovar_Format, DocumentsDescription[Node.Index].DocumentDate);
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
  column_doc_number: DocumentsDescription[Node.Index].DocumentNumber := NewText;
  column_doc_code: DocumentsDescription[Node.Index].DocumentCode := NewText;
  column_doc_date: DocumentsDescription[Node.Index].DocumentDate := StrToDate(NewText, fs)
  end;
end;

procedure TfrmTtnParserMain.vstResultStorageChange(Sender: TBaseVirtualTree; Node: PVirtualNode);
begin
  if not Assigned(Sender.GetFirstSelected()) then
    cpResultStorage.ActiveCard := crdActiveResultNone
  else
  begin
    ResultStorage.ActiveResult := ResultStorage[Sender.GetFirstSelected().Index];
    if ResultStorage.ActiveResult.TtnList.Count = 0 then
      ResultStorage.ActiveResult.Load();
    cpResultStorage.ActiveCard := crdActiveResult;
    edtShipmentCountry.Text := ResultStorage.ActiveResult.ShipmentCountry;
    edtDeliveryCountry.Text := ResultStorage.ActiveResult.DestinationCountry;
    medtShipmentRegion.Text := ResultStorage.ActiveResult.ShipmentCountryRegion;
    medtDeliveryRegion.Text := ResultStorage.ActiveResult.DestinationCountryRegion;
    if ResultStorage.ActiveResult.DateTtn = 0 then
      ResultStorage.ActiveResult.DateTtn := Now();
    cpNewResultDate.Date := ResultStorage.ActiveResult.DateTtn;
  end;
end;

procedure TfrmTtnParserMain.vstResultStorageGetText(Sender: TBaseVirtualTree; Node: PVirtualNode; Column: TColumnIndex;
    TextType: TVSTTextType; var CellText: string);
begin
  if ResultStorage.ActiveResult = ResultStorage[Node.Index] then
    CellText := Format('%s: (%d / %d)',[
        ExtractFileName(ResultStorage[Node.Index].Folder),
        ResultStorage.ActiveResult.TtnList.Count,
        ResultStorage.ActiveResult.Documents.Count
      ])
  else
    CellText := ExtractFileName(ResultStorage[Node.Index].Folder);
end;

procedure TfrmTtnParserMain.vstTtnDrawText(Sender: TBaseVirtualTree;
    TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const
    Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
{Отрисовка элементов с ошибками}
begin
if length(ttn[node.Index].ErrorMsg)>0 then
  TargetCanvas.Font.Color:=clRed;
end;

procedure TfrmTtnParserMain.vstTtnGetHint(Sender: TBaseVirtualTree; Node:
    PVirtualNode; Column: TColumnIndex; var LineBreakStyle:
    TVTTooltipLineBreakStyle; var HintText: string);
{Выдаем в Hint ошибки}
begin
HintText:=ttn[node.Index].ErrorMsg;
end;

procedure TfrmTtnParserMain.vstTtnGetText(Sender: TBaseVirtualTree; Node:
    PVirtualNode; Column: TColumnIndex; TextType: TVSTTextType; var CellText:
    string);
{Вывод текста}
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
  end;
end;

end.

