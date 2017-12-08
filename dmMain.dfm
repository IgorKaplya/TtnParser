object dm: Tdm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object conMain: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\DelphiXe\TtnPar' +
      'ser\_out\db\dbMain.accdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.ACE.OLEDB.12.0'
    Left = 16
    Top = 12
  end
  object tblKod: TADOTable
    Connection = conMain
    CursorType = ctStatic
    AfterInsert = tblUniAfterInsert
    IndexFieldNames = 'kod_txt'
    TableName = 'T_KOD'
    Left = 16
    Top = 64
    object tblKodkod_key: TGuidField
      FieldName = 'kod_key'
      FixedChar = True
      Size = 38
    end
    object tblKodkod_sign: TWideStringField
      FieldName = 'kod_sign'
      Size = 255
    end
    object tblKodkod_txt: TWideStringField
      FieldName = 'kod_txt'
      Size = 255
    end
    object tblKodkod_val: TWideStringField
      FieldName = 'kod_val'
      Size = 255
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
