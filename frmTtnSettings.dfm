object frmSett: TfrmSett
  Left = 686
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
  ClientHeight = 743
  ClientWidth = 1164
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTools: TPanel
    Left = 0
    Top = 702
    Width = 1164
    Height = 41
    Align = alBottom
    TabOrder = 0
    ExplicitWidth = 563
    object btnClose: TBitBtn
      Left = 13
      Top = 8
      Width = 129
      Height = 25
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 0
    end
  end
  object pgSetting: TPageControl
    Left = 0
    Top = 0
    Width = 1164
    Height = 702
    ActivePage = tsUni
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 563
    object tsKod: TTabSheet
      Caption = #1050#1086#1076#1099
      ExplicitWidth = 281
      ExplicitHeight = 165
      object dbgKod: TDBGrid
        Left = 0
        Top = 0
        Width = 1156
        Height = 674
        Align = alClient
        DataSource = dsKod
        PopupMenu = ppmEdt
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'kod_sign'
            Title.Caption = #1055#1088#1080#1079#1085#1072#1082
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'kod_txt'
            Title.Caption = #1058#1077#1082#1089#1090' '#1087#1086#1080#1089#1082#1072
            Width = 750
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'kod_val'
            Title.Caption = #1050#1086#1076
            Width = 78
            Visible = True
          end>
      end
    end
    object tsStrPr: TTabSheet
      Caption = #1057#1090#1088#1072#1085#1099' '#1087#1088#1086#1080#1089#1093#1086#1078#1076#1077#1085#1080#1103
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object dbgStrPr: TDBGrid
        Left = 0
        Top = 0
        Width = 1156
        Height = 674
        Align = alClient
        DataSource = dsStrPr
        PopupMenu = ppmEdt
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'str_pr_txt'
            Title.Caption = #1058#1077#1082#1089#1090' '#1087#1086#1080#1089#1082#1072
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'str_pr_val'
            Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077
            Width = 100
            Visible = True
          end>
      end
    end
    object tsUni: TTabSheet
      Caption = #1059#1085#1080#1092#1080#1082#1072#1094#1080#1103
      ImageIndex = 2
      ExplicitWidth = 281
      ExplicitHeight = 165
      object dbgUni: TDBGrid
        Left = 0
        Top = 0
        Width = 1156
        Height = 674
        Align = alClient
        DataSource = dsUni
        PopupMenu = ppmEdt
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'uni_kod'
            Title.Caption = #1050#1086#1076
            Width = 71
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'uni_etal_txt'
            Title.Caption = #1058#1077#1082#1089#1090' '#1076#1083#1103' '#1101#1090#1072#1083#1086#1085#1072
            Width = 1046
            Visible = True
          end>
      end
    end
  end
  object dsKod: TDataSource
    DataSet = dm.tblKod
    Left = 168
    Top = 696
  end
  object dsStrPr: TDataSource
    DataSet = dm.tblStrPr
    Left = 208
    Top = 696
  end
  object dsUni: TDataSource
    DataSet = dm.tblUni
    Left = 248
    Top = 696
  end
  object ppmEdt: TPopupMenu
    Left = 1088
    Top = 40
    object mniIns: TMenuItem
      Action = actIns
    end
    object mniDub: TMenuItem
      Action = actDub
    end
    object mniN1: TMenuItem
      Caption = '-'
    end
    object mniDel: TMenuItem
      Action = actDel
    end
  end
  object alSettings: TActionList
    Left = 1088
    Top = 88
    object actIns: TAction
      Caption = #1042#1089#1090#1072#1074#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnExecute = actInsExecute
      OnUpdate = actInsUpdate
    end
    object actDel: TAction
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnExecute = actDelExecute
      OnUpdate = actInsUpdate
    end
    object actDub: TAction
      Caption = #1044#1091#1073#1083#1080#1088#1086#1074#1072#1090#1100' '#1089#1090#1088#1086#1082#1091
      OnExecute = actDubExecute
      OnUpdate = actInsUpdate
    end
  end
end
