program TtnParserTest;

{$IFNDEF TESTINSIGHT}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  uMainConsole in 'uMainConsole.pas',
  uMainTestinsight in 'uMainTestinsight.pas',
  uTestParser in 'uTestParser.pas',
  uTestTtnParser in 'uTestTtnParser.pas';

begin
  try
    {$IFDEF TESTINSIGHT}
      TestTestinsightRun();
    {$ELSE}
      TestConsoleRun();
    {$ENDIF}
  except
  end;
end.
