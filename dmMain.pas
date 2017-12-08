unit dmMain;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  Tdm = class(TDataModule)
    conMain: TADOConnection;
    tblKod: TADOTable;
    tblKodkod_key: TGuidField;
    tblKodkod_sign: TWideStringField;
    tblKodkod_txt: TWideStringField;
    tblKodkod_val: TWideStringField;
    tblStrPr: TADOTable;
    tblUni: TADOTable;
    tblStrPrstr_pr_key: TGuidField;
    tblStrPrstr_pr_txt: TWideStringField;
    tblStrPrstr_pr_val: TWideStringField;
    tblUniuni_key: TGuidField;
    tblUniuni_kod: TWideStringField;
    tblUniuni_etal_txt: TWideStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure tblUniAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

const
  T_KOD = 'T_KOD';
    F_Kod_Key = 'kod_key';
    F_Kod_sign = 'kod_sign';
    F_Kod_txt = 'kod_txt';
    F_Kod_val = 'kod_val';

  T_UNI = 'T_UNI';
    F_Uni_Key = 'uni_key';
    F_Uni_kod = 'uni_kod';
    F_Uni_etal_txt = 'uni_etal_txt';

  T_STR_PR = 'T_STR_PR';
    F_Str_pr_key = 'str_pr_key';
    F_Str_pr_txt = 'str_pr_txt';
    F_Str_pr_val = 'str_pr_val';

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure Tdm.DataModuleCreate(Sender: TObject);
{На случай если забуду закрыть объекты}
begin
conMain.Connected:=False;
end;

procedure Tdm.tblUniAfterInsert(DataSet: TDataSet);
{Генерируем ключевые поля, для редактирования таблиц. Генерация на стороне БД в виде счетчика не получилась -
таблица не узнает новый ключ пока не будут перевычитаны данные}
var
  g: TGUID;
begin
CreateGUID(g);
DataSet.Fields[0].AsString:=GUIDToString(g);
end;

end.
