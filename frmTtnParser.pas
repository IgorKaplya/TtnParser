unit frmTtnParser;

interface

uses
  Forms,IniFiles, Vcl.Controls, Vcl.StdCtrls, System.Classes, Vcl.ActnList, Vcl.StdActns, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ImgList,
  Vcl.ToolWin, Ttn.Interfaces, VirtualTrees, Vcl.Graphics, Types, Vcl.Menus,
  System.ImageList, System.Actions;

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
    pgParserMain: TPageControl;
    tsParse: TTabSheet;
    tsWait: TTabSheet;
    pnlWait: TPanel;
    tsResults: TTabSheet;
    vstResultStorage: TVirtualStringTree;
    procedure actAddKodExecute(Sender: TObject);
    procedure actAddKodUpdate(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actRefreshUpdate(Sender: TObject);
    procedure actSettingsExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileOpenInpAccept(Sender: TObject);
    procedure FileSaveAsAccept(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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

procedure TfrmTtnParserMain.actRefreshExecute(Sender: TObject);
begin
ProcessInpFile();
end;

procedure TfrmTtnParserMain.actRefreshUpdate(Sender: TObject);
begin
(Sender as TAction).Enabled:=Length(InpFile)>0;
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

function TfrmTtnParserMain.CurTtnObj(out obj: ITtnObj): Boolean;
begin
  obj:=nil;
  if vstTtn.SelectedCount=1 then
    obj:=ttn[vstTtn.GetFirstSelected().Index];
  Result := Assigned(obj);
end;

procedure TfrmTtnParserMain.FileOpenInpAccept(Sender: TObject);
begin
InpFile:=(Sender as TFileOpen).Dialog.FileName;
ProcessInpFile;
end;

procedure TfrmTtnParserMain.FileSaveAsAccept(Sender: TObject);
{Сохранение результата в файл}
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

procedure TfrmTtnParserMain.ProcessInpFile;
{Разбор входного файла, сортировка и унифткация. Основной метод программы}
begin
  pgParserMain.ActivePage := tsWait;
  try
    vstTtn.Clear;
    Parser.Parse(InpFile);
    Processor.Process(Parser.ParseResult);
    vstTtn.RootNodeCount:=Ttn.Count;
  finally
    dm.TablesFirst;
  end;
  pgParserMain.ActivePage := tsParse;
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

  procedure IniRead();
  {Чтение ini в память}
  var
    sIni: string;
  begin
  sIni:=ExpandFileName('.\TtnParser.ini');
  TestErr(FileExists(sIni),'Не найден файл настроек: '+sIni);
  FIniFile:=TMemIniFile.Create(sIni);
  FormatSettings.DecimalSeparator:=IniFile.ReadString('Настройки','ДесятичныйРазделитель',FormatSettings.DecimalSeparator)[1];
  FValuta:=IniFile.ReadString('Настройки','Валюта','');
  Processor.WeightMultiplier := IniFile.ReadFloat('Настройки','Множитель_веса',1);
  Processor.Currency := Valuta;
  ResultStorage.Load(IniFile.ReadString('Результаты','путь','.'));
  vstResultStorage.RootNodeCount := ResultStorage.Count;
  end;

  procedure DbConnect();
  {Соединение с БД по ADO из INI}
  begin
  dm.conMain.ConnectionString:=IniFile.ReadString('БазаДанных','СтрокаПодключенияAdo','');
  dm.conMain.Open();
  TestErr(dm.conMain.Connected,'Не установлено соединение с базой данных');
  dm.tblKod.Open();
  dm.tblStrPr.Open();
  dm.tblUni.Open();
  end;

  procedure InitTab();
  var
    i: Integer;
  begin
    for i:=0 to pgParserMain.PageCount-1 do
      pgParserMain.Pages[i].TabVisible := False;
    pgParserMain.ActivePage := tsResults;
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
      ShowMessage(format('Инициализация программы: %s',[e.Message]));
      Close();
      end;
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
  C_COL_STRAN_OTPR: CellText := ttn[node.Index].DeliveryCountry;
  C_COL_ATD_OTPR: CellText := ttn[node.Index].DeliveryCountryRegion;
  C_COL_STRAN_NAZN: CellText := ttn[node.Index].DestinationCountry;
  C_COL_ATD_NAZN: CellText := ttn[node.Index].DestinationCountryRegion;
  C_COL_DATE_TOVAR: CellText := FormatDateTime(C_Date_Tovar_Format, ttn[node.Index].DateTtn)
  end;
end;

end.

