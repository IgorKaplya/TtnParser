program TtnParserTest;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework,
  uTestTtnParser in 'uTestTtnParser.pas',
  frmTtnParser in '..\frmTtnParser.pas' {frmTtnParserMain},
  ttnObjLst in '..\ttnObjLst.pas',
  ttnObj in '..\ttnObj.pas',
  TtnParserErrors in '..\TtnParserErrors.pas',
  dmMain in '..\dmMain.pas' {dm: TDataModule},
  frmTtnSettings in '..\frmTtnSettings.pas' {frmSett},
  uCodBook in '..\uCodBook.pas' {FrameCodBook: TFrame},
  frmAddCod in '..\frmAddCod.pas' {frmAddCode},
  frmCodBookHlp in '..\frmCodBookHlp.pas', Vcl.Forms {frmCodBookHelp};

var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  exit;
{$ENDIF}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //tell the runner how we will log things
    //Log to the console window
    logger := TDUnitXConsoleLogger.Create(true);
    runner.AddLogger(logger);
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);
    runner.FailsOnNoAsserts := False; //When true, Assertions must be made during tests;

    {GUI App init}
    Application.Initialize;
    Application.Title := '������ ���';
    Application.CreateForm(TfrmTtnParserMain, frmTtnParserMain);
    Application.CreateForm(Tdm, dm);
    Application.CreateForm(TfrmSett, frmSett);
    Application.CreateForm(TfrmAddCode, frmAddCode);
    Application.CreateForm(TfrmCodBookHelp, frmCodBookHelp);
    frmTtnParserMain.StartUp();

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
end.
