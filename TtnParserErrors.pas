unit TtnParserErrors;

interface

uses
  SysUtils;

type
  ETtnParserExc = exception;

procedure TestErr(bMustBeTrue: Boolean; sErrorMessage: string);

implementation

procedure TestErr(bMustBeTrue: Boolean; sErrorMessage: string);
begin
if not bMustBeTrue then
  raise ETtnParserExc.Create(sErrorMessage);
end;

end.
