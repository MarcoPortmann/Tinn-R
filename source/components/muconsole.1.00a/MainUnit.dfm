object MainForm: TMainForm
  Left = 635
  Top = 124
  Caption = 'MainForm'
  ClientHeight = 525
  ClientWidth = 881
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnResize = FormResize
  OnShow = FormShow
  DesignSize = (
    881
    525)
  PixelsPerInch = 96
  TextHeight = 13
  object ApplicationLabel: TLabel
    Left = 8
    Top = 12
    Width = 52
    Height = 13
    Caption = 'Application'
  end
  object CommandLabel: TLabel
    Left = 8
    Top = 44
    Width = 47
    Height = 13
    Caption = 'Command'
  end
  object OutputLabel: TLabel
    Left = 16
    Top = 81
    Width = 49
    Height = 13
    Caption = 'Std output'
  end
  object ErrorLabel: TLabel
    Left = 224
    Top = 78
    Width = 40
    Height = 13
    Caption = 'Std error'
  end
  object DebugLabel: TLabel
    Left = 432
    Top = 81
    Width = 32
    Height = 13
    Caption = 'Debug'
  end
  object CommLabel: TLabel
    Left = 648
    Top = 78
    Width = 47
    Height = 13
    Caption = 'Command'
  end
  object CommandLineEdit: TEdit
    Left = 64
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'C:\Program Files\R\R-3.1.0\bin\x64\Rterm.exe --no-save'
  end
  object CommandEdit: TEdit
    Left = 64
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'a=rnorm(1e3); a; Sys.sleep(x); a'
  end
  object RunBtn: TButton
    Left = 190
    Top = 6
    Width = 75
    Height = 25
    Caption = 'RunBtn'
    TabOrder = 1
    OnClick = RunBtnClick
  end
  object StopBtn: TButton
    Left = 272
    Top = 6
    Width = 75
    Height = 25
    Caption = 'StopBtn'
    TabOrder = 2
    OnClick = StopBtnClick
  end
  object SendBtn: TButton
    Left = 190
    Top = 38
    Width = 75
    Height = 25
    Caption = 'Send Edit'
    TabOrder = 4
    OnClick = SendBtnClick
  end
  object OutputMemo: TMemo
    Left = 8
    Top = 96
    Width = 201
    Height = 381
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'OutputMemo')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object ErrorMemo: TMemo
    Left = 217
    Top = 97
    Width = 201
    Height = 380
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'ErrorMemo')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 6
  end
  object DebugMemo: TMemo
    Left = 424
    Top = 96
    Width = 201
    Height = 381
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'DebugMemo')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 7
  end
  object ExitBtn: TButton
    Left = 793
    Top = 483
    Width = 81
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Exit'
    TabOrder = 12
    OnClick = ExitBtnClick
  end
  object EnableKillCheck: TCheckBox
    Left = 8
    Top = 479
    Width = 103
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Enable kill'
    TabOrder = 8
    OnClick = EnableKillCheckClick
  end
  object StopOnFreeCheck: TCheckBox
    Left = 8
    Top = 496
    Width = 103
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Stop on free'
    Checked = True
    State = cbChecked
    TabOrder = 9
    OnClick = StopOnFreeCheckClick
  end
  object SetTerminateCommandBtn: TButton
    Left = 120
    Top = 483
    Width = 145
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Set terminate command'
    TabOrder = 10
    OnClick = SetTerminateCommandBtnClick
  end
  object SetWaitTimeoutBtn: TButton
    Left = 270
    Top = 483
    Width = 148
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Set wait timeout'
    TabOrder = 11
    OnClick = SetWaitTimeoutBtnClick
  end
  object Button1: TButton
    Left = 271
    Top = 37
    Width = 75
    Height = 25
    Caption = 'Send Memo'
    TabOrder = 13
    OnClick = Button1Click
  end
  object CommandMemo: TMemo
    Left = 640
    Top = 97
    Width = 244
    Height = 380
    Anchors = [akLeft, akTop, akBottom]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    Lines.Strings = (
      'CommandMemo')
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 14
  end
  object Button2: TButton
    Left = 353
    Top = 6
    Width = 111
    Height = 25
    Caption = 'SplitMode sm0D0A'
    TabOrder = 15
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 353
    Top = 37
    Width = 111
    Height = 25
    Caption = 'SplitMode smNone'
    TabOrder = 16
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 470
    Top = 6
    Width = 99
    Height = 25
    Caption = 'SplitMode smSplitchar'
    TabOrder = 17
    OnClick = Button4Click
  end
  object ConsoleIO: TConsoleIO
    OnReceiveOutput = ConsoleIOReceiveOutput
    OnReceiveError = ConsoleIOReceiveError
    OnError = ConsoleIOError
    OnProcessStatusChange = ConsoleIOProcessStatusChange
    TerminateCommand = 'quit()'
    SplitMode = smSplitchar
    Left = 581
    Top = 1
  end
end
