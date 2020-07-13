unit Ttn.Registration;

interface

uses
  Spring.Container,
  Spring.Container.Common;

procedure RegisterTypes(); overload;
procedure RegisterTypes(const AContainer: TContainer); overload;

implementation

uses
  Ttn.Interfaces,
  Ttn.Parser,
  Ttn.List,
  Ttn.Obj;

procedure RegisterTypes();
begin
  RegisterTypes(GlobalContainer);
end;

procedure RegisterTypes(const AContainer: TContainer);
begin
  AContainer.RegisterType<TTtnParser>;
  AContainer.RegisterType<TTtnList>;
  AContainer.RegisterType<TTtnObj>;
  Acontainer.RegisterType<IFactory<ITtnObj>>.AsFactory;

  AContainer.Build;
end;

end.
