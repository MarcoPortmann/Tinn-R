object frmAbout: TfrmAbout
  Left = 538
  Top = 206
  AlphaBlend = True
  AlphaBlendValue = 200
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 478
  ClientWidth = 513
  Color = clBtnFace
  TransparentColorValue = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clHighlight
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 8
    Top = 8
    Width = 65
    Height = 435
    Shape = stRoundRect
  end
  object Label4: TLabel
    Left = 16
    Top = 205
    Width = 52
    Height = 13
    Caption = 'Fancy logo'
  end
  object Label9: TLabel
    Left = 14
    Top = 224
    Width = 55
    Height = 13
    Caption = 'placeholder'
  end
  object bbtOK: TBitBtn
    Left = 434
    Top = 449
    Width = 75
    Height = 25
    Caption = 'OK'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ModalResult = 1
    ParentFont = False
    TabOrder = 0
  end
  object ScrollBox1: TScrollBox
    Left = 80
    Top = 8
    Width = 425
    Height = 435
    BevelInner = bvNone
    BevelOuter = bvRaised
    BevelKind = bkFlat
    BorderStyle = bsNone
    Color = clWhite
    ParentColor = False
    TabOrder = 1
    object Label3: TLabel
      Left = 15
      Top = 16
      Width = 301
      Height = 13
      Caption = 'Tinn-R Editor - GUI for R Language and Environment'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object lVersion: TLabel
      Left = 15
      Top = 35
      Width = 38
      Height = 13
      Caption = 'Version:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      IsControl = True
    end
    object Label7: TLabel
      Left = 15
      Top = 54
      Width = 71
      Height = 13
      Caption = 'Copyright 2015'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      IsControl = True
    end
    object Label8: TLabel
      Left = 15
      Top = 73
      Width = 216
      Height = 13
      Caption = 'Under the GNU General Public License - GPL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      IsControl = True
    end
    object Label1: TLabel
      Left = 15
      Top = 105
      Width = 363
      Height = 13
      Caption = 'This version of Tinn-R has been developed by Marco Portmann.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      IsControl = True
    end
    object Label2: TLabel
      Left = 15
      Top = 124
      Width = 190
      Height = 13
      Caption = 'The source code is available on GitHub:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = True
      IsControl = True
    end
    object Label5: TLabel
      Left = 15
      Top = 177
      Width = 361
      Height = 13
      Caption = 'This version of Tinn-R bases on Tinn-R 3.0.3.5. All contributors'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      IsControl = True
    end
    object Label6: TLabel
      Left = 15
      Top = 196
      Width = 263
      Height = 13
      Caption = 'of this version of Tinn-R are mentioned below.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
      IsControl = True
    end
    object LinkLabel1: TLinkLabel
      Left = 15
      Top = 143
      Width = 239
      Height = 19
      Caption = 'https://github.com/MarcoPortmann/Tinn-R'
      TabOrder = 0
      UseVisualStyle = True
    end
    object Memo1: TMemo
      Left = 15
      Top = 215
      Width = 378
      Height = 1500
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Lines.Strings = (
        ' Main contributors '
        '==================='
        ' - Jos'#233' Cl'#225'udio Faria'
        '   email: joseclaudio.faria@gmail.com'
        ''
        ' - Philippe Grosjean'
        '   email: phgrosjean@sciviews.org'
        ''
        ' - Enio Jelihovschi (documentation in English)'
        '   email: eniojelihovs@gmail.com'
        ''
        ' - Marco de Groot'
        '   email: m.h.de.groot@mattic.com'
        ''
        ' - Huashan Chen:'
        '   email: chenhuashan@baidao.net'
        ''
        ' Other contributors'
        '======='
        ' - Anderson R. Barbieri'
        ' - Andy Bunn'
        ' - Bendix Carstensen'
        ' - Camila de Godoy (for the criation of the projetc logo) - '
        'http://www.camiladegodoy.com.br'
        ' - Douglas Federman'
        
          ' - Diethelm Wuertz (editor of Tinn-R ebook) - https://www.rmetri' +
          'cs.org'
        ' - Duncan Murdoch'
        ' - Eric Lacoutre'
        ' - Frank R. Lawrence'
        ' - Gabor Grothendieck'
        ' - Gabriel Moreno'
        ' - Hiroyuki Kawakatsu'
        ' - Igor Kojanov'
        ' - Ivan B. Allaman'
        ' - Jairo Cugliari'
        ' - Jan Fiala (PSPad editor for share code and helps)'
        ' - Jens Oehlschl'#228'gel'
        ' - John (JJ)'
        ' - John Cotter'
        ' - John Fox'
        ' - John Hathaway'
        ' - Jorge Alexandre Wiendl (for a lot of good ideas and works)'
        ' - Kelly Hildner'
        ' - Leon Barmuta'
        ' - Manuel Salamero'
        ' - Michael Pomada'
        ' - Mike Prager'
        
          ' - Ricardo Pietrobon (for making the Tinn-R User Guide more read' +
          'able and '
        'intelligible)'
        ' - Russel May (founder of the Tinn project)'
        ' - Savano S. Pereira'
        ' - S'#248'ren H'#248'jsgaard'
        ' - Stefan Ascher'
        ' - Steven Novick'
        ' - Suresh Krishna'
        
          ' - Teresa Gra'#231'a (for making the Tinn-R User Guide more readable ' +
          'and '
        'intelligible)'
        ' - Thomas Petzoldt'
        ' - Uwe Ligges'
        ' - Victor Moreno'
        ' - Wenping Wang'
        ' - Yves Brostaux'
        ''
        ' Institutions'
        '=========='
        ' - Universidade Estadual de Santa Cruz'#9#9#9#9
        'UESC/BA/BRASIL'
        
          ' - Conselho Nacional de Desenvolvimento Cient'#237'fico e Tecnol'#243'gico' +
          #9
        'CNPq/BRASIL'
        ' - Escola Superior de Agricultura "Luiz de Queiroz"'#9#9#9
        'ESALQ/USP/SP/BRASIL'
        ' - Departamento de Ci'#234'ncias Exatas'#9#9#9#9
        'LCE/ESALQ/USP/SP/BRASIL'
        ' - SourceForge.net'
        ''
        ' People'
        '======='
        ' - Bill Venables'#9#9#9'CSIRO/AUSTRALIA'
        ' - Clarice Garcia Borges Dem'#233'trio'#9'LCE/ESALQ/SP/BRASIL'
        ' - Jakson Alves de Aquino                       DCS/UFC/BRASIL'
        ''
        ' Teams of the open source projects'
        '============================='
        ' - Deplate'#9#9#9'Fc'#9
        'http://deplate.sourceforge.net/index.php'
        ' - InnoSetup'#9#9'Is'#9'http://www.jrsoftware.org'
        ' - JEDI'#9#9#9'Dc'#9'http://www.delphi-jedi.org'
        ' - MikTeX'#9#9#9'Cp'#9'http://www.miktex.org'
        ' - Tinn'#9#9#9'Te'#9'http://tinn.solarvoid.com'
        ' - TurboPower Abbrevia'#9'Dc'#9
        'http://sourceforge.net/projects/tpabbrevia'
        ' - Txt2tags'#9#9'Fc'#9'http://txt2tags.sourceforge.net'
        ''
        ' Teams of the freewere resources'
        '==========================='
        ' - FAMFAMFAM'#9#9'I'#9
        'http://www.famfamfam.com/lab/icons/silk'
        ' - IcoFiX'#9#9#9'Ie'#9'http://icofx.xhost.ro'
        ' - HotKeyManager'#9#9'Dc'#9'http://www.killprog.com/hkme.html'
        ' - TextDiff '#9#9'Dc'#9
        'http://www.users.on.net/johnson/delphi/textdiff.html'
        ''
        ' Note'
        '====='
        ' Cp'#9'Compilation'
        ' Dc'#9'Delphi component'
        ' Fc'#9'File conversor'
        ' I'#9'Icons'
        ' Ie'#9'Icons editor (and viewer)'
        ' Is'#9'Install setup'
        ' Ss'#9'Screenshots'
        ' Te'#9'Text editor project')
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
end