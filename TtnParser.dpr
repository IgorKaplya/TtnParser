program TtnParser;

uses
  Forms,
  frmTtnParser in 'frmTtnParser.pas' {frmTtnParserMain},
  Ttn.Errors in 'Ttn.Errors.pas',
  dmMain in 'dmMain.pas' {dm: TDataModule},
  Ttn.Obj in 'Ttn.Obj.pas',
  Ttn.List in 'Ttn.List.pas',
  frmTtnSettings in 'frmTtnSettings.pas' {frmSett},
  frmAddCod in 'frmAddCod.pas' {frmAddCode},
  uCodBook in 'uCodBook.pas' {FrameCodBook: TFrame},
  frmCodBookHlp in 'frmCodBookHlp.pas' {frmCodBookHelp},
  Ttn.Constants in 'Ttn.Constants.pas',
  Ttn.Interfaces in 'Ttn.Interfaces.pas',
  Ttn.Registration in 'Ttn.Registration.pas',
  Ttn.Processor in 'Ttn.Processor.pas',
  Ttn.Excel in 'Ttn.Excel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Разбор ТТН';
  RegisterTypes();
  Application.CreateForm(TfrmTtnParserMain, frmTtnParserMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmSett, frmSett);
  Application.CreateForm(TfrmAddCode, frmAddCode);
  Application.CreateForm(TfrmCodBookHelp, frmCodBookHelp);
  Application.Run;
end.
