object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object conMain: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=D:\DelphiXe\stuff\T' +
      'tnParser\_out\db\dbMain.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 12
  end
  object tblKod: TADOTable
    Connection = conMain
    AfterInsert = tblUniAfterInsert
    IndexFieldNames = 'kod_txt'
    TableName = 'T_KOD'
    Left = 16
    Top = 64
    object tblKodkod_key: TGuidField
      DisplayLabel = #1050#1083#1102#1095
      FieldName = 'kod_key'
      Visible = False
      FixedChar = True
      Size = 38
    end
    object tblKodkod_sign: TWideStringField
      DisplayLabel = #1055#1088#1080#1079#1085#1072#1082
      DisplayWidth = 25
      FieldName = 'kod_sign'
      Size = 255
    end
    object tblKodkod_txt: TWideStringField
      DisplayLabel = #1058#1077#1082#1089#1090
      DisplayWidth = 75
      FieldName = 'kod_txt'
      Size = 255
    end
    object tblKodkod_val: TWideStringField
      DisplayLabel = #1050#1086#1076' '#1058#1053#1042#1069#1044
      DisplayWidth = 25
      FieldName = 'kod_val'
      Size = 255
    end
    object tblKodkod_weight_standart: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #1069#1090#1072#1083#1086#1085#1085#1099#1081' '#1074#1077#1089
      FieldName = 'kod_weight_standart'
      OnSetText = tblKodkod_weight_standartSetText
    end
    object tblKodkod_weight_koef: TFloatField
      DefaultExpression = '0'
      DisplayLabel = #1069#1090#1072#1083#1086#1085' '#1074#1077#1089' '#1082#1086#1101#1092#1092
      FieldName = 'kod_weight_koef'
      OnSetText = tblKodkod_weight_standartSetText
    end
  end
  object tblStrPr: TADOTable
    Connection = conMain
    CursorType = ctStatic
    AfterInsert = tblUniAfterInsert
    IndexFieldNames = 'str_pr_txt'
    TableName = 'T_STR_PR'
    Left = 64
    Top = 64
    object tblStrPrstr_pr_key: TGuidField
      FieldName = 'str_pr_key'
      FixedChar = True
      Size = 38
    end
    object tblStrPrstr_pr_txt: TWideStringField
      FieldName = 'str_pr_txt'
      Size = 255
    end
    object tblStrPrstr_pr_val: TWideStringField
      FieldName = 'str_pr_val'
      Size = 255
    end
  end
  object tblUni: TADOTable
    Connection = conMain
    AfterInsert = tblUniAfterInsert
    IndexFieldNames = 'uni_kod'
    TableName = 'T_UNI'
    Left = 104
    Top = 64
    object tblUniuni_key: TGuidField
      FieldName = 'uni_key'
      FixedChar = True
      Size = 38
    end
    object tblUniuni_kod: TWideStringField
      FieldName = 'uni_kod'
      Size = 255
    end
    object tblUniuni_etal_txt: TWideStringField
      FieldName = 'uni_etal_txt'
      Size = 255
    end
  end
end
