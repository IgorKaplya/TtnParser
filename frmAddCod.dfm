object frmAddCode: TfrmAddCode
  Left = 0
  Top = 0
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1076
  ClientHeight = 151
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object lblWeight: TLabel
    Left = 360
    Top = 81
    Width = 12
    Height = 19
    Caption = '[]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtCodText: TButtonedEdit
    Left = 8
    Top = 8
    Width = 516
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TextHint = #1058#1077#1082#1089#1090' '#1089#1086#1087#1086#1089#1090#1072#1074#1083#1077#1085#1080#1103' '#1082#1086#1076#1072
    OnChange = edtCodTextChange
  end
  object edtCod: TButtonedEdit
    Left = 8
    Top = 43
    Width = 161
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TextHint = #1050#1086#1076' '#1058#1053#1042#1069#1044
    OnChange = edtCodChange
  end
  object edtCodWeight: TButtonedEdit
    Left = 8
    Top = 78
    Width = 161
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TextHint = #1069#1090#1072#1083#1086#1085#1085#1099#1081' '#1074#1077#1089
    OnChange = edtCodWeightChange
  end
  object edtCodKoeff: TButtonedEdit
    Left = 184
    Top = 78
    Width = 161
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    TextHint = #1050#1086#1101#1092#1092#1080#1094#1080#1077#1085#1090
    OnChange = edtCodKoeffChange
  end
  object btnOk: TBitBtn
    Left = 8
    Top = 111
    Width = 90
    Height = 33
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
  end
  object btnCancel: TBitBtn
    Left = 112
    Top = 111
    Width = 139
    Height = 33
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
  end
  object edtCodSign: TButtonedEdit
    Left = 530
    Top = 8
    Width = 89
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    TextHint = #1055#1088#1080#1079#1085#1072#1082
    OnChange = edtCodSignChange
  end
  object btnCodHelp: TBitBtn
    Left = 175
    Top = 42
    Width = 29
    Height = 28
    Caption = ' '
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btnCodHelpClick
  end
end
