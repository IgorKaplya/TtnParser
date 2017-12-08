program TtnParser;

uses
  Forms,
  frmTtnParser in 'frmTtnParser.pas' {frmTtnParserMain},
  TtnParserErrors in 'TtnParserErrors.pas',
  dmMain in 'dmMain.pas' {dm: TDataModule},
  ttnObj in 'ttnObj.pas',
  ttnObjLst in 'ttnObjLst.pas',
  frmTtnSettings in 'frmTtnSettings.pas' {frmSett};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Разбор ТТН';
  Application.CreateForm(TfrmTtnParserMain, frmTtnParserMain);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmSett, frmSett);
  Application.Run;
end.
