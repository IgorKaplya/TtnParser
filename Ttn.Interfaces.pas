unit Ttn.Interfaces;

interface

uses
  System.Classes, Ttn.Constants;

type

  ITtnObj = interface(IInvokable)
  ['{F597E2BD-3F63-4A60-AD1C-F569F116A265}']
    function GetCOST: Double;
    function GetError: Integer;
    function GetErrorMsg: string;
    function GetKOD: string;
    function GetNAME: string;
    function GetNUMBER: Integer;
    function GetQUANTITY: Integer;
    function GetSIGN: string;
    function GetSTR_PR: string;
    function GetVAL: string;
    function GetWEIGHT1: Double;
    function GetWEIGHT2: Double;
    function GetWEIGHT3: Double;
    procedure SetCOST(const Value: Double);
    procedure SetError(const Value: Integer);
    procedure SetErrorMsg(const Value: string);
    procedure SetKOD(const Value: string);
    procedure SetNAME(const Value: string);
    procedure SetNUMBER(const Value: Integer);
    procedure SetQUANTITY(const Value: Integer);
    procedure SetSIGN(const Value: string);
    procedure SetSTR_PR(const Value: string);
    procedure SetVAL(const Value: string);
    procedure SetWEIGHT1(const Value: Double);
    procedure SetWEIGHT2(const Value: Double);
    procedure SetWEIGHT3(const Value: Double);
    property COST: Double read GetCOST write SetCOST;
    property Error: Integer read GetError write SetError;
    property ErrorMsg: string read GetErrorMsg write SetErrorMsg;
    property KOD: string read GetKOD write SetKOD;
    property NAME: string read GetNAME write SetNAME;
    property NUMBER: Integer read GetNUMBER write SetNUMBER;
    property QUANTITY: Integer read GetQUANTITY write SetQUANTITY;
    property SIGN: string read GetSIGN write SetSIGN;
    property STR_PR: string read GetSTR_PR write SetSTR_PR;
    property VAL: string read GetVAL write SetVAL;
    property WEIGHT1: Double read GetWEIGHT1 write SetWEIGHT1;
    property WEIGHT2: Double read GetWEIGHT2 write SetWEIGHT2;
    property WEIGHT3: Double read GetWEIGHT3 write SetWEIGHT3;
  end;

  ITtnList = interface(IInterface)
  ['{C8ADF7F6-8F43-414E-AB41-D51DC74C59E3}']
    function Add: ITtnObj;
    procedure Clear;
    function GetCount: Integer;
    function GetItems(Index: Integer): ITtnObj;
    procedure Save(const AStrings: TStrings);
    procedure Sort;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: ITtnObj read GetItems; default;
  end;

  ITtnParser = interface(IInterface)
  ['{0CBE850A-4218-4491-82C1-C0A3D996776F}']
    function ColumnIdx(const AColumnName: string): Integer;
    procedure Parse(const AFile: string); overload;
    procedure Parse(const AFile: TStrings); overload;
    procedure Configure(const AFile: TStrings); overload;
    function GetConfiguration: TTtnParserConfiguration;
    function GetParseResult: ITtnList;
    property Configuration: TTtnParserConfiguration read GetConfiguration;
    property ParseResult: ITtnList read GetParseResult;
  end;

  ITtnParserTestable = interface(ITtnParser)
  ['{622737DF-80FE-4AB4-9961-40F358A3C5A4}']
    procedure ReadConfiguration(const AConfiguration: string);
    procedure MapHeader(const AHeader: string);
    function LineDataStr(const ASource: TStrings; AHeaderColumn: string): string;
    function LineDataDbl(const ASource: TStrings; AHeaderColumn: string): Double;
    function LineDataInt(const ASource: TStrings; AHeaderColumn: string): Integer;
    function RemoveWhiteSpace(const AStr: string): string;
  end;

  ITtnProcessor = interface(IInterface)
  ['{76592F46-8EB5-4EDE-BE46-44FD5C9889AE}']
    procedure Process(const AList: ITtnList);
    function GetCurrency: string;
    procedure SetCurrency(const Value: string);
    property Currency: string read GetCurrency write SetCurrency;
  end;

  ITtnProcessorTestable = interface(ITtnProcessor)
  ['{0DCD560F-91E2-481B-AA97-4DEF1FD04148}']
    procedure ProcessWeight(const AObj: ITtnObj);
    procedure ProcessCurrency(const AObj: ITtnObj);
  end;



implementation

end.


