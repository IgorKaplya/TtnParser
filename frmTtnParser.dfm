object frmTtnParserMain: TfrmTtnParserMain
  Left = 343
  Top = 0
  Caption = #1056#1072#1079#1073#1086#1088' '#1058#1058#1053
  ClientHeight = 632
  ClientWidth = 1571
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 16
  object cpMain: TCardPanel
    Left = 0
    Top = 0
    Width = 1571
    Height = 632
    Align = alClient
    ActiveCard = crdMainResults
    BevelOuter = bvNone
    Caption = 'cpMain'
    TabOrder = 0
    object crdMainWait: TCard
      Left = 0
      Top = 0
      Width = 1571
      Height = 632
      Caption = 'crdMainWait'
      CardIndex = 0
      TabOrder = 0
      object pnlWait: TPanel
        Left = 0
        Top = 0
        Width = 1571
        Height = 632
        Align = alClient
        Caption = #1054#1073#1088#1072#1073#1086#1090#1082#1072'...'
        Font.Charset = RUSSIAN_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object crdMainResults: TCard
      Left = 0
      Top = 0
      Width = 1571
      Height = 632
      Caption = 'crdMainResults'
      CardIndex = 1
      TabOrder = 1
      object cpResultStorage: TCardPanel
        Left = 447
        Top = 0
        Width = 1124
        Height = 632
        Align = alClient
        ActiveCard = crdActiveResult
        BevelOuter = bvNone
        Caption = 'cpResultStorage'
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 441
        ExplicitWidth = 1130
        object crdActiveResultNone: TCard
          Left = 0
          Top = 0
          Width = 1124
          Height = 632
          Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1080#1083#1080' '#1076#1086#1073#1072#1074#1100#1090#1077' '#1088#1077#1079#1091#1083#1100#1090#1072#1090
          CardIndex = 0
          Color = clInactiveCaption
          Font.Charset = RUSSIAN_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          ShowCaption = True
          TabOrder = 0
          ExplicitWidth = 1130
        end
        object crdActiveResult: TCard
          Left = 0
          Top = 0
          Width = 1124
          Height = 632
          Caption = 'crdActiveResult'
          CardIndex = 1
          TabOrder = 1
          ExplicitLeft = 6
          ExplicitWidth = 1130
          object gpnlActiveResult: TGridPanel
            AlignWithMargins = True
            Left = 3
            Top = 3
            Width = 1118
            Height = 32
            Align = alTop
            BevelOuter = bvNone
            ColumnCollection = <
              item
                Value = 36.842105263157900000
              end
              item
                Value = 10.526315789473690000
              end
              item
                Value = 5.263157894736842000
              end
              item
                Value = 36.842105263157900000
              end
              item
                Value = 10.526315789473690000
              end>
            ControlCollection = <
              item
                Column = 3
                Control = edtDeliveryCountry
                Row = 0
              end
              item
                Column = 0
                Control = edtShipmentCountry
                Row = 0
              end
              item
                Column = 2
                Control = imgShipment
                Row = 0
              end
              item
                Column = 4
                Control = medtDeliveryRegion
                Row = 0
              end
              item
                Column = 1
                Control = medtShipmentRegion
                Row = 0
              end>
            ExpandStyle = emFixedSize
            Font.Charset = RUSSIAN_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            RowCollection = <
              item
                Value = 100.000000000000000000
              end>
            TabOrder = 0
            ExplicitWidth = 1124
            object edtDeliveryCountry: TEdit
              AlignWithMargins = True
              Left = 589
              Top = 0
              Width = 405
              Height = 32
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alClient
              Color = clInactiveCaption
              TabOrder = 2
              OnChange = edtDeliveryCountryChange
              ExplicitLeft = 594
              ExplicitTop = 1
              ExplicitWidth = 407
              ExplicitHeight = 30
            end
            object edtShipmentCountry: TEdit
              AlignWithMargins = True
              Left = 3
              Top = 0
              Width = 405
              Height = 32
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alClient
              Color = clInactiveCaption
              TabOrder = 0
              OnChange = edtShipmentCountryChange
              ExplicitTop = 3
              ExplicitWidth = 408
            end
            object imgShipment: TImage
              Left = 528
              Top = 0
              Width = 58
              Height = 32
              Align = alClient
              Center = True
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
                00200806000000737A7AF400000006624B474400FF00FF00FFA0BDA793000002
                104944415478DAED97CB2B45411CC77FDE112E226F52A4ACED6E64A150522429
                56E4512245EC3C769E2B3BC5868D1576C24659A1C80A7F015692475EF19DE677
                6A3ACE3D33E7DC2B167EF5A939E7CE6FE673CE9C79DC28FAE588FA17F80B0299
                5C4E07A921EA7D807B97766EC1835F81CF083CC80BA803077E04CAB91C707903
                39604DD3D61898F723604527680A512F05D46BDA1A07737E04BAB8DC0A1ABC36
                1009814B2EA791F31088F10D7810C806050EBF3F735F1F76015D8837B46228B0
                0DCE417C883AFBA0911FEA9BC0141872484A00498602E209B734F596419F2AB0
                CDE50A506AD091178145B0C365D1F6128805ED60C312B03E9C1250686B340394
                8521D00D56956B315567C123A80417EA10888E8A6D8D8E907EFA79118821F91D
                D4806310540566D9D06F980888C8076724B78091482DC55E0444748075702504
                827C338BE4985B31098AC214782265CA29114D726DF95487A085E48662451BC9
                C5291C016DFCF4371011816BF04ECECBAB89806BBE9BC0091800477C1DE04E46
                419C8180517E28013147AB492EC33D20176C824392DBF69A46C0385F15980613
                5CAE05A7FC14257C4F4CD77E926BB96828681318041760CF43FEB32A90C7AF27
                91E4A6344CDFF7F71B92A723FB8CB9033324CF8DE22D2E18E6EFB96DC74E1FE5
                2B48066FA40FA37C37812A92874CB58E18DF6683CE8DF37507925E92E7047164
                DFE5EB1B4301A3FC3FF1C7E45FE057E30B9C6889B4978DCBE40000000049454E
                44AE426082}
              ExplicitLeft = 529
              ExplicitWidth = 59
            end
            object medtDeliveryRegion: TMaskEdit
              AlignWithMargins = True
              Left = 1000
              Top = 0
              Width = 115
              Height = 32
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alClient
              Alignment = taCenter
              Color = clInactiveCaption
              EditMask = '###;1;0'
              MaxLength = 3
              TabOrder = 3
              Text = '   '
              OnChange = medtDeliveryRegionChange
              ExplicitLeft = 1007
              ExplicitTop = 1
              ExplicitWidth = 113
              ExplicitHeight = 30
            end
            object medtShipmentRegion: TMaskEdit
              AlignWithMargins = True
              Left = 414
              Top = 0
              Width = 111
              Height = 32
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alClient
              Alignment = taCenter
              Color = clInactiveCaption
              EditMask = '###;1;0'
              MaxLength = 3
              TabOrder = 1
              Text = '   '
              OnChange = medtShipmentRegionChange
              ExplicitLeft = 417
              ExplicitTop = 3
              ExplicitWidth = 112
            end
          end
          object pnlChooseDateAndGo: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 588
            Width = 1118
            Height = 41
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            ExplicitLeft = 6
            ExplicitWidth = 1124
            object btnProceed: TButton
              Left = 943
              Top = 0
              Width = 175
              Height = 41
              Align = alRight
              Caption = #1044#1072#1083#1077#1077
              ImageAlignment = iaRight
              ImageIndex = 0
              Images = imlMain32
              TabOrder = 1
              ExplicitLeft = 949
            end
            object cpNewResultDate: TCalendarPicker
              AlignWithMargins = True
              Left = 738
              Top = 0
              Width = 202
              Height = 41
              Margins.Top = 0
              Margins.Bottom = 0
              Align = alRight
              CalendarHeaderInfo.DaysOfWeekFont.Charset = DEFAULT_CHARSET
              CalendarHeaderInfo.DaysOfWeekFont.Color = clWindowText
              CalendarHeaderInfo.DaysOfWeekFont.Height = -13
              CalendarHeaderInfo.DaysOfWeekFont.Name = 'Segoe UI'
              CalendarHeaderInfo.DaysOfWeekFont.Style = []
              CalendarHeaderInfo.Font.Charset = DEFAULT_CHARSET
              CalendarHeaderInfo.Font.Color = clWindowText
              CalendarHeaderInfo.Font.Height = -20
              CalendarHeaderInfo.Font.Name = 'Segoe UI'
              CalendarHeaderInfo.Font.Style = []
              Color = clInactiveCaption
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Segoe UI'
              Font.Style = []
              OnChange = cpNewResultDateChange
              ParentFont = False
              TabOrder = 0
              TextHint = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1072#1090#1091
              ExplicitLeft = 741
              ExplicitTop = -2
              ExplicitHeight = 39
            end
          end
          object pnlActiveDocuments: TPanel
            AlignWithMargins = True
            Left = 3
            Top = 41
            Width = 1118
            Height = 541
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            ExplicitLeft = 472
            ExplicitTop = 296
            ExplicitWidth = 185
            ExplicitHeight = 41
            object vstActiveDocuments: TVirtualStringTree
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 1070
              Height = 535
              Align = alClient
              BorderStyle = bsNone
              Color = clInactiveCaption
              Colors.UnfocusedSelectionColor = clHighlight
              Colors.UnfocusedSelectionBorderColor = clHighlight
              DefaultNodeHeight = 24
              EditDelay = 333
              Header.AutoSizeIndex = 0
              Header.Background = clActiveCaption
              Header.Height = 26
              Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
              Header.Style = hsPlates
              Indent = 9
              PopupMenu = ppmActiveResultsDocuments
              TabOrder = 0
              TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
              TreeOptions.MiscOptions = [toEditable, toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
              TreeOptions.PaintOptions = [toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toThemeAware, toUseBlendedImages]
              TreeOptions.SelectionOptions = [toExtendedFocus, toRightClickSelect, toAlwaysSelectNode, toRestoreSelection]
              TreeOptions.EditOptions = toHorizontalEdit
              OnGetText = vstActiveDocumentsGetText
              OnNewText = vstActiveDocumentsNewText
              ExplicitTop = 0
              Columns = <
                item
                  Position = 0
                  Width = 310
                  WideText = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                end
                item
                  Position = 1
                  Width = 248
                  WideText = #1050#1086#1076' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                end
                item
                  Position = 2
                  Width = 139
                  WideText = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
                end>
            end
            object stpActiveDocumentTools: TStackPanel
              AlignWithMargins = True
              Left = 1079
              Top = 3
              Width = 36
              Height = 535
              Align = alRight
              BevelOuter = bvNone
              ControlCollection = <
                item
                  Control = btnAddResultDocument
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = btnDelActiveResultDocument
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end
                item
                  Control = btnvstActiveDocumentsEdit
                  HorizontalPositioning = sphpFill
                  VerticalPositioning = spvpTop
                end>
              TabOrder = 1
              object btnAddResultDocument: TButton
                Left = 0
                Top = 0
                Width = 36
                Height = 33
                Action = actActiveResultDocumentAdd
                Align = alTop
                ImageIndex = 1
                Images = imlMain32
                TabOrder = 0
              end
              object btnDelActiveResultDocument: TButton
                Left = 0
                Top = 35
                Width = 36
                Height = 33
                Action = actActiveResultDocumentDelete
                Align = alTop
                ImageIndex = 2
                Images = imlMain32
                TabOrder = 1
                TabStop = False
              end
              object btnvstActiveDocumentsEdit: TButton
                Left = 0
                Top = 70
                Width = 36
                Height = 33
                Action = actActiveResultDocumentEdit
                Align = alTop
                ImageIndex = 3
                Images = imlMain32
                TabOrder = 2
                TabStop = False
              end
            end
          end
        end
      end
      object vstResultStorage: TVirtualStringTree
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 441
        Height = 626
        Align = alLeft
        BorderStyle = bsNone
        Color = clMenu
        Colors.UnfocusedSelectionColor = clHighlight
        Colors.UnfocusedSelectionBorderColor = clHighlight
        Header.AutoSizeIndex = 0
        Header.MainColumn = -1
        Indent = 9
        TabOrder = 1
        TreeOptions.AutoOptions = [toAutoDropExpand, toAutoScrollOnExpand, toAutoTristateTracking, toAutoDeleteMovedNodes, toAutoChangeScale]
        TreeOptions.MiscOptions = [toFullRepaintOnResize, toGridExtensions, toInitOnSave, toToggleOnDblClick, toWheelPanning, toEditOnClick]
        TreeOptions.PaintOptions = [toHotTrack, toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toThemeAware, toUseBlendedImages]
        OnChange = vstResultStorageChange
        OnGetText = vstResultStorageGetText
        ExplicitLeft = -6
        ExplicitTop = 0
        ExplicitHeight = 632
        Columns = <>
      end
    end
    object crdMainParse: TCard
      Left = 0
      Top = 0
      Width = 1571
      Height = 632
      Caption = 'crdMainParse'
      CardIndex = 2
      TabOrder = 2
      object lblInpFile: TLabel
        Left = 0
        Top = 616
        Width = 1571
        Height = 16
        Align = alBottom
        Caption = #1042#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 110
      end
      object vstTtn: TVirtualStringTree
        Left = 0
        Top = 39
        Width = 1571
        Height = 577
        Align = alClient
        Colors.FocusedSelectionColor = clSkyBlue
        Header.AutoSizeIndex = 0
        Header.Height = 20
        Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
        HintMode = hmHint
        LineStyle = lsSolid
        PopupMenu = ppmTtn
        TabOrder = 0
        TreeOptions.PaintOptions = [toShowButtons, toShowDropmark, toShowHorzGridLines, toShowRoot, toShowTreeLines, toShowVertGridLines, toThemeAware, toUseBlendedImages, toFullVertGridLines]
        TreeOptions.SelectionOptions = [toFullRowSelect, toRightClickSelect]
        OnDrawText = vstTtnDrawText
        OnGetText = vstTtnGetText
        OnGetHint = vstTtnGetHint
        Columns = <
          item
            Position = 0
            Width = 71
            WideText = 'NUMBER'
          end
          item
            Position = 1
            Width = 79
            WideText = 'KOD'
          end
          item
            Position = 2
            Width = 464
            WideText = 'NAME'
          end
          item
            Position = 3
            Width = 64
            WideText = 'WEIGHT1'
          end
          item
            Position = 4
            Width = 64
            WideText = 'WEIGHT2'
          end
          item
            Position = 5
            Width = 64
            WideText = 'WEIGHT3'
          end
          item
            Position = 6
            Width = 80
            WideText = 'COST'
          end
          item
            Position = 7
            Width = 70
            WideText = 'VAL'
          end
          item
            Position = 8
            Width = 61
            WideText = 'STR_PR'
          end
          item
            Position = 9
            Width = 72
            WideText = 'QUANTITY'
          end
          item
            Position = 10
            Width = 103
            WideText = 'STRAN_OTPR'
          end
          item
            Position = 11
            Width = 82
            WideText = 'ATD_OTPR'
          end
          item
            Position = 12
            Width = 99
            WideText = 'STRAN_NAZN'
          end
          item
            Position = 13
            Width = 79
            WideText = 'ATD_NAZN'
          end
          item
            Position = 14
            Width = 101
            WideText = 'DATE_TOVAR'
          end>
      end
      object tlbMain: TToolBar
        Left = 0
        Top = 0
        Width = 1571
        Height = 39
        AutoSize = True
        ButtonHeight = 39
        ButtonWidth = 70
        Caption = 'tlbMain'
        Images = imlMain
        ShowCaptions = True
        TabOrder = 1
        object btnInp: TToolButton
          Left = 0
          Top = 0
          Action = FileOpenInp
        end
        object btnSettings: TToolButton
          Left = 70
          Top = 0
          Action = actSettings
        end
        object btnRefresh: TToolButton
          Left = 140
          Top = 0
          Action = actRefresh
        end
        object btnFileSaveAs: TToolButton
          Left = 210
          Top = 0
          Action = FileSaveAs
        end
      end
    end
  end
  object alMain: TActionList
    Images = imlMain
    Left = 384
    Top = 48
    object FileOpenInp: TFileOpen
      Category = 'File'
      Caption = #1054#1090#1082#1088#1099#1090#1100
      Dialog.Filter = 'CSV|*.csv'
      Hint = #1054#1090#1082#1088#1099#1090#1100' '#1074#1093#1086#1076#1085#1099#1077' '#1076#1072#1085#1085#1099#1077
      ImageIndex = 0
      ShortCut = 16463
      OnAccept = FileOpenInpAccept
    end
    object actSettings: TAction
      Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      Hint = #1053#1072#1089#1090#1088#1086#1081#1082#1080
      ImageIndex = 1
      OnExecute = actSettingsExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100
      ImageIndex = 2
      OnExecute = actRefreshExecute
      OnUpdate = actRefreshUpdate
    end
    object FileSaveAs: TFileSaveAs
      Category = 'File'
      Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
      Dialog.DefaultExt = '.csv'
      Dialog.Filter = 'CSV|*.csv'
      Dialog.Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 3
      OnAccept = FileSaveAsAccept
    end
    object actAddKod: TAction
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1076
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1076' '#1074' '#1073#1072#1079#1091' '#1076#1083#1103' '#1088#1072#1089#1087#1086#1079#1085#1072#1074#1072#1085#1080#1103
      ImageIndex = 4
      OnExecute = actAddKodExecute
      OnUpdate = actAddKodUpdate
    end
    object actActiveResultDocumentAdd: TAction
      Hint = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actActiveResultDocumentAddExecute
    end
    object actActiveResultDocumentDelete: TAction
      Hint = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
      OnExecute = actActiveResultDocumentDeleteExecute
      OnUpdate = actActiveResultDocumentDeleteUpdate
    end
    object actActiveResultDocumentEdit: TAction
      Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' (F2)'
      OnExecute = actActiveResultDocumentEditExecute
      OnUpdate = actActiveResultDocumentDeleteUpdate
    end
  end
  object imlMain: TImageList
    ColorDepth = cd32Bit
    BlendColor = clWindow
    Left = 336
    Top = 48
    Bitmap = {
      494C0101050008008C0010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000100202028F010101DF010101FF010101FF010101FF010101DF0202
      028F000000100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000101
      0150050505EF050505FF050505FF050505FF050505FF050505FF050505FF0505
      05FF050505EF0101015000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000030303500808
      08FF080808FF080808FF080808FF080808FF080808FF080808FF080808FF0808
      08FF080808FF080808FF03030350000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000010101100C0C0CEF0C0C
      0CFF0C0C0CFF0C0C0CFF0C0C0CFF0202023000000000030303400C0C0CFF0C0C
      0CFF0C0C0CFF0C0C0CFF0C0C0CEF010101100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000808088F0F0F0FFF0F0F
      0FFF0F0F0FFF0F0F0FFF0F0F0FFF0000000000000000000000000F0F0FFF0F0F
      0FFF0F0F0FFF0F0F0FFF0F0F0FFF0808088F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000101010DF121212FF1212
      12FF121212FF121212FF121212FF000000000000000000000000121212FF1212
      12FF121212FF121212FF121212FF101010DF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000161616FF161616FF1616
      16FF030303300000000000000000000000000000000000000000000000000000
      000005050540161616FF161616FF161616FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000003030320191919FF191919FF1919
      19FF000000000000000000000000000000000000000000000000000000000000
      000000000000191919FF191919FF191919FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001D1D1DFF1D1D1DFF1D1D
      1DFF060606300000000000000000000000000000000000000000000000000000
      0000060606301D1D1DFF1D1D1DFF1D1D1DFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001B1B1BDF202020FF2020
      20FF202020FF202020FF202020FF000000000000000000000000202020FF2020
      20FF202020FF202020FF202020FF1B1B1BDF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001414148F232323FF2323
      23FF232323FF232323FF232323FF000000000000000000000000232323FF2323
      23FF232323FF232323FF232323FF1414148F0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000002020210242424EF2727
      27FF272727FF272727FF272727FF080808300000000008080830272727FF2727
      27FF272727FF272727FF242424EF020202100000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000C0C0C502A2A
      2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A2AFF2A2A
      2AFF2A2A2AFF2A2A2AFF0C0C0C50000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000E0E
      0E502A2A2AEF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E
      2EFF2A2A2AEF0E0E0E5000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000030303101A1A1A8F2A2A2ADF313131FF313131FF313131FF2A2A2ADF1A1A
      1A8F030303100000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0010000000BF010101FF01010180000000000000000001010180010101FF0000
      00BF000000100000000000000000000000000000000000000030000000000000
      000001010140000000AF010101FF010101FF010101FF010101FF000000AF0101
      014000000000000000000000000000000000010101FF010101FF010101FF0101
      01FF010101FF010101FF010101FF010101FF010101FF010101FF010101FF0101
      01FF010101FF010101FF010101FF010101FF00000000000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFDEDEDEFF000000000000000000000000000000000101
      0140040404FF040404FF040404FF0202024002020240040404FF040404FF0404
      04FF0101014000000000000000000000000000000000040404FF0202028F0202
      028F040404FF040404FF040404FF040404FF040404FF040404FF040404FF0404
      04FF0202028F000000000000000000000000040404FF040404FF040404FF0404
      04FF040404FF040404FF040404FF040404FF040404FF040404FF040404FF0404
      04FF040404FF040404FF040404FF040404FF00000000111111FF040404FF0404
      04FF040404FF040404FF040404FF040404FF040404FF040404FF040404FF0404
      04FF040404FF040404FF9F9F9FFF000000000000000000000000000000000000
      0000080808FF080808FF080808FF080808FF080808FF080808FF080808FF0808
      08FF0000000000000000000000000000000000000000080808FF080808FF0808
      08FF080808FF060606DF03030360020202400202024003030360060606DF0808
      08FF080808FF0505058F0000000000000000080808FF080808FF000000300000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000030080808FF080808FF00000000535353FF070707FF0707
      07FF070707FF070707FF070707FF070707FF070707FF070707FF070707FF0707
      07FF070707FF070707FF636363FF000000000101011003030340000000000202
      02300B0B0BFF0B0B0BFF0B0B0BFF080808BF080808BF0B0B0BFF0B0B0BFF0B0B
      0BFF02020230000000000303034001010110000000000B0B0BFF0B0B0BFF0B0B
      0BFF0B0B0BFF0606068F00000000000000000000000000000000010101100606
      069F0B0B0BFF0B0B0BFF03030340000000000B0B0BFF0B0B0BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000B0B0BFF0B0B0BFF00000000929292FF0B0B0BFF0B0B
      0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B0BFF0B0B
      0BFF0B0B0BFF0B0B0BFF282828FF000000000B0B0BBF0E0E0EFF0E0E0EFF0E0E
      0EFF0E0E0EFF0707078F010101100000000000000000010101100707078F0E0E
      0EFF0E0E0EFF0E0E0EFF0E0E0EFF0B0B0BBF000000000E0E0EFF0E0E0EFF0E0E
      0EFF0E0E0EFF0E0E0EFF0A0A0AAF000000000000000000000000000000000101
      01100D0D0DDF0E0E0EFF0A0A0AAF000000000E0E0EFF0E0E0EFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000E0E0EFF0E0E0EFF00000000E0E0E0FF0E0E0EFF0E0E
      0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E0EFF0E0E
      0EFF0E0E0EFF0E0E0EFF0E0E0EFFD1D1D1FF111111FF111111FF111111FF1111
      11FF0A0A0A8F0000000001010110070707700707076001010110000000000A0A
      0A8F111111FF111111FF111111FF111111FF00000000111111FF111111FF1111
      11FF0F0F0FDF0909098002020220000000000000000000000000000000000000
      000007070760111111FF111111FF00000000111111FF111111FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000111111FF111111FF00000000000000002D2D2DFF1111
      11FF111111FF111111FF111111FF111111FF111111FF111111FF111111FF1111
      11FF111111FF111111FF111111FF959595FF0B0B0B80141414FF141414FF1313
      13EF0101011001010110131313EF141414FF141414FF131313EF010101100101
      0110131313EF141414FF141414FF0B0B0B8000000000131313EF0D0D0D9F0505
      0540000000000000000000000000000000000000000000000000000000000000
      000003030320131313EF101010CF00000000141414FF141414FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000141414FF141414FFE1E1E1FF000000006A6A6AFF1515
      15FF151515FF151515FF151515FF151515FF151515FF151515FF151515FF1515
      15FF151515FF151515FF151515FF5C5C5CFF0000000006060640181818FF1212
      12BF000000000A0A0A70181818FF0303033003030330181818FF0A0A0A700000
      0000121212BF181818FF06060640000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000181818FF181818FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000181818FF181818FF989898FF00000000A8A8A8FF1818
      18FF181818FF181818FF181818FF181818FF181818FF181818FF181818FF1818
      18FF181818FF181818FF181818FF252525FF00000000070707401B1B1BFF1414
      14BF000000000E0E0E801B1B1BFF05050530050505301B1B1BFF0E0E0E800000
      0000141414BF1B1B1BFF07070740000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001B1B1BFF1B1B1BFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001B1B1BFF1B1B1BFF626262FF00000000E2E2E2FF1C1C
      1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C
      1CFF1C1C1CFF1C1C1CFF1C1C1CFF1C1C1CFF101010801E1E1EFF1E1E1EFF1B1B
      1BDF00000000040404201C1C1CEF1E1E1EFF1E1E1EFF1C1C1CEF040404200000
      00001B1B1BDF1E1E1EFF1E1E1EFF1010108000000000191919CF1C1C1CEF0404
      0420000000000000000000000000000000000000000000000000000000000000
      0000080808401212129F1C1C1CEF000000001E1E1EFF1E1E1EFF000000001E1E
      1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E1EFF1E1E
      1EFF00000000000000001E1E1EFF1E1E1EFF2B2B2BFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000212121FF212121FF212121FF2121
      21FF0E0E0E700000000004040420111111801111118004040420000000000E0E
      0E70212121FF212121FF212121FF212121FF00000000212121FF212121FF0D0D
      0D60000000000000000000000000000000000000000004040420111111801D1D
      1DDF212121FF212121FF212121FF00000000212121FF212121FF000000002121
      21FF212121FF212121FF212121FF212121FF0202021002020210212121FF2121
      21FF0000000000000000212121FF212121FF222222FFB9B9B9FF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001B1B1BBF242424FF242424FF2424
      24FF242424FF1111117000000000000000000000000000000000111111702424
      24FF242424FF242424FF242424FF1B1B1BBF00000000181818AF242424FF2020
      20DF0202021000000000000000000000000000000000181818AF242424FF2424
      24FF242424FF242424FF242424FF00000000242424FF242424FF000000002424
      24FF242424FF242424FF242424FF242424FF0000000000000000242424FF2424
      24FF0000000000000000242424FF242424FF262626FF262626FF262626FF2626
      26FF262626FF262626FF262626FF262626FF262626FF262626FF262626FF2626
      26FF262626FF5A5A5AFF0000000000000000020202100A0A0A40000000000606
      0630272727FF272727FF222222DF1616168F1616168F222222DF272727FF2727
      27FF06060630000000000A0A0A4002020210000000000A0A0A40272727FF2727
      27FF1A1A1A9F03030310000000000000000000000000000000001515158F2727
      27FF272727FF272727FF272727FF00000000272727FF272727FF000000002727
      27FF272727FF272727FF272727FF272727FF0000000000000000272727FF2727
      27FF0000000000000000272727FF272727FF353535FF292929FF292929FF2929
      29FF292929FF292929FF292929FF292929FF292929FF292929FF292929FF2929
      29FF292929FF6B6B6BFF00000000000000000000000000000000000000000000
      00002B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B
      2BFF0000000000000000000000000000000000000000000000001818188F2B2B
      2BFF2B2B2BFF252525DF101010600B0B0B400B0B0B4010101060252525DF2B2B
      2BFF2B2B2BFF2B2B2BFF2B2B2BFF000000002B2B2BFF2B2B2BFF080808302B2B
      2BFF2B2B2BFF2B2B2BFF2B2B2BFF2B2B2BFF00000000030303102B2B2BFF2B2B
      2BFF00000000161616802B2B2BFF2B2B2BFF959595FF2D2D2DFF2D2D2DFF2D2D
      2DFF2D2D2DFF2D2D2DFF525252FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000C0C
      0C402E2E2EFF2E2E2EFF2E2E2EFF0B0B0B400B0B0B402E2E2EFF2E2E2EFF2E2E
      2EFF0C0C0C400000000000000000000000000000000000000000000000001919
      198F2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E
      2EFF1919198F1919198F2E2E2EFF000000002E2E2EFF2E2E2EFF2E2E2EFF2E2E
      2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E2EFF2E2E
      2EFF2E2E2EFF2E2E2EFF2E2E2EFF2A2A2AEF00000000545454FF303030FF3030
      30FF303030FF3A3A3AFFD7D7D7FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000303
      0310242424BF313131FF19191980000000000000000019191980313131FF2424
      24BF030303100000000000000000000000000000000000000000000000000000
      00000C0C0C40222222AF313131FF313131FF313131FF313131FF222222AF0C0C
      0C4000000000000000000909093000000000313131FF313131FF313131FF3131
      31FF313131FF313131FF313131FF313131FF313131FF313131FF313131FF3131
      31FF313131FF313131FF292929CF09090930424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00F007000000000000E003000000000000
      C001000000000000808000000000000081C000000000000081C0000000000000
      87F00000000000000FF800000000000087F000000000000081C0000000000000
      81C00000000000008080000000000000C001000000000000E003000000000000
      F007000000000000FFFF0000000000000000E187B00F00000000E00780070000
      0000F00F800300000000200483C100000000018081E100000000042081F10000
      000000008FF1000000008811FFFF000000008811FFFF0000000008108FF10000
      000004208F810000000003C0878100000000200483C100000000F00FC0010000
      0000E007E00100000000E187F00D000000000000000000000000000000000000
      000000000000}
  end
  object ppmTtn: TPopupMenu
    Left = 384
    Top = 120
    object mniAddKod: TMenuItem
      Action = actAddKod
    end
  end
  object imlMain32: TImageList
    Height = 32
    Width = 32
    Left = 352
    Top = 208
    Bitmap = {
      494C010104000800200020002000FFFFFFFFFF00FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D2D2D200707070002929290007070700070707002929290070707000D3D3
      D300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006A6A
      6A00020202000000000000000000000000000000000000000000000000000202
      02006C6C6C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006E6E6E00000000000000000014141400313131007171
      7100BDBDBD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000444444000000
      00000505050067676700CACACA000000000000000000C9C9C900666666000404
      0400000000004646460000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000007E7E7E00101010006969
      690000000000000000008B8B8B00000000000000000000000000000000000000
      0000000000001818180095959500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000065656500000000001A1A
      1A00CECECE00000000000000000000000000000000000000000000000000CCCC
      CC00191919000000000071717100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FFD9D9D900000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000B7B7B70000000000000000001414
      14000000000000000000CDCDCD0076767600717171005D5D5D00393939000202
      020000000000000000000000000022222200CBCBCB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000767676001414140000000000000000000000
      000000000000000000000000000000000000000000000000000007070700D0D0
      D000000000000000000000000000000000000000000000000000000000000000
      0000CECECE000606060003030300D5D5D5000000000000000000000000000000
      0000000000000000000000000000000000007777770014141400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000015151500787878000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000000F0F0F004141410075757500A8A8A800DCDCDC00000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000058585800252525009B9B
      9B00000000000000000000000000000000000000000000000000000000000000
      0000949494001A1A1A00000000000000000009090900A9A9A900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000076767600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000707070000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006D6D6D0000000000707070000000000000000000000000000000
      0000000000000000000000000000767676000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007979790000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF15151500000000000000000000000000000000000000000010101000A7A7
      A700000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      000000000000909090008C8C8C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000079797900000000000000000000000000A9A9A9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001717170000000000C2C2C20000000000000000000000
      0000000000000000000000000000000000002828280000000000C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C600000000002A2A2A000000000000000000000000000000
      00000000000000000000000000001717170000000000C2C2C200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C0C0C000000000001818180000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF48484800000000006C6C6C0079797900444444000B0B0B00000000000202
      0200A7A7A700000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000B8B8B8000101010000000000919191000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ACACAC000A0A0A000000000009090900CBCB
      CB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000A0A0A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C0C0C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF7B7B7B00000000007A7A7A00000000FF000000FF47474700000000000000
      000003030300A7A7A700000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      00004A4A4A000000000005050500C1C1C1000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AAAAAA0000000000000000002424
      2400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000B0B0B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000C0C0C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FFACACAC000000000049494900000000FF8484840000000000131313005D5D
      5D000000000006060600B4B4B400000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      000000000000888888008F8F8F00000000000000000000000000000000000000
      0000000000000000000087878700828282000000000000000000000000000000
      0000000000000000000000000000000000000000000075757500000000000000
      0000929292000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002828280000000000C9C9C9000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C7C7C700000000002B2B2B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000000F0F0F004B4B4B000000000000000000B4B4B4000000
      00FF747474000000000003030300A7A7A700000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005B5B5B000000000005050500D1D1D10000000000000000000000
      0000000000000000000000000000000000000000000000000000181818000000
      0000151515000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006D6D6D0000000000707070000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006D6D6D0000000000717171000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF1515150000000000000000000D0D0D00A6A6A600000000FF0000
      00FF000000FF747474000000000003030300A6A6A600000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000BABABA00A5A5
      A500000000000000000000000000000000000000000000000000000000000000
      0000454545000000000000000000000000003636360000000000000000000000
      0000000000000000000000000000000000000000000000000000929292000000
      000000000000B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D2D2D2000101010007070700D1D1
      D100000000000000000000000000000000000000000000000000000000000000
      0000CECECE000606060002020200D4D4D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FFA3A3A300010101000000000074747400000000FF000000FF0000
      00FF000000FF000000FF656565000000000006060600B3B3B300000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF00000000000000004B4B4B000000
      0000171717000000000000000000000000000000000000000000000000003232
      320000000000000000000505050000000000000000008D8D8D00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006B6B6B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600000000001A1A
      1A00CECECE00000000000000000000000000000000000000000000000000CCCC
      CC00191919000000000068686800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FFA3A3A30002020200000000007E7E7E00000000FF0000
      00FF000000FF000000FF000000FF656565000000000006060600B3B3B3000000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000151515000000
      00004E4E4E000000000000000000000000000000000000000000272727000000
      0000000000002C2C2C00CECECE0013131300000000000C0C0C00000000000000
      0000000000000000000000000000000000000000000000000000000000003535
      3500000000002C2C2C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000444444000000
      00000505050067676700CACACA000000000000000000C9C9C900666666000404
      0400000000004545450000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFA2A2A20002020200000000007E7E7E000000
      00FF000000FF000000FF000000FF000000FF656565000000000006060600B3B3
      B300000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000808080006666
      6600A3A3A3000000000000000000000000000000000016161600000000000000
      00004A4A4A000000000000000000ADADAD000000000000000000434343000000
      0000000000000000000000000000000000000000000000000000000000005C5C
      5C00000000001212120000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006A6A
      6A00020202000000000000000000000000000000000000000000000000000202
      02006B6B6B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFA2A2A20002020200000000007E7E
      7E00000000FF000000FF000000FF000000FF000000FF65656500000000000404
      0400ACACAC00000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000079797900000000005252
      5200000000000000000000000000000000004A4A4A000000000000000000A2A2
      A200000000000000000000000000000000000000000000000000000000007777
      7700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D2D2D200707070002A2A2A0000000000000000002B2B2B0070707000D3D3
      D300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFA2A2A200020202000000
      00007E7E7E00000000FF000000FF000000FF000000FF000000FF656565000000
      000004040400ACACAC00000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AEAEAE000000
      0000000000000000000000000000000000000000000010101000000000001010
      1000000000000000000000000000000000000000000000000000000000007777
      7700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FFA1A1A1000202
      0200000000007E7E7E00000000FF000000FF000000FF000000FF000000FF6565
      65000000000004040400ACACAC00000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000808080006666
      6600A3A3A3000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000097979700000000000000
      0000585858000000000000000000000000000000000000000000000000005D5D
      5D00000000001111110000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFA1A1
      A10002020200000000007E7E7E00000000FF000000FF000000FF000000FF0000
      00FF656565000000000004040400ACACAC00000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000131313000000
      00004E4E4E000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000003E3E3E000000
      000000000000B4B4B40000000000000000000000000000000000000000003535
      3500000000002C2C2C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FFA0A0A00002020200000000007E7E7E00000000FF000000FF000000FF0000
      00FF000000FF656565000000000004040400ACACAC00000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF00000000000000004A4A4A000000
      0000171717000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D5D5D5000606
      0600000000001C1C1C0000000000000000000000000000000000000000000202
      0200000000006666660000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FFA0A0A00002020200000000007E7E7E00000000FF000000FF0000
      00FF000000FF000000FF656565000000000004040400ACACAC00000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000B9B9B900A6A6
      A600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008787
      8700000000000000000068686800000000000000000000000000929292000000
      000000000000B8B8B80000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FFA8A8A800030303000000000075757500000000FF0000
      00FF000000FF000000FF000000FF141414000000000002020200A4A4A4000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000363636000000000000000000D4D4D4000000000000000000191919000000
      0000151515000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFA8A8A8000303030000000000757575000000
      00FF000000FF000000FF2828280000000000121212000000000005050500CFCF
      CF00000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000008888880090909000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CBCBCB001B1B1B00ABABAB00000000000000000076767600000000000000
      0000939393000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FFA7A7A70003030300000000007575
      7500000000FF333333000000000024242400000000FF68686800000000004141
      4100000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000494949000000000006060600C2C2C2000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AAAAAA0000000000000000002525
      2500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FFA6A6A600020202000000
      000013131300000000002A2A2A00000000FF000000FF000000FF040404000808
      0800000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000B6B6B6000101010000000000939393000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000ACACAC00090909000000000009090900CCCC
      CC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FFA5A5A5000202
      02000000000011111100000000FF000000FF000000FF000000FF000000000F0F
      0F00000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000008E8E8E008E8E8E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000079797900000000000000000000000000A9A9A9000000
      0000000000000000000000000000000000000000000000000000000000001818
      180000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001919
      190000000000BFBFBF00BCBCBC00000000001A1A1A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003131310000000000000000000000000000000000313131000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FFA4A4
      A400020202000000000069696900000000FF000000FF3E3E3E00000000005757
      5700000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000055555500262626009494
      9400000000000000000000000000000000000000000000000000000000000000
      0000949494001A1A1A00000000000000000009090900A8A8A800000000000000
      0000000000000000000000000000000000000000000000000000000000007575
      7500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007979790000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FFA3A3A3000404040000000000050505000101010000000000131313000000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000B5B5B50000000000000000001818
      18000000000000000000CBCBCB0076767600717171005D5D5D00393939000202
      020000000000000000000000000022222200CBCBCB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000767676001E1E1E0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001E1E1E00797979000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002F2F2F00000000000000000000000000000000002F2F2F000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FFCBCBCB003A3A3A00040404000A0A0A0050505000000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      000000000000000000000000000000000000000000007D7D7D000F0F0F006D6D
      6D00000000000000000089898900000000000000000000000000000000000000
      0000000000001818180095959500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000006D6D6D0000000000000000000A0A0A00232323006464
      6400B8B8B8000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFF00FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFE007FFFFFFFFFFFFFFFFFFFC07FFFFFFC183FFFFFFFFFFFFFFFF
      FF8C01FFFFFF87E1FFFFFFFFF7FFFFFFFF0C007FFE000E70FF0000FFF03FFFFF
      FF8FF03FFC001E78FE00007FF00FFFFFF9FFFC1FFC7F1E78FE3FFC7FF007FFFF
      F0FFFE0FFCFF300CFE7FFE7FF183FFFFF0FFFF0FFCFF300CFE7FFE7FF101FFFF
      F9FCFF87FCFF1E78FE7FFE7FF810FFFFFFF87FC7FCE01E78FE66667FF8387FFF
      CFF07FC3FCE00E70FE66667FF87C3FFFC7E03FE3FCFF87E1FE66667FFC3E1FFF
      C7C03FE3FCFFC183FE66667FFE1F0FFFC7861FE3FCE00007FE66667FFF0F87FF
      FF8F0FE3FCE0100FFE66667FFF87C3FFFFDF8FE3FCFFFE7FFE66667FFFC3E1FF
      C7FF87E3FCFFFE7FFE66667FFFE1F0FFC7FFC3E3FCE01E7FFE66667FFFF0F87F
      C7FFC3E3FCE01E7FFE66667FFFF87C3FCFFFE1C3FCFFFE7FFE66667FFFFC3E1F
      FFFFF0C7FFFFFE7FFE7FFE7FFFFE1C0FF9FFF187E000067FFE7FFE7FFFFF088F
      F0FFFF0FE000067FFE7FFE7FFFFF81CFF0FFFE0FE7FFE67FFE7FFE7FFFFFC3CF
      F9FFFC1FE3FFE07FFC03C03FFFFFE18FFF8FF03FE000007FFC00003FFFFFF01F
      FF0C007FF00000FFFFF81FFFFFFFF83FFF8C01FFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFC07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
  end
  object ppmActiveResultsDocuments: TPopupMenu
    Left = 626
    Top = 137
    object mniActiveResultDocumentAdd: TMenuItem
      Action = actActiveResultDocumentAdd
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
    end
    object mniActiveResultDocumentDelete: TMenuItem
      Action = actActiveResultDocumentDelete
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090
    end
    object mniActiveResultDocumentEdit: TMenuItem
      Action = actActiveResultDocumentEdit
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1076#1086#1082#1091#1084#1077#1085#1090' (F2)'
    end
  end
end
