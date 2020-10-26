unit Ttn.Constants;

interface

type
  TTtnParserConfiguration = (tpcNone, tpcMotor, tpcAutoStrong);

const
  C_Input_Minimal_Lines = 3;
  C_Input_First_Data_Line = C_Input_Minimal_Lines - 1;
  C_All_Parser_Configurations: array[TTtnParserConfiguration] of TTtnParserConfiguration = (tpcNone, tpcMotor, tpcAutoStrong);
  Config_String_Alias: array[TTtnParserConfiguration] of string = ('', '#MOTOR', '#ASTRONG');
  F_sign = 'sign';
  F_name = 'name';
  F_cost = 'cost';
  F_quant = 'quant';
  F_weight = 'weight';
  C_Input_FieldNames: array[0..4] of string = (F_sign, F_name, F_cost, F_quant, F_weight);
  C_Date_Tovar_Format = 'DD.MM.YYYY';
  C_Max_Files_History = 20;

implementation

end.
