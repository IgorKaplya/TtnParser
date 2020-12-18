unit Ttn.Processor;

interface

uses
  Ttn.Interfaces,
  System.Generics.Collections;

type

  TTtnProcessor = class(TInterfacedObject, ITtnProcessor, ITtnProcessorTestable)
  private
    FCurrency: string;
    FWeightMultiplier: Double;
    FCountryList: TDictionary<string, string>;
    FKodList: ITtnKodList;
    function GetCurrency: string;
    procedure SetCurrency(const Value: string);
    procedure ProcessCurrency(const AObj: ITtnObj);
    procedure ProcessCountry(const AObj: ITtnObj);
    function GetCountryList: TDictionary<string, string>;
    procedure SetCountryList(const Value: TDictionary<string, string>);
    procedure LoadCountryList;
    procedure ProcessWeight(const AObj: ITtnObj);
    procedure LoadKodList;
    function GetKodList: ITtnKodList;
    procedure ProcessKod(const AObj: ITtnObj);
    property CountryList: TDictionary<string, string> read GetCountryList write SetCountryList;
    property KodList: ITtnKodList read GetKodList;
    function GetWeightMultiplier: Double;
    procedure SetWeightMultiplier(const Value: Double);
    property WeightMultiplier: Double read GetWeightMultiplier write SetWeightMultiplier;
    procedure CheckWeight(const AObj: ITtnObj; const AKod: ITtnKod);
    procedure ObjErrorAppend(const AErrorMessage: string; const AObj: ITtnObj);
    procedure CheckKodHasStandartWeight(const AKod: ITtnKod);
    procedure CheckKodHasWeightCoefficient(const AKod: ITtnKod);
    procedure CheckWeightRange(const AKod: ITtnKod; const AObj: ITtnObj);
    procedure Unify(const AList: ITtnList);
  public
    constructor Create(const AKodList: ITtnKodList);
    destructor Destroy; override;
    procedure Process(const AList: ITtnList);
    property Currency: string read GetCurrency write SetCurrency;
  end;

implementation

uses
  dmMain, System.SysUtils, Ttn.Errors, System.Math, Types;

const
  C_Kod_EPSILON = 0.00001;

procedure TTtnProcessor.Process(const AList: ITtnList);
var
  ttn: ITtnObj;
begin
  LoadCountryList();
  LoadKodList();
  for ttn in AList do
  begin
    ProcessWeight(ttn);
    ProcessCurrency(ttn);
    ProcessCountry(ttn);
    ProcessKod(ttn);
  end;
  Unify(AList);
end;

procedure TTtnProcessor.ProcessWeight(const AObj: ITtnObj);
begin
  AObj.WEIGHT1 := WeightMultiplier * AObj.WEIGHT1;
  AObj.WEIGHT2 := AObj.WEIGHT1;
  AObj.WEIGHT3 := AObj.WEIGHT1;
end;

function TTtnProcessor.GetCurrency: string;
begin
  Result := FCurrency;
end;

procedure TTtnProcessor.SetCurrency(const Value: string);
begin
  FCurrency := Value;
end;

procedure TTtnProcessor.ProcessCurrency(const AObj: ITtnObj);
begin
  AObj.VAL := Currency;
end;

procedure TTtnProcessor.ProcessCountry(const AObj: ITtnObj);
var
  country: TPair<string, string>;
  inputCountry: string;
  countryFound: Boolean;
begin
  countryFound := false;
  inputCountry := AObj.STR_PR.ToLower();
  for country in CountryList do
    if (pos(country.Key, inputCountry)<>0) then
    begin
      AObj.Str_Pr := country.Value;
      countryFound := True;
      Break;
    end;
  if not countryFound then
    ObjErrorAppend('Страна происхожения не найдена', AObj);
end;

function TTtnProcessor.GetCountryList: TDictionary<string, string>;
begin
  Result := FCountryList;
end;

procedure TTtnProcessor.SetCountryList(const Value: TDictionary<string, string>);
begin
  FCountryList := Value;
end;

procedure TTtnProcessor.LoadCountryList;
begin
  CountryList.Clear;
  if Assigned(dm) then
  begin
    dm.tblStrPr.First;
    while (not dm.tblStrPr.Eof) do
    begin
      CountryList.AddOrSetValue(dm.tblStrPr.FieldByName(F_Str_pr_txt).AsString.ToLower, dm.tblStrPr.FieldByName(F_Str_pr_val).AsString.ToLower);
      dm.tblStrPr.Next();
    end;
  end;
end;

constructor TTtnProcessor.Create(const AKodList: ITtnKodList);
begin
  inherited Create;
  FCountryList := TDictionary<string, string>.Create();
  FKodList := AKodList;
end;

destructor TTtnProcessor.Destroy;
begin
  FKodList := nil;
  FCountryList.Free;
  inherited Destroy;
end;

procedure TTtnProcessor.LoadKodList;
var
  newKod: ITtnKod;
