unit Ttn.Excel;

interface

uses
  System.Classes, zexmlss, zexlsx;

type

  TExcelAdapterErr = procedure(Sender: TObject; AMsg: string) of object;

  TExcelAdapter = class(TObject)
  private
    FLastError: string;
    FOnError: TExcelAdapterErr;
  protected
    procedure DoError(AMsg: string);
  public
    procedure Save(AFile: string; const AData: TStrings);
    procedure Load(AFile: string; const AData: TStrings);
    property LastError: string read FLastError;
    property OnError: TExcelAdapterErr read FOnError write FOnError;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs, Winapi.ActiveX, System.Win.ComObj,
  System.Variants, System.IOUtils;

type
  EExcelAdapterException = Exception;

procedure TestErr(AMustBeTrue: Boolean; AMsg: string);
begin
if not AMustBeTrue then
  raise EExcelAdapterException.Create(AMsg);
end;

procedure TExcelAdapter.Save(AFile: string; const AData: TStrings);

  procedure TransferData(const AWorkSheet: TZSheet);
  var
    iCol,iRow: integer;
    sLine: string;
    lineData: TArray<string>;
    val: string;
    iVal: Integer;
    dVal: Double;
    cell: TZCell;
  begin
    AWorkSheet.RowCount := AData.Count;
    iRow := 0;
    for sLine in AData do
    begin
      iCol := 0;
      lineData := sLine.Split([';']);
      for val in lineData do
      begin
        if iRow = 0 then
          AWorkSheet.ColCount := Length(lineData);
        cell := AWorkSheet.Cell[iCol,iRow];
        cell.AsString := val;
        inc(iCol);
      end;
      inc(iRow);
    end;
  end;

var
  expandedFile: string;
  MyExcel: TZEXMLSS;
begin
  FLastError:='';
  MyExcel := TZEXMLSS.Create(nil);
  try
    expandedFile := ExpandFileName(AFile);
    MyExcel.Sheets.Count := 1;
    TransferData(MyExcel.Sheets[0]);
    SaveXmlssToXLSX(MyExcel, expandedFile,	[0], [], nil, 'UTF-8');
  except on e: exception do DoError('Appending excel. '+e.Message);
  end;
  MyExcel.Free();
end;

procedure TExcelAdapter.Load(AFile: string; const AData: TStrings);

  procedure ReadSheet(const ASheet: TZSheet);
  var
    iCol,iRow: integer;
    sLine: string;
  begin
    iRow:= 0;
    while (iRow < ASheet.RowCount) and (not ASheet.Cell[0,iRow].AsString.IsEmpty()) do
    begin
      iCol:= 0;
      while (iCol < ASheet.ColCount)  and (not ASheet.Cell[iCol,iRow].AsString.IsEmpty()) do
      begin
        if iCol = 0 then
          sLine := ASheet.Cell[iCol,iRow].AsString
        else
          sLine := sLine + ';'+ ASheet.Cell[iCol,iRow].AsString;
        inc(iCol);
      end;
      AData.Add(sLine);
      inc(iRow);
    end;
  end;

var
  MyExcel: TZEXMLSS;
begin
  FLastError:='';
  MyExcel := TZEXMLSS.Create(nil);
  try
    ReadXLSX(MyExcel, ExpandFileName(AFile));
    ReadSheet(MyExcel.Sheets[0]);
  except on e: exception do DoError('Loading excel. '+e.Message);
  end;
  MyExcel.Free();
end;

procedure TExcelAdapter.DoError(AMsg: string);
begin
  FLastError:=AMsg;
  if Assigned(FOnError) then
    begin
    FOnError(Self, AMsg);
    end;
end;

end.
