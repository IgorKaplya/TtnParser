program TtnParserTest;

uses
  Ttn.Test.Run.Console in 'Ttn.Test.Run.Console.pas',
  Ttn.Test.Run.Testinsight in 'Ttn.Test.Run.Testinsight.pas',
  Ttn.Test.Run in 'Ttn.Test.Run.pas',
  Ttn.Test.Parser in 'Ttn.Test.Parser.pas',
  Ttn.Test.Processor in 'Ttn.Test.Processor.pas',
  Ttn.Test.ResultStorage in 'Ttn.Test.ResultStorage.pas',
  Ttn.Test.Result in 'Ttn.Test.Result.pas',
  Ttn.Test.TtnList in 'Ttn.Test.TtnList.pas',
  Ttn.Test.TtnObj in 'Ttn.Test.TtnObj.pas',
  Ttn.Test.DocumentList in 'Ttn.Test.DocumentList.pas',
  Ttn.Test.Document in 'Ttn.Test.Document.pas',
  Ttn.Test.Excel in 'Ttn.Test.Excel.pas';

begin
  RunTests();
end.
