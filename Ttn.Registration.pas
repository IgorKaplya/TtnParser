unit Ttn.Registration;

interface

uses
  Spring.Container,
  Spring.Container.Common,
  System.SysUtils;

procedure RegisterTypes(); overload;
procedure RegisterTypes(const AContainer: TContainer); overload;

type
  TTtnResolver = class
    class function Resolve<T>: T; overload;
    class function Resolve<T>(const AContainer: TContainer): T; overload;
  end;


implementation

uses
  Ttn.Interfaces,
  Ttn.Processor,
  Ttn.Parser,
  Ttn.List,
  Ttn.Obj,
  Ttn.Kod,
  Ttn.Kod.List,
  Ttn.Result,
  Ttn.ResultStorage;

procedure RegisterTypes();
begin
  RegisterTypes(GlobalContainer);
end;

procedure RegisterTypes(const AContainer: TContainer);
begin
  AContainer.RegisterType<TTtnParser>;
  AContainer.RegisterType<TTtnList>;
  AContainer.RegisterType<TTtnObj>;
  Acontainer.RegisterType<ITtnFactory<ITtnObj>>.AsFactory;
  AContainer.RegisterType<TTtnProcessor>;
  AContainer.RegisterType<TTtnKod>;
  Acontainer.RegisterType<ITtnFactory<ITtnKod>>.AsFactory;
  Acontainer.RegisterType<TTtnKodList>;
  AContainer.RegisterType<TTtnResult>;
  Acontainer.RegisterType<ITtnFactory<ITTnResult>>.AsFactory;
  AContainer.RegisterType<TTtnResultStorage>;

  AContainer.Build;
end;

class function TTtnResolver.Resolve<T>: T;
begin
  Result := Resolve<T>(GlobalContainer);
end;

class function TTtnResolver.Resolve<T>(const AContainer: TContainer): T;
begin
  Result := AContainer.Resolve<T>;
end;

end.
