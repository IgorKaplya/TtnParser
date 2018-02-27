unit frmTtnSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids, Data.DB, dmMain, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Data.Win.ADODB, Vcl.ActnList, Vcl.Menus, System.Actions, Vcl.DBCtrls, System.ImageList, Vcl.ImgList,
  uCodBook;

type
  TfrmSett = class(TForm)
    pnlTools: TPanel;
    btnClose: TBitBtn;
    pgSetting: TPageControl;
    tsKod: TTabSheet;
    tsStrPr: TTabSheet;
    tsUni: TTabSheet;
    dsStrPr: TDataSource;
    dsUni: TDataSource;
    dbgStrPr: TDBGrid;
    dbgUni: TDBGrid;
    ppmEdt: TPopupMenu;
    alSettings: TActionList;
    actIns: TAction;
    actDel: TAction;
    actDub: TAction;
    mniIns: TMenuItem;
    mniDub: TMenuItem;
    mniN1: TMenuItem;
    mniDel: TMenuItem;
    imlSettings: TImageList;
    frmCodBook: TFrameCodBook;
    procedure actDelExecute(Sender: TObject);
    procedure actDubExecute(Sender: TObject);
    procedure actInsExecute(Sender: TObject);
    procedure actInsUpdate(Sender: TObject);
    function CurTbl(out tbl: TADOTable): Boolean;
    procedure edtFilterRightButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSett: TfrmSett;

implementation

{$R *.dfm}

procedure TfrmSett.actDelExecute(Sender: TObject);
var
  tbl: TADOTable;
begin
if CurTbl(tbl) then
  begin
  tbl.Delete;
  end;
end;

procedure TfrmSett.actDubExecute(Sender: TObject);
var
  fld: TField;
  i: Integer;
  tbl: TADOTable;
  v: Variant;
begin
if CurTbl(tbl) then
  begin
  v:=VarArrayCreate([0,tbl.Fields.Count-1],varVariant);
  for i:=0 to tbl.Fields.Count-1 do
    begin
    fld:=tbl.Fields[i];
    if (fld.FieldKind=fkData) and (not fld.ReadOnly) then
      v[i]:=fld.Value;
    end;
  tbl.Insert;
  for i:=1 to tbl.Fields.Count-1 do
    begin
    fld:=tbl.Fields[i];
    if (fld.FieldKind=fkData) then
      fld.Value:=v[i];
    end;
  tbl.Post;
  end;
end;

procedure TfrmSett.actInsExecute(Sender: TObject);
var
  tbl: TADOTable;
begin
if CurTbl(tbl) then
  tbl.Insert;
end;

procedure TfrmSett.actInsUpdate(Sender: TObject);
var
  tbl: TADOTable;
begin
(Sender as TAction).Enabled:=CurTbl(tbl) and (tbl.State=dsBrowse);
end;

function TfrmSett.CurTbl(out tbl: TADOTable): Boolean;
begin
tbl:=nil;
if pgSetting.ActivePage=tsKod then
  tbl:=dm.tblKod;
if pgSetting.ActivePage=tsStrPr then
  tbl:=dm.tblStrPr;
if pgSetting.ActivePage=tsUni then
  tbl:=dm.tblUni;
Result:=Assigned(tbl);
end;

procedure TfrmSett.edtFilterRightButtonClick(Sender: TObject);
begin
(Sender as TButtonedEdit).Clear;
end;

procedure TfrmSett.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmCodBook.KodTxtFilter:='';
end;

procedure TfrmSett.FormCreate(Sender: TObject);
begin
pgSetting.ActivePageIndex:=0;
end;

end.
