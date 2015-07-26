object frmTools: TfrmTools
  Left = 411
  Top = 150
  AlphaBlend = True
  AlphaBlendValue = 200
  Caption = 'Tools'
  ClientHeight = 689
  ClientWidth = 351
  Color = clWindow
  Ctl3D = False
  DockSite = True
  DragKind = dkDock
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesigned
  Visible = True
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnMouseWheel = FormMouseWheel
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object JvPoweredByJCL1: TJvPoweredByJCL
    Left = 136
    Top = 24
    Width = 1
    Height = 33
    URL = 'http://homepages.codegear.com/jedi/jcl/'
  end
  object npTools: TJvNavigationPane
    Left = 0
    Top = 0
    Width = 351
    Height = 689
    ActivePage = ppMisc
    Align = alClient
    Background.Stretch = False
    Background.Proportional = False
    Background.Center = False
    Background.Tile = False
    Background.Transparent = False
    Caption = 'Tools'
    Colors.ButtonColorFrom = clWhite
    Colors.ButtonColorTo = 12435133
    Colors.ButtonHotColorFrom = 13009540
    Colors.ButtonHotColorTo = 13009540
    Colors.ButtonSelectedColorFrom = 14602190
    Colors.ButtonSelectedColorTo = 14602190
    Colors.SplitterColorFrom = 13026246
    Colors.SplitterColorTo = 9211532
    Colors.DividerColorFrom = 15725551
    Colors.DividerColorTo = 13026246
    Colors.HeaderColorFrom = 8684164
    Colors.HeaderColorTo = 8684164
    Colors.FrameColor = 8684676
    Colors.ToolPanelHeaderColorFrom = clWhite
    Colors.ToolPanelHeaderColorTo = 12435133
    StyleManager = npStyle
    ParentStyleManager = False
    MaximizedCount = 6
    SmallImages = frmTinnMain.imlTinnR
    OnChange = npToolsChange
    OnResize = npToolsResize
    OnSplitterMoved = npToolsSplitterMoved
    object ppR: TJvNavPanelPage
      Left = 0
      Top = 0
      Width = 349
      Height = 428
      Hint = ''
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Caption = 'R'
      Iconic = True
      ImageIndex = 80
      object JvNavPanelDivider2: TJvNavPanelDivider
        Left = 0
        Top = 0
        Width = 349
        Align = alTop
        MinSize = 1
        Caption = 'Explorer'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
      end
      object JvNavPanelDivider1: TJvNavPanelDivider
        Left = 0
        Top = 181
        Width = 349
        Align = alTop
        MinSize = 1
        OnMoved = JvNavPanelDivider1Moved
        Caption = 'R library'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
      end
      object JvNavPanelDivider4: TJvNavPanelDivider
        Left = 0
        Top = 367
        Width = 349
        Height = 20
        Align = alBottom
        MinSize = 1
        OnMoved = JvNavPanelDivider4Moved
        Caption = 'Navigator'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
        ExplicitTop = 427
      end
      object panExplorer: TPanel
        Left = 0
        Top = 19
        Width = 349
        Height = 162
        Align = alTop
        BevelOuter = bvNone
        Color = clWindow
        ParentBackground = False
        TabOrder = 0
        object panExplorerHeader: TPanel
          Left = 0
          Top = 0
          Width = 349
          Height = 50
          Align = alTop
          BevelOuter = bvNone
          BorderWidth = 2
          TabOrder = 0
          object Splitter4: TSplitter
            Left = 230
            Top = 25
            Width = 8
            Height = 23
            Align = alRight
            ResizeStyle = rsUpdate
            ExplicitLeft = 231
          end
          object edToolsRExplorerFilter: TButtonedEdit
            Left = 238
            Top = 25
            Width = 109
            Height = 23
            Margins.Left = 1
            Margins.Top = 0
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alRight
            Images = frmTinnMain.imlTinnR
            RightButton.ImageIndex = 55
            RightButton.Visible = True
            TabOrder = 0
            OnClick = edToolsRExplorerFilterClick
            OnExit = edToolsRExplorerFilterExit
            OnKeyUp = edToolsRExplorerFilterKeyUp
            ExplicitHeight = 19
          end
          object bbtREnvironmentRefresh: TBitBtn
            Left = 2
            Top = 5
            Width = 25
            Height = 21
            Action = frmTinnMain.actREnvironmentRefresh
            Caption = 'Refresh environment'
            Margin = 1
            TabOrder = 1
          end
          object panEnvironment: TPanel
            Left = 2
            Top = 2
            Width = 345
            Height = 23
            Align = alTop
            BevelEdges = []
            BevelOuter = bvNone
            TabOrder = 2
            object cbbToolsREnvironment: TComboBox
              AlignWithMargins = True
              Left = 28
              Top = 1
              Width = 317
              Height = 21
              Hint = 'Set R environment'
              Margins.Left = 1
              Margins.Top = 1
              Margins.Right = 0
              Align = alClient
              Style = csDropDownList
              TabOrder = 0
              OnSelect = cbbToolsREnvironmentSelect
            end
            object bbRefreshExplorerBoth: TBitBtn
              AlignWithMargins = True
              Left = 0
              Top = 0
              Width = 23
              Height = 21
              Hint = 'Refresh environment and explorer'
              Margins.Left = 0
              Margins.Top = 0
              Margins.Right = 4
              Margins.Bottom = 2
              Align = alLeft
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000000000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDD2DDDDDDDDDDDDDD22DDDDDDDDDDDDD22222D
                DDDDDDDDDDD22DD2DDDDDDDDDDDD2DD2DDDDDDDDD2DDDDD2DDDDDDDDD2DD2DDD
                DDDDDDDDD2DD22DDDDDDDDDDDD22222DDDDDDDDDDDDD22DDDDDDDDDDDDDD2DDD
                DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD}
              Margin = 0
              TabOrder = 1
              Visible = False
              OnClick = bbRefreshExplorerBothClick
            end
          end
          object cbbToolsRExplorer: TComboBoxEx
            AlignWithMargins = True
            Left = 3
            Top = 25
            Width = 227
            Height = 22
            Margins.Left = 1
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 5
            Align = alClient
            ItemsEx = <
              item
                Caption = 'All'
                ImageIndex = 0
                SelectedImageIndex = 0
              end
              item
                Caption = 'Data'
                ImageIndex = 1
                SelectedImageIndex = 1
              end
              item
                Caption = 'Functions'
                ImageIndex = 2
                SelectedImageIndex = 2
              end
              item
                Caption = 'Data.frames'
                ImageIndex = 3
                SelectedImageIndex = 3
              end
              item
                Caption = 'Arrays'
                ImageIndex = 4
                SelectedImageIndex = 4
              end
              item
                Caption = 'Matrices'
                ImageIndex = 4
                SelectedImageIndex = 4
              end
              item
                Caption = 'Tables'
                ImageIndex = 6
                SelectedImageIndex = 6
              end
              item
                Caption = 'Vectors'
                ImageIndex = 7
                SelectedImageIndex = 7
              end
              item
                Caption = 'Lists'
                ImageIndex = 8
                SelectedImageIndex = 8
              end
              item
                Caption = 'Others'
                ImageIndex = 9
                SelectedImageIndex = 9
              end>
            Style = csExDropDownList
            TabOrder = 3
            OnSelect = cbbToolsRExplorerSelect
            Images = frmTinnMain.imlRexplorer
          end
        end
        object cgObjects: TDBCtrlGrid
          Left = 0
          Top = 50
          Width = 349
          Height = 112
          Align = alClient
          DataSource = modDados.dsRObjects
          PanelBorder = gbNone
          PanelHeight = 28
          PanelWidth = 332
          ParentColor = False
          PopupMenu = frmTinnMain.pabRExplorer
          TabOrder = 1
          RowCount = 4
          SelectedColor = clWhite
          OnDblClick = cgObjectsDblClick
          OnKeyDown = cgObjectsKeyDown
          OnKeyPress = cgObjectsKeyPress
          OnKeyUp = cgObjectsKeyUp
          OnPaintPanel = cgObjectsPaintPanel
          OnStartDrag = cgObjectsStartDrag
        end
      end
      object panRCard: TPanel
        Left = 0
        Top = 200
        Width = 349
        Height = 167
        Align = alClient
        BevelOuter = bvNone
        ParentColor = True
        TabOrder = 1
        object panRCard4: TPanel
          Left = 0
          Top = 25
          Width = 349
          Height = 142
          Align = alClient
          BevelOuter = bvNone
          Color = clWindow
          ParentBackground = False
          TabOrder = 0
          object Bevel1: TBevel
            Left = 0
            Top = 22
            Width = 349
            Height = 1
            Align = alBottom
            Shape = bsBottomLine
            ExplicitTop = 80
          end
          object cgMainBase: TDBCtrlGrid
            Left = 0
            Top = 0
            Width = 349
            Height = 22
            Align = alClient
            DataSource = modDados.dsMainBase
            PanelBorder = gbNone
            PanelHeight = 5
            PanelWidth = 332
            ParentColor = False
            PopupMenu = frmTinnMain.pabLibrary
            TabOrder = 0
            RowCount = 4
            SelectedColor = clWhite
            OnDblClick = cgMainBaseDblClick
            OnKeyDown = cgMainBaseKeyDown
            OnKeyPress = cgMainBaseKeyPress
            OnPaintPanel = cgMainBasePaintPanel
            object DBText1: TDBText
              Left = 16
              Top = 16
              Width = 65
              Height = 17
              DataSource = modDados.dsMainBase
              Visible = False
            end
          end
          object wbDescription: TWebBrowser
            Left = 0
            Top = 23
            Width = 349
            Height = 119
            Align = alBottom
            TabOrder = 1
            ExplicitTop = 35
            ExplicitWidth = 366
            ControlData = {
              4C000000122400004D0C00000000000000000000000000000000000000000000
              000000004C000000000000000000000001000000E0D057007335CF11AE690800
              2B2E126200000000000000004C0000000114020000000000C000000000000046
              8000000000000000000000000000000000000000000000000000000000000000
              00000000000000000100000000000000000000000000000000000000}
          end
        end
        object panRCard1: TPanel
          Left = 0
          Top = 0
          Width = 349
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Padding.Left = 2
          Padding.Top = 2
          Padding.Right = 2
          Padding.Bottom = 2
          TabOrder = 1
          object Splitter2: TSplitter
            Left = 231
            Top = 2
            Width = 8
            Height = 21
            Align = alRight
            ResizeStyle = rsUpdate
          end
          object lbRCard: TComboBox
            Left = 2
            Top = 2
            Width = 229
            Height = 21
            Align = alClient
            Style = csDropDownList
            DropDownCount = 16
            TabOrder = 0
            OnClick = lbRcardClick
          end
          object edCardSearch: TButtonedEdit
            Left = 239
            Top = 2
            Width = 108
            Height = 21
            Margins.Left = 1
            Margins.Top = 0
            Margins.Right = 1
            Margins.Bottom = 1
            Align = alRight
            Images = frmTinnMain.imlTinnR
            RightButton.ImageIndex = 55
            RightButton.Visible = True
            TabOrder = 1
            OnExit = edCardSearchExit
            OnKeyDown = edCardSearchKeyDown
            OnKeyPress = edCardSearchKeyPress
            OnKeyUp = edCardSearchKeyUp
            OnRightButtonClick = edCardSearchRightButtonClick
            ExplicitHeight = 19
          end
        end
      end
      object panNavi: TPanel
        Left = 0
        Top = 387
        Width = 349
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'panNavi'
        TabOrder = 2
        object RNavigator: TRNavigator
          Left = 0
          Top = 0
          Width = 349
          Height = 41
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          HideSelection = False
          Indent = 19
          ReadOnly = True
          TabOrder = 0
          OnClick = RNavigatorClick
          OnDblClick = RNavigatorDblClick
        end
      end
    end
    object ppFiles: TJvNavPanelPage
      Left = 0
      Top = 0
      Width = 349
      Height = 428
      Hint = ''
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Caption = 'File management'
      Iconic = True
      ImageIndex = 65
      object JvNavPanelDivider5: TJvNavPanelDivider
        Left = 0
        Top = 0
        Width = 349
        Align = alTop
        Caption = 'Project'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
      end
      object JvNavPanelDivider6: TJvNavPanelDivider
        Left = 0
        Top = 113
        Width = 349
        Align = alTop
        Caption = 'Windows explorer'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
      end
      object panProj: TPanel
        Left = 0
        Top = 19
        Width = 349
        Height = 94
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object tvProject: TTreeView
          Left = 0
          Top = 26
          Width = 349
          Height = 49
          Align = alClient
          Anchors = [akLeft, akRight, akBottom]
          BevelInner = bvNone
          BevelOuter = bvRaised
          BiDiMode = bdLeftToRight
          BorderStyle = bsNone
          Ctl3D = False
          DragMode = dmAutomatic
          Images = frmTinnMain.imlProject
          Indent = 19
          ParentBiDiMode = False
          ParentCtl3D = False
          PopupMenu = frmTinnMain.pmenProjects
          ReadOnly = True
          RightClickSelect = True
          TabOrder = 0
          OnAddition = tvProjectAddition
          OnChange = tvProjectChange
          OnDblClick = tvProjectDblClick
          OnDeletion = tvProjectDeletion
          OnDragDrop = tvProjectDragDrop
          OnDragOver = tvProjectDragOver
          OnEndDrag = tvProjectEndDrag
          OnKeyDown = tvProjectKeyDown
          OnStartDrag = tvProjectStartDrag
        end
        object stbProject: TStatusBar
          Left = 0
          Top = 75
          Width = 349
          Height = 19
          Panels = <
            item
              Bevel = pbNone
              Text = 'Total:'
              Width = 29
            end
            item
              Width = 40
            end
            item
              Bevel = pbNone
              Text = 'Index:'
              Width = 35
            end
            item
              Width = 40
            end
            item
              Bevel = pbNone
              Text = 'Sel:'
              Width = 21
            end
            item
              Width = 50
            end>
        end
        object atbProject: TActionToolBar
          Left = 0
          Top = 0
          Width = 349
          Height = 26
          ActionManager = frmTinnMain.amMain
          Caption = 'Projects'
          Color = clMenuBar
          ColorMap.DisabledFontColor = 7171437
          ColorMap.HighlightColor = clWhite
          ColorMap.BtnSelectedFont = clBlack
          ColorMap.UnusedColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Spacing = 0
        end
      end
      object panWinExplorer: TPanel
        Left = 0
        Top = 132
        Width = 349
        Height = 296
        Align = alClient
        Anchors = [akLeft, akRight, akBottom]
        BevelOuter = bvNone
        TabOrder = 1
        object Splitter6: TSplitter
          Left = 0
          Top = 197
          Width = 349
          Height = 3
          Cursor = crVSplit
          Align = alBottom
          ExplicitTop = 249
        end
        object panWinExpHeader: TPanel
          Left = 0
          Top = 0
          Width = 349
          Height = 52
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object panWinFav: TPanel
            Left = 0
            Top = 0
            Width = 349
            Height = 25
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object bbtExplorerAddFavorites: TBitBtn
              AlignWithMargins = True
              Left = 3
              Top = 2
              Width = 25
              Height = 22
              Hint = 'Windows explorer: folder (add favorite)'
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 1
              Align = alLeft
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000008080008080
                0080803399CC0080800080800080800080800080800080803366333366333366
                333366333366330080800080800080800080803399CC3399CC3399CC00808000
                808000808033663333996666CC9999CCCC66CC99339966336633008080008080
                0080803399CC3399CC3399CC3399CC00808000808033663366CC9966CC990080
                8066CC9966CC993366330080800080800080800080803399CC33CCCC33CCCC33
                99CC3399CC33663399CCCC00808000808000808099CCCC336633008080008080
                0080800080800080803399CC99CCFF66CCCC3399CC33996699CCCC99CCCC0080
                8066CC9966CC9933663300808000808000808000808000808033CCCC66CCFF99
                CCFF66CCFF33999966999999CCCCC0DCC066CC9933996633663333CCCC33CCCC
                33CCCC33CCCC33CCCC33CCCC99CCFF33CCFF33CCFF99CCFF6699996699663399
                6633996633663300808033CCFF66CCFF99CCFF99CCFF99CCFF99CCFF99CCFF99
                CCFF99CCFF66CCFF66CCFF66CCFF33CCCC3399CC3399CC00808033CCFF33CCFF
                99FFFF33CCFF33CCFF33CCFF33CCFF99CCFF33CCCC33CCCC3399CC3399CC3399
                CC3399CC3399CC00808000808033CCFF99CCFF99CCFF33CCFF33CCFF33CCFF99
                CCFF66CCFF33CCCC00808000808000808000808000808000808000808033CCFF
                66CCFF99FFFF33CCFF33CCFF33CCFF66CCFF66CCFF33CCCC33CCCC0080800080
                8000808000808000808000808000808033CCFF99FFFF66CCFF33CCFF33CCFF33
                CCFF99CCFF66CCFF33CCCC33CCCC008080008080008080008080008080008080
                33CCFF66CCFF99FFFF33CCFF33CCFF33CCFF33CCFF99CCFF66CCFF33CCCC0080
                8000808000808000808000808000808000808033CCFF99FFFF99FFFF99FFFF99
                CCFF99CCFF99CCFF99CCFF66CCFF33CCCC008080008080008080008080008080
                00808033CCFF33CCFF33CCFF33CCFF33CCFF33CCFF33CCCC33CCCC33CCCC33CC
                CC33CCCC00808000808000808000808000808000808000808000808000808000
                8080008080008080008080008080008080008080008080008080}
              Margin = 1
              TabOrder = 0
              OnClick = bbtExplorerAddFavoritesClick
            end
            object bbtExplorerRemoveFavorites: TBitBtn
              AlignWithMargins = True
              Left = 31
              Top = 2
              Width = 25
              Height = 22
              Hint = 'Windows explorer: folder (remove favorite)'
              Margins.Left = 1
              Margins.Top = 2
              Margins.Right = 2
              Margins.Bottom = 1
              Align = alLeft
              Glyph.Data = {
                36030000424D3603000000000000360000002800000010000000100000000100
                1800000000000003000000000000000000000000000000000000008080008080
                0080803399CC0080800080800080800080800080800080803366CC0033CC0033
                CC0033CC0033CC0080800080800080800080803399CC3399CC3399CC00808000
                80800080803366CC3366CC3366CC0066FF0066CC0033CC0033CC008080008080
                0080803399CC3399CC3399CC3399CC0080800080800033CC6699FF3366FF0066
                FF0066FF0066CC0033CC0080800080800080800080803399CC33CCCC33CCCC33
                99CC3399CC0033CC99CCFF0080800080800080803366FF0033CC008080008080
                0080800080800080803399CC99CCFF66CCCC3399CC0033CC99CCFF3399FF0066
                FF3399FF3399FF0033CC00808000808000808000808000808033CCCC66CCFF99
                CCFF66CCFF3399CC3366CC99CCFFC6D6EF6699FF3366CC0033CC33CCCC33CCCC
                33CCCC33CCCC33CCCC33CCCC99CCFF33CCFF33CCFF99CCFF3399CC0066CC0033
                CC0033CC0033CC00808033CCFF66CCFF99CCFF99CCFF99CCFF99CCFF99CCFF99
                CCFF99CCFF66CCFF66CCFF66CCFF33CCCC3399CC3399CC00808033CCFF33CCFF
                99FFFF33CCFF33CCFF33CCFF33CCFF99CCFF33CCCC33CCCC3399CC3399CC3399
                CC3399CC3399CC00808000808033CCFF99CCFF99CCFF33CCFF33CCFF33CCFF99
                CCFF66CCFF33CCCC00808000808000808000808000808000808000808033CCFF
                66CCFF99FFFF33CCFF33CCFF33CCFF66CCFF66CCFF33CCCC33CCCC0080800080
                8000808000808000808000808000808033CCFF99FFFF66CCFF33CCFF33CCFF33
                CCFF99CCFF66CCFF33CCCC33CCCC008080008080008080008080008080008080
                33CCFF66CCFF99FFFF33CCFF33CCFF33CCFF33CCFF99CCFF66CCFF33CCCC0080
                8000808000808000808000808000808000808033CCFF99FFFF99FFFF99FFFF99
                CCFF99CCFF99CCFF99CCFF66CCFF33CCCC008080008080008080008080008080
                00808033CCFF33CCFF33CCFF33CCFF33CCFF33CCFF33CCCC33CCCC33CCCC33CC
                CC33CCCC00808000808000808000808000808000808000808000808000808000
                8080008080008080008080008080008080008080008080008080}
              Margin = 1
              TabOrder = 1
              OnClick = bbtExplorerRemoveFavoritesClick
            end
            object cbExplorerFavorites: TComboBox
              AlignWithMargins = True
              Left = 61
              Top = 3
              Width = 285
              Height = 21
              Hint = 'Windows explorer: folder (choice)'
              Align = alClient
              Style = csDropDownList
              Ctl3D = True
              DropDownCount = 10
              ParentCtl3D = False
              Sorted = True
              TabOrder = 2
              OnChange = cbExplorerFavoritesChange
            end
          end
          object Panel1: TPanel
            Left = 0
            Top = 25
            Width = 349
            Height = 27
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Splitter7: TSplitter
              Left = 219
              Top = 0
              Width = 4
              Height = 27
              Align = alRight
            end
            object fcbbToolsWinExplorer: TFilterComboBox
              AlignWithMargins = True
              Left = 3
              Top = 3
              Width = 213
              Height = 21
              Hint = 'Windows explorer: filter (choice)'
              Align = alClient
              AutoComplete = False
              AutoDropDown = True
              Ctl3D = True
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnChange = fcbbToolsWinExplorerChange
            end
            object edWinExplorerFilter: TButtonedEdit
              AlignWithMargins = True
              Left = 226
              Top = 3
              Width = 120
              Height = 21
              Align = alRight
              Images = frmTinnMain.imlTinnR
              RightButton.ImageIndex = 55
              RightButton.Visible = True
              TabOrder = 1
              OnExit = edWinExplorerFilterExit
              OnKeyDown = edWinExplorerFilterKeyDown
              OnKeyPress = edWinExplorerFilterKeyPress
              OnRightButtonClick = edWinExplorerFilterRightButtonClick
              ExplicitHeight = 19
            end
          end
        end
        object jvflbWinExplorer: TJvFileListBox
          Left = 0
          Top = 200
          Width = 349
          Height = 96
          Align = alBottom
          IntegralHeight = True
          PopupMenu = frmTinnMain.pabWinExplorerFiles
          ShowGlyphs = True
          TabOrder = 1
          OnDblClick = jvflbWinExplorerDblClick
          OnEndDrag = jvflbWinExplorerEndDrag
          OnKeyDown = jvflbWinExplorerKeyDown
          OnStartDrag = jvflbWinExplorerStartDrag
          ForceFileExtensions = False
          BorderStyle = bsNone
        end
        object stvWindows: TShellTreeView
          Left = 0
          Top = 52
          Width = 349
          Height = 145
          ObjectTypes = [otFolders]
          Root = 'rfDesktop'
          UseShellImages = True
          Align = alClient
          AutoRefresh = False
          BorderStyle = bsNone
          HideSelection = False
          Indent = 23
          ParentColor = False
          RightClickSelect = True
          ShowRoot = False
          TabOrder = 2
          OnChange = stvWindowsChange
        end
      end
    end
    object ppSearch: TJvNavPanelPage
      Left = 0
      Top = 0
      Width = 349
      Height = 428
      Hint = ''
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Caption = 'Search'
      ImageIndex = 57
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 349
        Height = 30
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
      end
      object tvSearch: TTreeView
        Left = 0
        Top = 30
        Width = 349
        Height = 379
        Align = alClient
        BevelInner = bvNone
        BevelOuter = bvNone
        BiDiMode = bdLeftToRight
        BorderStyle = bsNone
        Ctl3D = False
        DragMode = dmAutomatic
        Images = frmTinnMain.imlSearch
        Indent = 19
        ParentBiDiMode = False
        ParentCtl3D = False
        PopupMenu = frmTinnMain.pmenSearch
        ReadOnly = True
        RightClickSelect = True
        TabOrder = 1
        OnChange = tvSearchChange
        OnDblClick = tvSearchDblClick
        OnDragOver = tvSearchDragOver
        OnEndDrag = tvSearchEndDrag
        OnStartDrag = tvSearchStartDrag
      end
      object stbSearch: TStatusBar
        Left = 0
        Top = 409
        Width = 349
        Height = 19
        Panels = <
          item
            Bevel = pbNone
            Text = 'Total:'
            Width = 32
          end
          item
            Width = 50
          end
          item
            Bevel = pbNone
            Text = 'Index:'
            Width = 35
          end
          item
            Width = 50
          end
          item
            Bevel = pbNone
            Text = 'Selected:'
            Width = 51
          end
          item
            Width = 50
          end>
      end
    end
    object ppSpell: TJvNavPanelPage
      Left = 0
      Top = 0
      Width = 349
      Height = 428
      Hint = ''
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Caption = 'Spell'
      ImageIndex = 260
    end
    object ppMisc: TJvNavPanelPage
      Left = 0
      Top = 0
      Width = 349
      Height = 428
      Hint = ''
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Caption = 'Misc'
      ImageIndex = 120
      object JvNavPanelDivider15: TJvNavPanelDivider
        Left = 0
        Top = 0
        Width = 349
        Align = alTop
        Caption = 'Comments'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
        ExplicitTop = 121
      end
      object JvNavPanelDivider14: TJvNavPanelDivider
        Left = 0
        Top = 273
        Width = 349
        Align = alBottom
        Caption = 'Mirrors'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
        ExplicitTop = 327
      end
      object panComments: TPanel
        Left = 0
        Top = 19
        Width = 349
        Height = 254
        Align = alClient
        Caption = 'panComments'
        TabOrder = 0
        ExplicitTop = 140
        ExplicitHeight = 133
        object GroupBox30: TGroupBox
          Left = 1
          Top = 1
          Width = 347
          Height = 252
          Align = alClient
          Caption = ' Options '
          TabOrder = 0
          ExplicitHeight = 131
          object cbComAutoDetect_Language: TCheckBox
            Left = 9
            Top = 19
            Width = 203
            Height = 17
            Caption = 'Auto detect language (recommended)'
            TabOrder = 0
          end
          object cbComPriority_Line: TCheckBox
            Left = 9
            Top = 39
            Width = 190
            Height = 17
            Caption = 'When both available priority to line'
            TabOrder = 1
          end
        end
        object dbgComments: TDBGrid
          Left = 1
          Top = 65
          Width = 301
          Height = 0
          BorderStyle = bsNone
          DataSource = modDados.dsComments
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          PopupMenu = frmTinnMain.pmenComments
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          Columns = <
            item
              Expanded = False
              FieldName = 'Language'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Line'
              Title.Alignment = taCenter
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Begin'
              Title.Alignment = taCenter
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'End'
              Title.Alignment = taCenter
              Width = 40
              Visible = True
            end>
        end
      end
      object panRMirrors: TPanel
        Left = 0
        Top = 292
        Width = 349
        Height = 136
        Align = alBottom
        Caption = 'panRMirrors'
        TabOrder = 1
        object Splitter1: TSplitter
          Left = 1
          Top = 114
          Width = 347
          Height = 4
          Cursor = crVSplit
          Align = alTop
          Beveled = True
          Color = clActiveCaption
          ParentColor = False
          ExplicitWidth = 348
        end
        object Panel16: TPanel
          Left = 1
          Top = 1
          Width = 347
          Height = 26
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object panCountries: TPanel
          Left = 1
          Top = 27
          Width = 347
          Height = 87
          Align = alTop
          BevelOuter = bvNone
          Constraints.MinHeight = 15
          TabOrder = 1
          object lbCountries: TListBox
            Left = 0
            Top = 0
            Width = 347
            Height = 87
            AutoComplete = False
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Ctl3D = False
            ItemHeight = 13
            ParentCtl3D = False
            TabOrder = 0
            OnClick = lbCountriesClick
          end
        end
        object Panel18: TPanel
          Left = 1
          Top = 118
          Width = 347
          Height = 1
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object dbgRmirrors: TDBGrid
            Left = 0
            Top = 18
            Width = 347
            Height = 7
            Align = alClient
            BorderStyle = bsNone
            DataSource = modDados.dsRmirrors
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            PopupMenu = frmTinnMain.pmenRmirrors
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            Columns = <
              item
                Expanded = False
                FieldName = 'Name'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'City'
                Width = 64
                Visible = True
              end>
          end
          object Panel19: TPanel
            Left = 0
            Top = 0
            Width = 347
            Height = 18
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object DBNavigator5: TDBNavigator
              Left = 0
              Top = 0
              Width = 347
              Height = 18
              DataSource = modDados.dsRmirrors
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              Align = alClient
              TabOrder = 0
            end
          end
        end
        object Panel20: TPanel
          Left = 1
          Top = 55
          Width = 347
          Height = 61
          Align = alBottom
          TabOrder = 3
          object dbeRmirrorsURL: TDBEdit
            Left = 1
            Top = 20
            Width = 345
            Height = 19
            Align = alTop
            DataField = 'URL'
            DataSource = modDados.dsRmirrors
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBtnText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = dbeRmirrorsURLClick
            OnMouseMove = dbeRmirrorsURLMouseMove
          end
          object dbeRmirrorsCode: TDBEdit
            Left = 1
            Top = 39
            Width = 345
            Height = 19
            Align = alTop
            DataField = 'Code'
            DataSource = modDados.dsRmirrors
            TabOrder = 1
          end
          object dbeRmirrorsHost: TDBEdit
            Left = 1
            Top = 1
            Width = 345
            Height = 19
            Align = alTop
            DataField = 'Host'
            DataSource = modDados.dsRmirrors
            TabOrder = 2
          end
        end
        object stbRMirrors: TStatusBar
          Left = 1
          Top = 116
          Width = 347
          Height = 19
          Panels = <
            item
              Bevel = pbNone
              Style = psOwnerDraw
              Text = 'Default:'
              Width = 42
            end
            item
              Style = psOwnerDraw
              Width = 40
            end>
          OnClick = stbRMirrorsClick
          OnMouseMove = stbRMirrorsMouseMove
          OnDrawPanel = stbRMirrorsDrawPanel
        end
      end
    end
    object ppLatex: TJvNavPanelPage
      Left = 0
      Top = 0
      Width = 349
      Height = 428
      Hint = ''
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Caption = 'LaTeX'
      ImageIndex = 221
      object atbLatex: TActionToolBar
        Left = 0
        Top = 0
        Width = 349
        Height = 26
        ActionManager = frmTinnMain.amMain
        Caption = 'tbLatex'
        Color = clMenuBar
        ColorMap.DisabledFontColor = 7171437
        ColorMap.HighlightColor = clWhite
        ColorMap.BtnSelectedFont = clBlack
        ColorMap.UnusedColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        Spacing = 0
      end
      object pgLatex: TJvgPageControl
        Left = 0
        Top = 26
        Width = 349
        Height = 402
        ActivePage = tbsLatexAccent
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        TabOrder = 0
        TabStop = False
        TabStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
        TabStyle.BevelInner = bvNone
        TabStyle.BevelOuter = bvNone
        TabStyle.Bold = False
        TabStyle.BackgrColor = clBtnFace
        TabStyle.Font.Charset = DEFAULT_CHARSET
        TabStyle.Font.Color = clBlack
        TabStyle.Font.Height = -11
        TabStyle.Font.Name = 'Arial'
        TabStyle.Font.Style = []
        TabStyle.CaptionHAlign = fhaCenter
        TabStyle.Gradient.Active = False
        TabStyle.Gradient.Orientation = fgdHorizontal
        TabSelectedStyle.Borders = [fsdLeft, fsdTop, fsdRight, fsdBottom]
        TabSelectedStyle.BevelInner = bvNone
        TabSelectedStyle.BevelOuter = bvNone
        TabSelectedStyle.Bold = False
        TabSelectedStyle.BackgrColor = clBtnFace
        TabSelectedStyle.Font.Charset = DEFAULT_CHARSET
        TabSelectedStyle.Font.Color = clBtnText
        TabSelectedStyle.Font.Height = -11
        TabSelectedStyle.Font.Name = 'Arial'
        TabSelectedStyle.Font.Style = []
        TabSelectedStyle.CaptionHAlign = fhaCenter
        TabSelectedStyle.Gradient.Active = False
        TabSelectedStyle.Gradient.Orientation = fgdHorizontal
        Options = [ftoAutoFontDirection, ftoExcludeGlyphs]
        object tbsLatexAccent: TTabSheet
          Caption = 'Accent'
          object jvivAccents: TJvImagesViewer
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            HorzScrollBar.Range = 341
            HorzScrollBar.Tracking = True
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 31
            VertScrollBar.Tracking = True
            FileMask = 
              '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
              'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
              'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
              'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
              '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
            Options.AutoCenter = False
            Options.Alignment = taLeftJustify
            Options.FrameColor = clNone
            Options.Height = 30
            Options.HorzSpacing = 1
            Options.HotTrack = False
            Options.ImagePadding = 1
            Options.MultiSelect = False
            Options.ReduceMemoryUsage = True
            Options.Transparent = True
            Options.ShowCaptions = False
            Options.VertSpacing = 1
            Options.Width = 30
            SelectedIndex = -1
            OnItemHint = LatexHint
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TabStop = True
            OnMouseMove = LatexMouseMove
            OnMouseUp = LatexAccents
          end
        end
        object tbsLatexArrow: TTabSheet
          Caption = 'Arrow'
          ImageIndex = 1
          object ScrollBox3: TScrollBox
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            object GroupBox21: TGroupBox
              Left = 0
              Top = 236
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Sloped '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object jvivArrowSloped: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox22: TGroupBox
              Left = 0
              Top = 186
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Up '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object jvivArrowUp: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox23: TGroupBox
              Left = 0
              Top = 136
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Left '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              object jvivArrowLeft: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox24: TGroupBox
              Left = 0
              Top = 86
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Down '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 3
              object jvivArrowDown: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox25: TGroupBox
              Left = 0
              Top = 0
              Width = 341
              Height = 86
              Align = alTop
              Caption = ' Right '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 4
              object jvivArrowRight: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 71
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox20: TGroupBox
              Left = 0
              Top = 336
              Width = 341
              Height = 38
              Align = alClient
              Caption = ' Box '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 5
              object jvivArrowBox: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 23
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox19: TGroupBox
              Left = 0
              Top = 286
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Both '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 6
              object jvivArrowBoth: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
          end
        end
        object tbsLatexBar: TTabSheet
          Caption = 'Bar'
          ImageIndex = 2
          object jvivBar: TJvImagesViewer
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            HorzScrollBar.Range = 341
            HorzScrollBar.Tracking = True
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 31
            VertScrollBar.Tracking = True
            FileMask = 
              '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
              'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
              'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
              'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
              '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
            Options.AutoCenter = False
            Options.Alignment = taLeftJustify
            Options.FrameColor = clNone
            Options.Height = 30
            Options.HorzSpacing = 1
            Options.HotTrack = False
            Options.ImagePadding = 1
            Options.MultiSelect = False
            Options.ReduceMemoryUsage = True
            Options.Transparent = True
            Options.ShowCaptions = False
            Options.VertSpacing = 1
            Options.Width = 30
            SelectedIndex = -1
            OnItemHint = LatexHint
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            TabStop = True
            OnMouseMove = LatexMouseMove
            OnMouseUp = LatexSymbol
          end
        end
        object tbsLatexBracket: TTabSheet
          Caption = 'Bracket'
          ImageIndex = 3
          object jvivBracket: TJvImagesViewer
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            HorzScrollBar.Range = 341
            HorzScrollBar.Tracking = True
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 31
            VertScrollBar.Tracking = True
            FileMask = 
              '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
              'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
              'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
              'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
              '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
            Options.AutoCenter = False
            Options.Alignment = taLeftJustify
            Options.FrameColor = clNone
            Options.Height = 30
            Options.HorzSpacing = 1
            Options.HotTrack = False
            Options.ImagePadding = 1
            Options.MultiSelect = False
            Options.ReduceMemoryUsage = True
            Options.Transparent = True
            Options.ShowCaptions = False
            Options.VertSpacing = 1
            Options.Width = 30
            SelectedIndex = -1
            OnItemHint = LatexHint
            Align = alClient
            TabOrder = 0
            TabStop = True
            OnMouseMove = LatexMouseMove
            OnMouseUp = LatexSymbol
          end
        end
        object tbsLatexDot: TTabSheet
          Caption = 'Dot'
          ImageIndex = 4
          object jvivDot: TJvImagesViewer
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            HorzScrollBar.Range = 341
            HorzScrollBar.Tracking = True
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 31
            VertScrollBar.Tracking = True
            FileMask = 
              '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
              'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
              'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
              'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
              '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
            Options.AutoCenter = False
            Options.Alignment = taLeftJustify
            Options.FrameColor = clNone
            Options.Height = 30
            Options.HorzSpacing = 1
            Options.HotTrack = False
            Options.ImagePadding = 1
            Options.MultiSelect = False
            Options.ReduceMemoryUsage = True
            Options.Transparent = True
            Options.ShowCaptions = False
            Options.VertSpacing = 1
            Options.Width = 30
            SelectedIndex = -1
            OnItemHint = LatexHint
            Align = alClient
            TabOrder = 0
            TabStop = True
            OnMouseMove = LatexMouseMove
            OnMouseUp = LatexSymbol
          end
        end
        object tbsLatexGeometry: TTabSheet
          Caption = 'Geometry'
          ImageIndex = 8
          object ScrollBox1: TScrollBox
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            object GroupBox18: TGroupBox
              Left = 0
              Top = 0
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Line '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object jvivGeometryLine: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox17: TGroupBox
              Left = 0
              Top = 50
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Angle '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object jvivGeometryAngle: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox16: TGroupBox
              Left = 0
              Top = 100
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Triangle '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              object jvivGeometryTriangle: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox15: TGroupBox
              Left = 0
              Top = 150
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Star '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 3
              object jvivGeometryStar: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox14: TGroupBox
              Left = 0
              Top = 200
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Box '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 4
              object jvivGeometryBox: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox13: TGroupBox
              Left = 0
              Top = 250
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Diamond '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 5
              object jvivGeometryDiamond: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox12: TGroupBox
              Left = 0
              Top = 300
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Circle '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 6
              object jvivGeometryCircle: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox11: TGroupBox
              Left = 0
              Top = 350
              Width = 341
              Height = 24
              Align = alClient
              Caption = ' Var '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 7
              object jvivGeometryVar: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 9
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                Align = alClient
                TabOrder = 0
                TabStop = True
              end
            end
            object GroupBox10: TGroupBox
              Left = 0
              Top = 350
              Width = 341
              Height = 24
              Align = alClient
              Caption = ' Misc '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 8
              object jvivGeometryMisc: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 9
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
          end
        end
        object tbsLatexGreek: TTabSheet
          Caption = 'Greek'
          ImageIndex = 9
          object ScrollBox2: TScrollBox
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            object GroupBox4: TGroupBox
              Left = 0
              Top = 0
              Width = 341
              Height = 86
              Align = alTop
              Caption = ' Lower '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object jvivGreekLower: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 71
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox3: TGroupBox
              Left = 0
              Top = 86
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Upper '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object jvivGreekUpper: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox2: TGroupBox
              Left = 0
              Top = 136
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Var '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              object jvivGreekVar: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox1: TGroupBox
              Left = 0
              Top = 186
              Width = 341
              Height = 188
              Align = alClient
              Caption = ' Misc '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 3
              object jvivGreekMisc: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 173
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
          end
        end
        object tbsLatexMath: TTabSheet
          Caption = 'Math'
          ImageIndex = 10
          object ScrollBox5: TScrollBox
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            object GroupBox9: TGroupBox
              Left = 0
              Top = 0
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Function '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object jvivMathFunction: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox8: TGroupBox
              Left = 0
              Top = 50
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Logical '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object jvivMathLogical: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox7: TGroupBox
              Left = 0
              Top = 100
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Set '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              object jvivMathSet: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox6: TGroupBox
              Left = 0
              Top = 150
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Var '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 3
              object jvivMathVar: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox5: TGroupBox
              Left = 0
              Top = 200
              Width = 341
              Height = 174
              Align = alClient
              Caption = ' Misc '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 4
              object jvivMathMisc: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 159
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
          end
        end
        object tbsLatexMisc: TTabSheet
          Caption = 'Misc'
          ImageIndex = 11
          object jvivMisc: TJvImagesViewer
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            HorzScrollBar.Range = 341
            HorzScrollBar.Tracking = True
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 31
            VertScrollBar.Tracking = True
            FileMask = 
              '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
              'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
              'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
              'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
              '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
            Options.AutoCenter = False
            Options.Alignment = taLeftJustify
            Options.FrameColor = clNone
            Options.Height = 30
            Options.HorzSpacing = 1
            Options.HotTrack = False
            Options.ImagePadding = 1
            Options.MultiSelect = False
            Options.ReduceMemoryUsage = True
            Options.Transparent = True
            Options.ShowCaptions = False
            Options.VertSpacing = 1
            Options.Width = 30
            SelectedIndex = -1
            OnItemHint = LatexHint
            Align = alClient
            TabOrder = 0
            TabStop = True
            OnMouseMove = LatexMouseMove
            OnMouseUp = LatexSymbol
          end
        end
        object tbsLatexNegation: TTabSheet
          Caption = 'Negation'
          ImageIndex = 12
          object jvivNegation: TJvImagesViewer
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            HorzScrollBar.Range = 341
            HorzScrollBar.Tracking = True
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 31
            VertScrollBar.Tracking = True
            FileMask = 
              '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
              'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
              'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
              'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
              '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
            Options.AutoCenter = False
            Options.Alignment = taLeftJustify
            Options.FrameColor = clNone
            Options.Height = 30
            Options.HorzSpacing = 1
            Options.HotTrack = False
            Options.ImagePadding = 1
            Options.MultiSelect = False
            Options.ReduceMemoryUsage = True
            Options.Transparent = True
            Options.ShowCaptions = False
            Options.VertSpacing = 1
            Options.Width = 30
            SelectedIndex = -1
            OnItemHint = LatexHint
            Align = alClient
            TabOrder = 0
            TabStop = True
            OnMouseMove = LatexMouseMove
            OnMouseUp = LatexSymbol
          end
        end
        object tbsLatexOperator: TTabSheet
          Caption = 'Operator'
          ImageIndex = 5
          object jvivOperator: TJvImagesViewer
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            HorzScrollBar.Range = 341
            HorzScrollBar.Tracking = True
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 31
            VertScrollBar.Tracking = True
            FileMask = 
              '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
              'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
              'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
              'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
              '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
            Options.AutoCenter = False
            Options.Alignment = taLeftJustify
            Options.FrameColor = clNone
            Options.Height = 30
            Options.HorzSpacing = 1
            Options.HotTrack = False
            Options.ImagePadding = 1
            Options.MultiSelect = False
            Options.ReduceMemoryUsage = True
            Options.Transparent = True
            Options.ShowCaptions = False
            Options.VertSpacing = 1
            Options.Width = 30
            SelectedIndex = -1
            OnItemHint = LatexHint
            Align = alClient
            TabOrder = 0
            TabStop = True
            OnMouseMove = LatexMouseMove
            OnMouseUp = LatexSymbol
          end
        end
        object tbsLatexRelation: TTabSheet
          Caption = 'Relation'
          ImageIndex = 6
          object jvivRelation: TJvImagesViewer
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            HorzScrollBar.Range = 341
            HorzScrollBar.Tracking = True
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 31
            VertScrollBar.Tracking = True
            FileMask = 
              '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
              'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
              'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
              'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
              '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
            Options.AutoCenter = False
            Options.Alignment = taLeftJustify
            Options.FrameColor = clNone
            Options.Height = 30
            Options.HorzSpacing = 1
            Options.HotTrack = False
            Options.ImagePadding = 1
            Options.MultiSelect = False
            Options.ReduceMemoryUsage = True
            Options.Transparent = True
            Options.ShowCaptions = False
            Options.VertSpacing = 1
            Options.Width = 30
            SelectedIndex = -1
            OnItemHint = LatexHint
            Align = alClient
            TabOrder = 0
            TabStop = True
            OnMouseMove = LatexMouseMove
            OnMouseUp = LatexSymbol
          end
        end
        object tbsLatexSky: TTabSheet
          Caption = 'Sky'
          ImageIndex = 7
          object ScrollBox4: TScrollBox
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 0
            object GroupBox26: TGroupBox
              Left = 0
              Top = 100
              Width = 341
              Height = 274
              Align = alClient
              Caption = ' Var '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 0
              object jvivSkyVar: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 259
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox27: TGroupBox
              Left = 0
              Top = 50
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Astrology '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 1
              object jvivSkyAstrology: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
            object GroupBox28: TGroupBox
              Left = 0
              Top = 0
              Width = 341
              Height = 50
              Align = alTop
              Caption = ' Solar '
              Ctl3D = False
              ParentCtl3D = False
              TabOrder = 2
              object jvivSkySolar: TJvImagesViewer
                Left = 1
                Top = 14
                Width = 339
                Height = 35
                HorzScrollBar.Range = 341
                HorzScrollBar.Tracking = True
                HorzScrollBar.Visible = False
                VertScrollBar.Range = 31
                VertScrollBar.Tracking = True
                FileMask = 
                  '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
                  'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
                  'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
                  'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
                  '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
                Options.AutoCenter = False
                Options.Alignment = taLeftJustify
                Options.FrameColor = clNone
                Options.Height = 30
                Options.HorzSpacing = 1
                Options.HotTrack = False
                Options.ImagePadding = 1
                Options.MultiSelect = False
                Options.ReduceMemoryUsage = True
                Options.Transparent = True
                Options.ShowCaptions = False
                Options.VertSpacing = 1
                Options.Width = 30
                SelectedIndex = -1
                OnItemHint = LatexHint
                Align = alClient
                TabOrder = 0
                TabStop = True
                OnMouseMove = LatexMouseMove
                OnMouseUp = LatexSymbol
              end
            end
          end
        end
        object tbsLatexUserCustom: TTabSheet
          Caption = 'User custom'
          ImageIndex = 13
          object jvivUserCustom: TJvImagesViewer
            Left = 0
            Top = 0
            Width = 341
            Height = 374
            HorzScrollBar.Range = 341
            HorzScrollBar.Tracking = True
            HorzScrollBar.Visible = False
            VertScrollBar.Range = 31
            VertScrollBar.Tracking = True
            FileMask = 
              '*.png;*.psp;*.cut;*.pcd;*.pic;*.cel;*.pbm;*.pgm;*.ppm;*.pdd;*.ps' +
              'd;*.bw;*.rgb;*.rgba;*.sgi;*.rla;*.rpf;*.scr;*.pcc;*.pcx;*.eps;*.' +
              'fax;*.tif;*.tiff;*.icb;*.tga;*.vda;*.vst;*.win;*.dib;*.rle;*.jpe' +
              'g;*.jpe;*.jpg;*.jfif;*.emf;*.wmf;*.ico;*.bmp;*.gif;*.cur;*.pcx;*' +
              '.ani;*.jpg;*.jpeg;*.bmp;*.ico;*.emf;*.wmf'
            Options.AutoCenter = False
            Options.Alignment = taLeftJustify
            Options.FrameColor = clNone
            Options.Height = 30
            Options.HorzSpacing = 1
            Options.HotTrack = False
            Options.ImagePadding = 1
            Options.MultiSelect = False
            Options.ReduceMemoryUsage = True
            Options.Transparent = True
            Options.ShowCaptions = False
            Options.VertSpacing = 1
            Options.Width = 30
            SelectedIndex = -1
            OnItemHint = LatexHint
            Align = alClient
            TabOrder = 0
            TabStop = True
            OnMouseMove = LatexMouseMove
            OnMouseUp = LatexSymbol
          end
        end
      end
    end
    object ppDeveloper: TJvNavPanelPage
      Left = 0
      Top = 0
      Width = 349
      Height = 428
      Hint = ''
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Caption = 'Developer'
      ImageIndex = 280
      object JvNavPanelDivider8: TJvNavPanelDivider
        Left = 0
        Top = 193
        Width = 349
        Height = 24
        Align = alTop
        Caption = 'Files'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
      end
      object JvNavPanelDivider9: TJvNavPanelDivider
        Left = 0
        Top = 217
        Width = 349
        Align = alTop
        Caption = 'Ini log'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 349
        Height = 193
        Align = alTop
        DataSource = modDados.dsMainBase
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect, dgTitleClick, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object memIniLog: TMemo
        Left = 0
        Top = 236
        Width = 349
        Height = 192
        Align = alClient
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBackground
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        HideSelection = False
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
      end
    end
    object ppTxt2tags: TJvNavPanelPage
      Left = 0
      Top = 0
      Width = 349
      Height = 428
      Hint = ''
      Background.Stretch = False
      Background.Proportional = False
      Background.Center = False
      Background.Tile = False
      Background.Transparent = False
      Caption = 'Txt2tags'
      ImageIndex = 230
      object JvNavPanelDivider10: TJvNavPanelDivider
        Left = 0
        Top = 0
        Width = 349
        Align = alTop
        Caption = 'Marks'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
      end
      object JvNavPanelDivider11: TJvNavPanelDivider
        Left = 0
        Top = 211
        Width = 349
        Align = alTop
        Caption = 'Macros'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
      end
      object JvNavPanelDivider12: TJvNavPanelDivider
        Left = 0
        Top = 332
        Width = 349
        Align = alBottom
        Caption = 'Settings'
        ColorFrom = 15725551
        ColorTo = 13026246
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        StyleManager = npStyle
        ExplicitTop = 386
      end
      object Panel17: TPanel
        Left = 0
        Top = 19
        Width = 349
        Height = 192
        Align = alTop
        TabOrder = 0
        object Label43: TLabel
          Tag = 1
          Left = 16
          Top = 17
          Width = 29
          Height = 13
          Caption = 'Title 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label44: TLabel
          Tag = 2
          Left = 16
          Top = 33
          Width = 29
          Height = 13
          Caption = 'Title 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label45: TLabel
          Tag = 3
          Left = 16
          Top = 50
          Width = 29
          Height = 13
          Caption = 'Title 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label46: TLabel
          Tag = 4
          Left = 16
          Top = 67
          Width = 29
          Height = 13
          Caption = 'Title 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label47: TLabel
          Tag = 5
          Left = 16
          Top = 84
          Width = 29
          Height = 13
          Caption = 'Title 5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label48: TLabel
          Tag = 6
          Left = 16
          Top = 101
          Width = 55
          Height = 13
          Caption = 'Title num. 1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label49: TLabel
          Tag = 7
          Left = 16
          Top = 118
          Width = 55
          Height = 13
          Caption = 'Title num. 2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label50: TLabel
          Tag = 8
          Left = 16
          Top = 135
          Width = 55
          Height = 13
          Caption = 'Title num. 3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label51: TLabel
          Tag = 9
          Left = 16
          Top = 152
          Width = 55
          Height = 13
          Caption = 'Title num. 4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label52: TLabel
          Tag = 10
          Left = 16
          Top = 169
          Width = 55
          Height = 13
          Caption = 'Title num. 5'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label53: TLabel
          Tag = 11
          Left = 103
          Top = 17
          Width = 21
          Height = 13
          Caption = 'Bold'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label54: TLabel
          Tag = 12
          Left = 103
          Top = 33
          Width = 22
          Height = 13
          Caption = 'Italic'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label55: TLabel
          Tag = 13
          Left = 103
          Top = 50
          Width = 45
          Height = 13
          Caption = 'Underline'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label56: TLabel
          Tag = 14
          Left = 103
          Top = 67
          Width = 27
          Height = 13
          Caption = 'Mono'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label57: TLabel
          Tag = 15
          Left = 103
          Top = 84
          Width = 29
          Height = 13
          Caption = 'Quote'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label58: TLabel
          Tag = 16
          Left = 103
          Top = 101
          Width = 16
          Height = 13
          Caption = 'List'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label59: TLabel
          Tag = 17
          Left = 103
          Top = 118
          Width = 42
          Height = 13
          Caption = 'List num.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label60: TLabel
          Tag = 18
          Left = 103
          Top = 135
          Width = 37
          Height = 13
          Caption = 'List def.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label61: TLabel
          Tag = 19
          Left = 103
          Top = 152
          Width = 20
          Height = 13
          Caption = 'Link'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label62: TLabel
          Tag = 20
          Left = 103
          Top = 169
          Width = 34
          Height = 13
          Caption = 'Anchor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label63: TLabel
          Tag = 21
          Left = 174
          Top = 17
          Width = 60
          Height = 13
          Caption = 'Verbatim line'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label64: TLabel
          Tag = 22
          Left = 174
          Top = 33
          Width = 65
          Height = 13
          Caption = 'Verbatim area'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label65: TLabel
          Tag = 23
          Left = 174
          Top = 50
          Width = 42
          Height = 13
          Caption = 'Raw text'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label66: TLabel
          Tag = 24
          Left = 174
          Top = 67
          Width = 41
          Height = 13
          Caption = 'Raw line'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label67: TLabel
          Tag = 25
          Left = 174
          Top = 84
          Width = 46
          Height = 13
          Caption = 'Raw area'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label68: TLabel
          Tag = 26
          Left = 174
          Top = 101
          Width = 29
          Height = 13
          Caption = 'Image'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label69: TLabel
          Tag = 27
          Left = 174
          Top = 118
          Width = 49
          Height = 13
          Caption = 'Comments'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label70: TLabel
          Tag = 28
          Left = 174
          Top = 135
          Width = 27
          Height = 13
          Caption = 'Table'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label71: TLabel
          Tag = 29
          Left = 174
          Top = 152
          Width = 73
          Height = 13
          Caption = 'Line sep. single'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label72: TLabel
          Tag = 30
          Left = 174
          Top = 169
          Width = 78
          Height = 13
          Caption = 'Line sep. double'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
      end
      object Panel21: TPanel
        Left = 0
        Top = 351
        Width = 349
        Height = 77
        Align = alBottom
        TabOrder = 1
        object Label73: TLabel
          Tag = 37
          Left = 24
          Top = 17
          Width = 31
          Height = 13
          Caption = 'Target'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label74: TLabel
          Tag = 38
          Left = 24
          Top = 33
          Width = 36
          Height = 13
          Caption = 'Options'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label75: TLabel
          Tag = 39
          Left = 89
          Top = 17
          Width = 65
          Height = 13
          Caption = 'Pre processor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label76: TLabel
          Tag = 40
          Left = 89
          Top = 33
          Width = 70
          Height = 13
          Caption = 'Post processor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label77: TLabel
          Tag = 41
          Left = 190
          Top = 17
          Width = 45
          Height = 13
          Caption = 'Encoding'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label78: TLabel
          Tag = 42
          Left = 190
          Top = 33
          Width = 23
          Height = 13
          Caption = 'Style'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
      end
      object Panel22: TPanel
        Left = 0
        Top = 230
        Width = 349
        Height = 102
        Align = alClient
        TabOrder = 2
        object Label79: TLabel
          Tag = 31
          Left = 16
          Top = 17
          Width = 23
          Height = 13
          Caption = 'Date'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label80: TLabel
          Tag = 32
          Left = 16
          Top = 33
          Width = 79
          Height = 13
          Caption = 'Modification time'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label81: TLabel
          Tag = 33
          Left = 141
          Top = 17
          Width = 57
          Height = 13
          Caption = 'Path source'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label82: TLabel
          Tag = 34
          Left = 141
          Top = 33
          Width = 76
          Height = 13
          Caption = 'Path destination'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label83: TLabel
          Tag = 35
          Left = 16
          Top = 51
          Width = 83
          Height = 13
          Caption = 'Table of contents'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
        object Label84: TLabel
          Tag = 36
          Left = 141
          Top = 51
          Width = 68
          Height = 13
          Caption = 'Document title'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMenuText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Transparent = True
          OnClick = LabelClick
          OnMouseEnter = LabelMouseEnter
          OnMouseLeave = LabelMouseLeave
        end
      end
    end
  end
  object JvDockClientTools: TJvDockClient
    DirectDrag = False
    DockStyle = frmTinnMain.JvDockVSNetStyle
    Left = 432
    Top = 463
  end
  object npStyle: TJvNavPaneStyleManager
    Colors.ButtonColorFrom = clWhite
    Colors.ButtonColorTo = 12435133
    Colors.ButtonHotColorFrom = 13009540
    Colors.ButtonHotColorTo = 13009540
    Colors.ButtonSelectedColorFrom = 14602190
    Colors.ButtonSelectedColorTo = 14602190
    Colors.SplitterColorFrom = 13026246
    Colors.SplitterColorTo = 9211532
    Colors.DividerColorFrom = 15725551
    Colors.DividerColorTo = 13026246
    Colors.HeaderColorFrom = 8684164
    Colors.HeaderColorTo = 8684164
    Colors.FrameColor = 8684676
    Colors.ToolPanelHeaderColorFrom = clWhite
    Colors.ToolPanelHeaderColorTo = 12435133
    Fonts.NavPanelFont.Charset = DEFAULT_CHARSET
    Fonts.NavPanelFont.Color = clWindowText
    Fonts.NavPanelFont.Height = -12
    Fonts.NavPanelFont.Name = 'Segoe UI'
    Fonts.NavPanelFont.Style = [fsBold]
    Fonts.NavPanelHotTrackFont.Charset = DEFAULT_CHARSET
    Fonts.NavPanelHotTrackFont.Color = clWindow
    Fonts.NavPanelHotTrackFont.Height = -12
    Fonts.NavPanelHotTrackFont.Name = 'Segoe UI'
    Fonts.NavPanelHotTrackFont.Style = [fsBold]
    Fonts.DividerFont.Charset = DEFAULT_CHARSET
    Fonts.DividerFont.Color = clWindowText
    Fonts.DividerFont.Height = -12
    Fonts.DividerFont.Name = 'Segoe UI'
    Fonts.DividerFont.Style = []
    Fonts.HeaderFont.Charset = DEFAULT_CHARSET
    Fonts.HeaderFont.Color = clWindow
    Fonts.HeaderFont.Height = -12
    Fonts.HeaderFont.Name = 'Arial'
    Fonts.HeaderFont.Style = [fsBold]
    Theme = nptCustom
    Left = 104
    Top = 48
  end
end
