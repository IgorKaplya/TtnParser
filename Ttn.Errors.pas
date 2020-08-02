unit Ttn.Errors;

interface

uses
  System.SysUtils;

type
  ETtnParserExc = class(exception)
  public
    class procedure Test(const ATrue: Boolean; const AMsg: string); overload;
    class procedure Test(const ATrue: Boolean; const AMsgFmt: string; const AArguments: array of const); overload;
  end;

  ETtnParserEmptyInput = class(ETtnParserExc);
  ETtnParserWrongConfig = class(ETtnParserExc);
  ETtnParserWrongHeader = class(ETtnParserExc);
  ETtnParserWrongMotorLines = class(ETtnParserExc);
  ETtnParserColumnNotMapped = class(ETtnParserExc);
  ETtnParserColumnExceedInput = class(ETtnParserExc);
  ETtnWeightProcessing = class(ETtnParserExc);
  ETtnWeightProcessingWeightStandartZero = class(ETtnWeightProcessing);
  ETtnWeightProcessingCoefficientWeightZero = class(ETtnWeightProcessing);
  ETtnWeightProcessingWeightViolatesAcceptable = class(ETtnWeightProcessing);


procedure TestErr(bMustBeTrue: Boolean; AMsg: string); overload; deprecated;

implementation

procedure TestErr(bMustBeTrue: Boolean; AMsg: string);
begin
  ETtnParserExc.Test(bMustBeTrue, AMsg);
end;

class procedure ETtnParserExc.Test(const ATrue: Boolean; const AMsg: string);
var
  E: Exception;
begin
  if not ATrue then
  begin
    E := (NewInstance() as Exception);
    E.Message := AMsg;
    raise (E as E.ClassType);
  end;
end;

class procedure ETtnParserExc.Test(const ATrue: Boolean; const AMsgFmt: string; const AArguments: array of const);
begin
  Test(ATrue, Format(AMsgFmt, AArguments));
end;

end.
