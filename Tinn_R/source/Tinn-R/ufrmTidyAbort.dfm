object frmTidyAbort: TfrmTidyAbort
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Updating source code'
  ClientHeight = 52
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 250
    Height = 46
    Align = alLeft
    Caption = 
      'Tinn-R is tidying your source code. If this process takes too lo' +
      'ng you can abort it.'
    WordWrap = True
    ExplicitLeft = 8
    ExplicitTop = 8
    ExplicitHeight = 41
  end
  object bAbort: TButton
    Left = 259
    Top = 19
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Abort'
    Default = True
    ModalResult = 3
    TabOrder = 0
    OnClick = bAbortClick
  end
end
