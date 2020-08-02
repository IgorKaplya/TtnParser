unit Ttn.Kod;

interface

uses
  Ttn.Interfaces;

type
  TTtnKod = class(TInterfacedObject, ITtnKod)
  private
    FKodKey: TGUID;
    FKodsign: string;
    FKodTxt: string;
    FKodVal: string;
    FKodWeightKoef: Double;
    FKodWeightStandart: Double;
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
  public
    property KodKey: TGUID read GetKodKey write SetKodKey;
    property Kodsign: string read GetKodsign write SetKodsign;
    property KodTxt: string read GetKodTxt write SetKodTxt;
    property KodVal: string read GetKodVal write SetKodVal;
    property KodWeightKoef: Double read GetKodWeightKoef write SetKodWeightKoef;
    property KodWeightStandart: Double read GetKodWeightStandart write SetKodWeightStandart;
  end;

implementation

function TTtnKod.GetKodKey: TGUID;
begin
  Result := FKodKey;
end;

procedure TTtnKod.SetKodKey(const Value: TGUID);
begin
  FKodKey := Value;
end;

function TTtnKod.GetKodsign: string;
begin
  Result := FKodsign;
end;

procedure TTtnKod.SetKodsign(const Value: string);
begin
  FKodsign := Value;
end;

function TTtnKod.GetKodTxt: string;
begin
  Result := FKodTxt;
end;

procedure TTtnKod.SetKodTxt(const Value: string);
begin
  FKodTxt := Value;
end;

function TTtnKod.GetKodVal: string;
begin
  Result := FKodVal;
end;

procedure TTtnKod.SetKodVal(const Value: string);
begin
  FKodVal := Value;
end;

function TTtnKod.GetKodWeightKoef: Double;
begin
  Result := FKodWeightKoef;
end;

procedure TTtnKod.SetKodWeightKoef(const Value: Double);
begin
  FKodWeightKoef := Value;
end;

function TTtnKod.GetKodWeightStandart: Double;
begin
  Result := FKodWeightStandart;
end;

procedure TTtnKod.SetKodWeightStandart(const Value: Double);
begin
  FKodWeightStandart := Value;
end;

end.
