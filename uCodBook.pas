unit uCodBook;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFrameCodBook = class(TFrame)
    dbgKod: TDBGrid;
    edtFilter: TButtonedEdit;
    dsKod: TDataSource;
    procedure edtFilterChange(Sender: TObject);
    procedure edtFilterRightButtonClick(Sender: TObject);
  private
    FKodTxtFilter: string;
    procedure SetKodTxtFilter(const Value: string);
    { Private declarations }
  public
    property KodTxtFilter: string read FKodTxtFilter write SetKodTxtFilter;
    { Public declarations }
  end;

implementation

uses
  dmMain;

{$R *.dfm}

procedure TFrameCodBook.edtFilterChange(Sender: TObject);
begin
KodTxtFilter:= (Sender as TButtonedEdit).Text;
end;

procedure TFrameCodBook.edtFilterRightButtonClick(Sender: TObject);
begin
(Sender as TButtonedEdit).Clear;
end;

procedure TFrameCodBook.SetKodTxtFilter(const Value: string);
begin
if FKodTxtFilter <> Value then
  begin
  FKodTxtFilter := Value;
  dm.tblKod.Filtered:=False;
  if not SameText(edtFilter.Text,KodTxtFilter) then
    edtFilter.Text:=KodTxtFilter;
  if Length(KodTxtFilter)>0 then
    begin
    dm.tblKod.Filter:=F_Kod_txt+' LIKE '+quotedstr('*'+KodTxtFilter+'*');
    dm.tblKod.Filtered:=True;
    end;
  end;
end;

end.
