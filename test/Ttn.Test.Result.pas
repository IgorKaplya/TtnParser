unit Ttn.Test.Result;

interface
uses
  DUnitX.TestFramework, Ttn.Interfaces;

type

  [TestFixture]
  TTestTtnResult = class(TObject) 
  private
    FTtnResult: ITTnResult;
  public
    [Setup]
    procedure Setup;
    [TearDown]
    procedure TearDown;
    [Test]
    procedure Test_Append;
    property TtnResult: ITTnResult read FTtnResult;
  end;

implementation

uses
  Ttn.Registration, System.SysUtils;

procedure TTestTtnResult.Setup;
begin
  FTtnResult := TTtnResolver.Resolve<ITTnResult>;
end;

procedure TTestTtnResult.TearDown;
begin
  FTtnResult := nil;
end;

procedure TTestTtnResult.Test_Append;

  function DoUpdate(const AListTtn: ITtnList; const ADocuments: TArray<ITtnDocumentDescription>; const ACount: Integer): TTestLocalMethod;
  begin
    Result :=
    (
      procedure()
      var
          i: Integer;
      begin
        for i := 1 to ACount do
          TtnResult.Append(AListTtn, ADocuments);
      end
    );
  end;

const
  append_count = 2;
var
  listTtn: ITtnList;
  listDocs: TArray<ITtnDocumentDescription>;
  ttnExpected, ttnActual: ITtnObj;
  doc: ITtnDocument;
  i: Integer;
  j: Integer;
  numOffsetExpected: Integer;
begin
  TtnResult.DestinationCountry := 'VillaRibo';
  TtnResult.DestinationCountryRegion := 'RIB';
  TtnResult.ShipmentCountry := 'VillaBadgo';
  TtnResult.ShipmentCountryRegion := 'BAD';
  TtnResult.DateTtn := now;

  listDocs := [TTtnResolver.Resolve<ITtnDocument>];
  listDocs[0] := TTtnResolver.Resolve<ITtnDocument>;
    listDocs[0].DocumentCode := 'DocCode';
    listDocs[0].DocumentNumber := 'DocNum';
    listDocs[0].DocumentDate := Now;

  listTtn := TTtnResolver.Resolve<ITtnList>;
  listTtn.Add;
    listTtn.Last.NUMBER := 1;
    listTtn.Last.KOD := '123';
    listTtn.Last.STR_PR := 'Zombie-land';
    listTtn.Last.NAME := 'Name';
    listTtn.Last.QUANTITY := 3;
    listTtn.Last.SIGN := 'O';
    listTtn.Last.VAL := 'Tugr';
    listTtn.Last.WEIGHT1 := 1.14;
    listTtn.Last.WEIGHT2 := 2.14;
    listTtn.Last.WEIGHT3 := 3.14;
    listTtn.Last.COST := 10.0;

  Assert.WillNotRaise(DoUpdate(listTtn, listDocs, append_count));
  Assert.AreEqual(append_count * listTtn.Count, TtnResult.TtnList.Count);
  Assert.AreEqual(append_count * listTtn.Count * length(listDocs), TtnResult.Documents.Count);

  for i := 0 to append_count-1 do
    begin
      if i>0 then
        numOffsetExpected := TtnResult.TtnList[i*listTtn.Count-1].NUMBER
      else
        numOffsetExpected := 0;
      for j := 0 to listTtn.Count-1 do
        begin
          ttnActual := TtnResult.TtnList[i*listTtn.Count+j];
          ttnExpected := listTtn[j];
          //
          Assert.AreEqual(ttnExpected.NUMBER + numOffsetExpected, ttnActual.NUMBER);
          //
          Assert.AreEqual(ttnExpected.COST, ttnActual.COST);
          Assert.AreEqual(ttnExpected.KOD, ttnActual.KOD);
          Assert.AreEqual(ttnExpected.STR_PR, ttnActual.STR_PR);
          Assert.AreEqual(ttnExpected.NAME, ttnActual.NAME);
          Assert.AreEqual(ttnExpected.QUANTITY, ttnActual.QUANTITY);
          Assert.AreEqual(ttnExpected.VAL, ttnActual.VAL);
          Assert.AreEqual(ttnExpected.WEIGHT1, ttnActual.WEIGHT1);
          Assert.AreEqual(ttnExpected.WEIGHT2, ttnActual.WEIGHT2);
          Assert.AreEqual(ttnExpected.WEIGHT3, ttnActual.WEIGHT3);
          //
          Assert.AreEqual(TtnResult.DestinationCountry, ttnActual.DestinationCountry);
          Assert.AreEqual(TtnResult.DestinationCountryRegion, ttnActual.DestinationCountryRegion);
          Assert.AreEqual(TtnResult.ShipmentCountry, ttnActual.DeliveryCountry);
          Assert.AreEqual(TtnResult.ShipmentCountryRegion, ttnActual.DeliveryCountryRegion);
          Assert.AreEqual(TtnResult.DateTtn, ttnActual.DateTtn);
        end;
    end;

  for doc in TtnResult.Documents do
  begin
    Assert.AreEqual(listDocs[0].DocumentCode, doc.DocumentCode, 'Results were not updated.');
    Assert.AreEqual(listDocs[0].DocumentNumber, doc.DocumentNumber, 'Results were not updated.');
    Assert.AreEqual(listDocs[0].DocumentDate, doc.DocumentDate, 'Results were not updated.');
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnResult);
end.
