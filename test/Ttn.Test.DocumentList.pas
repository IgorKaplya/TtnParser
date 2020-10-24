unit Ttn.Test.DocumentList;

interface
uses
  DUnitX.TestFramework, Ttn.Interfaces;

type

  [TestFixture]
  TTestTtnDocumentList = class(TObject)
  private
    FDocList: ITtnDocumentList;
    property DocList: ITtnDocumentList read FDocList;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure Test_LoadSave;
    [Test]
    procedure Load_BoundaryConditions;
  end;

implementation

uses
  Ttn.Registration, System.Classes, System.SysUtils;

procedure TTestTtnDocumentList.Setup;
begin
  FDocList := TTtnResolver.Resolve<ITtnDocumentList>
end;

procedure TTestTtnDocumentList.TearDown;
begin
  FDocList := nil;
end;

procedure TTestTtnDocumentList.Test_LoadSave;

  procedure AddDocs(const Count: Integer);
  var
    idx: Integer;
  begin
    for idx := 1 to Count do
    begin
      DocList.Add();
        DocList.Last.NumberObj := idx;
        DocList.Last.DocumentCode := 'DocCode_'+idx.ToString;
        DocList.Last.DocumentNumber := 'DocNum_'+idx.ToString;
        DocList.Last.DocumentDate := Now;
    end;
  end;

const
  doc_count = 5;
var
  sl: TStringList;
begin
  sl := TStringList.Create();
  try
    AddDocs(doc_count);
    DocList.Save(sl);
    DocList.Load(sl);
    Assert.AreEqual(
      doc_count,
      DocList.Count
    );
  finally
    sl.Free();
  end;
end;

procedure TTestTtnDocumentList.Load_BoundaryConditions;

  function ListLoadFileDelegate(const AFile: string): TTestLocalMethod;
  begin
    Result :=
      procedure()
      begin
        DocList.Load(AFile);
      end;
  end;

begin
  Assert.WillRaise(ListLoadFileDelegate('Abracadabra.csv'),EFOpenError);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnDocumentList);
end.
