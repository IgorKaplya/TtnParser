object frmTtnParserMain: TfrmTtnParserMain
  Left = 343
  Top = 0
  Caption = #1056#1072#1079#1073#1086#1088' '#1058#1058#1053
  ClientHeight = 555
  ClientWidth = 1581
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
  object pgParserMain: TPageControl
    Left = 0
    Top = 0
    Width = 1581
    Height = 555
    ActivePage = tsResults
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsResults: TTabSheet
      Caption = 'tsResults'
      ImageIndex = 2
      ExplicitLeft = 0
      ExplicitTop = 34
      object vstResultStorage: TVirtualStringTree
        Left = 0
        Top = 0
        Width = 441
        Height = 521
        Align = alLeft
        Header.AutoSizeIndex = 0
        Header.MainColumn = -1
        TabOrder = 0
        OnGetText = vstResultStorageGetText
        Columns = <>
      end
    end
    object tsWait: TTabSheet
      Caption = 'tsWait'
      ImageIndex = 1
      object pnlWait: TPanel
        Left = 0
        Top = 0
        Width = 1573
        Height = 521
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
    object tsParse: TTabSheet
      Caption = 'tsParse'
      object lblInpFile: TLabel
        Left = 0
        Top = 505
        Width = 1573
        Height = 16
        Align = alBottom
        Caption = #1042#1093#1086#1076#1085#1086#1081' '#1092#1072#1081#1083':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitTop = 539
        ExplicitWidth = 110
      end
      object tlbMain: TToolBar
        Left = 0
        Top = 0
        Width = 1573
        Height = 39
        AutoSize = True
        ButtonHeight = 39
        ButtonWidth = 70
        Caption = 'tlbMain'
        Images = imlMain
        ShowCaptions = True
        TabOrder = 0
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
      object vstTtn: TVirtualStringTree
        Left = 0
        Top = 39
        Width = 1573
        Height = 466
        Align = alClient
        Colors.FocusedSelectionColor = clSkyBlue
        Header.AutoSizeIndex = 0
        Header.Height = 20
        Header.Options = [hoColumnResize, hoDrag, hoShowSortGlyphs, hoVisible]
        HintMode = hmHint
        LineStyle = lsSolid
        PopupMenu = ppmTtn
        TabOrder = 1
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
  end
  object imlMain: TImageList
    ColorDepth = cd32Bit
    BlendColor = clWindow
    Left = 336
    Top = 48
    Bitmap = {
      494C0101050008006C0010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
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
    Left = 496
    Top = 144
    object mniAddKod: TMenuItem
      Action = actAddKod
    end
  end
end
