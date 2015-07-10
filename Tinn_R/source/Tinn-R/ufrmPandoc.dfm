object frmPandoc: TfrmPandoc
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'Pandoc (document converter)'
  ClientHeight = 584
  ClientWidth = 535
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object rdgFrom: TRadioGroup
    Left = 0
    Top = 0
    Width = 535
    Height = 90
    Align = alTop
    Caption = ' From '
    Columns = 2
    Items.Strings = (
      'docbook (DocBook XML)'
      'html (HTML)'
      'json (JSON version of native AST)'
      'latex (LaTeX)'
      'markdown (markdown)'
      'native (native Haskell)'
      'rst (reStructuredText)'
      'textile (Textile)')
    TabOrder = 0
    OnClick = rdgFromClick
  end
  object rdgTo: TRadioGroup
    Left = 0
    Top = 90
    Width = 535
    Height = 254
    Align = alTop
    Caption = ' To '
    Columns = 2
    Items.Strings = (
      'asciidoc (AsciiDoc)'
      'beamer (LaTeX beamer slide show)'
      'context (ConTeXt)'
      'docbook (DocBook XML)'
      'docx (Word docx)'
      'dzslides (HTML5 + javascript slide show)'
      'epub (EPUB book)'
      'html (XHTML 1)'
      'html5 (HTML 5)'
      'json (JSON version of native AST)'
      'latex (LaTeX)'
      'man (groff man)'
      'markdown (markdown)'
      'mediawiki (MediaWiki markup)'
      'native (native Haskell)'
      'odt (OpenOffice text document)'
      'opendocument (OpenDocument XML)'
      'org (Emacs Org-Mode)'
      'plain (plain text)'
      'rst (reStructuredText)'
      'rtf (rich text format)'
      's5 (S5 HTML and javascript slide show)'
      'slideous (Slideous HTML and javascript slide show)'
      'slidy (Slidy HTML and javascript slide show)'
      'texinfo (GNU Texinfo)'
      'textile (Textile)')
    TabOrder = 1
    OnClick = rdgToClick
  end
  object bbtOK: TBitBtn
    Left = 350
    Top = 554
    Width = 89
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    NumGlyphs = 2
    ParentDoubleBuffered = True
    TabOrder = 2
  end
  object bbtCancel: TBitBtn
    Left = 438
    Top = 554
    Width = 89
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    NumGlyphs = 2
    ParentDoubleBuffered = True
    TabOrder = 3
  end
  object gpbInstruction: TGroupBox
    Left = 0
    Top = 344
    Width = 535
    Height = 101
    Align = alTop
    Caption = ' Instruction (will be send to pandoc.exe) '
    TabOrder = 4
    object Label1: TLabel
      Left = 5
      Top = 56
      Width = 37
      Height = 13
      Caption = '%from:'
    end
    object Label2: TLabel
      Left = 17
      Top = 82
      Width = 25
      Height = 13
      Caption = '%to:'
    end
    object edFrom: TEdit
      Left = 48
      Top = 48
      Width = 484
      Height = 21
      TabOrder = 0
    end
    object edInstruction: TEdit
      Left = 4
      Top = 21
      Width = 528
      Height = 21
      TabOrder = 1
    end
    object edTo: TEdit
      Left = 48
      Top = 75
      Width = 484
      Height = 21
      TabOrder = 2
    end
  end
  object bbtPandocRestoreDefault: TButton
    Left = 261
    Top = 554
    Width = 90
    Height = 25
    Caption = 'Restore default'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bbtPandocRestoreDefaultClick
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 445
    Width = 535
    Height = 100
    Align = alTop
    Caption = ' Instruction (history) '
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
    object Label3: TLabel
      Left = 5
      Top = 50
      Width = 37
      Height = 13
      Caption = '%from:'
    end
    object Label4: TLabel
      Left = 17
      Top = 76
      Width = 25
      Height = 13
      Caption = '%to:'
    end
    object cbPandocHistory: TComboBox
      Left = 4
      Top = 15
      Width = 528
      Height = 21
      TabOrder = 0
      OnSelect = cbPandocHistorySelect
    end
    object edHistoryFrom: TEdit
      Left = 48
      Top = 42
      Width = 484
      Height = 21
      TabOrder = 1
    end
    object edHistoryTo: TEdit
      Left = 48
      Top = 69
      Width = 484
      Height = 21
      TabOrder = 2
    end
  end
end
