unit frmCodBookHlp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uCodBook;

type
  TfrmCodBookHelp = class(TForm)
    FrameCodBook1: TFrameCodBook;
    procedure FrameCodBook1dbgKodDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCodBookHelp: TfrmCodBookHelp;

implementation

{$R *.dfm}

procedure TfrmCodBookHelp.FrameCodBook1dbgKodDblClick(Sender: TObject);
begin
ModalResult:=mrOk;
end;

end.
