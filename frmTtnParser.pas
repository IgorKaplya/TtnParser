unit frmTtnParser;

interface

uses
  Forms,IniFiles, Vcl.Controls, Vcl.StdCtrls, System.Classes, Vcl.ActnList, Vcl.StdActns, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ImgList,
  Vcl.ToolWin, ttnObjLst, VirtualTrees, Vcl.Graphics, Types, ttnObj, Vcl.Menus,
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
    pnlWait: TPanel;
    actAddKod: TAction;
    ppmTtn: TPopupMenu;
    mniAddKod: TMenuItem;
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
    FTtn: TTtnObjLst;
    FValuta: string;
    procedure ClearUnNames;
    function CurTtnObj(out obj: TTtnObj): Boolean;
    procedure SetInpFile(const Value: string);
    property IniFile: TMemIniFile read FIniFile;
    property Inited: Boolean read FInited;
    property Valuta: string read FValuta;
  public
    procedure ProcessInpFile;
    procedure StartUp;
    property InpFile: string read FInpFile write SetInpFile;
    property Ttn: TTtnObjLst read FTtn;
  end;

var
  frmTtnParserMain: TfrmTtnParserMain;

implementation

uses
  Dialogs, SysUtils, TtnParserErrors, dmMain, System.Variants, DB, frmTtnSettings, System.Math, frmAddCod;

const
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

{$R *.dfm}

procedure TfrmTtnParserMain.actAddKodExecute(Sender: TObject);
{���������� ���� � ���� ����� �� ������}
var
  obj: TTtnObj;
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
  obj: TTtnObj;
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
{����� �������� �������������� �����.}
var
  lnt,nt: Integer;
  i: integer;
  obj: TTtnObj;
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

function TfrmTtnParserMain.CurTtnObj(out obj: TTtnObj): Boolean;
begin
  obj:=nil;
  if vstTtn.SelectedCount=1 then
    obj:=ttn[vstTtn.GetFirstSelected().Index];
  Result := Assigned(obj);
end;

procedure TfrmTtnParserMain.FormCreate(Sender: TObject);
begin
FTtn := TTtnObjLst.Create();
end;

procedure TfrmTtnParserMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FTtn);
  dm.conMain.Close();
  FreeAndNil(FIniFile);
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

procedure TfrmTtnParserMain.ProcessInpFile;
{������ �������� �����, ���������� � ����������. �������� ����� ���������}

const
  C_Inp_Arg_Cnt = 5;
  C_Inp_Sign = 0;
  C_Inp_Name = 1;
  C_Inp_Cost = 2;
  C_Inp_Weight = 4;
  C_Inp_Quantity = 3;
  C_Inp_Str_Pr = 1;

  procedure ParseInpLine(const sLineData: string; const slLine: TStrings);
  {��������� ���� ������ �� �������� ����� � �������� � slLine ��� ������. DelimitedText �� ������� ��-�� Excel �������� CSV}
  var
    i: Integer;
    sLine: string;
    iPos: Integer;
  begin
  sLine:=sLineData;
  while Pos(';',sLine)<>0 do
    begin
    iPos:=Pos(';',sLine);
    Delete(sLine,iPos,1);
    insert(sLineBreak,sLine,iPos);
    end;
  slLine.Text:=sLine;
  for i:=0 to slLine.Count-1 do
    slLine[i]:=Trim(slLine[i]);
  if slLine.Count=C_Inp_Arg_Cnt then
    begin
    slLine[C_Inp_Cost]:=StringReplace(slLine[C_Inp_Cost],' ','',[rfReplaceAll]);
    slLine[C_Inp_Weight]:=StringReplace(slLine[C_Inp_Weight],' ','',[rfReplaceAll]);
    slLine[C_Inp_Quantity]:=StringReplace(slLine[C_Inp_Quantity],' ','',[rfReplaceAll]);
    end;
  end;

  procedure ParseKod(const AObj: TTtnObj; iLine: integer);
  {����� ������������ ���� ����� �� ����� � ��������}
  const
    C_EPSILON = 0.00001;
  var
    sSign,sName: string;
    weightMin,weightMax, weight: Double;
  begin
  sSign:=AObj.SIGN;
  sName:=AObj.NAME;
  if Length(sSign)>0 then
    TestErr(
      dm.tblKod.Locate(F_kod_sign+';'+F_kod_txt,VarArrayOf([sSign,sName]),[loPartialKey]),
      Format('%d: %s', [iLine,C_ERR_NO_KOD])
    )
  else
    TestErr(
      dm.tblKod.Locate(F_Kod_txt,sName,[loPartialKey]),
      Format('%d: %s', [iLine,C_ERR_NO_KOD])
    );
  AObj.KOD:=dm.tblKod.FieldByName(F_Kod_val).AsString;
  //�������� �� ���������� ����
  TestErr(not dm.tblKod.FieldByName(F_Kod_Weight_Standart).IsNull,'�� ����� ��������� ���');
  TestErr(not dm.tblKod.FieldByName(F_Kod_Weight_Koef).IsNull,'�� ����� ��������� ��� �����');
  TestErr(not SameValue(dm.tblKod.FieldByName(F_Kod_Weight_Koef).AsFloat,0,C_EPSILON),'��������� ��� ����� �������� ������� ���� ��� ����� 0');
  weightMin:=dm.tblKod.FieldByName(F_Kod_Weight_Standart).AsFloat/dm.tblKod.FieldByName(F_Kod_Weight_Koef).AsFloat;
  weightMax:=dm.tblKod.FieldByName(F_Kod_Weight_Standart).AsFloat*dm.tblKod.FieldByName(F_Kod_Weight_Koef).AsFloat;
  weight:=AObj.WEIGHT1/Aobj.QUANTITY;
  if (CompareValue(weight,weightMin,C_EPSILON)=LessThanValue) or (CompareValue(weight,weightMax,C_EPSILON)=GreaterThanValue) then
    begin
    AObj.Error:=errWeight;
    AObj.ErrorMsg:=Format( '%d: ��� (%.3f) �� ������������ � ��������� [%.3f..%.3f]', [iLine,weight,weightMin,weightMax]);
    end;
  end;

  procedure Unify();
  {��������� � ����������� NUMBER}
  var
    i,iNum: Integer;
    sCountry: string;
    sKod: string;
  begin
  //����������
  Ttn.Sort;
  //����������� ������
  i:=0;
  iNum:=1;
  while i<Ttn.Count do
    begin
    sKod:=Ttn[i].KOD;
    sCountry:=Ttn[i].STR_PR;
    Ttn[i].NUMBER:=iNum;
    if dm.tblUni.Locate(F_Uni_kod,sKod,[]) then
      repeat
      Ttn[i].NAME:=dm.tblUni.FieldByName(F_Uni_etal_txt).AsString;
      Ttn[i].NUMBER:=iNum;
      Inc(i);
      until (i>=Ttn.Count-1) or not SameText(sKod,Ttn[i].KOD) or not SameText(sCountry,Ttn[i].STR_PR)
    else
      Inc(i);
    Inc(iNum);
    end;
  end;

  function RemoveSpaces(const s: string): string;
  begin
  Result:=StringReplace(s,' ','',[rfReplaceAll]);
  end;

