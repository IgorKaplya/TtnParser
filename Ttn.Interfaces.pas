unit Ttn.Interfaces;

interface

uses
  System.Generics.Collections
  ,System.Classes
  ,Ttn.Constants
  ,System.SysUtils
  ;

type

{$REGION 'Ttn enumerable implemetation.}
  ITtnEnumerator<T> = interface
  ['{4465A967-A0E1-4AC8-985F-3FE66F157FF6}']
    function GetCurrent: T;
    function MoveNext: Boolean;
    procedure Reset;
    property Current: T read GetCurrent;
  end;

  ITtnEnumerable<T> = interface
  ['{E59198CD-EDE8-4A26-BE4B-4A051BBB6ED9}']
    function GetEnumerator: ITtnEnumerator<T>;
  end;
{$ENDREGION}

{$REGION 'Ttn IFactory implementation'}
  {$M+}
  ITtnFactory<TResult> = interface(TFunc<TResult>)
    function Invoke: TResult;
  end;

  ITtnFactory<T,TResult> = interface(TFunc<T,TResult>)
    function Invoke(Arg: T): TResult;
  end;
  {$M-}
{$ENDREGION}

  ITtnListBase<T> = interface(ITtnEnumerable<T>)
  ['{C8ADF7F6-8F43-414E-AB41-D51DC74C59E3}']
    function Add: T;
    procedure Clear;
    function GetCount: Integer;
    function GetItems(Index: Integer): T;
    property Count: Integer read GetCount;
    property Items[Index: Integer]: T read GetItems; default;
  end;


  StringCountryRegion = string[3];

  ITtnObj = interface(IInvokable)
  ['{F597E2BD-3F63-4A60-AD1C-F569F116A265}']
  {$REGION 'Property accessors'}
    function GetCOST: Double;
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
    function GetDestinationCountry: string;
    procedure SetDestinationCountry(const Value: string);
    function GetDestinationCountryRegion: StringCountryRegion;
    procedure SetDestinationCountryRegion(const Value: StringCountryRegion);
    function GetDeliveryCountry: string;
    procedure SetDeliveryCountry(const Value: string);
    function GetDeliveryCountryRegion: StringCountryRegion;
    procedure SetDeliveryCountryRegion(const Value: StringCountryRegion);
    function GetDateTtn: TDate;
    procedure SetDateTtn(const Value: TDate);
  {$ENDREGION}
    property COST: Double read GetCOST write SetCOST;
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
    property DestinationCountry: string read GetDestinationCountry write SetDestinationCountry;
    property DestinationCountryRegion: StringCountryRegion read GetDestinationCountryRegion write SetDestinationCountryRegion;
    property DeliveryCountry: string read GetDeliveryCountry write SetDeliveryCountry;
    property DeliveryCountryRegion: StringCountryRegion read GetDeliveryCountryRegion write SetDeliveryCountryRegion;
    property DateTtn: TDate read GetDateTtn write SetDateTtn;
  end;

  ITtnList  = interface(ITtnListBase<ITtnObj>)
  ['{C8ADF7F6-8F43-414E-AB41-D51DC74C59E3}']
    procedure Save(const AStrings: TStrings);
    procedure Sort;
  end;

  ITtnParser = interface(IInterface)
  ['{0CBE850A-4218-4491-82C1-C0A3D996776F}']
    function ColumnIdx(const AColumnName: string): Integer;
    procedure Parse(const AFile: string); overload;
    procedure Parse(const AFile: TStrings); overload;
    procedure Configure(const AFile: TStrings); overload;
  {$REGION 'Property Accessors'}
    function GetConfiguration: TTtnParserConfiguration;
    function GetParseResult: ITtnList;
  {$ENDREGION}
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
    procedure ParseAStrongName(AInput: string; const AObj: ITtnObj);
  end;

  ITtnProcessor = interface(IInterface)
  ['{76592F46-8EB5-4EDE-BE46-44FD5C9889AE}']
    procedure Process(const AList: ITtnList);
    {$REGION 'Property Accessors'}
    function GetCurrency: string;
    procedure SetCurrency(const Value: string);
    function GetWeightMultiplier: Double;
    procedure SetWeightMultiplier(const Value: Double);
    {$ENDREGION}
    property Currency: string read GetCurrency write SetCurrency;
    property WeightMultiplier: Double read GetWeightMultiplier write SetWeightMultiplier;
  end;

  ITtnKod = interface(IInterface)
  ['{C27AF1C0-170B-403D-965D-8DF450AE038C}']
  {$REGION 'Property Accessors'}
    function GetKodKey: TGUID;
    procedure SetKodKey(const Value: TGUID);
    function GetKodsign: string;
    procedure SetKodsign(const Value: string);
    function GetKodTxt: string;
    procedure SetKodTxt(const Value: string);
    function GetKodVal: string;
    procedure SetKodVal(const Value: string);
    function GetKodWeightKoef: Double;
    procedure SetKodWeightKoef(const Value: Double);
    function GetKodWeightStandart: Double;
    procedure SetKodWeightStandart(const Value: Double);
  {$ENDREGION}
    property KodKey: TGUID read GetKodKey write SetKodKey;
    property Kodsign: string read GetKodsign write SetKodsign;
    property KodTxt: string read GetKodTxt write SetKodTxt;
    property KodVal: string read GetKodVal write SetKodVal;
    property KodWeightKoef: Double read GetKodWeightKoef write SetKodWeightKoef;
    property KodWeightStandart: Double read GetKodWeightStandart write SetKodWeightStandart;
  end;

  ITtnKodList = interface(ITtnListBase<ITtnKod>)
  ['{13948C7D-087E-4AEB-AFE7-61AD3423C6AB}']
  end;

  ITtnProcessorTestable = interface(ITtnProcessor)
  ['{0DCD560F-91E2-481B-AA97-4DEF1FD04148}']
    {$REGION 'Property Accessors'}
    function GetCountryList: TDictionary<string, string>;
    procedure SetCountryList(const Value: TDictionary<string, string>);
    function GetKodList: ITtnKodList;
    {$ENDREGION}
    procedure ProcessWeight(const AObj: ITtnObj);
    procedure ProcessCurrency(const AObj: ITtnObj);
    procedure ProcessCountry(const AObj: ITtnObj);
    procedure ProcessKod(const AObj: ITtnObj);
    procedure CheckKodHasStandartWeight(const AKod: ITtnKod);
    procedure CheckKodHasWeightCoefficient(const AKod: ITtnKod);
    procedure CheckWeightRange(const AKod: ITtnKod; const AObj: ITtnObj);
    property CountryList: TDictionary<string, string> read GetCountryList write SetCountryList;
    property KodList: ITtnKodList read GetKodList;
  end;

implementation

end.


