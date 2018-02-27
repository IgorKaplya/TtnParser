unit ttnObj;

interface

uses
  Vcl.Graphics;

type

  TTtnObjErr = (
    errCommon, //Общая ошибка
    errWeight  //Ошибка цвета
  );

  // Рабочий объект программы. В него загружаем входные данные потом обрабатываем и сохраняем.
  TTtnObj = class
  private
    FCOST: Double;
    FError: TTTnObjErr;
    FErrorMsg: string;
    FKOD: string;
    FNAME: string;
    FNUMBER: Integer;
    FQUANTITY: Integer;
    FSIGN: string;
    FSTR_PR: string;
    FVAL: string;
    FWEIGHT1: Double;
    FWEIGHT2: Double;
    FWEIGHT3: Double;
  protected
  public
    property COST: Double read FCOST write FCOST;
    property Error: TTTnObjErr read FError write FError;
    property ErrorMsg: string read FErrorMsg write FErrorMsg;
    property KOD: string read FKOD write FKOD;
    property NAME: string read FNAME write FNAME;
    property NUMBER: Integer read FNUMBER write FNUMBER;
    property QUANTITY: Integer read FQUANTITY write FQUANTITY;
    property SIGN: string read FSIGN write FSIGN;
    property STR_PR: string read FSTR_PR write FSTR_PR;
    property VAL: string read FVAL write FVAL;
    property WEIGHT1: Double read FWEIGHT1 write FWEIGHT1;
    property WEIGHT2: Double read FWEIGHT2 write FWEIGHT2;
    property WEIGHT3: Double read FWEIGHT3 write FWEIGHT3;
  end;

const
  C_TTN_ERR_CLR : array[TTtnObjErr] of Integer = (clRed,clHighlight);

implementation

end.
