program TtnParserTest;

{$IFNDEF TESTINSIGHT}
  {$APPTYPE CONSOLE}
{$ENDIF}

uses
  Ttn.Test.Main.Console in 'Ttn.Test.Main.Console.pas',
  Ttn.Test.Main.Testinsight in 'Ttn.Test.Main.Testinsight.pas',
  Ttn.Test.Parser in 'Ttn.Test.Parser.pas',
  Ttn.Registration in '..\Ttn.Registration.pas',
  Ttn.List in '..\Ttn.List.pas',
  Ttn.Obj in '..\Ttn.Obj.pas';

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
