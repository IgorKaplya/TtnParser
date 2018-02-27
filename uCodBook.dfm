object FrameCodBook: TFrameCodBook
  Left = 0
  Top = 0
  Width = 985
  Height = 655
  TabOrder = 0
  object dbgKod: TDBGrid
    Left = 0
    Top = 29
    Width = 985
    Height = 626
    Align = alClient
    DataSource = dsKod
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
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kod_txt'
        Width = 528
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kod_val'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kod_weight_standart'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'kod_weight_koef'
        Width = 99
        Visible = True
      end>
  end
  object edtFilter: TButtonedEdit
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 979
    Height = 23
    Align = alTop
    BevelInner = bvLowered
    BevelKind = bkFlat
    BevelOuter = bvRaised
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    LeftButton.ImageIndex = 0
    LeftButton.PressedImageIndex = 1
    ParentFont = False
    RightButton.ImageIndex = 0
    RightButton.PressedImageIndex = 1
    RightButton.Visible = True
    TabOrder = 1
    TextHint = #1060#1080#1083#1100#1090#1088' '#1087#1086' '#1090#1077#1082#1089#1090#1086#1074#1086#1084#1091' '#1086#1087#1080#1089#1072#1085#1080#1102
    OnChange = edtFilterChange
    OnRightButtonClick = edtFilterRightButtonClick
  end
  object dsKod: TDataSource
    DataSet = dm.tblKod
    Left = 88
    Top = 99
  end
end
