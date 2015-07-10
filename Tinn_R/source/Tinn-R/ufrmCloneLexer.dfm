object frmCloneDialog: TfrmCloneDialog
  Left = 0
  Top = 0
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsDialog
  Caption = 'frmCloneDialog'
  ClientHeight = 129
  ClientWidth = 278
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 49
    Width = 73
    Height = 13
    Caption = 'Scintilla lexer id'
  end
  object OK: TButton
    Left = 114
    Top = 96
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
  end
  object Button2: TButton
    Left = 195
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object leLexerName: TLabeledEdit
    Left = 8
    Top = 24
    Width = 262
    Height = 21
    EditLabel.Width = 103
    EditLabel.Height = 13
    EditLabel.Caption = 'New highlighter name'
    TabOrder = 2
    Text = 'New Lexer'
  end
  object seLexerId: TSpinEdit
    Left = 8
    Top = 68
    Width = 262
    Height = 22
    MaxValue = 1000
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
end
