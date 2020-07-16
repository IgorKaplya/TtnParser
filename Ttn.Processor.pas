unit Ttn.Processor;

interface

uses
  Ttn.Interfaces;

type
  TTtnProcessor = class(TInterfacedObject, ITtnProcessor, ITtnProcessorTestable)
  private
    FCurrency: string;
    procedure Process(const AList: ITtnList);
    function GetCurrency: string;
    procedure SetCurrency(const Value: string);
    procedure ProcessCurrency(const AObj: ITtnObj);
  public
    procedure ProcessWeight(const AObj: ITtnObj);
    property Currency: string read GetCurrency write SetCurrency;
  end;

implementation

procedure TTtnProcessor.Process(const AList: ITtnList);
var
  i: Integer;
begin
  for i := 0 to AList.Count-1 do
  begin

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

end.
