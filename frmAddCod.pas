unit frmAddCod;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmAddCode = class(TForm)
    edtCodText: TButtonedEdit;
    edtCod: TButtonedEdit;
    edtCodWeight: TButtonedEdit;
    edtCodKoeff: TButtonedEdit;
    lblWeight: TLabel;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    edtCodSign: TButtonedEdit;
    btnCodHelp: TBitBtn;
    procedure btnCodHelpClick(Sender: TObject);
    procedure edtCodChange(Sender: TObject);
    procedure edtCodKoeffChange(Sender: TObject);
    procedure edtCodSignChange(Sender: TObject);
    procedure edtCodTextChange(Sender: TObject);
    procedure edtCodWeightChange(Sender: TObject);
  private
    FCodTxt: string;
    FCod: string;
    FCodWeight: Double;
    FCodKoeff: Double;
    FCodSign: string;
    procedure RangeLabelUpdate;
    procedure SetCodTxt(const Value: string);
    procedure SetCod(const Value: string);
    procedure SetCodWeight(const Value: Double);
    procedure SetCodKoeff(const Value: Double);
    procedure SetCodSign(const Value: string);
    { Private declarations }
  public
    property Cod: string read FCod write SetCod;
    property CodKoeff: Double read FCodKoeff write SetCodKoeff;
    property CodTxt: string read FCodTxt write SetCodTxt;
    property CodSign: string read FCodSign write SetCodSign;
    property CodWeight: Double read FCodWeight write SetCodWeight;
    { Public declarations }
  end;

var
  frmAddCode: TfrmAddCode;

implementation

{$R *.dfm}

uses frmCodBookHlp,dmMain;

procedure TfrmAddCode.btnCodHelpClick(Sender: TObject);
begin
if (frmCodBookHelp.ShowModal=mrOk) and (dm.tblKod.RecordCount>0) then
  begin
  frmAddCode.Cod := dm.tblKod.FieldByName(F_Kod_val).AsString;
  frmAddCode.CodWeight := dm.tblKod.FieldByName(F_Kod_Weight_Standart).AsFloat;
  frmAddCode.CodKoeff := dm.tblKod.FieldByName(F_Kod_Weight_Koef).AsFloat;
  end;
end;

procedure TfrmAddCode.edtCodChange(Sender: TObject);
begin
Cod:=(Sender as TButtonedEdit).Text;
end;

procedure TfrmAddCode.edtCodKoeffChange(Sender: TObject);
var
  val: Double;
begin
if TryStrToFloat((Sender as TButtonedEdit).Text,val) then
  CodKoeff:=Val;
end;

procedure TfrmAddCode.edtCodSignChange(Sender: TObject);
begin
CodSign:=(Sender as TButtonedEdit).Text;
end;

procedure TfrmAddCode.edtCodTextChange(Sender: TObject);
begin
CodTxt:=(Sender as TButtonedEdit).Text;
end;

procedure TfrmAddCode.edtCodWeightChange(Sender: TObject);
var
  val: Double;
begin
if TryStrToFloat((Sender as TButtonedEdit).Text,val) then
  CodWeight:=Val;
end;

procedure TfrmAddCode.RangeLabelUpdate;
begin
  if CodKoeff<>0 then
    lblWeight.Caption:=Format('[%.3f..%.3f]',[CodWeight/CodKoeff,CodWeight*CodKoeff])
  else
    lblWeight.Caption:=Format('[]',[]);
end;

procedure TfrmAddCode.SetCodTxt(const Value: string);
begin
if FCodTxt <> Value then
  begin
  FCodTxt := Value;
  edtCodText.Text:= CodTxt;
  end;
end;

procedure TfrmAddCode.SetCod(const Value: string);
begin
if FCod <> Value then
  begin
  FCod := Value;
  edtCod.Text:= Cod;
  end;
end;

procedure TfrmAddCode.SetCodWeight(const Value: Double);
begin
if FCodWeight <> Value then
  begin
  FCodWeight := Value;
  edtCodWeight.Text:=Format('%.3f',[CodWeight]);
  RangeLabelUpdate;
  end;
end;

procedure TfrmAddCode.SetCodKoeff(const Value: Double);
begin
if FCodKoeff <> Value then
  begin
  FCodKoeff := Value;
  edtCodKoeff.Text:=Format('%.3f',[CodKoeff]);
  RangeLabelUpdate;
  end;
end;

procedure TfrmAddCode.SetCodSign(const Value: string);
begin
if FCodSign <> Value then
  begin
  FCodSign := Value;
  edtCodSign.Text:= CodSign;
  end;
end;

end.
