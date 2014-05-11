object frmConfigurePrint: TfrmConfigurePrint
  Left = 380
  Top = 186
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  ClientHeight = 141
  ClientWidth = 476
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 5
    Top = 7
    Width = 143
    Height = 97
    Caption = ' Include '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object chkFileName: TCheckBox
      Left = 8
      Top = 24
      Width = 70
      Height = 17
      Action = actFileName
      TabOrder = 0
    end
    object chkPageNumber: TCheckBox
      Left = 8
      Top = 48
      Width = 86
      Height = 17
      Action = actPageNumber
      TabOrder = 1
    end
    object chkLineNumber: TCheckBox
      Left = 8
      Top = 72
      Width = 82
      Height = 17
      Action = actLineNumber
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 152
    Top = 7
    Width = 152
    Height = 97
    Caption = ' Options '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
    object chkWordWrap: TCheckBox
      Left = 8
      Top = 24
      Width = 84
      Height = 17
      Action = actLineWrap
      TabOrder = 0
    end
    object chkColors: TCheckBox
      Left = 8
      Top = 72
      Width = 117
      Height = 17
      Action = actImpressionColored
      TabOrder = 2
    end
    object chkSyntaxColor: TCheckBox
      Left = 8
      Top = 48
      Width = 108
      Height = 17
      Action = actSyntaxColor
      TabOrder = 1
    end
  end
  object bbtPrintConfig: TBitBtn
    Left = 67
    Top = 109
    Width = 101
    Height = 25
    Action = actPrintConfig
    Caption = 'Printer settings'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00636363005D5D
      5D005858580081818100797979006E6E6E006161610052525200434343003636
      36002B2B2B0023232300232323002424240023232300232323006A6A6A00A7A7
      A700B5B5B5008181810089898900898989008989890089898900898989008989
      890089898900808080002C2C2C00B5B5B5009B9B9B002323230070707000B5B5
      B500B5B5B500959595008181810081818100797979006E6E6E00616161005252
      520043434300424242006E6E6E00B5B5B500B5B5B5002525250075757500BBBB
      BB00BBBBBB008D8D8D00D4D4D400B9B9B900B9B9B900B9B9B900B9B9B900B9B9
      B900B9B9B900D3D3D30083838300BBBBBB00BBBBBB002A2A2A007A7A7A00D7D7
      D700D7D7D70097979700D8D8D800BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00D7D7D7008E8E8E00D7D7D700D7D7D7003F3F3F007E7E7E00F9F9
      F900F9F9F900ABABAB00DFDFDF00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00CBCBCB00DFDFDF00A3A3A300F9F9F900F9F9F9006161610081818100FCFC
      FC00FCFCFC00CBCBCB00F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200C6C6C600FCFCFC00FCFCFC007070700081818100D2D2
      D200E8E8E8007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D00E8E8E800C4C4C40056565600818181009A9A
      9A00CCCCCC00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDFDF00DFDF
      DF00DFDFDF00DFDFDF00DFDFDF00C3C3C3007474740047474700FF00FF008181
      810081818100989898009B9B9B009B9B9B009A9A9A0099999900979797009696
      960096969600959595007F7F7F005959590053535300FF00FF00FF00FF00FF00
      FF0081818100818181009C9C9C00D7D7D700C3C3C300C3C3C300C3C3C300C3C3
      C300D7D7D700969696006666660060606000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF009C9C9C009C9C9C009B9B9B009B9B9B009A9A9A009999
      99009797970096969600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    TabOrder = 0
  end
  object bbtPrint: TBitBtn
    Left = 269
    Top = 109
    Width = 101
    Height = 25
    Action = actPrint
    Caption = 'Print'
    Glyph.Data = {
      36040000424D3604000000000000360000002800000010000000100000000100
      2000000000000004000000000000000000000000000000000000FF00FF00FF00
      FF00FF00FF00C8956100CA986500CA976500CA976500CA976500CA976400C997
      6400C9976400CA986500C8946100FF00FF00FF00FF00FF00FF00636363005D5D
      5D0058585800C7956100F9F7F600F9F1EC00F9F1EB00F8F0E900F7EDE600F4EA
      E100F2E8DE00FAF8F600C79461002424240023232300232323006A6A6A00A7A7
      A700B5B5B50081818100AFACAA00C5C0BD00C5C0BD00C5C0BD00C5C0BD00C5C0
      BD00C5C0BD00ADAAA8002C2C2C00B5B5B5009B9B9B002323230070707000B5B5
      B500B5B5B500959595008181810081818100797979006E6E6E00616161005252
      520043434300424242006E6E6E00B5B5B500B5B5B5002525250075757500BBBB
      BB00BBBBBB008D8D8D00D4D4D400B9B9B900B9B9B900B9B9B900B9B9B900B9B9
      B900B9B9B900D3D3D30083838300BBBBBB00BBBBBB002A2A2A007A7A7A00D7D7
      D700D7D7D70097979700D8D8D800BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBF
      BF00BFBFBF00D7D7D7008E8E8E00D7D7D700D7D7D7003F3F3F007E7E7E00F9F9
      F900F9F9F900ABABAB00DFDFDF00CBCBCB00CBCBCB00CBCBCB00CBCBCB00CBCB
      CB00CBCBCB00DFDFDF00A3A3A300F9F9F900F9F9F9006161610081818100FCFC
      FC00FCFCFC00CBCBCB00F2F2F200F2F2F200F2F2F200F2F2F200F2F2F200F2F2
      F200F2F2F200F2F2F200C6C6C600FCFCFC00FCFCFC007070700081818100D2D2
      D200E8E8E8007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D7D007D7D
      7D007D7D7D007D7D7D007D7D7D00E8E8E800C4C4C40056565600818181009A9A
      9A00CCCCCC00C78B4E00F9F4ED00FEE8D800FEE8D700FDE5D300FCE4D100FAE0
      C700F9DDC300FAF4ED00C7854A00C3C3C3007474740047474700FF00FF008181
      810081818100C5894C00F9F4EF00FEE7D700FDE7D500FCE6D200FBE1CC00F8DC
      C200F6DABD00FAF4EF00C48348005959590053535300FF00FF00FF00FF00FF00
      FF0081818100C5894B00F9F4F000FCE6D300FDE7D300FBE3CD00FAE0C800F5D6
      BB00F3D4B500F8F4F000C382460060606000FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00C6894B00F9F5F100FCE3CF00FCE4CF00FAE1CA00F9DDC400F4E9
      DF00F7F2EC00F5EFE900C27E4500FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00C6894C00F9F5F100FCE3CD00FBE3CD00F9E0C800F8DCC200FDFB
      F800FCE6CD00E2B68400BF794200FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00C4864900F7F2EC00F8F4EE00F8F3ED00F8F3ED00F8F2EC00F2E6
      D700E2B27D00DA916300B46B3E00FF00FF00FF00FF00FF00FF00FF00FF00FF00
      FF00FF00FF00C17D4400C88B4D00C88C4F00C88C4F00C88D4F00C98C4F00C589
      4C00C4763B00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    TabOrder = 2
  end
  object bbtClose: TBitBtn
    Left = 370
    Top = 109
    Width = 101
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = bbtCloseClick
  end
  object GroupBox3: TGroupBox
    Left = 308
    Top = 7
    Width = 163
    Height = 97
    Caption = ' Range '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    object Label1: TLabel
      Left = 9
      Top = 74
      Width = 28
      Height = 13
      Caption = 'Start:'
    end
    object Label2: TLabel
      Left = 90
      Top = 74
      Width = 22
      Height = 13
      Caption = 'End:'
    end
    object rbAll: TRadioButton
      Left = 7
      Top = 24
      Width = 34
      Height = 17
      Caption = 'All'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object rbSelection: TRadioButton
      Left = 8
      Top = 48
      Width = 66
      Height = 17
      Caption = 'Selection'
      TabOrder = 1
    end
    object edStartPage: TEdit
      Left = 39
      Top = 71
      Width = 41
      Height = 19
      TabOrder = 2
      OnKeyPress = edStartPageKeyPress
    end
    object edEndPage: TEdit
      Left = 114
      Top = 71
      Width = 41
      Height = 19
      TabOrder = 3
      OnKeyPress = edEndPageKeyPress
    end
  end
  object bbtPreview: TBitBtn
    Left = 168
    Top = 109
    Width = 101
    Height = 25
    Caption = 'Preview'
    TabOrder = 1
    OnClick = bbtPreviewClick
  end
  object acConfigurePrint: TActionList
    Images = frmTinnMain.imlTinnR
    Left = 6
    Top = 106
    object actFileName: TAction
      Caption = 'File name'
      OnExecute = actFileNameExecute
    end
    object actPageNumber: TAction
      Caption = 'Page number'
      OnExecute = actPageNumberExecute
    end
    object actLineNumber: TAction
      Caption = 'Line number'
      Hint = 'Line number'
      ImageIndex = 100
      OnExecute = actLineNumberExecute
    end
    object actLineWrap: TAction
      Caption = 'Line wrap'
      Hint = 'Line wrap'
      ImageIndex = 101
      OnExecute = actLineWrapExecute
    end
    object actSyntaxColor: TAction
      Caption = 'Syntax color'
      Hint = 'Syntax color'
      ImageIndex = 62
      OnExecute = actSyntaxColorExecute
    end
    object actImpressionColored: TAction
      Caption = 'Impression colored'
      Hint = 'Impression colored'
      ImageIndex = 165
      OnExecute = actImpressionColoredExecute
    end
    object actPrintConfig: TAction
      Caption = 'Printer settings'
      Hint = 'Printer settings'
      ImageIndex = 152
      OnExecute = actPrintConfigExecute
    end
    object actPrint: TAction
      Caption = 'Print'
      Hint = 'Print'
      ImageIndex = 153
      OnExecute = actPrintExecute
    end
  end
end
