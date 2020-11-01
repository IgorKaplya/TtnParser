unit Ttn.Obj;

interface

uses
  Ttn.Interfaces;

type

  TTtnObj = class(TInterfacedObject, ITtnObj)
  private
    FCOST: Double;
    FErrorMsg: string;
    FKOD: string;
    FNAME: string;
    FNUMBER: Integer;
    FQUANTITY: Integer;
    FSIGN: string;
    FSTR_PR: string;
    FVAL: string;
    FWEIGHT1: Double;
    FWEIGHT2: Double;
    FWEIGHT3: Double;
    FDestinationCountry: string;
    FDestinationCountryRegion: StringCountryRegion;
    FDeliveryCountry: string;
    FDeliveryCountryRegion: StringCountryRegion;
    FDateTtn: TDate;
    function GetDateTtn: TDate;
    function GetDeliveryCountry: string;
    function GetDeliveryCountryRegion: StringCountryRegion;
    function GetDestinationCountry: string;
    function GetDestinationCountryRegion: StringCountryRegion;
    procedure SetDateTtn(const Value: TDate);
    procedure SetDeliveryCountry(const Value: string);
    procedure SetDeliveryCountryRegion(const Value: StringCountryRegion);
    procedure SetDestinationCountry(const Value: string);
    procedure SetDestinationCountryRegion(const Value: StringCountryRegion);
    function GetAsText: string;
    procedure SetAsText(const Value: string);
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
  public
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

implementation

uses
  System.SysUtils, Ttn.Constants, System.Classes, Ttn.Errors;

const
  obj_minimum_field_count = 15;

function TTtnObj.GetCOST: Double;
begin
  Result := FCOST;
end;

function TTtnObj.GetErrorMsg: string;
begin
  Result := FErrorMsg;
end;

function TTtnObj.GetKOD: string;
begin
  Result := FKOD;
end;

function TTtnObj.GetNAME: string;
begin
  Result := FNAME;
end;

function TTtnObj.GetNUMBER: Integer;
begin
  Result := FNUMBER;
end;

function TTtnObj.GetQUANTITY: Integer;
begin
  Result := FQUANTITY;
end;

function TTtnObj.GetSIGN: string;
begin
  Result := FSIGN;
end;

function TTtnObj.GetSTR_PR: string;
begin
  Result := FSTR_PR;
end;

function TTtnObj.GetVAL: string;
begin
  Result := FVAL;
end;

function TTtnObj.GetWEIGHT1: Double;
begin
  Result := FWEIGHT1;
end;

function TTtnObj.GetWEIGHT2: Double;
begin
  Result := FWEIGHT2;
end;

function TTtnObj.GetWEIGHT3: Double;
begin
  Result := FWEIGHT3;
end;

procedure TTtnObj.SetCOST(const Value: Double);
begin
  FCOST := Value;
end;

procedure TTtnObj.SetErrorMsg(const Value: string);
begin
  FErrorMsg := Value;
end;

procedure TTtnObj.SetKOD(const Value: string);
begin
  FKOD := Value;
end;

procedure TTtnObj.SetNAME(const Value: string);
begin
  FNAME := Value;
end;

procedure TTtnObj.SetNUMBER(const Value: Integer);
begin
  FNUMBER := Value;
end;

procedure TTtnObj.SetQUANTITY(const Value: Integer);
begin
  FQUANTITY := Value;
end;

procedure TTtnObj.SetSIGN(const Value: string);
begin
  FSIGN := Value;
end;

procedure TTtnObj.SetSTR_PR(const Value: string);
begin
  FSTR_PR := Value;
end;

procedure TTtnObj.SetVAL(const Value: string);
begin
  FVAL := Value;
end;

procedure TTtnObj.SetWEIGHT1(const Value: Double);
begin
  FWEIGHT1 := Value;
end;

procedure TTtnObj.SetWEIGHT2(const Value: Double);
begin
  FWEIGHT2 := Value;
end;

procedure TTtnObj.SetWEIGHT3(const Value: Double);
begin
  FWEIGHT3 := Value;
