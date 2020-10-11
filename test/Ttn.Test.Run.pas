unit Ttn.Test.Run;

{$IFNDEF TESTINSIGHT}
  {$APPTYPE CONSOLE}
{$ENDIF}

interface

procedure RunTests;

implementation

uses
  Ttn.Registration, Ttn.Test.Run.Console, Ttn.Test.Run.Testinsight;

procedure RunTests;
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
end;

end.
