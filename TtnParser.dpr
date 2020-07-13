program TtnParser;

uses
  Forms,
  frmTtnParser in 'frmTtnParser.pas' {frmTtnParserMain},
  uTtnErrors in 'uTtnErrors.pas',
  dmMain in 'dmMain.pas' {dm: TDataModule},
  ttnObj in 'ttnObj.pas',
  ttnObjLst in 'ttnObjLst.pas',
  frmTtnSettings in 'frmTtnSettings.pas' {frmSett},
  frmAddCod in 'frmAddCod.pas' {frmAddCode},
  uCodBook in 'uCodBook.pas' {FrameCodBook: TFrame},
  frmCodBookHlp in 'frmCodBookHlp.pas' {frmCodBookHelp};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Разбор ТТН';
  Application.CreateForm(TfrmTtnParserMain, frmTtnParserMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmSett, frmSett);
  Application.CreateForm(TfrmAddCode, frmAddCode);
  Application.CreateForm(TfrmCodBookHelp, frmCodBookHelp);
  Application.Run;
end.
