program TtnParserTest;

{$IFNDEF TESTINSIGHT}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Ttn.Test.Main.Console in 'Ttn.Test.Main.Console.pas',
  Ttn.Test.Main.Testinsight in 'Ttn.Test.Main.Testinsight.pas',
  Ttn.Registration in '..\Ttn.Registration.pas',
  Ttn.Test.Parser in 'Ttn.Test.Parser.pas',
  Ttn.Test.Processor in 'Ttn.Test.Processor.pas';

begin
  try
    RegisterTypes();
    {$IFDEF TESTINSIGHT}
      TestTestinsightRun();
    {$ELSE}
      TestConsoleRun();
    {$ENDIF}
  except
  end;
end.
