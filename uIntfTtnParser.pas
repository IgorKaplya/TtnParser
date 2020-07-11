unit uIntfTtnParser;

interface

uses
  System.Classes, TtnParserErrors;

type
  TTtnParserConfiguration = (tpcNone, tpcMotor, tpcAutoStrong);

  ETtnParserEmptyInput = class(ETtnParserExc);
  ETtnParserWrongConfig = class(ETtnParserExc);
  ETtnParserWrongHeader = class(ETtnParserExc);
  ETtnParserWrongLineColumns = class(ETtnParserExc);


  ITtnObjParser = interface(IInterface)
  ['{0CBE850A-4218-4491-82C1-C0A3D996776F}']
    procedure Parse(const AFile: string); overload;
    procedure Parse(const AFile: TStrings); overload;
    procedure Configure(const AFile: TStrings); overload;
    function GetConfiguration: TTtnParserConfiguration;
    property Configuration: TTtnParserConfiguration read GetConfiguration;
  end;

function CreateTtnParser: ITtnObjParser;

const
  C_Input_Minimal_Lines = 3;
  C_Input_First_Data_Line = C_Input_Minimal_Lines - 1;
  C_All_Parser_Configurations: array[TTtnParserConfiguration] of TTtnParserConfiguration = (tpcNone, tpcMotor, tpcAutoStrong);
  Config_String_Alias: array[TTtnParserConfiguration] of string = ('', '#MOTOR', '#ASTRONG');
  F_sign = 'sign';
  F_name = 'name';
  F_cost = 'cost';
  F_quant = 'quant';
  F_weight = 'weight';
  C_Input_FieldNames: array[0..4] of string = (F_sign, F_name, F_cost, F_quant, F_weight);


implementation

uses
  uTtnObjParser;

function CreateTtnParser: ITtnObjParser;
begin
  Result := TTtnParser.Create() as ITtnObjParser;
end;

end.
