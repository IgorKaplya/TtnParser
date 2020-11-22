unit Ttn.Errors;

interface

uses
  System.SysUtils;

type
  ETtnExc = class(exception)
  public
    class procedure Test(const ATrue: Boolean; const AMsg: string); overload;
    class procedure Test(const ATrue: Boolean; const AMsgFmt: string; const AArguments: array of const); overload;
  end;

  ETtnParserEmptyInput = class(ETtnExc);
  ETtnParserWrongConfig = class(ETtnExc);
  ETtnParserWrongHeader = class(ETtnExc);
  ETtnParserWrongMotorLines = class(ETtnExc);
  ETtnParserColumnNotMapped = class(ETtnExc);
  ETtnParserColumnExceedInput = class(ETtnExc);
  ETtnWeightProcessing = class(ETtnExc);
  ETtnWeightProcessingWeightStandartZero = class(ETtnWeightProcessing);
  ETtnWeightProcessingCoefficientWeightZero = class(ETtnWeightProcessing);
  ETtnWeightProcessingWeightViolatesAcceptable = class(ETtnWeightProcessing);
  ETtnObjAsTxtNotEnoughFields = class(ETtnExc);
  ETtnObjAsTxtFieldIsEmpty = class(ETtnExc);
  ETtnDocAsTxtNotEnoughFields = class(ETtnExc);
  ETtnDocAsTxtFieldIsEmpty = class(ETtnExc);
  ETtnExcelAdapterFOpenError = class(ETtnExc);
  ETtnExcelAdapterFSaveError = class(ETtnExc);

procedure TestErr(bMustBeTrue: Boolean; AMsg: string); overload; deprecated;

implementation

procedure TestErr(bMustBeTrue: Boolean; AMsg: string);
begin
  ETtnExc.Test(bMustBeTrue, AMsg);
end;

class procedure ETtnExc.Test(const ATrue: Boolean; const AMsg: string);
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

class procedure ETtnExc.Test(const ATrue: Boolean; const AMsgFmt: string; const AArguments: array of const);
begin
  Test(ATrue, Format(AMsgFmt, AArguments));
end;

end.
