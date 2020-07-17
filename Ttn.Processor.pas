unit Ttn.Processor;

interface

uses
  Ttn.Interfaces, System.Generics.Collections;

type
  TTtnProcessor = class(TInterfacedObject, ITtnProcessor, ITtnProcessorTestable)
  private
    FCurrency: string;
    FCountryList: TDictionary<string, string>;
    function GetCurrency: string;
    procedure SetCurrency(const Value: string);
    procedure ProcessCurrency(const AObj: ITtnObj);
    procedure ProcessCountry(const AObj: ITtnObj);
    function GetCountryList: TDictionary<string, string>;
    procedure SetCountryList(const Value: TDictionary<string, string>);
    procedure LoadCountryList;
    procedure ProcessWeight(const AObj: ITtnObj);
    property CountryList: TDictionary<string, string> read GetCountryList write SetCountryList;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Process(const AList: ITtnList);
    property Currency: string read GetCurrency write SetCurrency;
  end;

implementation

uses
  dmMain, System.SysUtils;

procedure TTtnProcessor.Process(const AList: ITtnList);
var
  i: Integer;
begin
  LoadCountryList();
  for i := 0 to AList.Count-1 do
  begin
    ProcessWeight(AList[i]);
    ProcessCurrency(AList[i]);
    ProcessCountry(AList[i]);
  end;
end;

procedure TTtnProcessor.ProcessWeight(const AObj: ITtnObj);
begin
  AObj.WEIGHT1 := 1000 * AObj.WEIGHT1;
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
  begin
    AObj.ErrorMsg := 'Страна происхожения не найдена';
    AObj.Error := 255;
  end;
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

constructor TTtnProcessor.Create;
begin
  inherited Create;
  FCountryList := TDictionary<string, string>.Create();
end;

destructor TTtnProcessor.Destroy;
begin
  FCountryList.Free;
  inherited Destroy;
end;

end.
