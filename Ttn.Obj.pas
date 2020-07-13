unit Ttn.Obj;

interface

uses
  Ttn.Interfaces;

type

  TTtnObj = class(TInterfacedObject, ITtnObj)
  private
    FCOST: Double;
    FError: Integer;
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
  public
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
  end;

implementation

function TTtnObj.GetCOST: Double;
begin
  Result := FCOST;
end;

function TTtnObj.GetError: Integer;
begin
  Result := FError;
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

procedure TTtnObj.SetError(const Value: Integer);
begin
  FError := Value;
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
  FWEIGHT1 := Value;
end;

procedure TTtnObj.SetWEIGHT3(const Value: Double);
begin
  FWEIGHT3 := Value;
end;

end.

