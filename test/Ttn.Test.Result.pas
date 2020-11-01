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
    [Test]
    procedure Test_Save();
  end;

implementation

uses
  Ttn.Registration, System.SysUtils, Ttn.Constants, System.Types, System.IOUtils,
  System.Variants;

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

  procedure AddTtnObj(const listTtn: ITtnList; AData: variant);
  begin
    listTtn.Add;
      listTtn.Last.NUMBER := AData[0];
      listTtn.Last.KOD := AData[1];
      listTtn.Last.STR_PR := AData[2];
      listTtn.Last.NAME := AData[3];
      listTtn.Last.QUANTITY := AData[4];
      listTtn.Last.SIGN := AData[5];
      listTtn.Last.VAL := AData[6];
      listTtn.Last.WEIGHT1 := AData[7];
      listTtn.Last.WEIGHT2 := AData[8];
      listTtn.Last.WEIGHT3 := AData[9];
      listTtn.Last.COST := AData[10];
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
    AddTtnObj(listTtn, VarArrayOf([1,'123','Zombie-land','Name',3,'O','Tugr',1.14,2.14,3.14,10.0]));
    AddTtnObj(listTtn, VarArrayOf([1,'321','Zombie-land','Nom',4,'P','Byn',0.14,1.14,2.14,1.0]));
    AddTtnObj(listTtn, VarArrayOf([2,'010','Zombie-land','Èìÿ',5,'Q','USD',0.1,1.1,2.2,1.00]));


  Assert.WillNotRaise(DoUpdate(listTtn, listDocs, append_count));
  Assert.AreEqual(append_count * listTtn.Count, TtnResult.TtnList.Count);
  Assert.AreEqual(append_count * listTtn.CountObjWithUniqueNumbers * length(listDocs), TtnResult.Documents.Count);

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

procedure TTestTtnResult.Test_Save;
const
  test_save_result_folder = '_testdata\result\save';
var
  i: Integer;
  historyFiles: TStringDynArray;
begin
  TtnResult.Folder := test_save_result_folder;
  for i:=0 to C_Max_Files_History+1 do
  begin
    TtnResult.Save();
    Sleep(1);
  end;
  historyFiles := TDirectory.GetFiles(TtnResult.HistoryFolder);
  Assert.IsTrue(length(historyFiles) <= C_Max_Files_History);
end;

initialization
  TDUnitX.RegisterTestFixture(TTestTtnResult);
end.
