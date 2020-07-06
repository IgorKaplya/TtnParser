unit uIntfTtnParser;

interface

uses
  System.Classes, TtnParserErrors;

type

  TTtnParserConfiguration = (tpcNone, tpcMotor, tpcAutoStrong);

  ETtnParserEmptyInput = class(ETtnParserExc)
  end;

  ITtnObjParser = interface(IInterface)
  ['{0CBE850A-4218-4491-82C1-C0A3D996776F}']
    procedure Configure(const AFile: string); overload;
    procedure Configure(const AFile: TStrings); overload;
    function GetConfiguration: TTtnParserConfiguration;
    function Parse(const AText: string; const AObj: TObject): Boolean;
    property Configuration: TTtnParserConfiguration read GetConfiguration;
  end;

function CreateTtnParser: ITtnObjParser;

implementation

uses
  uTtnObjParser;

function CreateTtnParser: ITtnObjParser;
begin
  Result := TTtnParser.Create() as ITtnObjParser;
end;

end.
