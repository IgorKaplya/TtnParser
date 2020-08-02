unit Ttn.Test.Run.Testinsight;

interface

procedure TestTestinsightRun;

implementation

uses
  TestInsight.DUnitX;

procedure TestTestinsightRun;
begin
  TestInsight.DUnitX.RunRegisteredTests();
end;

end.
