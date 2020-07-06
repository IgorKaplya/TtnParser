unit TtnParserErrors;

interface

uses
  System.SysUtils;

type
  ETtnParserExc = class(exception)
  public
    class procedure Test(const ATrue: Boolean; const AMsg: string); overload;
    class procedure Test(const ATrue: Boolean; const AMsgFmt: string; const AArguments: array of const); overload;
  end;

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
