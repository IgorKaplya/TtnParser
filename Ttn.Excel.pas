unit Ttn.Excel;

interface

uses
  System.Classes, zexmlss, zexlsx, Ttn.Interfaces, System.SysUtils;

type
  TTtnExcelAdapter = class(TInterfacedObject, ITtnExcelAdapter)
  public
    procedure Save(AFile: string; const AData: TStrings);
    procedure Load(AFile: string; const AData: TStrings);
  end;

implementation

uses
  Vcl.Dialogs, Winapi.ActiveX, System.Win.ComObj,
  System.Variants, System.IOUtils, Ttn.Errors;

procedure TTtnExcelAdapter.Save(AFile: string; const AData: TStrings);

  procedure TransferData(const AWorkSheet: TZSheet);
  var
    iCol,iRow: integer;
    sLine: string;
    lineData: TStringList;
    val: string;
    iVal: Integer;
    dVal: Double;
    cell: TZCell;
  begin
    lineData := TStringList.Create('"',';',[soStrictDelimiter]);
    try
      AWorkSheet.RowCount := AData.Count;
      iRow := 0;
      for sLine in AData do
      begin
        iCol := 0;
        lineData.DelimitedText := sLine;
        for val in lineData do
        begin
          if AWorkSheet.ColCount < lineData.Count then
            AWorkSheet.ColCount := lineData.Count;
          cell := AWorkSheet.Cell[iCol,iRow];
          cell.AsString := val;
          inc(iCol);
        end;
        inc(iRow);
      end;
    finally
      lineData.Free();
    end;
  end;

var
  expandedFile: string;
  MyExcel: TZEXMLSS;
begin
  MyExcel := TZEXMLSS.Create(nil);
  try
    expandedFile := ExpandFileName(AFile);
    MyExcel.Sheets.Count := 1;
    TransferData(MyExcel.Sheets[0]);
    SaveXmlssToXLSX(MyExcel, expandedFile,	[0], [], nil, 'UTF-8');
  finally
    MyExcel.Free();
  end;
end;

procedure TTtnExcelAdapter.Load(AFile: string; const AData: TStrings);

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
  expandedFile: string;
  MyExcel: TZEXMLSS;
begin
  MyExcel := TZEXMLSS.Create(nil);
  try
    expandedFile := ExpandFileName(AFile);
    ETtnExcelAdapterFOpenError.Test(FileExists(expandedFile), '���� �� ������: "%s"', [expandedFile]);
    ReadXLSX(MyExcel, expandedFile);
    if MyExcel.Sheets.Count>0 then
      ReadSheet(MyExcel.Sheets[0]);
  finally
    MyExcel.Free();
  end;
end;

end.
