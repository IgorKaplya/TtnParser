object frmCodBookHelp: TfrmCodBookHelp
  Left = 0
  Top = 0
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1082#1086#1076#1086#1074
  ClientHeight = 701
  ClientWidth = 983
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inline FrameCodBook1: TFrameCodBook
    Left = 0
    Top = 0
    Width = 983
    Height = 701
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -350
    ExplicitTop = -356
    inherited dbgKod: TDBGrid
      Width = 983
      Height = 672
      ReadOnly = True
      OnDblClick = FrameCodBook1dbgKodDblClick
    end
    inherited edtFilter: TButtonedEdit
      Width = 977
      ExplicitTop = 3
    end
  end
end