begin
  KodList.Clear();
  if Assigned(dm) then
  begin
    dm.tblKod.Filtered := False;
    dm.tblKod.First;
    while (not dm.tblKod.Eof) do
    begin
      newKod := KodList.Add();
      newKod.KodKey := dm.tblKod.FieldByName(F_Kod_Key).AsGuid;
      newKod.Kodsign := dm.tblKod.FieldByName(F_Kod_sign).AsString;
      newKod.KodTxt := dm.tblKod.FieldByName(F_Kod_txt).AsString;
      newKod.KodVal := dm.tblKod.FieldByName(F_Kod_val).AsString;
      newKod.KodWeightKoef := dm.tblKod.FieldByName(F_Kod_Weight_Koef).AsFloat;
      newKod.KodWeightStandart := dm.tblKod.FieldByName(F_Kod_Weight_Standart).AsFloat;
      dm.tblKod.Next();
    end;
  end;
end;

function TTtnProcessor.GetKodList: ITtnKodList;
begin
  Result := FKodList;
end;

procedure TTtnProcessor.ProcessKod(const AObj: ITtnObj);
var
  inputName, inputSign: string;
  kod: ITtnKod;
  kodFound: Boolean;
begin
  kodFound := false;
  AObj.KOD := '';
  inputName := Trim(AObj.NAME);
  inputSign := Trim(AObj.SIGN);
  for kod in KodList do
    if AnsiSameText(inputName, kod.KodTxt) and AnsiSameText(kod.Kodsign, inputSign) then
    begin
      AObj.KOD := kod.KodVal;
      kodFound := True;
      Break;
    end;
  if not kodFound then
    ObjErrorAppend('не найден код товара', AObj);
end;

procedure TTtnProcessor.CheckWeight(const AObj: ITtnObj; const AKod: ITtnKod);
begin
  try
  CheckKodHasWeightCoefficient(AKod);
  CheckKodHasStandartWeight(AKod);
  CheckWeightRange(AKod, AObj);
  except on E: ETtnWeightProcessing do ObjErrorAppend(E.Message, AObj);
  end;
end;

procedure TTtnProcessor.CheckWeightRange(const AKod: ITtnKod; const AObj: ITtnObj);
var
  weightMin: Double;
  weightMax: Double;
  weight: Double;
begin
  weightMin := AKod.KodWeightStandart / AKod.KodWeightKoef;
  weightMax := AKod.KodWeightStandart * AKod.KodWeightKoef;
  weight := AObj.WEIGHT1 / Aobj.QUANTITY;
  ETtnWeightProcessingWeightViolatesAcceptable.Test(
    (CompareValue(weight, weightMin, C_Kod_Epsilon) = GreaterThanValue) and (CompareValue(weight, weightMax, C_Kod_Epsilon) = LessThanValue),
    'Вес (%.3f) не укладывается в эталонный [%.3f..%.3f]',
    [weight, weightMin, weightMax]
  );
end;

procedure TTtnProcessor.CheckKodHasWeightCoefficient(const AKod: ITtnKod);
begin
  ETtnWeightProcessingCoefficientWeightZero.Test(not SameValue(AKod.KodWeightKoef, 0, C_Kod_Epsilon), 'Не задан эталонный вес коэфф');
end;

procedure TTtnProcessor.CheckKodHasStandartWeight(const AKod: ITtnKod);
begin
  ETtnWeightProcessingWeightStandartZero.Test(not SameValue(AKod.KodWeightStandart, 0, C_Kod_Epsilon), 'Не задан эталонный вес');
end;

procedure TTtnProcessor.ObjErrorAppend(const AErrorMessage: string; const AObj: ITtnObj);
begin
  if AObj.ErrorMsg.IsEmpty then
    AObj.ErrorMsg := AErrorMessage
  else
    AObj.ErrorMsg := AObj.ErrorMsg + sLineBreak+ AErrorMessage;
end;

procedure TTtnProcessor.Unify(const AList: ITtnList);
{Сортируем и проставляем NUMBER}
var
  i,iNum: Integer;
  sCountry: string;
  sKod: string;
begin
//Сортировка
AList.Sort;
//Проставляем номера
i:=0;
iNum:=1;
while i<AList.Count do
  begin
  sKod:=AList[i].KOD;
  sCountry:=AList[i].STR_PR;
  AList[i].NUMBER:=iNum;
  if dm.tblUni.Locate(F_Uni_kod,sKod,[]) then
    repeat
    AList[i].NAME:=dm.tblUni.FieldByName(F_Uni_etal_txt).AsString;
    AList[i].NUMBER:=iNum;
    Inc(i);
    until (i>=AList.Count) or not SameText(sKod,AList[i].KOD) or not SameText(sCountry,AList[i].STR_PR)
  else
    Inc(i);
  Inc(iNum);
  end;
end;

function TTtnProcessor.GetWeightMultiplier: Double;
begin
  Result := FWeightMultiplier;
end;

procedure TTtnProcessor.SetWeightMultiplier(const Value: Double);
begin
  FWeightMultiplier := Value;
end;

end.