end;

function TTtnObj.GetDateTtn: TDate;
begin
  Result := FDateTtn;
end;

function TTtnObj.GetDeliveryCountry: string;
begin
  Result := FDeliveryCountry;
end;

function TTtnObj.GetDeliveryCountryRegion: StringCountryRegion;
begin
  Result := FDeliveryCountryRegion;
end;

function TTtnObj.GetDestinationCountry: string;
begin
  Result := FDestinationCountry;
end;

function TTtnObj.GetDestinationCountryRegion: StringCountryRegion;
begin
  Result := FDestinationCountryRegion;
end;

procedure TTtnObj.SetDateTtn(const Value: TDate);
begin
  FDateTtn := Value;
end;

procedure TTtnObj.SetDeliveryCountry(const Value: string);
begin
  FDeliveryCountry := Value;
end;

procedure TTtnObj.SetDeliveryCountryRegion(const Value: StringCountryRegion);
begin
  FDeliveryCountryRegion := Value;
end;

procedure TTtnObj.SetDestinationCountry(const Value: string);
begin
  FDestinationCountry := Value;
end;

procedure TTtnObj.SetDestinationCountryRegion(const Value: StringCountryRegion);
begin
  FDestinationCountryRegion := Value;
end;

function TTtnObj.GetAsText: string;
begin
  Result := Format('%d;"%s";"%s";%.3f;%.3f;%.3f;%.2f;"%s";"%s";%d;"%s";"%s";"%s";"%s";"%s"',[
    NUMBER,                                        // 0
    KOD ,                                          // 1
    NAME ,                                         // 2
    WEIGHT1 ,                                      // 3
    WEIGHT2 ,                                      // 4
    WEIGHT3 ,                                      // 5
    COST ,                                         // 6
    VAL ,                                          // 7
    STR_PR ,                                       // 8
    QUANTITY,                                      // 9
    DeliveryCountry,                               // 12
    String(DeliveryCountryRegion).Replace(' ','0'),                         // 13
    DestinationCountry,                            // 10
    String(DestinationCountryRegion).Replace(' ','0'),                      // 11
    FormatDateTime(C_Date_Tovar_Format, DateTtn)   // 14
  ]);
end;

procedure TTtnObj.SetAsText(const Value: string);
var
  i: Integer;
  listFields: TStringList;
  fs: TFormatSettings;
begin
  listFields := TStringList.Create();
  try
    fs := TFormatSettings.Create('Windows-1251');
    fs.ShortDateFormat := C_Date_Tovar_Format;
    listFields.StrictDelimiter := true;
    listFields.Delimiter := ';';
    listFields.DelimitedText := Value;
    ETtnObjAsTxtNotEnoughFields.Test(listFields.Count>=obj_minimum_field_count, 'Couldn`t load line "%s". Need %d+ fields.', [Value, obj_minimum_field_count ]);
    for i := 0 to listFields.Count - 1 do
    begin
      ETtnObjAsTxtFieldIsEmpty.Test(not listFields[i].IsEmpty, 'Couldn`t load line "%s". [%d] field is empty.', [Value, i]);
      case i of
      0 : NUMBER := listFields[i].ToInteger;
      1 : KOD := listFields[i];
      2 : NAME := listFields[i];
      3 : WEIGHT1 := listFields[i].ToDouble;
      4 : WEIGHT2 := listFields[i].ToDouble;
      5 : WEIGHT3 := listFields[i].ToDouble;
      6 : COST := listFields[i].ToDouble;
      7 : VAL := listFields[i];
      8 : STR_PR := listFields[i];
      9 : QUANTITY := listFields[i].ToInteger;
      10 : DeliveryCountry := listFields[i];
      11 : DeliveryCountryRegion := listFields[i];
      12 : DestinationCountry := listFields[i];
      13 : DestinationCountryRegion := listFields[i];
      14 : DateTtn := StrToDate(listFields[i], fs);
      end;
    end;
  finally
    listFields.Free;
    listFields := nil;
  end;
end;

end.