var
  dCost: Double;
  dWeight: Double;
  sl,slLine: TStringList;
  iLine: Integer;
  iQuantity: Integer;
  obj: TTtnObj;
begin
pnlWait.BringToFront;
sl:=TStringList.Create;
slLine:=TStringList.Create;
  try
  vstTtn.Clear;
  ttn.Clear();
  sl.LoadFromFile(InpFile);
  TestErr(sl.Count>1,'���� ������ ����');
  TestErr(Odd(sl.Count),'� ����� ������ ������ ���� �������� ����� ����� (� ������ ���������)');
  //����������� ���������
  sl.Delete(0);
  iLine:=0;
  while iLine<(sl.Count div 2) do
    begin
    ParseInpLine(sl[2*iLine],slLine);
    obj:=Ttn.Add;
      try
      TestErr(slLine.Count=C_Inp_Arg_Cnt,Format('%d: ������ ���� %d ��������', [2*iLine+2,C_Inp_Arg_Cnt]));
        //������ �� ������� �����
        obj.SIGN:=slLine[C_Inp_Sign];
        obj.NAME:=slLine[C_Inp_Name];
        TestErr(TryStrToFloat(slLine[C_Inp_Cost],dCost),Format('%d: ��������� �����������', [2*iLine+2]));
        obj.COST:=dCost;
        TestErr(TryStrToInt(slLine[C_Inp_Quantity],iQuantity),Format('%d: ���������� �����������', [2*iLine+2]));
        obj.QUANTITY:=iQuantity;
        TestErr(TryStrToFloat(slLine[C_Inp_Weight],dWeight),Format('%d: ��� �����������', [2*iLine+2]));
        obj.WEIGHT1:=1000*dWeight;
        obj.WEIGHT2:=obj.WEIGHT1;
        obj.WEIGHT3:=obj.WEIGHT1;
        //������ ������������
        ParseInpLine(sl[2*iLine+1],slLine);
        TestErr(slLine.Count=C_Inp_Arg_Cnt-1,Format('%d: ������ ���� %d ��������', [2*iLine+3,C_Inp_Arg_Cnt-1]));
        TestErr(dm.tblStrPr.Locate(F_Str_pr_txt,slLine[C_Inp_Str_Pr],[loCaseInsensitive]),Format('%d: �� ������� ������ �������������', [2*iLine+3,C_Inp_Arg_Cnt-1]));
        obj.STR_PR:=dm.tblStrPr.FieldByName(F_Str_pr_val).AsString;
        //������
        obj.VAL:=Valuta;
        //���
        ParseKod(obj,2*iLine+2);
        //����������
        Unify();
      except on e: Exception do
        begin
        obj.ErrorMsg:=e.Message;
        end;
      end;
    Inc(iLine);
    end;
  ClearUnNames();
  vstTtn.RootNodeCount:=Ttn.Count;
  finally
    FreeAndNil(sl);
    FreeAndNil(slLine);
    dm.TablesFirst;
  end;
pnlWait.SendToBack;
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
  sIni:=ChangeFileExt(ParamStr(0),'.ini');
  TestErr(FileExists(sIni),'�� ������ ���� ��������: '+sIni);
  FIniFile:=TMemIniFile.Create(sIni);
  FormatSettings.DecimalSeparator:=IniFile.ReadString('���������','���������������������',FormatSettings.DecimalSeparator)[1];
  FValuta:=IniFile.ReadString('���������','������','');
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

begin
  if not Inited then
    try
    IniRead();
    DbConnect();
    FInited:=True;
    except on e: Exception do
      begin
      ShowMessage(format('������������� ���������: %s',[e.Message]));
      Close();
      end;
    end;
end;

procedure TfrmTtnParserMain.vstTtnDrawText(Sender: TBaseVirtualTree;
    TargetCanvas: TCanvas; Node: PVirtualNode; Column: TColumnIndex; const
    Text: string; const CellRect: TRect; var DefaultDraw: Boolean);
{��������� ��������� � ��������}
begin
if length(ttn[node.Index].ErrorMsg)>0 then
  TargetCanvas.Font.Color:=C_TTN_ERR_CLR[ttn[node.Index].Error];
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
  end;
end;

end.

