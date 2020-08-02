unit Ttn.Test.Run.Console;

interface

procedure TestConsoleRun;

implementation

uses
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework;

procedure TestConsoleRun;
var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
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
  //Run tests
  results := runner.Execute;
  if not results.AllPassed then
    System.ExitCode := EXIT_ERRORS;
end;



end.
