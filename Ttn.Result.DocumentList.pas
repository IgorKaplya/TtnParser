unit Ttn.Result.DocumentList;

interface

uses
  Ttn.Interfaces, Ttn.Enum.EnumerableList;

type
  TTtnDocumentList = class(TTtnEnumerableList<ITtnDocument>, ITtnDocumentList)
  end;

implementation

end.
