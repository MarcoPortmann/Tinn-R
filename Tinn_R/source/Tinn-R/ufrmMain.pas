﻿{$A8,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$MINSTACKSIZE $00004000}
{$MAXSTACKSIZE $00100000}
{$IMAGEBASE $00400000}
{$APPTYPE GUI}
{$WARN SYMBOL_DEPRECATED ON}
{$WARN SYMBOL_LIBRARY ON}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_LIBRARY ON}
{$WARN UNIT_PLATFORM OFF}
{$WARN UNIT_DEPRECATED ON}
{$WARN HRESULT_COMPAT ON}
{$WARN HIDING_MEMBER ON}
{$WARN HIDDEN_VIRTUAL ON}
{$WARN GARBAGE ON}
{$WARN BOUNDS_ERROR ON}
{$WARN ZERO_NIL_COMPAT ON}
{$WARN STRING_CONST_TRUNCED ON}
{$WARN FOR_LOOP_VAR_VARPAR ON}
{$WARN TYPED_CONST_VARPAR ON}
{$WARN ASG_TO_TYPED_CONST ON}
{$WARN CASE_LABEL_RANGE ON}
{$WARN FOR_VARIABLE ON}
{$WARN CONSTRUCTING_ABSTRACT ON}
{$WARN COMPARISON_FALSE ON}
{$WARN COMPARISON_TRUE ON}
{$WARN COMPARING_SIGNED_UNSIGNED ON}
{$WARN COMBINING_SIGNED_UNSIGNED ON}
{$WARN UNSUPPORTED_CONSTRUCT ON}
{$WARN FILE_OPEN ON}
{$WARN FILE_OPEN_UNITSRC ON}
{$WARN BAD_GLOBAL_SYMBOL ON}
{$WARN DUPLICATE_CTOR_DTOR ON}
{$WARN INVALID_DIRECTIVE ON}
{$WARN PACKAGE_NO_LINK ON}
{$WARN PACKAGED_THREADVAR ON}
{$WARN IMPLICIT_IMPORT ON}
{$WARN HPPEMIT_IGNORED ON}
{$WARN NO_RETVAL ON}
{$WARN USE_BEFORE_DEF ON}
{$WARN FOR_LOOP_VAR_UNDEF ON}
{$WARN UNIT_NAME_MISMATCH ON}
{$WARN NO_CFG_FILE_FOUND ON}
{$WARN MESSAGE_DIRECTIVE ON}
{$WARN IMPLICIT_VARIANTS ON}
{$WARN UNICODE_TO_LOCALE ON}
{$WARN LOCALE_TO_UNICODE ON}
{$WARN IMAGEBASE_MULTIPLE ON}
{$WARN SUSPICIOUS_TYPECAST ON}
{$WARN PRIVATE_PROPACCESSOR ON}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
(*
  Tinn is a ASCII file editor primarily intended as a better replacement
  of the default Notepad.exe under Windows.

  This software is distributed under the terms of the GNU General
  Public License, either Version 2, June 1991 or Version 3, June 2007.
  The terms of version 2 and of the license are in a folder called
  doc (licence_gpl2.txt and licence_gpl2.txt)
  which you should have received with this software.

  See http://www.opensource.org/licenses/gpl-license.html or
  http://www.fsf.org/copyleft/gpl.html for further information.

  Copyright
  Russell May - http://www.solarvoid.com

  Tinn-R is an extension of Tinn that provides additional tools to control R
  (http://cran.r-project.org). The project is coordened by José Cláudio Faria
  (joseclaudio.faria@gmail.com).

  As such, Tinn-R is a feature-rich replacement of the basic script editor
  provided with Rgui. It provides syntax-highlighting, submission of code in
  whole, or line-by-line, and many other useful tools to ease writting and
  debugging of R code.

  Copyright
  Tinn-R team October/2005
  Tinn-R team October/2013

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 and 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*)

(*
  Basic conventions of Tinn-R to variables names:
  a   = Array                        ex: aMyArray
  b   = boolean                      ex: bMyBoolean
  ba  = TBasicAction                 ex: baMyAction
  bc  = TBufferCoord                 ex: bcMyPos
  c   = Char                         ex: cMyChar
  cb  = TComboBox                    ex: cbSyntax
  cd  = TColorDialog                 ex: cdSyntax
  ch  = PChar                        ex: chMyPChar
  cl  = Color                        ex: clMyColor
  co  = SynEditorOC                  ex: coMyEditor  // Container of the editor options
  cs  = TClientSocket                ex: csMyClient
  ctb = TControlBar                  ex: ctbMain
  d   = Double                       ex: dMyDouble
  dc  = TDisplayCoord;               ex: dcMyDC
  dt  = TMsgDlgType                  ex: dtMyType
  fd  = TFOntDialog                  ex: fdMain
  h   = handle                       ex: hMyHandle
  hk  = TfrmHotKeys                  ex: hkMyHotkeys
  i   = integer                      ex: iMyInteger
  if  = TIniFile                     ex: ifMyFile
  im  = im                           ex: imMyImage
  ks  = TKeyboardState               ex: ksMyState
  li  = TListItem                    ex: liMyItem
  lp  = LParam                       ex: lpMyLParam
  me  = TMemo                        ex: meMyMemeo
  mi  = TMenuItem                    ex: miMyMenuItem
  mr  = TModalResult                 ex: mrMyModalResult
  ms  = TMemoryStream                ex: msMyStream
  op  = TOpenDialog                  ex: opMain
  p   = TPoint                       ex: pMyPoint
  pc  = TPageControl                 ex: pcMyPageControl
  pr  = TPrintDialog                 ex: prMain
  pre = TPerlRegEx                   ex: preRegEx
  rs  = TRegExpr                     ex: rsMyReg
  s   = string                       ex: sMyString
  sd  = TSaveDialog                  ex: sdMain
  se  = TSynEdit                     ex: seMySynEdit
  see = TSynEncoding                 ex: seeANSI
  sef = TSaveFormat                  ex: sefUTF8
  sl  = TStringList                  ex: slMyStringLIst
  sm  = TSynSelectionMode            ex: smLine
  sp  = TSplitter                    ex: spMySplitter
  sr  = TSearchRec                   ex: srMySearchRec
  tb  = TTrackBar                    ex: tbDelay
  tf  = TextFile                     ex: tfMyTextFile
  tn  = TTreeNode                    ex: tnMyNode
  tob = ToolBar                      ex: tobMyBar
  ts  = TString                      ex: tsMyTString
  us  = UnicodeStrings               ex: usMyUnicodeStrings
  w   = Word                         ex: wMyWord
  wc  = WideChar                     ex: wcMWChar
*)

unit ufrmMain;
(*
  The two directives below is to
  avoide Unit or symbol "Unit FileCtrl or faArchive etc" is specific to a plataform
  under Delphi 7
*)

{ $ W A RN UNIT_PLATFORM OFF}
{ $ W A RN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, ToolWin, StdActns, ActnList, ImgList, StdCtrls, ExtCtrls,
  ClipBrd, ufrmAbout, inifiles,
  Buttons, Httpapp, trCommon,

  RegularExpressions,

  FileCtrl,AppEvnts, ShellAPI, ufrmHotKeys, trRHistory, ShellCtrls, Grids,
  DBGrids, DBCtrls,
  ScktComp, commctrl, AbArcTyp, AbUtils, AbZipper,
  AbZipKit, AbZipTyp, AbZBrows, AbMeter, AbDlgDir, AbView, AbZView, AbBrowse,
  AbBase, AbUnzper , Vcl.ActnPopup, Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,
  JvTimer, JvMenus, JvAppStorage, JvAppIniStorage, JvDockTree,
  JvDockControlForm, JvDockVIDStyle, JvDockVSNetStyle, JvComponentBase,
  System.Actions, Vcl.ActnCtrls, Registry,
  Jpeg, JvPCX, JvGIF, {JvAni, JvCursor,} JvImagesViewer,
  DateUtils, ConsoleIO, clMultiStream,
  JvDriveCtrls, JvgTypes, JvComponent, JvAppHotKey,
  DB,
  System.Generics.Collections, Vcl.ActnColorMaps, System.Types, DScintillaTypes,    ufrmEditor, ufrmTidyAbort,
  DScintillaCustom, DScintilla, SciKeyBindings, SciResLang, SciSupport,{ JvThread, }
  IdBaseComponent, IdThreadComponent, Vcl.Mask, JvThread{, JvExMask, JvToolEdit};
  {JvCustomItemViewer,} {JvExForms, }  { JvExStdCtrls, JvListBox, JvCombobox,} {JvExComCtrls,
  JvComCtrls,}



const
  WM_OPENEDITOR = WM_USER + 1;
  WM_NOTEXISTS = WM_USER + 2;
  WM_RESTOREAPP = WM_USER + 3;
  MyUniqueConst = $17031958;

  // Constants that we must pass to Windows to specify which special folder we want
  // From: http://forum.codecall.net/topic/60120-using-special-folders-to-comply-with-uac-enabled-windows-with-delphi-code/
const
  CSIDL_APPDATA = $001A; // APPDATA folder
  CSIDL_LOCAL_APPDATA = $001C; // LOCAL_APPDATA folder
  CSIDL_COMMON_APPDATA = $0023; // COMMON_APPDATA folder
  CSIDL_COMMON_DOCUMENTS = $002E; // COMMON_DOCUMENTS folder
  CSIDL_PERSONAL = $0005; // MY DOCUMENTS folder

const
  AllBrackets = ['{', '[', '(', '<', '}', ']', ')', '>'];

var
  WM_FINDINSTANCE: integer;





type
  TfrmTinnMain = class(TForm)
    actHelpAbout: TAction;
    actANSI: TAction;
    actAplicationExit: TAction;
    actAsciiChart: TAction;
    actBackupDatabase: TAction;
    actBackupSystemConfiguration: TAction;
    actBlockMark: TAction;
    actBlockUnmark: TAction;
    actCloseDVIViewer: TAction;
    actClosePDFViewer: TAction;
    actColorsPreference: TAction;
    actComment: TAction;
    actCommentsEdit: TAction;
    actCommentsHelp: TAction;
    actCompletion: TAction;
    actCopyFormatted: TAction;
    actCopyFormattedHtml: TAction;
    actCopyFormattedRtf: TAction;
    actCopyFormattedTeX: TAction;
    actCount: TAction;
    actDateStamp: TAction;
    actDeplateToDocbookArticle: TAction;
    actDeplateToDocbookBook: TAction;
    actDeplateToDocbookReference: TAction;
    actDeplateToHtml: TAction;
    actDeplateToHtmlSite: TAction;
    actDeplateToHtmlSlides: TAction;
    actDeplateToLaTeX: TAction;
    actDeplateToLaTeXDramatist: TAction;
    actDeplateToPhp: TAction;
    actDeplateToPlain: TAction;
    actDeplateToSweave: TAction;
    actDeplateToXhtmlMathMl: TAction;
    actDeplateToXhtmlTransitional: TAction;
    actDifferences: TAction;
    actDosMinimizedAlways: TAction;
    actDviOpenAlways: TAction;
    actDviOpenFile: TAction;
    actEditCopy: TAction;
    actEditCut: TAction;
    actEditorLineWrap: TAction;
    actEditPaste: TAction;
    actEditRedo: TAction;
    actEditSelectAll: TAction;
    actEditUndo: TAction;
    actFileClose: TAction;
    actFileCloseAll: TAction;
    actFileCloseLeft: TAction;
    actFileCloseOthers: TAction;
    actFileCloseRight: TAction;
    actFileNew: TAction;
    actFileOpen: TAction;
    actFilesAdd: TAction;
    actFilesAddCurrent: TAction;
    actFileSave: TAction;
    actFileSaveAll: TAction;
    actFileSaveAs: TAction;
    actFilesCloseAll: TAction;
    actFilesCloseAllOfGroup: TAction;
    actFilesFullPathUnix: TAction;
    actFilesFullPathWindows: TAction;
    actFilesOpenAll: TAction;
    actFilesOpenAllOfGroup: TAction;
    actFilesRemove: TAction;
    actFilesRemoveAllOfGroup: TAction;
    actFilesRemoveAllOfProject: TAction;
    actFind: TAction;
    actFindAgain: TAction;
    actFontDecrease: TAction;
    actFontIncrease: TAction;
    actFullPathUnix: TAction;
    actFullPathWindows: TAction;
    actGotoLine: TAction;
    actGroupCollapseAll: TAction;
    actGroupDeleteAll: TAction;
    actGroupDeleteCurrent: TAction;
    actGroupExpandAll: TAction;
    actGroupRename: TAction;
    actGrouptNew: TAction;
    actMarkersVisible: TAction;
    actHtmlOpenAlways: TAction;
    actHtmlOpenCurrentFile: TAction;
    actHtmlOpenFile: TAction;
    actIndentBlock: TAction;
    actIniLogVisible: TAction;
    actInvertCase: TAction;
    actInvertSelection: TAction;
    actLatexAlgebricFrac: TAction;
    actLatexAlgebricSqrt: TAction;
    actLatexAlgebricSqrtN: TAction;
    actLatexDimensional: TAction;
    actLatexFontBold: TAction;
    actLatexFontEnphase: TAction;
    actLatexFontFootnote: TAction;
    actLatexFontHuge: TAction;
    actLatexFontHuger: TAction;
    actLatexFontItalic: TAction;
    actLatexFontLarge: TAction;
    actLatexFontLarger: TAction;
    actLatexFontLargest: TAction;
    actLatexFontNormal: TAction;
    actLatexFontScript: TAction;
    actLatexFontSlatend: TAction;
    actLatexFontSmall: TAction;
    actLatexFontSmallcaps: TAction;
    actLatexFontTiny: TAction;
    actLatexFontTypewriter: TAction;
    actLatexFormatCenter: TAction;
    actLatexFormatEnumeration: TAction;
    actLatexFormatItemization: TAction;
    actLatexFormatLeft: TAction;
    actLatexFormatRight: TAction;
    actLatexHeaderChapter: TAction;
    actLatexHeaderParagraph: TAction;
    actLatexHeaderPart: TAction;
    actLatexHeaderSection: TAction;
    actLatexHeaderSubParagraph: TAction;
    actLatexHeaderSubSection: TAction;
    actLatexHeaderSubSubSection: TAction;
    actLatexMakeIndex: TAction;
    actLatexToDviBibtex: TAction;
    actLatexToDviSingle: TAction;
    actLatexToPdfBibtex: TAction;
    actLatexToPdfSingle: TAction;
    actLineNumbersVisible: TAction;
    actLowerCase: TAction;
    actMacroPlay: TAction;
    actMacroRecord: TAction;
    actMatchBracket: TAction;
    actOnTop: TAction;
    actOpenMaximized: TAction;
    actOpenMRU: TAction;
    actOrganizeScreen: TAction;
    actPdfOpenAlways: TAction;
    actPdfOpenFile: TAction;
    actPgFilesVisible: TAction;
    actPrint: TAction;
    actProjectClose: TAction;
    actProjectDeleteCurrent: TAction;
    actProjectEdit: TAction;
    actProjectNew: TAction;
    actProjectOpen: TAction;
    actProjectOpenNode: TAction;
    actProjectReload: TAction;
    actProjectSave: TAction;
    actProjectSaveAs: TAction;
    actProjectVisible: TAction;
    actRCardCopyDescription: TAction;
    actRcardCopyFunction: TAction;
    actRcardEdit: TAction;
    actRCardExampleSelected: TAction;
    actRCardHelp: TAction;
    actRCardHelpSelected: TAction;
    actRcardInsert: TAction;
    actRComplexDefault: TAction;
    actRContClearAll: TAction;
    actRContClearConsole: TAction;
    actRContCloseAllGraphics: TAction;
    actRContEditVariable: TAction;
    actRContEscape: TAction;
    actRContExampleSelectedWord: TAction;
    actRContFixVariable: TAction;
    actRContGuiStartClose: TAction;
    actRContHelp: TAction;
    actRContHelpSelectedWord: TAction;
    actRContListAllObjects: TAction;
    actRContListVariableNames: TAction;
    actRContListVariableStructure: TAction;
    actRContPacInstall: TAction;
    actRContPacInstalled: TAction;
    actRContPacInstallZip: TAction;
    actRContPacInstTinnRcom: TAction;
    actRContPackages: TAction;
    actRContPacLoad: TAction;
    actRContPacLoadTinnRcom: TAction;
    actRContPacNew: TAction;
    actRContPacRemove: TAction;
    actRContPacStatus: TAction;
    actRContPacUpdate: TAction;
    actRContPlotVariable: TAction;
    actRContPrintVariableContent: TAction;
    actRContRemoveAllObjects: TAction;
    actRContSetWorkDirectory: TAction;
    actRContTCPConnection: TAction;
    actRContTermStartClose: TAction;
    actRCurrentLineToTop: TAction;
    actReadOnly: TAction;
    actReformatR: TAction;
    actReload: TAction;
    actReloadLatexSymbols: TAction;
    actREnvironmentRefresh: TAction;
    actReplace: TAction;
    actRestoreDatabase: TAction;
    actRestoreSystemConfiguration: TAction;
    actRExplorerBasic: TAction;
    actRExplorerContent: TAction;
    actRExplorerEdit: TAction;
    actRExplorerExampleSelected: TAction;
    actRExplorerExpAscii: TAction;
    actRExplorerExpHtml: TAction;
    actRExplorerExpRaw: TAction;
    actRExplorerExpTeX: TAction;
    actRExplorerFix: TAction;
    actRExplorerHelp: TAction;
    actRExplorerHelpSelected: TAction;
    actRExplorerNames: TAction;
    actRExplorerPlot: TAction;
    actRExplorerRefresh: TAction;
    actRExplorerRemove: TAction;
    actRExplorerRemoveAllObjects: TAction;
    actRExplorerSendNameToClipboard: TAction;
    actRExplorerSendNameToEditor: TAction;
    actRExplorerStructure: TAction;
    actRExplorerStyle: TAction;
    actRExplorerSummary: TAction;
    actRFilterRefresh: TAction;
    actRguiReturnFocus: TAction;
    actRmirrorsCopyHost: TAction;
    actRmirrorsCopyURL: TAction;
    actRmirrorsEdit: TAction;
    actRmirrorsHelp: TAction;
    actRmirrorsOpenURLCurrent: TAction;
    actRmirrorsOpenURLDefault: TAction;
    actRmirrorsSetRepos: TAction;
    actRmirrorsUpdate: TAction;
    actRSendBlockMarked: TAction;
    actRSendClipboard: TAction;
    actRSendContiguous: TAction;
    actRSendCursorToBeginningLine: TAction;
    actRSendCursorToEndLine: TAction;
    actRSendFile: TAction;
    actRSendKnitHtml: TAction;
    actRSendKnitPdf: TAction;
    actRSendLine: TAction;
    actRSendLinesToEndPage: TAction;
    actRSendSelection: TAction;
    actRSendSweave: TAction;
    actRSimpleDefault: TAction;
    actRtermDivide: TAction;
    actRtermEditorSetFocus: TAction;
    actRtermIOandLogClear: TAction;
    actRtermIOClear: TAction;
    actRtermIOHistory: TAction;
    actRtermIOLineWrap: TAction;
    actRtermIOPrint: TAction;
    actRtermIOSave: TAction;
    actRtermIOSaveAs: TAction;
    actRtermIOSetFocus: TAction;
    actRtermIOSplitHorizontal: TAction;
    actRtermIOSplitRemove: TAction;
    actRtermIOSplitVertical: TAction;
    actRtermLoadHistory: TAction;
    actRtermLoadWorkspace: TAction;
    actRtermLogClear: TAction;
    actRtermLogLineWrap: TAction;
    actRtermLogPrint: TAction;
    actRtermLogSave: TAction;
    actRtermLogSaveAs: TAction;
    actRtermLogSetFocus: TAction;
    actRtermMaximize: TAction;
    actRtermMinimize: TAction;
    actRtermSaveHistory: TAction;
    actRtermSaveWorkspace: TAction;
    actRtermSetIOSyntaxToR: TAction;
    actRtermSetIOSyntaxToText: TAction;
    actRtermSetLogSyntaxToR: TAction;
    actRtermSetLogSyntaxToText: TAction;
    actRtermVisible: TAction;
    actRtermWarningError: TAction;
    actSearchCollapseAll: TAction;
    actSearchCollapseOne: TAction;
    actSearchExpandAll: TAction;
    actSearchExpandOne: TAction;
    actSearchInFiles: TAction;
    actShortcutsEdit: TAction;
    actShortcutsHelp: TAction;
    actShowAllBars: TAction;
    actShowAppOptions: TAction;
    actSortDate: TAction;
    actSortNumber: TAction;
    actSortString: TAction;
    actSpecialCharVisible: TAction;
    actSpell: TAction;
    actSplitHorizontal: TAction;
    actSplitRemove: TAction;
    actSplitVertical: TAction;
    actStatusBarVisible: TAction;
    actTextDefault: TAction;
    actToolsDivide: TAction;
    actToolsMaximize: TAction;
    actToolsMinimize: TAction;
    actToolsVisible: TAction;
    actTxt2tagsToDoku: TAction;
    actTxt2tagsToGwiki: TAction;
    actTxt2tagsToHtml: TAction;
    actTxt2tagsToLatex: TAction;
    actTxt2tagsToLout: TAction;
    actTxt2tagsToMan: TAction;
    actTxt2tagsToMgp: TAction;
    actTxt2tagsToMoin: TAction;
    actTxt2tagsToPm6: TAction;
    actTxt2tagsToSgml: TAction;
    actTxt2tagsToSweave: TAction;
    actTxt2tagsToTxt: TAction;
    actTxt2tagsToWiki: TAction;
    actTxt2tagsToXhtml: TAction;
    actUncomment: TAction;
    actUnindentBlock: TAction;
    actUnmarkAll: TAction;
    actUpperCase: TAction;
    actUTF16BE: TAction;
    actUTF16LE: TAction;
    actUTF8: TAction;
    actWindowArrange: TWindowArrange;
    actWindowCascade: TWindowCascade;
    actWindowMinimizeAll: TWindowMinimizeAll;
    actWindowTileHorizontal: TWindowTileHorizontal;
    actWindowTileVertical: TWindowTileVertical;
    actWinExplVisible: TAction;
    alMain: TActionList;
    cdMain: TColorDialog;
    Closeallselectedgroup2: TMenuItem;
    Copyhost1: TMenuItem;
    CopyURL1: TMenuItem;
    csREnvironment: TClientSocket;
    csRExplorer: TClientSocket;
    csRGeneral: TClientSocket;
    csRtip: TClientSocket;
    ctbMain: TControlBar;
    Exampleselected2: TMenuItem;
    Help3: TMenuItem;
    Help5: TMenuItem;
    Helpselected2: TMenuItem;
    imlProject: TImageList;
    imlRexplorer: TImageList;
    imlSearch: TImageList;
    imlStatusBar: TImageList;
    imlTinnR: TImageList;
    Insert1: TMenuItem;
    JvAppIniFileStorage: TJvAppIniFileStorage;
    JvDockServer: TJvDockServer;
    JvDockVSNetStyle: TJvDockVSNetStyle;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    N102: TMenuItem;
    N102_OLD: TMenuItem;
    N116: TMenuItem;
    N123: TMenuItem;
    N146: TMenuItem;
    N151: TMenuItem;
    N152: TMenuItem;
    N168: TMenuItem;
    N190: TMenuItem;
    N194: TMenuItem;
    N196: TMenuItem;
    N197: TMenuItem;
    N34_OLD: TMenuItem;
    N37_OLD: TMenuItem;
    N38_OLD: TMenuItem;
    N43_OLD: TMenuItem;
    N44_OLD: TMenuItem;
    n45_OLD: TMenuItem;
    N47_OLD: TMenuItem;
    N50: TMenuItem;
    N56_OLD: TMenuItem;
    N59_OLD: TMenuItem;
    N62: TMenuItem;
    N65: TMenuItem;
    N72: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    Openallselectedgroup1: TMenuItem;
    Opennode1: TMenuItem;
    OpenURLactive1: TMenuItem;
    OpenURLcurrent1: TMenuItem;
    panInvisibleParent: TPanel;
    panProjectDockSite: TPanel;
    pmemLogClear: TMenuItem;
    pmemLogClearIOLog: TMenuItem;
    pmemLogClearLog: TMenuItem;
    pmemLogEdit: TMenuItem;
    pmemLogEditCopy: TMenuItem;
    pmemLogEditCut: TMenuItem;
    pmemLogEditPaste: TMenuItem;
    pmemLogEditRedo: TMenuItem;
    pmemLogEditSelectAll: TMenuItem;
    pmemLogEditUndo: TMenuItem;
    pmemLogFile: TMenuItem;
    pmemLogFilePrint: TMenuItem;
    pmemLogFileSave: TMenuItem;
    pmemLogFileSaveAs: TMenuItem;
    pmemLogFocus: TMenuItem;
    pmemLogFocusEditor: TMenuItem;
    pmemLogFocusIO: TMenuItem;
    pmemLogFocusLog: TMenuItem;
    pmemLogHighlighter: TMenuItem;
    pmemLogLineWrap: TMenuItem;
    pmemLogShowHide: TMenuItem;
    pmemLogSize: TMenuItem;
    pmemLogSizeDivide: TMenuItem;
    pmemLogSizeMaximize: TMenuItem;
    pmemLogSizeMinimize: TMenuItem;
    pmemLogSplit: TMenuItem;
    pmemLogSplitRemove: TMenuItem;
    pmemLogSplittHorizontal: TMenuItem;
    pmemLogSplitVertical: TMenuItem;
    pmemLogSyntaxR: TMenuItem;
    pmemLogSyntaxText: TMenuItem;
    pmenComments: TJvPopupMenu;
    pmenFiles_OLD: TMenuItem;
    pmenFilesAdd_OLD: TMenuItem;
    pmenFilesAddCurrent_OLD: TMenuItem;
    pmenFilesCloseAll_OLD: TMenuItem;
    pmenFilesDeleteAllOfGroup_OLD: TMenuItem;
    pmenFilesDeleteAllOfProject_OLD: TMenuItem;
    pmenFilesDeleteCurrent_OLD: TMenuItem;
    pmenFilesFullPath: TMenuItem;
    pmenFilesFullPathUnix: TMenuItem;
    pmenFilesFullPathWindows: TMenuItem;
    pmenFilesOpenAll_OLD: TMenuItem;
    pmenGroup_OLD: TMenuItem;
    pmenGroupCollapseAll: TMenuItem;
    pmenGroupDeleteAll_OLD: TMenuItem;
    pmenGroupDeleteCurrent_OLD: TMenuItem;
    pmenGroupExpandAll: TMenuItem;
    pmenGroupNew_OLD: TMenuItem;
    pmenGroupRename_OLD: TMenuItem;
    pmenLog: TJvPopupMenu;
    pmenMainMRU: TJvPopupMenu;
    pmenProject_OLD: TMenuItem;
    pmenProjectClose_OLD: TMenuItem;
    pmenProjectDeleteCurrent_OLD: TMenuItem;
    pmenProjectMRU: TJvPopupMenu;
    pmenProjects: TJvPopupMenu;
    pmenProjectSave_OLD: TMenuItem;
    pmenProjectSaveAs_OLD: TMenuItem;
    pmenProjNew_OLD: TMenuItem;
    pmenProjOpen_OLD: TMenuItem;
    pmenProjR: TMenuItem;
    pmenProjRSendToR: TMenuItem;
    pmenProjRSetWorkDir: TMenuItem;
    pmenRcard: TJvPopupMenu;
    pmenRCardCopyDescription: TMenuItem;
    pmenRcardCopyFunction: TMenuItem;
    pmenRcardEdit: TMenuItem;
    pmenRcardEditExample: TMenuItem;
    pmenRcardHelp: TMenuItem;
    pmenResultsNewSearch: TMenuItem;
    pmenResultsOpenLink: TMenuItem;
    pmenRmirrors: TJvPopupMenu;
    pmenSearch: TJvPopupMenu;
    pmenViewToolbars: TJvPopupMenu;
    pmenViewToolbarsEdit: TMenuItem;
    pmenViewToolbarsFile: TMenuItem;
    pmenViewToolbarsFilter: TMenuItem;
    pmenViewToolbarsFormat: TMenuItem;
    pmenViewToolbarsMacro: TMenuItem;
    pmenViewToolbarsMisc: TMenuItem;
    pmenViewToolbarsProcessing: TMenuItem;
    pmenViewToolbarsR: TMenuItem;
    pmenViewToolbarsSearch: TMenuItem;
    pmenViewToolbarsShowall: TMenuItem;
    pmenViewToolbarsSpell: TMenuItem;
    pmenViewToolbarsSyntax: TMenuItem;
    pmenViewToolbarsView: TMenuItem;
    pmenWinExplorerFolders: TJvPopupMenu;
    pmenWinExplorerFoldersRefresh: TMenuItem;
    prDialog: TPrintDialog;
    zipKit: TAbZipKit;
    actRSendNavigator: TAction;
    amMain: TActionManager;
    atbRSend: TActionToolBar;
    atbRContent: TActionToolBar;
    atbRConsole: TActionToolBar;
    actnReopenPseudo: TAction;
    actRsendEchoOn: TAction;
    atbFiles: TActionToolBar;
    edFilter: TButtonedEdit;
    actnReopenPseudoFile: TAction;
    acReopenFile1: TAction;
    acReopenFile2: TAction;
    acReopenFile3: TAction;
    acReopenFile4: TAction;
    acReopenFile5: TAction;
    acReopenFile6: TAction;
    acReopenFile7: TAction;
    acReopenFile8: TAction;
    acReopenFile9: TAction;
    acReopenFile10: TAction;
    atbFind: TActionToolBar;
    atbMacro: TActionToolBar;
    atbView: TActionToolBar;
    atBookmark: TActionToolBar;
    acReopenProject1: TAction;
    acReopenProject2: TAction;
    acReopenProject3: TAction;
    acReopenProject4: TAction;
    acReopenProject5: TAction;
    acReopenProject6: TAction;
    acReopenProject7: TAction;
    acReopenProject8: TAction;
    acReopenProject9: TAction;
    acReopenProject10: TAction;
    atbFormat: TActionToolBar;
    atbStatus: TActionToolBar;
    actPseudoEncoding: TAction;
    actChaLinEndWIN: TAction;
    actSetANSI: TAction;
    actSetUTF8: TAction;
    actSetUTF16LE: TAction;
    actSetUTF16BE: TAction;
    actChaLinEndMAC: TAction;
    actChaLinEndUnix: TAction;
    actRContObjNames: TAction;
    pabWinExplorerFiles: TPopupActionBar;
    actCopyFileList: TAction;
    Copyfilelist1: TMenuItem;
    actFoldAll: TAction;
    actUnfoldAll: TAction;
    actQuote: TAction;
    actRemoveLineBreaks: TAction;
    pabRExplorer: TPopupActionBar;
    Help6: TMenuItem;
    Help7: TMenuItem;
    N78: TMenuItem;
    Example1: TMenuItem;
    Objectbasicaction1: TMenuItem;
    Removeallobjects1: TMenuItem;
    Remove1: TMenuItem;
    N79: TMenuItem;
    Summary1: TMenuItem;
    N80: TMenuItem;
    Content1: TMenuItem;
    Plot1: TMenuItem;
    Names1: TMenuItem;
    Structure1: TMenuItem;
    Edit2: TMenuItem;
    Content2: TMenuItem;
    eXexport1: TMenuItem;
    HTMLexport1: TMenuItem;
    ASCIIexport1: TMenuItem;
    Rawexport1: TMenuItem;
    N81: TMenuItem;
    Fix1: TMenuItem;
    Clipboardsend1: TMenuItem;
    Editorsend1: TMenuItem;
    Action1: TAction;
    actnHighlighterPesudo: TAction;
    cbLexers: TComboBox;
    actTemplateRScript: TAction;
    actTemplateRFunction: TAction;
    actTemplateRDataset: TAction;
    actTemplateREmpty: TAction;
    actTemplateRMarkdown: TAction;
    actTemplateRNoWeb: TAction;
    actTemplateRHTML: TAction;
    actConvertANSI: TAction;
    actConvertUTF8: TAction;
    actConvertUTF16LE: TAction;
    actConvertUTF16BE: TAction;
    actShowMenuShortcuts: TAction;
    actShowMenuCompletion: TAction;
    actDoCompletion: TAction;
    actDoComments: TAction;
    actDoRCard: TAction;
    actDoMirrors: TAction;
    actActionListToClipboard: TAction;
    actActionListToDataset: TAction;
    actDatasetToActionList: TAction;
    actTestRegEx: TAction;
    actStringReplace: TAction;
    actGetInfo: TAction;
    actShowMenuHotkeys: TAction;
    actHelpUserGuide: TAction;
    actHelpWhatsNew: TAction;
    actHelpUserList: TAction;
    actHelpEfficientUse: TAction;
    actHelpScript: TAction;
    actHelpRecognizedWords: TAction;
    actHelpDeplate: TAction;
    actHelpPandoc: TAction;
    actTxt2tags: TAction;
    actWebSelectedTextGoogle: TAction;
    actWebSelectedTextSiteSearch: TAction;
    actWebRInfoCRAN: TAction;
    actWebRNews: TAction;
    actWebRWiki: TAction;
    actWebWebsite: TAction;
    actRSet_trPaths: TAction;
    actRserver: TAction;
    pabFileTemp: TPopupActionBar;
    menFileRecentFiles2: TMenuItem;
    menProjRecent2: TMenuItem;
    actToolsPandocConversion: TAction;
    odMain: TFileOpenDialog;
    sdMain: TFileSaveDialog;
    pgFiles: TPageControl;
    pabPgFiles: TPopupActionBar;
    Close1: TMenuItem;
    Closeothers1: TMenuItem;
    Closeall1: TMenuItem;
    N1: TMenuItem;
    Closeallright1: TMenuItem;
    Closeallleft1: TMenuItem;
    N2: TMenuItem;
    actExplorerRefresh: TAction;
    Refresh1: TMenuItem;
    pabEditor: TPopupActionBar;
    File1: TMenuItem;
    Close2: TMenuItem;
    pmenEditorCloseMore1: TMenuItem;
    pmenEditorCloseOthers1: TMenuItem;
    pmenEditorCloseAll1: TMenuItem;
    N5: TMenuItem;
    pmenEditorCloseRight1: TMenuItem;
    pmenEditorCloseLeft1: TMenuItem;
    pmenEditorEdit1: TMenuItem;
    pmenEditorUndo1: TMenuItem;
    pmenEditorRedo1: TMenuItem;
    N12: TMenuItem;
    pmenEditorCopy1: TMenuItem;
    pmenEditorCut1: TMenuItem;
    pmenEditorPaste1: TMenuItem;
    N16: TMenuItem;
    pmenEditorSelectAll1: TMenuItem;
    N18: TMenuItem;
    pmenEditorComment1: TMenuItem;
    pmenEditorUncommentFirsts1: TMenuItem;
    pmenEditorUncommentAll1: TMenuItem;
    Indent2: TMenuItem;
    Unindent2: TMenuItem;
    pmenEditorFormatReformat1: TMenuItem;
    ReformatRfileorselection2: TMenuItem;
    N30: TMenuItem;
    pmenEditorSave1: TMenuItem;
    pmenEditorSaveAs1: TMenuItem;
    pmenEditorSaveAll1: TMenuItem;
    N33: TMenuItem;
    pmenEditorPrint1: TMenuItem;
    pmenEditorReload1: TMenuItem;
    pmenFilePath1: TMenuItem;
    pmenFilePathUnix1: TMenuItem;
    pmenFilePathWindows1: TMenuItem;
    pmenEditorCopyFormatted1: TMenuItem;
    popEditorCopyFormattedRTF1: TMenuItem;
    popEditorCopyFormattedHTML1: TMenuItem;
    popEditorCopyFormattedTeX1: TMenuItem;
    N36: TMenuItem;
    pmenEditorSort1: TMenuItem;
    pmenEditorSortString1: TMenuItem;
    pmenEditorSortNumber1: TMenuItem;
    pmenEditorSortDate1: TMenuItem;
    pmenEditorCount1: TMenuItem;
    N6: TMenuItem;
    N53: TMenuItem;
    Editorshowhide2: TMenuItem;
    N52: TMenuItem;
    actRQuickCommand: TAction;
    actRQuickCommand1: TMenuItem;
    summaryselection1: TMenuItem;
    namesselection1: TMenuItem;
    actFoldingVisible: TAction;
    jvMenMain: TMainMenu;
    menFile1: TMenuItem;
    menFileNew1: TMenuItem;
    menFileTemplate1: TMenuItem;
    menFileTemplateRscript1: TMenuItem;
    menFileTemplateRdoc1: TMenuItem;
    menFileTemplateRdocFunction1: TMenuItem;
    actTemplateRDatasetDiff1: TMenuItem;
    menFileTemplateRdocEmpty1: TMenuItem;
    menFileTemplateRhtml1: TMenuItem;
    menFileTemplateRmarkdown1: TMenuItem;
    menFileTemplateRsweave1: TMenuItem;
    N3: TMenuItem;
    menFileOpenAllMRU1: TMenuItem;
    menFileOpen1: TMenuItem;
    menFileRecentFiles: TMenuItem;
    menFileReload1: TMenuItem;
    N4: TMenuItem;
    menFileSave1: TMenuItem;
    menFileSaveAs1: TMenuItem;
    menFileSaveAll1: TMenuItem;
    N7: TMenuItem;
    menFileClose1: TMenuItem;
    menFileCloseAll1: TMenuItem;
    N8: TMenuItem;
    menFilePrint1: TMenuItem;
    N9: TMenuItem;
    menFileCopyFullPath1: TMenuItem;
    menFileCopyFullPathUnix1: TMenuItem;
    menFileCopyFullPathWindows1: TMenuItem;
    N10: TMenuItem;
    menFileExit1: TMenuItem;
    menProject1: TMenuItem;
    menProjProject1: TMenuItem;
    menProjProjectNew1: TMenuItem;
    menProjProjectOpen1: TMenuItem;
    N11: TMenuItem;
    menProjProjectSave1: TMenuItem;
    menProjProjectSaveAs1: TMenuItem;
    menProjProjectClose1: TMenuItem;
    N13: TMenuItem;
    menProjProjectDeleteCurrent1: TMenuItem;
    N14: TMenuItem;
    menProjGroup1: TMenuItem;
    menProjGroupNew1: TMenuItem;
    N15: TMenuItem;
    menProjGroupRename1: TMenuItem;
    N17: TMenuItem;
    menProjGroupDeleteCurrent1: TMenuItem;
    menProjGroupDeleteAll1: TMenuItem;
    N19: TMenuItem;
    menProjGroupExpandAll1: TMenuItem;
    menProjGroupCollapseAll1: TMenuItem;
    N20: TMenuItem;
    menProjFiles1: TMenuItem;
    menProjFilesOpenAll1: TMenuItem;
    menProjFilesCloseAll1: TMenuItem;
    N22: TMenuItem;
    menProjFilesOpenAllOfGroup1: TMenuItem;
    menProjFilesCloseAllOfGroup1: TMenuItem;
    N23: TMenuItem;
    menProjFilesAdd1: TMenuItem;
    menProjFilesAddCurrent1: TMenuItem;
    N24: TMenuItem;
    menProjFilesRemoveAllOfProject1: TMenuItem;
    menProjFilesRemoveAllOfGroup1: TMenuItem;
    menProjFilesRemove1: TMenuItem;
    N25: TMenuItem;
    menFilesFullPath1: TMenuItem;
    menFilesFullPathUnix1: TMenuItem;
    menFilesFullPathWindows1: TMenuItem;
    N27: TMenuItem;
    menProjRecent: TMenuItem;
    N29: TMenuItem;
    menProjEdit1: TMenuItem;
    menProjReload1: TMenuItem;
    menEdit1: TMenuItem;
    menEditUndo1: TMenuItem;
    menEditRedo1: TMenuItem;
    N31: TMenuItem;
    menEditCopy1: TMenuItem;
    menEditCut1: TMenuItem;
    menEditPaste1: TMenuItem;
    N32: TMenuItem;
    menEditCopyFormated1: TMenuItem;
    menEditCopyFormatedRtf1: TMenuItem;
    menEditCopyFormatedHtml1: TMenuItem;
    menEditCopyFormatedTex1: TMenuItem;
    N34: TMenuItem;
    menEditSelectAll1: TMenuItem;
    N35: TMenuItem;
    menEditComment1: TMenuItem;
    menEditUncommentAll1: TMenuItem;
    menEditQuoteWords1: TMenuItem;
    menEditRemoveLineBreaks1: TMenuItem;
    menFormat1: TMenuItem;
    menFormatBlockIndent1: TMenuItem;
    menFormatBlockUnident1: TMenuItem;
    InvertSelection1: TMenuItem;
    N40: TMenuItem;
    UppercaseWord1: TMenuItem;
    LowercaseWord1: TMenuItem;
    InvertCase1: TMenuItem;
    N42: TMenuItem;
    menFormatReformat1: TMenuItem;
    R1: TMenuItem;
    menMarks1: TMenuItem;
    menMarksBlock1: TMenuItem;
    menMarksMark1: TMenuItem;
    menMarksUnmark1: TMenuItem;
    N43: TMenuItem;
    menMarksUnmarkAll1: TMenuItem;
    menInsert1: TMenuItem;
    menInsertLatex1: TMenuItem;
    menInsertLatexMath1: TMenuItem;
    menInsertLatexMathDimensional1: TMenuItem;
    N44: TMenuItem;
    menInsertLatexMathFrac1: TMenuItem;
    menInsertLatexMathSqrt1: TMenuItem;
    menInsertLatexMathSqrtn1: TMenuItem;
    N45: TMenuItem;
    menInsertLatexHeader1: TMenuItem;
    menInsertLatexHeaderPart1: TMenuItem;
    menInsertLatexHeaderChapter1: TMenuItem;
    menInsertLatexHeaderSection1: TMenuItem;
    menInsertLatexHeaderSubsection1: TMenuItem;
    menInsertLatexHeaderSubsubsection1: TMenuItem;
    menInsertLatexHeaderParagraph1: TMenuItem;
    menInsertLatexHeaderSubparagraph1: TMenuItem;
    menInsertLatexFormat1: TMenuItem;
    menInsertLatexFormatItemization1: TMenuItem;
    menInsertLatexFormatEnumeration1: TMenuItem;
    N46: TMenuItem;
    menInsertLatexFormatLeft1: TMenuItem;
    menInsertLatexFormatCenter1: TMenuItem;
    menInsertLatexFormatRight1: TMenuItem;
    menInsertLatexFont1: TMenuItem;
    menInsertLatexFontEnphase1: TMenuItem;
    menInsertLatexFontBold1: TMenuItem;
    menInsertLatexFontItalic1: TMenuItem;
    menInsertLatexFontSlatend1: TMenuItem;
    menInsertLatexFontTypewriter1: TMenuItem;
    menInsertLatexFontSmallcaps1: TMenuItem;
    N48: TMenuItem;
    menInsertLatexFontTiny1: TMenuItem;
    menInsertLatexFontScriptsize1: TMenuItem;
    menInsertLatexFontFootnotsize1: TMenuItem;
    menInsertLatexFontSmall1: TMenuItem;
    menInsertLatexFontNormal1: TMenuItem;
    menInsertLatexFontLarge1: TMenuItem;
    menInsertLatexFontLarger1: TMenuItem;
    menInsertLatexFontLargest1: TMenuItem;
    menInsertLatexFontHuge1: TMenuItem;
    menInsertLatexFontHuger1: TMenuItem;
    N49: TMenuItem;
    menInserCompletion1: TMenuItem;
    N51: TMenuItem;
    menInsertDateTime1: TMenuItem;
    menSearch1: TMenuItem;
    menSearchFind1: TMenuItem;
    menSearchFindAgain1: TMenuItem;
    N54: TMenuItem;
    menSearchInFiles1: TMenuItem;
    N55: TMenuItem;
    menSearchReplace1: TMenuItem;
    N57: TMenuItem;
    menSearchGoTo1: TMenuItem;
    menOptions1: TMenuItem;
    menOptionsApplication1: TMenuItem;
    menOptionsShortcuts1: TMenuItem;
    menOptionColorPreference1: TMenuItem;
    menToolsDatabase1: TMenuItem;
    menToolsDatabaseComments1: TMenuItem;
    menToolsDatabaseMirrorsR1: TMenuItem;
    N58: TMenuItem;
    menOptionStartupFileMaximized1: TMenuItem;
    menOptionGoBack1: TMenuItem;
    menOptionAlwaysOnTop1: TMenuItem;
    menOptionReadOnlyToggle1: TMenuItem;
    Setdefaulthighlighter1: TMenuItem;
    menTools1: TMenuItem;
    menToolsProcessing1: TMenuItem;
    menToolsConversion1: TMenuItem;
    menToolsConversionDeplateTo1: TMenuItem;
    menToolsConversionDeplateToLaTeX1: TMenuItem;
    menToolsConversionDeplateToLaTeXdramastic1: TMenuItem;
    menToolsConversionDeplateToSweave1: TMenuItem;
    menToolsConversionDeplateToPlain1: TMenuItem;
    N59: TMenuItem;
    menToolsConversionDeplateToHTML1: TMenuItem;
    menToolsConversionDeplateToHtmlsite1: TMenuItem;
    menToolsConversionDeplateToHtmlslides1: TMenuItem;
    menToolsConversionDeplateToXhtml1: TMenuItem;
    menToolsConversionDeplateToXhtml2: TMenuItem;
    menToolsConversionDeplateToPhp1: TMenuItem;
    N60: TMenuItem;
    menToolsConversionDeplateToDbkarticle1: TMenuItem;
    menToolsConversionDeplateToDbkbook1: TMenuItem;
    menToolsConversionDeplateToDbkref1: TMenuItem;
    menToolsConversionPandoc: TMenuItem;
    menToolsConversionTxt2tagsTo1: TMenuItem;
    menToolsConversionTxt2tagsToLatex1: TMenuItem;
    menToolsConversionTxt2tagsToSweave1: TMenuItem;
    xt1: TMenuItem;
    N61: TMenuItem;
    menToolsConversionTxt2tagsToHTML1: TMenuItem;
    XHTML1: TMenuItem;
    SGML1: TMenuItem;
    Lout1: TMenuItem;
    Manpage1: TMenuItem;
    N63: TMenuItem;
    Wikipedia1: TMenuItem;
    GoogleCodeWiki1: TMenuItem;
    DokuWiki1: TMenuItem;
    MoinMoin1: TMenuItem;
    N64: TMenuItem;
    MagicPoint1: TMenuItem;
    PageMaker1: TMenuItem;
    menToolsCompilation1: TMenuItem;
    menToolsCompilationMinimized1: TMenuItem;
    N66: TMenuItem;
    menToolsCompilationLaTeXToDVISingle1: TMenuItem;
    menToolsCompilationLaTeXToDVIBibtex1: TMenuItem;
    N67: TMenuItem;
    menToolsCompilationLaTeXToPDFSingle1: TMenuItem;
    menToolsCompilationLaTeXToPDFBibtex1: TMenuItem;
    N68: TMenuItem;
    Makeindexmakeindex1: TMenuItem;
    menToolsViewer1: TMenuItem;
    menToolsViewerDVI1: TMenuItem;
    menToolsViewerDVIOpenAlways1: TMenuItem;
    menToolsViewerDVIOpenFile1: TMenuItem;
    menToolsViewerPDF1: TMenuItem;
    menToolsViewerPDFOpenAlways1: TMenuItem;
    menToolsViewerPDFOpenFile1: TMenuItem;
    menToolsViewerHTML1: TMenuItem;
    menToolsViewerHTMLOpenAlways1: TMenuItem;
    N69: TMenuItem;
    menToolsViewerHTMLOpenCurrent1: TMenuItem;
    menToolsViewerHTMLOpenFile1: TMenuItem;
    N70: TMenuItem;
    menToolsBackup1: TMenuItem;
    menToolsBackupSystem1: TMenuItem;
    menToolsBackupDatabase1: TMenuItem;
    menToolsRestore1: TMenuItem;
    menToolsRestoreSystem1: TMenuItem;
    menToolsRestoreDatabase1: TMenuItem;
    N71: TMenuItem;
    menToolsMacro1: TMenuItem;
    menToolsMacroRecord1: TMenuItem;
    menToolsMacroPlay1: TMenuItem;
    N73: TMenuItem;
    menToolsASCIIChart1: TMenuItem;
    menToolsDifferences1: TMenuItem;
    N84: TMenuItem;
    menToolsSpell1: TMenuItem;
    menToolsSort1: TMenuItem;
    menToolsSortString1: TMenuItem;
    menToolsSortNumber1: TMenuItem;
    menToolsSortDate1: TMenuItem;
    actCount1: TMenuItem;
    N86: TMenuItem;
    menToolsMatchBracket1: TMenuItem;
    menToolsUtils1: TMenuItem;
    menToolsUtilsTesteRegex1: TMenuItem;
    N88: TMenuItem;
    menToolsUtilsStringReplace1: TMenuItem;
    N90: TMenuItem;
    menR1: TMenuItem;
    menRStartClose1: TMenuItem;
    menRTermStartClose1: TMenuItem;
    menRGuiStartClose1: TMenuItem;
    N91: TMenuItem;
    menRserver1: TMenuItem;
    N92: TMenuItem;
    menRSet_trPaths1: TMenuItem;
    menRGet_Info1: TMenuItem;
    menRmirrors_update1: TMenuItem;
    N93: TMenuItem;
    menRterm1: TMenuItem;
    menRtermShowHide1: TMenuItem;
    N94: TMenuItem;
    menRtermFile1: TMenuItem;
    menRtermFileIO1: TMenuItem;
    menRtermFileIOSave1: TMenuItem;
    menRtermFileIOSaveAs1: TMenuItem;
    menRtermFileIOPrint1: TMenuItem;
    menRtermFileLog1: TMenuItem;
    menRtermFileLogSave1: TMenuItem;
    menRtermFileLogSaveAs1: TMenuItem;
    menRtermFileLogPrint1: TMenuItem;
    N95: TMenuItem;
    Clear1: TMenuItem;
    IO1: TMenuItem;
    Log1: TMenuItem;
    IOandLog1: TMenuItem;
    menRtermFocus1: TMenuItem;
    menRtermFocusEditor1: TMenuItem;
    menRtermFocusConsole1: TMenuItem;
    menRtermFocusLog1: TMenuItem;
    menRtermSize1: TMenuItem;
    menRtermSizeMaximize1: TMenuItem;
    mmenRtermSizeDivide1: TMenuItem;
    mmenRtermSizeMinimize1: TMenuItem;
    menRtermSplit1: TMenuItem;
    menRtermSplitHorizontal1: TMenuItem;
    menRtermSplitVertical1: TMenuItem;
    N96: TMenuItem;
    menRtermSplitRemove1: TMenuItem;
    menRtermHighlighter1: TMenuItem;
    menRtermSyntaxIO1: TMenuItem;
    menRtermSyntaxIOText1: TMenuItem;
    menRtermSyntaxIOR1: TMenuItem;
    menRtermSyntaxLog1: TMenuItem;
    menRtermSyntaxLogText1: TMenuItem;
    menRtermSyntaxLogR1: TMenuItem;
    menRtermLineWrap1: TMenuItem;
    IO2: TMenuItem;
    Log2: TMenuItem;
    N97: TMenuItem;
    menRtermHistory1: TMenuItem;
    menRtermHistorySave1: TMenuItem;
    menRtermHistoryLoad1: TMenuItem;
    N98: TMenuItem;
    menRtermHistoryPrior1: TMenuItem;
    menRtermHistoryNext1: TMenuItem;
    menRtermWorkspace1: TMenuItem;
    menRtermWorkspaceSave1: TMenuItem;
    menRtermWorkspaceLoad1: TMenuItem;
    N99: TMenuItem;
    menRtermFont1: TMenuItem;
    Increase1: TMenuItem;
    Decrease1: TMenuItem;
    N100: TMenuItem;
    menControlR1: TMenuItem;
    menControlRSetWorkDir1: TMenuItem;
    N103: TMenuItem;
    menControlRListAllObjects1: TMenuItem;
    menControlRPrintVariableContent1: TMenuItem;
    menControlRListVariableNames1: TMenuItem;
    menControlRListVariableStructure1: TMenuItem;
    menControlREditSelected1: TMenuItem;
    menControlRFixSelected1: TMenuItem;
    menControlRPlotSelected1: TMenuItem;
    N104: TMenuItem;
    menControlRClearConsole1: TMenuItem;
    menControlRCloseAllGraphicDevices1: TMenuItem;
    menControlRRemoveAllObjects1: TMenuItem;
    N105: TMenuItem;
    menControlRClearAll1: TMenuItem;
    N107: TMenuItem;
    menControlREscape1: TMenuItem;
    N109: TMenuItem;
    menControlRHelpSelected1: TMenuItem;
    menControlRExampleSelected1: TMenuItem;
    menControlRHelp1: TMenuItem;
    N110: TMenuItem;
    menRPackages1: TMenuItem;
    menRPackagesInstall1: TMenuItem;
    menRPackagesInstallfromZip1: TMenuItem;
    N111: TMenuItem;
    menRPackagesInstallTinnRcom1: TMenuItem;
    menRPackagesLoadTinnRcom1: TMenuItem;
    N112: TMenuItem;
    menRPackagesInstalled1: TMenuItem;
    menRPackagesLoad1: TMenuItem;
    menRPackagesNew1: TMenuItem;
    menRPackagesRemove1: TMenuItem;
    menRPackagesUpdate1: TMenuItem;
    menRPackagesStatus1: TMenuItem;
    N114: TMenuItem;
    memRTCPConnection1: TMenuItem;
    N115: TMenuItem;
    menRHotKeys1: TMenuItem;
    menView1: TMenuItem;
    oolsshowhide1: TMenuItem;
    oolsmaximize1: TMenuItem;
    oolsdivide1: TMenuItem;
    oolsminimize1: TMenuItem;
    N117: TMenuItem;
    OrganizescreenTinnRRgui1: TMenuItem;
    N118: TMenuItem;
    Rtermshowhide1: TMenuItem;
    Rtermmaximize1: TMenuItem;
    Rtermdivide1: TMenuItem;
    Rtermminimize1: TMenuItem;
    menViewRtermSplit1: TMenuItem;
    menViewRtermSplitHorizontal1: TMenuItem;
    menViewRtermSplitVertical1: TMenuItem;
    N119: TMenuItem;
    menViewRtermSplitRemove1: TMenuItem;
    menViewRtermSyntax1: TMenuItem;
    menViewRtermSyntaxIO1: TMenuItem;
    menViewRtermSyntaxIOText1: TMenuItem;
    menViewRtermSyntaxIOR1: TMenuItem;
    menViewRtermSyntaxLog1: TMenuItem;
    menViewRtermSyntaxLogText1: TMenuItem;
    menViewRtermSyntaxLogR1: TMenuItem;
    N120: TMenuItem;
    Wordwrap1: TMenuItem;
    Editorshowhide1: TMenuItem;
    RtermIOshowhide1: TMenuItem;
    RtermLogLinewrapshowhide1: TMenuItem;
    menViewGutter1: TMenuItem;
    menViewLineNumbers1: TMenuItem;
    Foldingshowhide1: TMenuItem;
    menViewSpecialCharacters1: TMenuItem;
    menViewStatusBar1: TMenuItem;
    menViewSplit1: TMenuItem;
    menViewSplitHorizontal1: TMenuItem;
    menViewSplitVertical1: TMenuItem;
    N121: TMenuItem;
    menViewSplitRemove1: TMenuItem;
    menWindow1: TMenuItem;
    menWindowTileVertically1: TMenuItem;
    menWindowTileHorizontally1: TMenuItem;
    N122: TMenuItem;
    menWindowMinimizeAll1: TMenuItem;
    menWindowCascade1: TMenuItem;
    menWindowArrangeIcons1: TMenuItem;
    menWeb1: TMenuItem;
    menWebRSearch1: TMenuItem;
    menWebSearchSelGoogle: TMenuItem;
    menWebSearchSelRSite: TMenuItem;
    N124: TMenuItem;
    N126: TMenuItem;
    menWebRInformation1: TMenuItem;
    menWebRInformationsCRAN: TMenuItem;
    menWebRInformationsNews: TMenuItem;
    menWebRInformationsRWiki: TMenuItem;
    menWebRInformationsWebSite: TMenuItem;
    menHelp: TMenuItem;
    menHelUserGuide: TMenuItem;
    menHelNews: TMenuItem;
    menHelSecrets: TMenuItem;
    N127: TMenuItem;
    menHelExampleOfScript: TMenuItem;
    menHelpRecognizedWords: TMenuItem;
    N128: TMenuItem;
    menHelFileConversion1: TMenuItem;
    menHelFileConversionDeplate: TMenuItem;
    menHelFileConversionPandoc: TMenuItem;
    menHelFileConversionTxt2tags: TMenuItem;
    N129: TMenuItem;
    menHelAbout1: TMenuItem;
    csMainBase: TClientSocket;
    actRLibAddSnippet: TAction;
    N76: TMenuItem;
    Addcodesnippettothelibrary1: TMenuItem;
    pabLibrary: TPopupActionBar;
    Edit3: TMenuItem;
    actDeleteCategory: TAction;
    tDataConflict: TTimer;
    tBackup: TTimer;
    tUpdateOptions: TTimer;
    tRRuning: TTimer;
    Label1: TLabel;
    Label3: TLabel;
    Invertcase2: TMenuItem;
    Uppercase1: TMenuItem;
    Lowercase1: TMenuItem;
    actAlignFirstLine: TAction;
    actAlignEqualSign: TAction;
    Align1: TMenuItem;
    Alignwithfirstline: TMenuItem;
    Insert2: TMenuItem;
    actRcardInsertNoArgs: TAction;
    Insertwithoutarguments1: TMenuItem;
    actRLibDeleteEntry: TAction;
    Deleteentryfromlibrary1: TMenuItem;
    acShowNotification: TAction;
    tNotifyTimer: TTimer;
    Button2: TButton;
    actMarkColor1: TAction;
    actMarkColor2: TAction;
    actUnMarkColor: TAction;
    N21: TMenuItem;
    Markgreen1: TMenuItem;
    Markred1: TMenuItem;
    Removecolormarks1: TMenuItem;
    Label5: TLabel;
    Sendingrulesforcoloredmarkers1: TMenuItem;
    actSendMarkColor1Only: TAction;
    actSendMarkColor2Only: TAction;
    Sendgreenmarkedtextonly1: TMenuItem;
    Sendredmarkedtextonly1: TMenuItem;
    N26: TMenuItem;
    actExcludeMarkColor1: TAction;
    actExcludeMarkColor2: TAction;
    Dontsendgreenmarkedtext1: TMenuItem;
    Dontsendredmarkedtext1: TMenuItem;
    StartupThreadShortcuts: TIdThreadComponent;
    pabIO: TPopupActionBar;
    pmemIOShowHide1: TMenuItem;
    N37: TMenuItem;
    Helpselected4: TMenuItem;
    Exampleselected3: TMenuItem;
    Help4: TMenuItem;
    N38: TMenuItem;
    pmemIOEdit1: TMenuItem;
    pmemIOUndo1: TMenuItem;
    pmemIORedo1: TMenuItem;
    N39: TMenuItem;
    pmemIOCopy1: TMenuItem;
    pmemIOCut1: TMenuItem;
    pmemIOPaste1: TMenuItem;
    N41: TMenuItem;
    pmemIOSelectAll1: TMenuItem;
    pmemIOFile1: TMenuItem;
    pmemIOFileSave1: TMenuItem;
    pmemIOFileSaveAs1: TMenuItem;
    pmemIOFilePrint1: TMenuItem;
    N77: TMenuItem;
    pmemIOClear1: TMenuItem;
    pmemIOClearIO1: TMenuItem;
    pmemIOClearIOLog1: TMenuItem;
    pmemIOFocus1: TMenuItem;
    pmemIOSetFocusEditor1: TMenuItem;
    pmemIOSetFocusConsole1: TMenuItem;
    pmemIOSetFocusLog1: TMenuItem;
    pmemIOSize1: TMenuItem;
    pmemIOSizeMaximize1: TMenuItem;
    pmemIOSizeDivide1: TMenuItem;
    pmemIOSizeMinimize1: TMenuItem;
    pmemIOSplit1: TMenuItem;
    pmemIOSplitHorizontal1: TMenuItem;
    pmemIOSplitVertical1: TMenuItem;
    N82: TMenuItem;
    pmemIOSplitRemove1: TMenuItem;
    pmemIOSHighlighter1: TMenuItem;
    pmemIOSyntaxText1: TMenuItem;
    pmemIOSyntaxR1: TMenuItem;
    pmemIOLineWrap1: TMenuItem;
    N83: TMenuItem;
    pmemIOHistory1: TMenuItem;
    pmemIOHistorySave1: TMenuItem;
    pmemIOHistoryLoad1: TMenuItem;
    N85: TMenuItem;
    pmemIOHistoryPrior1: TMenuItem;
    pmemIOWorkspace1: TMenuItem;
    pmemIOWorkspaceSave1: TMenuItem;
    pmemIOWorkspaceLoad1: TMenuItem;
    Edit4: TEdit;
    Button1: TButton;

    procedure actHelpAboutExecute(Sender: TObject);
    procedure actANSIExecute(Sender: TObject);
    procedure actAplicationExitExecute(Sender: TObject);
    procedure actAsciiChartExecute(Sender: TObject);
    procedure actBackupDatabaseExecute(Sender: TObject);
    procedure actBackupSystemConfigurationExecute(Sender: TObject);
    procedure actBlockMarkExecute(Sender: TObject);
    procedure actBlockUnmarkExecute(Sender: TObject);
    procedure actColorsPreferenceExecute(Sender: TObject);
    procedure actCommentExecute(Sender: TObject);
    procedure actCommentsEditExecute(Sender: TObject);
    procedure actCommentsHelpExecute(Sender: TObject);
    procedure actCompletionExecute(Sender: TObject);
    procedure actCopyFormattedExecute(Sender: TObject);
    procedure actCopyFormattedHtmlExecute(Sender: TObject);
    procedure actCopyFormattedRtfExecute(Sender: TObject);
    procedure actCopyFormattedTeXExecute(Sender: TObject);
    procedure actCountExecute(Sender: TObject);
    procedure actDateStampExecute(Sender: TObject);
    procedure actDeplateToDocbookArticleExecute(Sender: TObject);
    procedure actDeplateToDocbookBookExecute(Sender: TObject);
    procedure actDeplateToDocbookReferenceExecute(Sender: TObject);
    procedure actDeplateToHtmlExecute(Sender: TObject);
    procedure actDeplateToHtmlSiteExecute(Sender: TObject);
    procedure actDeplateToHtmlSlidesExecute(Sender: TObject);
    procedure actDeplateToLaTeXDramatistExecute(Sender: TObject);
    procedure actDeplateToLaTeXExecute(Sender: TObject);
    procedure actDeplateToPhpExecute(Sender: TObject);
    procedure actDeplateToPlainExecute(Sender: TObject);
    procedure actDeplateToSweaveExecute(Sender: TObject);
    procedure actDeplateToXhtmlMathMlExecute(Sender: TObject);
    procedure actDeplateToXhtmlTransitionalExecute(Sender: TObject);
    procedure actDifferencesExecute(Sender: TObject);
    procedure actDosMinimizedAlwaysExecute(Sender: TObject);
    procedure actDviOpenAlwaysExecute(Sender: TObject);
    procedure actDviOpenFileExecute(Sender: TObject);
    procedure actEditCopyExecute(Sender: TObject);
    procedure actEditCutExecute(Sender: TObject);
    procedure actEditorLineWrapExecute(Sender: TObject);
    procedure actEditPasteExecute(Sender: TObject);
    procedure actEditRedoExecute(Sender: TObject);
    procedure actEditSelectAllExecute(Sender: TObject);
    procedure actEditUndoExecute(Sender: TObject);
    procedure actFileCloseAllExecute(Sender: TObject);
    procedure actFileCloseExecute(Sender: TObject);
    procedure actFileCloseLeftExecute(Sender: TObject);
    procedure actFileCloseOthersExecute(Sender: TObject);
    procedure actFileCloseRightExecute(Sender: TObject);
    procedure actFileNewExecute(Sender: TObject);
    procedure actFileOpenExecute(Sender: TObject);
    procedure actFilesAddCurrentExecute(Sender: TObject);
    procedure actFilesAddExecute(Sender: TObject);
    procedure actFileSaveAllExecute(Sender: TObject);
    procedure actFileSaveAsExecute(Sender: TObject);
    procedure actFileSaveExecute(Sender: TObject);
    procedure actFilesCloseAllExecute(Sender: TObject);
    procedure actFilesCloseAllOfGroupExecute(Sender: TObject);
    procedure actFilesFullPathUnixExecute(Sender: TObject);
    procedure actFilesFullPathWindowsExecute(Sender: TObject);
    procedure actFilesOpenAllExecute(Sender: TObject);
    procedure actFilesOpenAllOfGroupExecute(Sender: TObject);
    procedure actFilesRemoveAllOfGroupExecute(Sender: TObject);
    procedure actFilesRemoveAllOfProjectExecute(Sender: TObject);
    procedure actFilesRemoveExecute(Sender: TObject);
    procedure actFindAgainExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure actFullPathUnixExecute(Sender: TObject);
    procedure actFullPathWindowsExecute(Sender: TObject);
    procedure actGotoLineExecute(Sender: TObject);
    procedure actGroupCollapseAllExecute(Sender: TObject);
    procedure actGroupDeleteAllExecute(Sender: TObject);
    procedure actGroupDeleteCurrentExecute(Sender: TObject);
    procedure actGroupExpandAllExecute(Sender: TObject);
    procedure actGroupRenameExecute(Sender: TObject);
    procedure actGrouptNewExecute(Sender: TObject);
    procedure actMarkersVisibleExecute(Sender: TObject);
    procedure actHtmlOpenAlwaysExecute(Sender: TObject);
    procedure actHtmlOpenCurrentFileExecute(Sender: TObject);
    procedure actHtmlOpenFileExecute(Sender: TObject);
    procedure actIndentBlockExecute(Sender: TObject);
    procedure actInvertCaseExecute(Sender: TObject);
    procedure actInvertSelectionExecute(Sender: TObject);
    procedure actLatexAlgebricFracExecute(Sender: TObject);
    procedure actLatexAlgebricSqrtExecute(Sender: TObject);
    procedure actLatexAlgebricSqrtNExecute(Sender: TObject);
    procedure actLatexDimensionalExecute(Sender: TObject);
    procedure actLatexMakeIndexExecute(Sender: TObject);
    procedure actLatexToDviBibtexExecute(Sender: TObject);
    procedure actLatexToDviSingleExecute(Sender: TObject);
    procedure actLatexToPdfBibtexExecute(Sender: TObject);
    procedure actLatexToPdfSingleExecute(Sender: TObject);
    procedure actLineNumbersVisibleExecute(Sender: TObject);
    procedure actLowerCaseExecute(Sender: TObject);
    procedure actMacroPlayExecute(Sender: TObject);
    procedure actMacroRecordExecute(Sender: TObject);
    procedure actMatchBracketExecute(Sender: TObject);
    procedure actOnTopExecute(Sender: TObject);
    procedure actOpenMaximizedExecute(Sender: TObject);
    procedure actOpenMRUExecute(Sender: TObject);
    procedure actOrganizeScreenExecute(Sender: TObject);
    procedure actPdfOpenAlwaysExecute(Sender: TObject);
    procedure actPdfOpenFileExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actProjectCloseExecute(Sender: TObject);
    procedure actProjectDeleteCurrentExecute(Sender: TObject);
    procedure actProjectEditExecute(Sender: TObject);
    procedure actProjectNewExecute(Sender: TObject);
    procedure actProjectOpenExecute(Sender: TObject);
    procedure actProjectOpenNodeExecute(Sender: TObject);
    procedure actProjectReloadExecute(Sender: TObject);
    procedure actProjectSaveAsExecute(Sender: TObject);
    procedure actProjectSaveExecute(Sender: TObject);
    procedure actRcardCopyFunctionExecute(Sender: TObject);
    procedure actRcardEditExecute(Sender: TObject);
    procedure actRCardExampleSelectedExecute(Sender: TObject);
    procedure actRCardHelpExecute(Sender: TObject);
    procedure actRCardHelpSelectedExecute(Sender: TObject);
    procedure actRcardInsertExecute(Sender: TObject);
    procedure actRComplexDefaultExecute(Sender: TObject);
    procedure actRContClearAllExecute(Sender: TObject);
    procedure actRContClearConsoleExecute(Sender: TObject);
    procedure actRContCloseAllGraphicsExecute(Sender: TObject);
    procedure actRContEditVariableExecute(Sender: TObject);
    procedure actRContEscapeExecute(Sender: TObject);
    procedure actRContExampleSelectedWordExecute(Sender: TObject);
    procedure actRContFixVariableExecute(Sender: TObject);
    procedure actRContGuiStartCloseExecute(Sender: TObject);
    procedure actRContHelpExecute(Sender: TObject);
    procedure actRContHelpSelectedWordExecute(Sender: TObject);
    procedure actRContListAllObjectsExecute(Sender: TObject);
    procedure actRContListVariableNamesExecute(Sender: TObject);
    procedure actRContListVariableStructureExecute(Sender: TObject);
    procedure actRContPacAvailableExecute(Sender: TObject);
    procedure actRContPacInstalledExecute(Sender: TObject);
    procedure actRContPacInstallExecute(Sender: TObject);
    procedure actRContPacInstallZipExecute(Sender: TObject);
    procedure actRContPacInstTinnRcomExecute(Sender: TObject);
    procedure actRContPackagesExecute(Sender: TObject);
    procedure actRContPacLoadExecute(Sender: TObject);
    procedure actRContPacLoadTinnRcomExecute(Sender: TObject);
    procedure actRContPacNewExecute(Sender: TObject);
    procedure actRContPacRemoveExecute(Sender: TObject);
    procedure actRContPacStatusExecute(Sender: TObject);
    procedure actRContPacUpdateExecute(Sender: TObject);
    procedure actRContPlotVariableExecute(Sender: TObject);
    procedure actRContPrintVariableContentExecute(Sender: TObject);
    procedure actRContRemoveAllObjectsExecute(Sender: TObject);
    procedure actRContSetWorkDirectoryExecute(Sender: TObject);
    procedure actRContTCPConnectionExecute(Sender: TObject);
    procedure actRContTermStartCloseExecute(Sender: TObject);
    procedure actRCurrentLineToTopExecute(Sender: TObject);
    procedure actReadOnlyExecute(Sender: TObject);
    procedure actReformatRExecute(Sender: TObject);
    procedure actReloadExecute(Sender: TObject);
    procedure actReloadLatexSymbolsExecute(Sender: TObject);
    procedure actREnvironmentRefreshExecute(Sender: TObject);
    procedure actReplaceExecute(Sender: TObject);
    procedure actRestoreDatabaseExecute(Sender: TObject);
    procedure actRestoreSystemConfigurationExecute(Sender: TObject);
    procedure actRExplorerBasicExecute(Sender: TObject);
    procedure actRExplorerContentExecute(Sender: TObject);
    procedure actRExplorerEditExecute(Sender: TObject);
    procedure actRExplorerExampleSelectedExecute(Sender: TObject);
    procedure actRExplorerExpAsciiExecute(Sender: TObject);
    procedure actRExplorerExpHtmlExecute(Sender: TObject);
    procedure actRExplorerExpRawExecute(Sender: TObject);
    procedure actRExplorerExpTeXExecute(Sender: TObject);
    procedure actRExplorerFixExecute(Sender: TObject);
    procedure actRExplorerHelpExecute(Sender: TObject);
    procedure actRExplorerHelpSelectedExecute(Sender: TObject);
    procedure actRExplorerNamesExecute(Sender: TObject);
    procedure actRExplorerPlotExecute(Sender: TObject);
    procedure actRExplorerRefreshExecute(Sender: TObject);
    procedure actRExplorerRemoveAllObjectsExecute(Sender: TObject);
    procedure actRExplorerRemoveExecute(Sender: TObject);
    procedure actRExplorerSendNameToClipboardExecute(Sender: TObject);
    procedure actRExplorerSendNameToEditorExecute(Sender: TObject);
    procedure actRExplorerStructureExecute(Sender: TObject);
    procedure actRExplorerStyleExecute(Sender: TObject);
    procedure actRExplorerSummaryExecute(Sender: TObject);
    procedure actRguiReturnFocusExecute(Sender: TObject);
    procedure actRmirrorsCopyHostExecute(Sender: TObject);
    procedure actRmirrorsCopyURLExecute(Sender: TObject);
    procedure actRmirrorsEditExecute(Sender: TObject);
    procedure actRmirrorsHelpExecute(Sender: TObject);
    procedure actRmirrorsOpenURLCurrentExecute(Sender: TObject);
    procedure actRmirrorsOpenURLDefaultExecute(Sender: TObject);
    procedure actRmirrorsSetReposExecute(Sender: TObject);
    procedure actRmirrorsUpdateExecute(Sender: TObject);
    procedure actRSendBlockMarkedExecute(Sender: TObject);
    procedure actRSendClipboardExecute(Sender: TObject);
    procedure actRSendContiguousExecute(Sender: TObject);
    procedure actRSendCursorToBeginningLineExecute(Sender: TObject);
    procedure actRSendCursorToEndLineExecute(Sender: TObject);
    procedure actRSendFileExecute(Sender: TObject);
    procedure actRSendKnitHtmlExecute(Sender: TObject);
    procedure actRSendKnitPdfExecute(Sender: TObject);
    procedure actRSendLineExecute(Sender: TObject);
    procedure actRSendLinesToEndPageExecute(Sender: TObject);
    procedure actRSendSelectionExecute(Sender: TObject);
    procedure actRSendSweaveExecute(Sender: TObject);
    procedure actRSimpleDefaultExecute(Sender: TObject);
    procedure actRtermDivideExecute(Sender: TObject);
    procedure actRtermEditorSetFocusExecute(Sender: TObject);
    procedure actRtermIOandLogClearExecute(Sender: TObject);
    procedure actRtermIOClearExecute(Sender: TObject);
    procedure actRtermIOHistoryExecute(Sender: TObject);
    procedure actRtermIOLineWrapExecute(Sender: TObject);
    procedure actRtermIOPrintExecute(Sender: TObject);
    procedure actRtermIOSaveAsExecute(Sender: TObject);
    procedure actRtermIOSaveExecute(Sender: TObject);
    procedure actRtermIOSetFocusExecute(Sender: TObject);
    procedure actRtermIOSplitHorizontalExecute(Sender: TObject);
    procedure actRtermIOSplitRemoveExecute(Sender: TObject);
    procedure actRtermIOSplitVerticalExecute(Sender: TObject);
    procedure actRtermLoadHistoryExecute(Sender: TObject);
    procedure actRtermLoadWorkspaceExecute(Sender: TObject);
    procedure actRtermLogClearExecute(Sender: TObject);
    procedure actRtermLogLineWrapExecute(Sender: TObject);
    procedure actRtermLogPrintExecute(Sender: TObject);
    procedure actRtermLogSaveAsExecute(Sender: TObject);
    procedure actRtermLogSaveExecute(Sender: TObject);
    procedure actRtermLogSetFocusExecute(Sender: TObject);
    procedure actRtermMaximizeExecute(Sender: TObject);
    procedure actRtermMinimizeExecute(Sender: TObject);
    procedure actRtermSaveHistoryExecute(Sender: TObject);
    procedure actRtermSaveWorkspaceExecute(Sender: TObject);
    procedure actRtermSetIOSyntaxToRExecute(Sender: TObject);
    procedure actRtermSetIOSyntaxToTextExecute(Sender: TObject);
    procedure actRtermSetLogSyntaxToRExecute(Sender: TObject);
    procedure actRtermSetLogSyntaxToTextExecute(Sender: TObject);
    procedure actRtermVisibleExecute(Sender: TObject);
    procedure actRtermWarningErrorExecute(Sender: TObject);
    procedure actRtipInsertExecute(Sender: TObject);
    procedure actSearchCollapseAllExecute(Sender: TObject);
    procedure actSearchCollapseOneExecute(Sender: TObject);
    procedure actSearchExpandAllExecute(Sender: TObject);
    procedure actSearchExpandOneExecute(Sender: TObject);
    procedure actSearchInFilesExecute(Sender: TObject);
    procedure actShortcutsCustomizationSaveExecute(Sender: TObject);
    procedure actShortcutsEditExecute(Sender: TObject);
    procedure actShortcutsHelpExecute(Sender: TObject);
    procedure actShowAllBarsExecute(Sender: TObject);
    procedure actShowAppOptionsExecute(Sender: TObject);
    procedure actSortDateExecute(Sender: TObject);
    procedure actSortNumberExecute(Sender: TObject);
    procedure actSortStringExecute(Sender: TObject);
    procedure actSpecialCharVisibleExecute(Sender: TObject);
    procedure actSplitHorizontalExecute(Sender: TObject);
    procedure actSplitRemoveExecute(Sender: TObject);
    procedure actSplitVerticalExecute(Sender: TObject);
    procedure actStatusBarVisibleExecute(Sender: TObject);
    procedure actToolsDivideExecute(Sender: TObject);
    procedure actToolsMaximizeExecute(Sender: TObject);
    procedure actToolsMinimizeExecute(Sender: TObject);
    procedure actToolsVisibleExecute(Sender: TObject);
    procedure actTxt2tagsToDokuExecute(Sender: TObject);
    procedure actTxt2tagsToGwikiExecute(Sender: TObject);
    procedure actTxt2tagsToHtmlExecute(Sender: TObject);
    procedure actTxt2tagsToLatexExecute(Sender: TObject);
    procedure actTxt2tagsToLoutExecute(Sender: TObject);
    procedure actTxt2tagsToManExecute(Sender: TObject);
    procedure actTxt2tagsToMgpExecute(Sender: TObject);
    procedure actTxt2tagsToMoinExecute(Sender: TObject);
    procedure actTxt2tagsToPm6Execute(Sender: TObject);
    procedure actTxt2tagsToSgmlExecute(Sender: TObject);
    procedure actTxt2tagsToSweaveExecute(Sender: TObject);
    procedure actTxt2tagsToTxtExecute(Sender: TObject);
    procedure actTxt2tagsToWikiExecute(Sender: TObject);
    procedure actTxt2tagsToXhtmlExecute(Sender: TObject);
    procedure actUncommentExecute(Sender: TObject);
    procedure actUnindentBlockExecute(Sender: TObject);
    procedure actUnmarkAllExecute(Sender: TObject);
    procedure actUpperCaseExecute(Sender: TObject);
    procedure actUTF16BEExecute(Sender: TObject);
    procedure actUTF16LEExecute(Sender: TObject);
    procedure actUTF8Execute(Sender: TObject);
    procedure actWindowArrangeExecute(Sender: TObject);
    procedure actWindowCascadeExecute(Sender: TObject);
    procedure actWindowMinimizeAllExecute(Sender: TObject);
    procedure actWindowTileHorizontalExecute(Sender: TObject);
    procedure actWindowTileVerticalExecute(Sender: TObject);
    procedure csREnvironmentError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: integer);
    procedure csREnvironmentRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRExplorerError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: integer);
    procedure csRGeneralConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRGeneralDisconnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRGeneralError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: integer);
    procedure csRGeneralRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRtipError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: integer);
    procedure FormCloseQuery(Sender: TObject; var bCanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDragDrop(Sender, Source: TObject; X, Y: integer);
    procedure FormDragOver(Sender, Source: TObject; X, Y: integer;
      State: TDragState; var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure LatexAccents(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure LatexFont(Sender: TObject);
    procedure LatexFontSize(Sender: TObject);
    procedure LatexFormat(Sender: TObject);
    procedure LatexHeader(Sender: TObject);

    procedure menChaLinEndMACClick(Sender: TObject);
    procedure menChaLinEndWINClick(Sender: TObject);
    procedure menFileTemplateRhtmlClick(Sender: TObject);
    procedure menHelpEnglishChanges_t2tClick(Sender: TObject);
    procedure menRtermHistoryNextClick(Sender: TObject);
    procedure menRtermHistoryPriorClick(Sender: TObject);
    procedure menWebRguiJGRClick(Sender: TObject);
    procedure menWebRGuiRStudioClick(Sender: TObject);
    procedure panProjectDockSiteDockDrop(Sender: TObject;
      Source: TDragDockObject; X, Y: integer);
    procedure panProjectDockSiteUnDock(Sender: TObject; Client: TControl;
      NewTarget: TWinControl; var Allow: Boolean);
    procedure pgFilesChange(Sender: TObject);
    procedure pgFilesDragDrop(Sender, Source: TObject; X, Y: integer);
    procedure pgFilesDragOver(Sender, Source: TObject; X, Y: integer;
      State: TDragState; var Accept: Boolean);
    procedure pgFilesMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure pmenProjRSendToRClick(Sender: TObject);
    procedure pmenProjRSetWorkDirClick(Sender: TObject);
    procedure pmenResultsOpenLinkClick(Sender: TObject);
    procedure pmenResultsOpenLinkMeasureItem(Sender: TObject; ACanvas: TCanvas;
      var Width, Height: integer);
    procedure pmenRResContTCPConnectionClick(Sender: TObject);
    procedure RecentFileClick(Sender: TObject);
    procedure sdMainShow(Sender: TObject);
    procedure sdMainTypeChange(Sender: TObject);
  //  procedure stbMainClick(Sender: TObject);

    procedure synIOClick(Sender: TObject);
    procedure synIOEnter(Sender: TObject);
//    procedure synPaintTransient(Sender: TObject; Canvas: TCanvas;
 //     TransientType: TTransientType);


    procedure tbReloadClick(Sender: TObject);
    procedure tRRuningTimer(Sender: TObject);
    procedure tUpdateOptionsTimer(Sender: TObject);
    procedure actRSendNavigatorExecute(Sender: TObject);
    procedure tBackupTimer(Sender: TObject);
    procedure acReopenProject1Execute(Sender: TObject);
    procedure acReopenProject2Execute(Sender: TObject);
    procedure acReopenProject3Execute(Sender: TObject);
    procedure acReopenProject5Execute(Sender: TObject);
    procedure acReopenProject6Execute(Sender: TObject);
    procedure acReopenProject7Execute(Sender: TObject);
    procedure acReopenProject8Execute(Sender: TObject);
    procedure acReopenProject9Execute(Sender: TObject);
    procedure acReopenProject10Execute(Sender: TObject);
    procedure actnReopenPseudoExecute(Sender: TObject);
    procedure acReopenProject4Execute(Sender: TObject);
    procedure actRsendEchoOnExecute(Sender: TObject);
    procedure edFilterRightButtonClick(Sender: TObject);
    procedure edFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actnReopenPseudoFileExecute(Sender: TObject);
    procedure acReopenFile1Execute(Sender: TObject);
    procedure acReopenFile2Execute(Sender: TObject);
    procedure acReopenFile3Execute(Sender: TObject);
    procedure acReopenFile4Execute(Sender: TObject);
    procedure acReopenFile5Execute(Sender: TObject);
    procedure acReopenFile6Execute(Sender: TObject);
    procedure acReopenFile7Execute(Sender: TObject);
    procedure acReopenFile8Execute(Sender: TObject);
    procedure acReopenFile9Execute(Sender: TObject);
    procedure acReopenFile10Execute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure edFilterKeyPress(Sender: TObject; var Key: Char);
    procedure Action1Execute(Sender: TObject);
    procedure actPseudoEncodingExecute(Sender: TObject);
    procedure actChaLinEndWINExecute(Sender: TObject);

    procedure actSetANSIExecute(Sender: TObject);
    procedure actSetUTF8Execute(Sender: TObject);
    procedure actSetUTF16LEExecute(Sender: TObject);
    procedure actSetUTF16BEExecute(Sender: TObject);
    procedure actChaLinEndMACExecute(Sender: TObject);
    procedure actChaLinEndUnixExecute(Sender: TObject);
    procedure actRContObjNamesExecute(Sender: TObject);
    procedure actCopyFileListExecute(Sender: TObject);
    procedure actUnfoldAllExecute(Sender: TObject);
    procedure actFoldAllExecute(Sender: TObject);
    procedure synEditPrintPrintLine(Sender: TObject; LineNumber,
      PageNumber: Integer);
    procedure SaveEditorKeystrokes;
    procedure actQuoteExecute(Sender: TObject);
    procedure actRemoveLineBreaksExecute(Sender: TObject);
    procedure csRExplorerWrite(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRExplorerRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure actnHighlighterPesudoExecute(Sender: TObject);
    procedure cbLexersSelect(Sender: TObject);
    procedure actTemplateRScriptExecute(Sender: TObject);
    procedure actTemplateRFunctionExecute(Sender: TObject);
    procedure actTemplateRDatasetExecute(Sender: TObject);
    procedure actTemplateREmptyExecute(Sender: TObject);
    procedure actTemplateRMarkdownExecute(Sender: TObject);
    procedure actTemplateRNoWebExecute(Sender: TObject);
    procedure actTemplateRHTMLExecute(Sender: TObject);
    procedure actDoCommentsExecute(Sender: TObject);
    procedure actDoRCardExecute(Sender: TObject);
    procedure actDoMirrorsExecute(Sender: TObject);
    procedure actTestRegExExecute(Sender: TObject);
    procedure actStringReplaceExecute(Sender: TObject);
    procedure actShowMenuHotkeysExecute(Sender: TObject);
    procedure actHelpUserGuideExecute(Sender: TObject);
    procedure actHelpWhatsNewExecute(Sender: TObject);
    procedure actHelpEfficientUseExecute(Sender: TObject);
    procedure actHelpScriptExecute(Sender: TObject);
    procedure actHelpRecognizedWordsExecute(Sender: TObject);
    procedure actHelpDeplateExecute(Sender: TObject);
    procedure actHelpPandocExecute(Sender: TObject);
    procedure actTxt2tagsExecute(Sender: TObject);
    procedure actWebSelectedTextGoogleExecute(Sender: TObject);
    procedure actWebSelectedTextSiteSearchExecute(Sender: TObject);
    procedure actWebRInfoCRANExecute(Sender: TObject);
    procedure actWebRNewsExecute(Sender: TObject);
    procedure actWebRWikiExecute(Sender: TObject);
    procedure actWebWebsiteExecute(Sender: TObject);
    procedure actRSet_trPathsExecute(Sender: TObject);
    procedure actRserverExecute(Sender: TObject);
    procedure actToolsPandocConversionExecute(Sender: TObject);
    procedure actExplorerRefreshExecute(Sender: TObject);
    procedure actRQuickCommandExecute(Sender: TObject);
    procedure summaryselection1Click(Sender: TObject);
    procedure namesselection1Click(Sender: TObject);
    procedure actFoldingVisibleExecute(Sender: TObject);
    procedure csMainBaseError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure csMainBaseRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure csRExplorerConnect(Sender: TObject; Socket: TCustomWinSocket);
    procedure tDataConflictTimer(Sender: TObject);
    procedure actDeleteCategoryExecute(Sender: TObject);
    procedure actAlignFirstLineExecute(Sender: TObject);
    procedure actAlignEqualSignExecute(Sender: TObject);
    procedure actRLibAddSnippetExecute(Sender: TObject);
    procedure actRcardInsertNoArgsExecute(Sender: TObject);
    procedure actRLibDeleteEntryExecute(Sender: TObject);
    procedure acShowNotificationExecute(Sender: TObject);
    procedure tNotifyTimerTimer(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure actMarkColor1Execute(Sender: TObject);
    procedure actMarkColor2Execute(Sender: TObject);
    procedure actUnMarkColorExecute(Sender: TObject);

// Refactor: move to a common file, e.g. uRSendCommands
//    function GetSelectionToReformat(sSel: string): string;
//    function GetFileToReformat: string;
    procedure StartupThreadShortcutsRun(Sender: TIdThreadComponent);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  {  sLookupName: String;
    iLookupCursor: Integer;
    sciLookup: TDScintilla;      }

    aOpenFileSearch: Array of Integer;
    aImg: Array [0 .. 9] of TBitmap;
    bAlreadyOrganized: Boolean;
    bAskActualizeChangedFiles: Boolean;

    bConectionError: Boolean;
    bDataCompletionAnywhere: Boolean;
    bFirstActivated: Boolean;
    bInExecute: Boolean;

    bMinimizeTinnAfterLastFile: Boolean;
    bOnTop: Boolean;
    bOrganizeAutomatically: Boolean;
    bRestored: Boolean;
    bRestoreIniDock: Boolean;
    bRget_Info: Boolean;
    bRKnitr: Boolean;
    bRmirros_Update: Boolean;

    bBackgroundConnectionErrorWarning: Boolean;

    bRsvSocket_Connect: Boolean;
    bRtermCloseWithoutAsk: Boolean;
    bRtermHorizontal: Boolean; // IO disposition for IO and Log in the same view
    bRtermOptionCancel: Boolean;


    bRTinnRcom_Info: Boolean;
    bRTinnRcom_Install: Boolean;
    bRTinnRcom_Installed: Boolean;
    bRTinnRcom_Load: Boolean;
    bRTinnRcom_Loaded: Boolean;
    bRTinnRcom_Updating: Boolean;

    bRUseLatest: Boolean;
    bSearchDirectory: Boolean;
    bSearchInSub: Boolean;
    bSearchOpenFiles: Boolean;
    bShortcutsLoaded: Boolean;
    bStartingUp: Boolean;
    bStartOptionsWithProcessingPage: Boolean;
    bStartOptionsWithRPage: Boolean;

    hkTinnR: TfrmHotKeys;


    iDefaultLexerId: Integer;

    iLastFile: integer;
    iLastSearch: integer;

//    iLogSyntax: integer;

    iOldHeight: integer;
    iOldLeft: integer;
    iOldTop: integer;
    iOldWidth: integer;
    iReformatRSplit: integer;
//    iRFormatted: integer;
    iRguiTinnRDisposition: integer;
    iRguiTinnRProportion: integer;

    iRtermDockHeight: integer;
    iRtermDockWidth: integer;
    iTimerCounter: integer;
    iToolsDockHeight: integer;
    iToolsDockWidth: integer;
    iViewStyleRExplorer: integer;
    mrTinnRcom_Install: TModalResult;
    pThread: Pointer;
    rsSearch: TRegEx;

    sAppData: string;



    sDataCompletion: string;
    sEncodingDefault: string;
    sFileLatexOrigin: string;
    sGuiRRunning: string;
    sIniDockFilePath: string;
    slFileMRU: TStringList;
    slProject: TStringList;
    slProjectChanges: TStringList;
    slprojectMRU: TStringList;
    slRLibPaths: TStringList;
    slTextDiff: TStringList;
    sNotifyLongText: String;
//    sOldPreferencesTmp: string;
    sParDeplate: string;
    sParDviBibtex: string;
    sParDviSingle: string;
    sParPdfBibtex: string;
    sParPdfSingle: string;
    sParRgui: string;
    sParRterm: string;
    sParTxt2tags: string;
    sPath_Pandoc: string;
    sPathBkp: string;
    sPathDeplate_Converter: string;
    sPathDeplate_Interpreter: string;
    sPathEditor: string;
    sPathIni: string;
    sPathIniEditor_Tmp: string;
    sPathIniTinn_Tmp: string;
    sPathLatex: string;
    sPathR: string;
    sPathR_Connected: string;
    sPathRgui: string;
    sPathRterm: string;
    sPathTinnRcom_Installed: string;
    sPathTxt2tags_Converter: string;
    sPathTxt2tags_Interpreter: string;
    sProjectName: string;

    sRIOSaved: string;
    sRLogSaved: string;
    sSearchDirHistory: string;
    sSearchFileMaskHistory: string;
    sTipFromRServer: string;
    sTriggerRDataCompletion: string;
    sTriggerRtip: string;
    sVersion_Cache: string;
    sVersion_Comments: string;
    sVersion_Ini: string;
    sVersion_Latex: string;
    sVersion_Rcard: string;
    sVersion_Rmirrors: string;
    sVersion_Shortcuts: string;
    sVersion_TinnRcomInstalled: string;
    sWindowOption: string;
    tnGenericGroup: TTreeNode;
    FRecentProjectActions: TList<TAction>;
    FRecentFileActions: TList<TAction>;

//    function ActivePanel: integer;
//    function CheckConnection: Boolean;
    function CloseAllFilesOfProject: Boolean;
    function FileExistsAsNode(var iPos: integer; sFile: string): Boolean;
    function FindWindowByName(sName: string): integer;
    function FindWindowById(Id: integer): integer;
    function FindWord: string;
    function GenericGroupExists: Boolean;
    function GetEncodingDefault: string;
    function GetFile(var bSingleLine: Boolean): string;

//    function GetFocus: integer;


    function GroupExistsAsNode(sGroupName: string): Boolean;
    function MessageDlg(const sMsg: string; mdType: TMsgDlgType;
      mdButtons: TMsgDlgButtons; iHelp: integer): integer;

    function StripRegExPower(sSearchText: string): string;
    procedure AddFile(iFile: string);
    procedure BackupSystemConfiguration(bStarting: Boolean);
    procedure BuildMRU(var miItem: TMenuItem);
    procedure BuildProjectMRU(var miItem: TMenuItem);
    procedure CheckData;
//    procedure CheckEditorOptions;
    procedure CheckIfProjectWasChanged;
    procedure CheckIniAndData;
    procedure CheckIniDock;
    procedure CheckLatex(bReload: Boolean);
    procedure ProduceDebugOutput;
    procedure CheckProcessingPath(sPath: string);
//    procedure CheckTinnRcom_Package;
    procedure CheckVersion;
    procedure ClearStatusBarProject;
    procedure CloseAllFilesOfGroup;
    procedure CompileLaTeX(sMikPar, sBibPar, sExtension: string;
      bWait: Boolean);
    procedure ControlResources(bOption: Boolean);
    procedure CreateGroup(sGroupName: string);
    procedure CreateProject;
    procedure DoClearConsole;
    procedure DoIPConnection(sIPHost: string; iIPPort: integer;
      bActive: Boolean);
    procedure DoShowHide(iTmp1, iTmp2: integer; bShow: Boolean = True);
    procedure DoTxt2Tag(iButton: integer);
    procedure DoUndoAutoHideRterm;
    procedure DoUndoAutoHideTools;
    procedure FileConversion(sParameter, sExtension, sPathConversor: string;
      sPathInterpreter: string = ''; bWait: Boolean = True);
    procedure FileSaveGeneric(sFile: string; sciEditor: TDScintilla);
//    procedure GetCallTip(var sRObject, sRPackage, sRTip: string;
 //     var bTipFound: Boolean);
    procedure GetComments;
    procedure GetCompletion(var sRObject, sRPackage, sCompletion: string);

    function  GetNewUniqueEditorId: Integer;
//    procedure InsertLatexMath(sFunction: string; iCaretControl: integer);
    procedure LoadEditorKeystrokes;


    procedure MakeTemplate(sTemplateFile: string; iHiglighterID: Integer);
    procedure MatchBracket(seEditor: TDScintilla);
    procedure MySort(iSort: integer);
    procedure OnTop(hHandle: HWND);
    procedure OpenFileWithViewer(sFilter, sDefaultExt: string);
    procedure OpenHelpFile(sFileToOpen: string);
    procedure OpenProject;
    procedure OpenProjectIntoTinn(sProjectName: string);
    procedure PandocConversion(sPandocInstruction, sPandocFrom,
      sPandocTo: string; bWait: Boolean = True);
    procedure RecentProjectFileClick(Sender: TObject);
    procedure RecentProjectOpen(sfilename: String);
    procedure RecordActions(baAction: TBasicAction; var bHandled: Boolean);
    procedure ReRecordTabOrder;
    procedure RMenu(bOption: Boolean);
    procedure RmirrorsInterface_Update;
    procedure RtermHide;
    procedure RtermShow;

{    procedure SaveNewIni_Application;
    procedure SaveNewIni_Editor;  }
    procedure SaveProject;
    procedure SearchInDirectories(const sDir, sMask: string;
      var iFileCount, iMatchCount, iTotFileCount: integer);
    procedure SearchInOpenFiles(var iFileCount, iMatchCount: integer);
    procedure SendResources(bOption: Boolean);
//    procedure SetBuffer_FileFormat(ff: TSynEditFileFormat);
//    procedure SetBuffer_SaveFormat(sf: TSaveFormat);
    procedure SetCompletion;
    procedure SetEncodingDefault(sTmp: string);
    procedure SetAllTinnRPaths;
    procedure SetIniStructure;
    procedure SetInterfaceSize(frm: TForm; iSize: integer);
    procedure SetPreferences_Application;
    procedure SetPreferences_Editor;
    procedure SetRcard;
    procedure SetRExplorer(bOption: Boolean);
    procedure SetRmirrors;

    procedure SetupSearchParameters(sSearchText: string);
    procedure SortProject;
//    procedure StartSocketServer_svSocket;
    procedure TabMenuPopup(pcTmp: TPageControl; X, Y: integer);
//    procedure TinnRcomInstall_AskUser(bMessageDlg: Boolean = True);
    procedure ToolsProjectControls(bOption: Boolean);
    procedure ToolsSearchControls(bOption: Boolean);
    procedure TraverseDir(sPath: string; var tsFileList: TStringList;
      sMask: string);
    procedure UdatePgFiles;
    procedure UnpackFile(sFile, sPath, sChoice: string);
    procedure UpdateBars(bOption: Boolean);
    procedure UpdateCloseFileOptions;
//    procedure UpdateFile(var seEditor: TSynEdit;
//      var smOption: TSynSelectionMode);
    // procedure UpdateFileIntoTinn(sFile: string; iLineNumberJump: integer = 0);
    procedure UpdateOptions;
    procedure UpdateProjectMRU(var miItem: TMenuItem; sfilename: string);

    Procedure UpdateRterm_Appearance(bUpdate_FontSize: Boolean = True);
    procedure WMCopyData(var msg: TWMCopyData); message WM_COPYDATA;
    procedure WMDropFiles(var msg: TWMDropFiles); message WM_DROPFILES;
    procedure WMSysCommand(var msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure WriteIniFile_Application(bMakingBackup: Boolean);
    procedure WriteIniFile_Editor(bMakingBackup: Boolean);
    function WriteAppDataToIniFile(ifFile: TIniFile;
      DeleteslprojectMRU: Boolean = False): Boolean;
    function  GetFocusedObject: TWinControl;




  public
    { Public declarations }
    abortDialog: TfrmTidyAbort;
    ajavHK: array [1 .. 20] of TJvApplicationHotKey; // R Hotkeys
    ajavHKC: array [1 .. 20] of TJvApplicationHotKey; // R Hotkeys Custom
    aRC: array [1 .. 20] of string; // R Custom

    bAllNames: Boolean;
    bBackup: Boolean;
    bbBOM: Boolean;
    bCloseCanceled: Boolean;
    bConnectionBeepOnError: Boolean;
    bDatabaseRestored: Boolean;
    bDoInsert: Boolean;

    bRtermSimple: Boolean; // IO and Log in the same view
    bTidying: Boolean;

    bUpdate_Cache: Boolean;
    bUpdate_Comments: Boolean;
    bUpdate_Completion: Boolean;
    bUpdate_Latex: Boolean;
    bUpdate_Rcard: Boolean;
    bUpdate_Rmirrors: Boolean;
    bUpdate_Shortcuts: Boolean;

    sCurrentVersion_Cache: string;
    sCurrentVersion_Comments: string;

    sCurrentVersion_Latex: string;
    sCurrentVersion_Rcard: string;
    sCurrentVersion_Rmirrors: string;
    sCurrentVersion_Shortcuts: string;


    acHighlightersCI:  Array of TActionClientItem;
    acHighlighters:  Array of TAction;

    acHighlightersCIDefault:  Array of TActionClientItem;
    acHighlightersDefault:  Array of TAction;


    // Editor Preferences
{

    bShowLineNumbers: Boolean;
    bShowMarkers: Boolean;
    bShowFolding: Boolean;

    }
    bHighlightActiveLine: Boolean;

    iEditorLineWrap: Integer;
    iIOLineWrap: Integer;
    iLogLineWrap: Integer;

    iHighlightActiveLineColor: Integer;
    ifTinn: TIniFile;

    // Names popup
    iObjectCallID: Integer;

    iActivePopupPosition: Integer;
    sciActivePopupEditor: TDScintilla;
    sActivePopupObject: String;
    iActivePopupIndicatorStart: Integer;


    bEchoOn: Boolean;
    bIPLocal: Boolean;
    // It controls the type of TCPIP connection: False: Remote, True: Local
    bIPRemoteConnected: Boolean;
    bNameFormActive: Boolean;
    bNameFormLoading: Boolean;
    bPrintColors: Boolean;
    bPrintFileName: Boolean;
    bPrintLineNumber: Boolean;

    bPrintPageNumber: Boolean;
    bPrintSyntaxColor: Boolean;
    bProjectChanged: Boolean;
    bRArchitecture64: Boolean;
    bRAsServer: Boolean;
    bReopenFiles: Boolean;
    bRememberFileState: Boolean;
    bRememberSearchList: Boolean;
    bRemoveExtension: Boolean;
    bRExplorerActive: Boolean;
    bRguiReturnFocus: Boolean;
    bRRequireKnitr: Boolean;
    bRObjectsUpdate: Boolean;
    bTCPIPRunning: Boolean;
    bRTCPIPConsoleEcho: Boolean;
    bRTCPIPConsoleUse: Boolean;
    bRtermBeepOnError: Boolean;
    bRtermFindError: Boolean;
    bSearchSelectionOnly: Boolean;
    bSearchBackwards: Boolean;
    bSearchCaseSensitive: Boolean;
    bSearchFromCursor: Boolean;
    bSearchRegExp: Boolean;
    bSearchWholeWords: Boolean;

    bRSendAll: Boolean;
    bRSmartSend: Boolean;
    bScrollSendingLines: Boolean;
    bselectedToPreview: Boolean;
    bTinnRHotKeysActive: Boolean;
    bUndoAfterSave: Boolean;
    hRgui: HWND;
    iAlphaBlendValue: integer;
    iBackupInterval: integer;
    iCommentsBeforeChanges: integer;
    iCompletionBeforeChanges: integer;
    iCountriesFilter: integer;

    iColorMark1: Integer;
    iColorMark2: Integer;


{
    iCols: integer;
    iLatexDimensionalElement: integer;
    iRows: integer;
}
    // m.p. - new R connection stuff
    iServerConnectionTrial: Integer;

    iDelay: integer;

    iPrintLineWrap: Integer;
    iDragLevel: integer;
    ifEditor: TIniFile;
    iFileCount: integer;
    iFilterToSaveAs: integer;

    iIPPortLocal: integer;
    iIPPortRemote: integer;

    iMaxDeparseLength: integer;
    iPandocFrom: integer;
    iPandocTo: integer;
    iProjecSelected: integer;
//    iRcardBeforeChanges: integer;
//    iRcardFilter: integer;
    iRExplorerFilter: Integer;
    iRguiRecognitionCaption: integer;
    iRguiRecognitionType: integer;
    iRmirrorsBeforeChanges: integer;
    iRtipBeforeChanges: integer;
    iRtipFilter: integer;
    iScaleMode: integer;
    iShortcutsBeforeChanges: integer;
    iShortcutsFilter: integer;
    iSciWithFocus: integer;
    iTransparency: integer;
    iZoomPreview: integer;
    RHistory: TRHistory;
    sAppSelected: string;
    sBeginComment: string;

    iRFormatted: Integer;
    sReformatR: string;
    sReformatRd: string;

    sDragSource: string;
    sDragSourceLine: string;
    sSearchText: string;
    sReplaceText: string;
    sReplaceTextHistory: string;
    seeEncoding: TEncoding;
    seeEncoding_NewFile: TEncoding;
//    sefDefault: TSaveFormat;
    sEndComment: string;
    sFileDataOrigin: string;
    sFileExtensions: string;
    sIPHostLocal: string;
    sIPHostRemote: string;
    slFilters: TStringList;
    slFiltersDisplay: TStringList;

    sciLastSearchEditor: TDScintilla;
    sLineComment: string;
    sPandocHistory: string;
    sPandocHistoryFrom: string;
    sPandocHistoryTo: string;
    sPathApp: string;
    sPathColor: string;
    sPathColor_Custom: string;
    sPathData: string;
    sPathFileBackup: string;
    sPathIniEditor_File: string;
    sPathEditor_KeyStrokes: string;
    sPathIniTinn_File: string;
    sPathSyntax: string;
    sPathSyntaxBKP: string;
    sPathRes: string;
    sPathTinnR: string;
    sPathTinnRExe: String;
    sPathTinnRcom: string;
    sPathTmp: string;
    sRmirror: string;
    sRversion: string;
    sSaveAsFileExt: string;
    sSearchTextHistory: string;
    sSelectedEnvironment: string;
    sPathShortcuts: string;
    sTipToWrite: string;
    sUtilsOrigin: string;
    sWorkingDir: string;

    sCommentsBookMark: TArray<Byte>;
    sCompletionBookMark: TArray<Byte>;
    sRmirrorsBookMark: TArray<Byte>;
    sRtipBookMark: TArray<Byte>;
    sRcardBookMark: TArray<Byte>;

    EditorKeystrokes: TSciKeyCommandCollection;
    acSetHighlighter: array of TAction;

    procedure AfterLibraryUpdate;
  //  function BufferToDisplayCoord(coordIn: TBufferCoord): TDisplayCoord;
    function RExplorerIsRunning: Boolean;
    function GetCurrentLexerId: Integer;
    function GetCurrentLexerName: String;
    function GetLexerIdFromFileExtension(sFileExtension: String): Integer;


    function GetIdByFileName(sName: string): integer;
    function FindTabByName(sName: string): integer;
    function FindTopWindow: integer;
    function GetBuildInfo: string;
    //function GetActiveEditorFormOrNil(var edForm: TfrmEditor): Boolean;
    function GetTopEditorForm(var edForm:  TfrmEditor): Boolean;
    function GetActiveEditorOrNil(var seEditor: TDScintilla): Boolean;
    function GetEditorWithFocus: TDScintilla;
    function GetKeyStrokeByCommand(var KeyCommand: TSciKeyCommand; iCommand: Integer): Integer;
    function GetPathFile(bFull: Boolean = False): string;
    function Rgui_Running: Boolean;
    function Rterm_Running: Boolean;
    function UseTCPIP: Boolean;
    function ValidRRunning: Boolean;
    procedure BackupCleanUp;
    procedure InitialBackup;
    procedure CheckFilesBackup;
    procedure CheckIfFileFromDvi(sFile: string);
    procedure CheckRterm;
    procedure ClearMRU;
    procedure ClearStatusBar;
    procedure CheckTop;
    procedure DefaultHandler(var message); override;
    procedure DoRConnection(sTmp: string; bActive, bSendTask: Boolean);
    procedure DoRguiConnection(sTmp: string; bActive: Boolean);

    procedure DrawSelectionMode(iSelMode: integer);
    procedure GetFile_Info(sfilename: string; usTmp: String;
      bConverting: Boolean = False);
    procedure InstantLookup(Sender: TObject);
    procedure CheckNamesLookup(Sender: TObject);
    procedure LoadFile(EdFile: TEditorFile);
    procedure LookupRObjectNames(sRObject: string; Sender: TDScintilla; curpos: Integer);
    // procedure LoadFile(sFileName: string; bCreateNewChild: boolean = True; bUpdateMRU: boolean = True);

    procedure MinimizeTinnAfterLastFile;
    procedure OpenAllFiles;
    procedure OpenAllFilesOfGroup;
    procedure OpenFileFromSearch;
    procedure OpenFileIntoTinn(sFileIn: string; iLineNumberJump: integer = 0;
      bOpenProjetcText: Boolean = False; bUpdateMRU: Boolean = True;
      bAllowOverwrite: Boolean = False);
    procedure OpenUserGuidePDF(sWhere: string);
    procedure PrintMessage(sInstruction: string; bNewLine: Boolean;
      sSignal: string = '> ');
    procedure ReLoadLexersAndExtensions;
    procedure ReLoadDialogFileExtension(FileTypes : TFileTypeItems);
    procedure RemoveTab(iId: integer);
    procedure ShowNamesPopup;
    procedure SendLibraryUpdate;
    procedure SendRCustom(sRC: string);
    procedure SendToConsole(sTmp: string);
    procedure SetFileSize_StatusBar(sfilename: string);
    procedure SetFocus_Main;
    procedure SetFocus_Rgui(iDelay: integer);
    procedure SetPathRgui;
    procedure SetPathRTerm;
    procedure SetReadOnlyState;
    procedure SetShortcuts;
    procedure SetHighlighterCombo(iLexerId: Integer);
    procedure SetTabTitle(sStat: string);
    procedure SetToolbarProcessing(sFileExtension: string);
    procedure ShowNotification(sShortText, sLongText: String);
    procedure UpdateAppearance(bFontSize: Boolean = True);
    procedure UpdateCursorPos(Sender: TDScintilla); overload;
    procedure UpdateMRU(var miItem: TMenuItem; sfilename: string);
    procedure ToggleAtLeastOneFileOpenOptions(bOption: Boolean);



  end;
var
  frmTinnMain: TfrmTinnMain;

//type
//  TExecute = procedure of object;

implementation

uses
  StrUtils,
  trCodeSender,
  trUtils,
  uActionMacro,
  ufrmAppOptions,
  ufrmAsciiChart,
  ufrmNameBrowser,
  ufrmColors,
  ufrmConfigurePrint,
  ufrmRterm,
  ufrmCount,
  ufrmDiffMain,
  //ufrmEditor,
  ufrmGroupRename,
  ufrmLatexDimensional,
  ufrmNewGoup,
  ufrmPrintPreview,
  ufrmRcard,
  ufrmRServer,
  ufrmSearchInFiles,
  ufrmSplash,
  ufrmTools,
  uModDados,
  ufrmShortcuts,
  ufrmPandoc,
  ufrmComments,
  ufrmRmirrors,
  uRSendCommands,
  uLexerCommands,
  uLaTeX;

{$R *.DFM}


procedure TfrmTinnMain.SetShortcuts;
begin

  with modDados.sqldsShortcuts do
  begin
    alMain.State := asSuspended;
    First;
    while not eof do
    begin
      with TAction(alMain.Actions[FieldByName('ActionIndex').AsInteger]) do
      begin
        Category := FieldByName('Category').AsString;
        Caption :=  FieldByName('Caption').AsString;
        Hint :=  FieldByName('Hint').AsString;
        ShortCut := TextToShortCut(FieldByName('ShortCut').AsString);
        ImageIndex := FieldByName('Image').AsInteger
      end;
      Next;
    end;
    alMain.State := asNormal;
  end;
end;

procedure TfrmTinnMain.CheckVersion;
begin
  sVersion_Cache := ifTinn.ReadString('App', 'sCacheVersion', '0.0.0.0');
  sVersion_Comments := ifTinn.ReadString('App', 'sCommentsVersion', '0.0.0.0');
  sVersion_Ini := ifTinn.ReadString('App', 'sIniVersion', '0.0.0.0');
  sVersion_Latex := ifTinn.ReadString('App', 'sLatexVersion', '0.0.0.0');
  sVersion_Rcard := ifTinn.ReadString('App', 'sRcardVersion', '0.0.0.0');
  sVersion_Rmirrors := ifTinn.ReadString('App', 'sRmirrorsVersion', '0.0.0.0');
  sVersion_Shortcuts := ifTinn.ReadString('App', 'sShortcutsVersion',
    '0.0.0.0');

  // Current versions
  sCurrentVersion_Cache := '2.03.02.04';
  sCurrentVersion_Comments := '3.00.02.01';
  sCurrentVersion_Latex := '2.01.01.01';
  sCurrentVersion_Rcard := '2.03.00.00';
  sCurrentVersion_Rmirrors := '3.00.02.06';
//
//  ----------------------------------------------------------------------------
//  Important for developers: Change the sCurrentVersion_Shortcuts whenever the
//  action list has been changed. Otherwise SetShortcuts will fail.
//
//  You can also include a new shortcut database file in the data.zip. This
//  should make the "restore shortcuts" more elegant as new restart will be
//  required.
//
//  ----------------------------------------------------------------------------
//
  sCurrentVersion_Shortcuts := '3.00.07.00';

  // Released joinly with Tinn-R setup program

  // Cache
  if (AnsiCompareStr(sVersion_Cache, sCurrentVersion_Cache) < 0) then
  begin
    bUpdate_Cache := True;
    sVersion_Cache := sCurrentVersion_Cache;
  end;

  // Comments
  if (AnsiCompareStr(sVersion_Comments, sCurrentVersion_Comments) < 0) then
  begin
    bUpdate_Comments := True;
    sVersion_Comments := sCurrentVersion_Comments;
  end;


  // Latex
  if (AnsiCompareStr(sVersion_Latex, sCurrentVersion_Latex) < 0) then
  begin
    bUpdate_Latex := True;
    sVersion_Latex := sCurrentVersion_Latex;
  end;

  // Rcard
  if (AnsiCompareStr(sVersion_Rcard, sCurrentVersion_Rcard) < 0) then
  begin
    bUpdate_Rcard := True;
    sVersion_Rcard := sCurrentVersion_Rcard;
  end;

  // Rmirrors
  if (AnsiCompareStr(sVersion_Rmirrors, sCurrentVersion_Rmirrors) < 0) then
  begin
    bUpdate_Rmirrors := True;
    sVersion_Rmirrors := sCurrentVersion_Rmirrors;
  end;

  // Shortcuts
  if (AnsiCompareStr(sVersion_Shortcuts, sCurrentVersion_Shortcuts) < 0) then
  begin
    sVersion_Shortcuts := sCurrentVersion_Shortcuts;
    bUpdate_Shortcuts := True;
  end;

end;

function GetActiveEditorFormOrNil(var edForm: TfrmEditor): Boolean;
begin
  if frmTinnMain.MDIChildCount >0 then
  begin
    edForm := (frmTinnMain.MDIChildren[frmTinnMain.FindTopWindow] as TfrmEditor);
    Result := true;
  end else Result := false;
end;



procedure TfrmTinnMain.OpenFileIntoTinn(sFileIn: string;
  iLineNumberJump: integer = 0; bOpenProjetcText: Boolean = False;
  bUpdateMRU: Boolean = True; bAllowOverwrite: Boolean = False);
var
  bFileExists, bUntitled, bLoadInNewWindows, bLoadFileFromDisk,
    bOverwriteCurrentContents: Boolean;

  iWin, itab, j: integer;

  seEditor: TDScintilla;
  slNewFile: TStringList;
  slTmp1, slTmp2: TStringList;
  sDir, sFileExt : string;

  EditorFile: TEditorFile;
  edForm: TfrmEditor;
begin
  // Check if is *.tps file, if yes, open it in the project interface
  EditorFile.sFile := sFileIn;
  sFileExt := lowerCase(ExtractFileExt(EditorFile.sFile));

  iWin := FindWindowByName(EditorFile.sFile);

  itab := FindTabByName(EditorFile.sFile);


  if (sFileExt = '.tps') then
  begin
    frmTools.npTools.ActivePage := frmTools.ppMisc;

    CheckIfProjectWasChanged;
    Application.ProcessMessages;

    sProjectName := EditorFile.sFile;
    // Bring to front the textual project, if it is opened
    iWin := FindWindowByName(EditorFile.sFile);
    if (iWin > -1) then
      Self.MDIChildren[iWin].BringToFront;

    OpenProjectIntoTinn(sProjectName);
    Application.ProcessMessages;

    if not bOpenProjetcText then
      Exit; // The textual project file (*.tps) will not be opened!
  end;

  ControlResources(False);

  // Init of the variables
  bLoadFileFromDisk := True;
  bOverwriteCurrentContents := False;

  // Check to see if the file is already opened



  if (iWin > -1) then
  begin // if the file is already open, bring it to the front
    // !! removed, done in activate and btw, do not change if user set it manually
    if bUpdateMRU then
      UpdateMRU(menFileRecentFiles, EditorFile.sFile);

    seEditor := (Self.MDIChildren[iWin] as TfrmEditor).sciEditor;

    // !! set after the calls to Self.MDIChildren[i] because the bring to front changes the order of the MDIChildren
    Self.MDIChildren[iWin].BringToFront;

    pgFiles.ActivePageIndex := itab - 1;

    // !! Check contents of new file
    slNewFile := TStringList.Create;
    if FileExists(EditorFile.sFile) then
      slNewFile.LoadFromFile(EditorFile.sFile);

    bAskActualizeChangedFiles := False;
    // Contents changed
    // -- Case 1: Ask user whether content shall be overwritten. Deactivated!!!!!
    if not slNewFile.Equals(seEditor.Lines) and (bAskActualizeChangedFiles) then
    begin
      { userOption:= MessageDlg('The file was changed.' + #13 +
        'Load original file from disk?',
        mtConfirmation,
        [mbYes, mbNo, mbNoToAll],
        0);
        case userOption of
        mrYes: begin
        bOverwriteCurrentContents:= True;
        // Remember current line
        iLineNumberJump:= seEditor.CaretY;
        end;

        mrNo: bLoadFileFromDisk:= False;

        mrNoToAll: begin
        bLoadFileFromDisk        := False;
        bAskActualizeChangedFiles:= False;
        end;
        end;

        Exit;
        }

    end
    else
    begin
      // -- Case 2a: This replaces the "updateFileIntoTinn" function
      if not slNewFile.Equals(seEditor.Lines) and bAllowOverwrite then
      begin
        bLoadFileFromDisk := True;
        bOverwriteCurrentContents := True;
      end
      else
        // -- This 2b: This is the standard case. To not load anything.
        bLoadFileFromDisk := False;
        Exit;
    end;
    FreeAndNil(slNewFile);
    Exit;
  end;

  // If added
  if bLoadFileFromDisk then
  begin
   with EditorFile do
   begin
     sMarks := '';
     iNewFile := 0;
     iTopLine := 0;
     iModified :=  0;
     iUnsavedChanges := 0;
     iCaretPosition := 0;
     sFolding := '';
     sMarks := '';
     iLexerId := GetLexerIdFromFileExtension(ExtractFileExt(sFile));
   end;





   // Load file state from Cache.xml
   if bRememberFileState then
     modDados.LoadFileState(EditorFile);


   /////////// check whether the below can be deleted

   {
   if bBackup then
   begin

      showmessage('why does that run???');
        {
     if trim(modDados.cdEditors.FieldByName('TempFile').AsString) <> '' then
       if FileExists(modDados.cdEditors.FieldByName('TempFile').AsString) then
         if modDados.LoadFileStateFromBackup(sMarks, iTopLine, iCaretX, iCaretY, sFolding, iLexerId) then
           bSomeRestoreAction := true;

   end;}
   /////////////////////////




    // If an Untitled is on top
    bFileExists := False;

   //    check whether this variable above is still required
   //
   /////////////////////////////////////////////////////////////////////////////
   /////////////////////////////////////////////////////////////////////////////

   if GetActiveEditorFormOrNil(edForm) then
   begin
     bUntitled := (edForm.EditorFile.iNewFile = 1);
     bFileExists := FileExists(edForm.EditorFile.sFile);
   end else bUntitled := false;


    bLoadInNewWindows := False;
    // Case 1: The active window is untitled
    if not(bFileExists) and (bUntitled) then
    begin
      // Case 1a: The top window is not modified => load new file in this window
      if ( edForm.EditorFile.iModified = 0) then
       begin
        EditorFile.iId := edForm.EditorFile.iId;
        EditorFile.iTabPosition := edForm.EditorFile.iTabPosition;
        LoadFile(EditorFile);
      end
      // Case 1b: The top window is modified => load new file in a new window
      else
        bLoadInNewWindows := True;
    end
    // Case 2: There is no untitled window on top. Either a new file is opened or an old one reloaded.
    else
    begin
      if bOverwriteCurrentContents then
      begin
        showmessage('This message should not appear. Reopening files which aready open should just bring the corresponding file to the top.');

        {showmessage(modDados.cdEditors.FieldByName('FileName').AsString);
        modDados.cdEditors.Edit;
        modDados.cdEditors.FieldValues['Filename'] := sTmp;
        modDados.cdEditors.FieldValues['NewFile'] := False;
        modDados.cdEditors.FieldValues['Modified'] := False;
        modDados.cdEditors.FieldValues['UnsavedChanges'] := False;
        modDados.cdEditors.FieldValues['HighlighterId'] := iDefaultLexerId;
        modDados.cdEditors.Post;
        LoadFileDB;
        }
        Exit;
      end
      else
        bLoadInNewWindows := True;
    end;

    if bLoadInNewWindows then
    begin
      EditorFile.iId := GetNewUniqueEditorId;
      EditorFile.iTabPosition := pgFiles.PageCount+1;
      LoadFile(EditorFile);
    end;

    if bUpdateMRU then
      UpdateMRU(menFileRecentFiles, EditorFile.sFile);
    exit;
    //cTmp := sFile[1];
    sDir := ExtractFilePath(EditorFile.sFile);

    if (frmTools.stvWindows.Path <> sDir) and (SysUtils.DirectoryExists(sDir)) then
    begin
      with frmTools do
      begin
        stvWindows.Path := sDir;
        frmTools.jvflbWinExplorer.Mask := '*.*';
        frmTools.edWinExplorerFilter.Text := '';
      end;
    end;


   // THE PLACE TO SET THE FILE EXPLORER ON THE TOOLBAR TO A PROJECT SPECIF
  end;


 {
  if (iLineNumberJump > 0) then
  begin
    GetTopEditorForm(edForm);

    with edForm.sciEditor do
    begin
      SetFirstVisibleLine(iLineNumberJump);
      GotoLine(iLineNumberJump);
    end;
  end;
     }

end;


procedure TfrmTinnMain.LoadFile(EdFile: TEditorFile);
var
  sLoadFile: string;
  wAttributes: Word;
  j :Integer;
  synenc: TEncoding;
  Encoding: TEncoding;
  edForm: TfrmEditor;
  sltmp1, sltmp2: TStringList;
begin

  // Load a new editor window and add a tab if necessary
  if EdFile.iTabPosition > pgFiles.PageCount
  then
  begin
    edForm := TfrmEditor.Create(Self);

    edForm.Tag := EdFile.iId;
    with TTabSheet.Create(Self) do
    begin
      PageControl := pgFiles;
      Tag := edForm.Tag;
      pgFiles.ActivePageIndex := pgFiles.PageCount - 1;
      frmTinnMain.pgFiles.Visible := ( frmTinnMain.pgFiles.PageCount <> 0);
      pgFiles.Visible := (pgFiles.PageCount <> 0);
      if pgFiles.PageCount = 1 then
        ToggleAtLeastOneFileOpenOptions(true);
    end;
  end else GetTopEditorForm(edForm);

  with edForm, edForm.EditorFile do
  begin
    bEditorFormIsLoading := true;
    edForm.EditorFile := EdFile;

    sWorkingDir := ExtractFilePath(sFile);

    if sWorkingDir <> '' then
      sLoadFile := sFile else
         sLoadFile := '';

    if bBackup then
      if trim(sTempFile) <> '' then
        if FileExists(sTempFile) then
          sLoadFile := trim(sTempFile);


    if (trim(sTempFile) <> '') and (iNewFile = 1) and (iModified = 0)   then
      if FileExists(sTempFile) then
      begin
      // This case should only occur for templates!
      sLoadFile := trim(sTempFile);
      sTempFile := '';
      end;

    sciEditor.Lines.BeginUpdate;
    if FileExists(sLoadFile) then
    begin
     // Encoding.GetCodePage(
      //sciEditor.

      //Encoding := sysutils.TEncoding.GetEncoding(sysutils.TEncoding.getcodepage);
     // sysutils.getcodepage

      //sciEditor.Lines.Clear;
      //synenc := GetEncoding(sLoadFile, bbBOM);
     // SysUtils.TUnicodeEncoding.GetCodePage
     // sciEditor.setco
      sciEditor.SetCodePage(CP_ACP);
      sciEditor.Lines.LoadFromFile(sLoadFile);

      sciEditor.EmptyUndoBuffer;
      sciEditor.SetSavePoint;
      //seeEncoding := LoadFromFile((synEditor.Lines, sLoadFile, synenc, bbBOM);
      //GetFile_Info(sLoadFile, synEditor.Lines);

      wAttributes := FileGetAttr(sLoadFile);
      if (((wAttributes and SysUtils.faReadOnly) = SysUtils.faReadOnly) = True)
      then
      begin
        sciEditor.SetReadOnly(True);
        actReadOnly.Checked := True;
        actReadOnly.ImageIndex := 169;
      end;
      SetFileSize_StatusBar(sLoadFile);
    end
    else
    begin
      // For new files
      actReadOnly.Checked := False;
      actReadOnly.ImageIndex := 292;
      seeEncoding := seeEncoding_NewFile;

      (* Do not remove!
        By default (SynUnidoce) it is seUTF8 on creating!
        Syn Unicode Line 381: TSynEncoding = (seUTF8, seUTF16LE, seUTF16BE, seAnsi);
      *)

    end;

    SetTitles;
    CheckSaveStatus;
    bBackupUnsaved := False;

    UpdateMainFormLexer;
    ApplyLexer(iLexerId, sciEditor);
    SetScintillaProperties(sciEditor);

    if assigned(sciEditor2) then
    begin
      ApplyLexer(iLexerId, sciEditor2);
      SetScintillaProperties(sciEditor2);
    end;

    if bHighlightActiveLine then
    begin
      sciEditor.SetCaretLineBack(iHighlightActiveLineColor);
      sciEditor.SetCaretLineVisible(true);
    end;

      // Restore all marks
    if (sMarks <> '') then
    begin
      //showmessage(sMarks);

      slTmp1 := TStringList.Create;
      slTmp2 := TStringList.Create;
      StrSplit(' ', sMarks, slTmp1);

      if (slTmp1.Count >= 0) then
        for j := 0 to (slTmp1.Count - 1) do
        begin

            StrSplit(':', slTmp1[j], slTmp2);

            if (slTmp2.Count >= 0) then
              edForm.sciEditor.MarkerAddSet(StrToInt(slTmp2[0]), StrToInt(slTmp2[1]));
        end;
      FreeAndNil(slTmp2);
    end;

      // Restore folding state
    if (sFolding <> '') then
    begin
      sciEditor.Lines.EndUpdate;

      slTmp1 := TStringList.Create;
      StrSplit(' ', sFolding, slTmp1);

      Refresh;
      SetFocus;
      if (slTmp1.Count >= 0) then
        for j := (slTmp1.Count - 1) downto 0 do
          begin
            {self.visible := true;
            self.SetFocus;
            scieditor.SetFocus;}
            sciEditor.ToggleFold(StrToInt(slTmp1[j]));
            {sciEditor.Refresh;
            sciEditor.setfocus;
            }
          end;
       sciEditor.Lines.BeginUpdate;
    end;

    if (sMarks <> '') or (sFolding <> '') then
      FreeAndNil(slTmp1);


    //showmessage(inttostr(iCaretX)+' '+inttostr(iCaretY));

    // Restore: CaretX, CaretY and TopLine

    sciEditor.GotoPos(iCaretPosition);

    sciEditor.SetFirstVisibleLine(iTopLine);


    UpdateCloseFileOptions;

    sciEditor.Lines.EndUpdate;
    sciEditor.SetFocus;

    UpdateCursorPos(sciEditor);

    frmTinnMain.SetFileSize_StatusBar(EditorFile.sFile);

    if Assigned(frmTools) then
      if Assigned(frmTools.RNavigator) then
        if Assigned(self) then
          frmTools.RNavigator.sciEditor := sciEditor;



    iSciWithFocus := 1;
    actRtermWarningError.Visible := False;


    bEditorFormIsLoading := false;
  end;
end;


{
procedure TfrmTinnMain.SaveNewIni_Application;
begin
  // Application
  if not SysUtils.DirectoryExists(sPathApp) then
  begin
    try
      CreateDir(sPathApp);
    except
      MessageDlg(sPathApp + #13 + #13 +
        'The path above is no allowed for your system previleges.' + #13 +
        'The necessary ".ini" files related to "Application" will not be saved!',
        mtError, [mbOk], 0);
      Exit;
    end;
  end;
   showmessage('SaveNewIni_Application needs update');
  // Aplication
  ifTinn := TIniFile.Create(sPathApp + '\Tinn.tmp');
  sPathIniTinn_Tmp := (sPathApp + '\Tinn.tmp');
  if FileExists(sPathIniTinn_Tmp) then
    DeleteFile(sPathIniTinn_Tmp);

  ifTinn_Tmp.WriteString('App', 'sIniVersion', GetBuildInfo);
  ifTinn_Tmp.WriteString('App', 'sLatexVersion', sVersion_Latex);

  WriteAppDataToIniFile(ifTinn_Tmp);
end;
}
 {
procedure TfrmTinnMain.SaveNewIni_Editor;
begin
  // Editor
  if not SysUtils.DirectoryExists(sPathEditor) then
  begin
    try
      CreateDir(sPathEditor);
    except
      MessageDlg(sPathEditor + #13 + #13 +
        'The path above is no allowed for your system previleges.' + #13 +
        'The necessary ".ini" files related to "Editor" will not be saved!',
        mtError, [mbOk], 0);
      Exit;
    end;
  end;

  // Editor
  ifEditor_Tmp := TIniFile.Create(sPathEditor + '\Editor.tmp');
  sPathIniEditor_Tmp := (sPathEditor + '\Editor.tmp');
  if FileExists(sPathIniEditor_Tmp) then
    DeleteFile(sPathIniEditor_Tmp); // Delete any old Editor.tmp

  with ifEditor_Tmp do
  begin

    // Gutter settings
    WriteBool('Gutter', 'bAutoSize', coEditor.Gutter.AutoSize);
    WriteBool('Gutter', 'bLeadingZeros', coEditor.Gutter.LeadingZeros);
    WriteBool('Gutter', 'bLineNumber', coEditor.Gutter.ShowLineNumbers);
    WriteBool('Gutter', 'bVisible', coEditor.Gutter.Visible);
    WriteBool('Gutter', 'bZeroStart', coEditor.Gutter.ZeroStart);
    WriteInteger('Gutter', 'iColor', coEditor.Gutter.Color);
    WriteInteger('Gutter', 'iDigitCount', coEditor.Gutter.DigitCount);
    WriteInteger('Gutter', 'iFont.Color', coEditor.Gutter.Font.Color);
    WriteInteger('Gutter', 'iFont.Size', coEditor.Gutter.Font.Size);
    WriteInteger('Gutter', 'iWidth', coEditor.Gutter.Width);
    WriteString('Gutter', 'sFont.Name', coEditor.Gutter.Font.Name);

    // Editor settings
    WriteBool('Editor', 'bHideSelection', coEditor.HideSelection);
    WriteBool('Editor', 'bWantTabs', coEditor.WantTabs);
    WriteInteger('Editor', 'iExtraLineSpacing', coEditor.ExtraLineSpacing);
    WriteInteger('Editor', 'iFont.Color', coEditor.Font.Color);
    WriteInteger('Editor', 'iFont.Size', coEditor.Font.Size);
    WriteInteger('Editor', 'iInsertCaret', integer(coEditor.InsertCaret));
    WriteInteger('Editor', 'iOptions', integer(coEditor.Options));
    WriteInteger('Editor', 'iOverwriteCaret', integer(coEditor.OverwriteCaret));
    WriteInteger('Editor', 'iRightEdge', coEditor.RightEdge);
    WriteInteger('Editor', 'iRightEdgeColor', coEditor.RightEdgeColor);
    WriteInteger('Editor', 'iSelectedColor.Background',
      coEditor.SelectedColor.Background);
    WriteInteger('Editor', 'iSelectedColor.Foreground',
      coEditor.SelectedColor.Foreground);
    WriteInteger('Editor', 'iTab.Width', coEditor.TabWidth);
    WriteString('Editor', 'sFont.Name', coEditor.Font.Name);

  end;

  FreeAndNil(ifEditor_Tmp);
end;
        }
procedure TfrmTinnMain.WriteIniFile_Application(bMakingBackup: Boolean);
var
  slSearch, slPandocHistory, slPandocHistoryFrom, slPandocHistoryTo
    : TStringList;

  i: integer;

begin
  // Application
  if not SysUtils.DirectoryExists(sPathApp) then
  begin
    try
      CreateDir(sPathApp);
    except
      MessageDlg(sPathApp + #13 + #13 +
        'The path above is no allowed for your system previleges.' + #13 +
        'The necessary ".ini" files related to "Application" will not be saved!',
        mtError, [mbOk], 0);
      Exit;
    end;
  end;

  ifTinn.EraseSection('PandocHistory');
  ifTinn.EraseSection('PandocHistoryFrom');
  ifTinn.EraseSection('PandocHistoryTo');
  ifTinn.EraseSection('SearchTextHistory');
  ifTinn.EraseSection('SearchDirHistory');
  ifTinn.EraseSection('SearchFileMaskHistory');

  ifTinn.EraseSection('ExplorerFavorites');
  ifTinn.EraseSection('FileMRU');
  ifTinn.EraseSection('ProjectMRU');

  WriteAppDataToIniFile(ifTinn, not bMakingBackup);

  if not bMakingBackup then
  begin
    if Assigned(hkTinnR) then
      FreeAndNil(hkTinnR);
    if Assigned(ifTinn) then
      FreeAndNil(ifTinn);
  end;
end;

procedure TfrmTinnMain.WriteIniFile_Editor(bMakingBackup: Boolean);
begin
  // Editor
  if not SysUtils.DirectoryExists(sPathEditor) then
  begin
    try
      CreateDir(sPathEditor);
    except
      MessageDlg(sPathEditor + #13 + #13 +
        'The path above is no allowed for your system previleges.' + #13 +
        'The necessary ".ini" files related to "Editor" will not be saved!',
        mtError, [mbOk], 0);
      Exit;
    end;
  end;

  with ifEditor do
  begin


    // Gutter

    WriteBool('Gutter', 'bLineNumber', actLineNumbersVisible.Checked);
    WriteBool('Gutter', 'bFolding', actFoldingVisible.Checked);
    WriteBool('Gutter', 'bMarkers', actMarkersVisible.Checked);

    WriteInteger('Gutter', 'iColorMark1', iColorMark1);
    WriteInteger('Gutter', 'iColorMark2', iColorMark2);

    // Line breaks

    WriteInteger('Editor', 'iEditorLineWrap', iEditorLineWrap);
    WriteInteger('Editor', 'iIOLineWrap', iIOLineWrap);
    WriteInteger('Editor', 'iLogLineWrap', iLogLineWrap);

    // Active line
    WriteInteger('Editor', 'iHighlightActiveLineColor', iHighlightActiveLineColor);
    WriteBool('Editor', 'bHighlightActiveLine', bHighlightActiveLine);




    // Gutter settings
{    WriteBool('Gutter', 'bAutoSize', coEditor.Gutter.AutoSize);
    WriteBool('Gutter', 'bLeadingZeros', coEditor.Gutter.LeadingZeros);
    WriteBool('Gutter', 'bLineNumber', coEditor.Gutter.ShowLineNumbers);
    WriteBool('Gutter', 'bVisible', coEditor.Gutter.Visible);
    WriteBool('Gutter', 'bZeroStart', coEditor.Gutter.ZeroStart);
    WriteInteger('Gutter', 'iColor', coEditor.Gutter.Color);
    WriteInteger('Gutter', 'iDigitCount', coEditor.Gutter.DigitCount);
    WriteInteger('Gutter', 'iFont.Color', coEditor.Gutter.Font.Color);
    WriteInteger('Gutter', 'iFont.Size', coEditor.Gutter.Font.Size);
    WriteInteger('Gutter', 'iWidth', coEditor.Gutter.Width);
    WriteString('Gutter', 'sFont.Name', coEditor.Gutter.Font.Name);

    // Editor settings
    WriteBool('Editor', 'bHideSelection', coEditor.HideSelection);
    WriteBool('Editor', 'bWantTabs', coEditor.WantTabs);
    WriteInteger('Editor', 'iExtraLineSpacing', coEditor.ExtraLineSpacing);
    WriteInteger('Editor', 'iFont.Color', coEditor.Font.Color);
    WriteInteger('Editor', 'iFont.Size', coEditor.Font.Size);
    WriteInteger('Editor', 'iInsertCaret', integer(coEditor.InsertCaret));
    WriteInteger('Editor', 'iOptions', integer(coEditor.Options));
    WriteInteger('Editor', 'iOverwriteCaret', integer(coEditor.OverwriteCaret));
    WriteInteger('Editor', 'iRightEdge', coEditor.RightEdge);
    WriteInteger('Editor', 'iRightEdgeColor', coEditor.RightEdgeColor);
    WriteInteger('Editor', 'iSelectedColor.Background',
      coEditor.SelectedColor.Background);
    WriteInteger('Editor', 'iSelectedColor.Foreground',
      coEditor.SelectedColor.Foreground);
    WriteInteger('Editor', 'iTab.Width', coEditor.TabWidth);
    WriteString('Editor', 'sFont.Name', coEditor.Font.Name);}
  end;
  {
  if not bMakingBackup then
  begin
    if Assigned(coEditor) then
      FreeAndNil(coEditor);
    if Assigned(ifEditor) then
      FreeAndNil(ifEditor);
  end;  }
end;

function TfrmTinnMain.GetEncodingDefault: string;
begin
  if actANSI.Checked then
    Result := 'ANSI'
  else if actUTF8.Checked then
    Result := 'UTF8'
  else if actUTF16LE.Checked then
    Result := 'UTF16LE'
  else if actUTF16BE.Checked then
    Result := 'UTF16BE';
end;

procedure TfrmTinnMain.SetEncodingDefault(sTmp: string);
begin
{  case StringToCaseSelect(sTmp, ['ANSI', 'UTF8', 'UTF16LE', 'UTF16BE']) of
    0:
      begin
        sefDefault := sfANSI;
        actANSIExecute(Self);
      end;
    1:
      begin
        sefDefault := sfUTF8;
        actUTF8Execute(Self);
      end;
    2:
      begin
        sefDefault := sfUTF16LSB;
        actUTF16LEExecute(Self);
      end;
    3:
      begin
        sefDefault := sfUTF16MSB;
        actUTF16BEExecute(Self);
      end;
  end;  }
end;

procedure TfrmTinnMain.GetFile_Info(sfilename: string; usTmp: String;
  bConverting: Boolean = False);
var
//  ff: TSynEditFileFormat;
  // sf: TSaveFormat;
  sff, ssf: string;

begin
 { if (ExtractFileExt(sfilename) = '') and (pos('Untitled', sfilename) > 0) then
  begin // The file does not exist (physically in the HD) yet!

    with stbMain do
    begin
      case seeEncoding_NewFile of
        seANSI:
          ssf := 'ANSI';
        seUTF8:
          ssf := 'UTF-8';
        seUTF16LE:
          ssf := 'UTF16-LE';
        seUTF16BE:
          ssf := 'UTF16-BE';
      end;

      atbStatus.ActionClient.Items[0].Caption := ssf;
      atbStatus.ActionClient.Items[1].Caption := 'WIN';

      Panels[0].Text := ssf;
      Panels[1].Text := 'WIN';
    end;
  end // if (ExtractFileExt(sFileName) = EmptyStr) and
  else
  begin
    // The file should already exist (physically in the HD)!
    if not FileExists(sfilename) then
      Exit;

    seeEncoding := GetEncoding(sfilename, bbBOM);
    // sf:= TSynEditStringList(usTmp).FileFormat;

    case seeEncoding of

      seANSI:
        ssf := 'ANSI';
      seUTF8:
        ssf := 'UTF-8';
      seUTF16LE:
        ssf := 'UTF16-LE';
      seUTF16BE:
        ssf := 'UTF16-BE';
    end;

    ff := TSynEditStringList(usTmp).FileFormat;
    case ff of
      sffDOS:
        sff := 'WIN';
      sffUNIX:
        sff := 'UNIX';
      sffMAC:
        sff := 'MAC';
    else
      sff := 'UNK';
    end;

    with stbMain do
    begin
      if (not bConverting and bbBOM) then
        Panels[0].Text := ssf + ' BOM'
      else
        Panels[0].Text := ssf;
      Panels[1].Text := sff;
    end;

    with stbMain do
    begin
      if (not bConverting and bbBOM) then
        atbStatus.ActionClient.Items[0].Caption := ssf + ' BOM'
      else
        atbStatus.ActionClient.Items[0].Caption := ssf;
      atbStatus.ActionClient.Items[1].Caption := sff;
    end;

  end;    $
end;

procedure TfrmTinnMain.SetBuffer_SaveFormat(sf: TSaveFormat);
begin
//sci //m.p.
{
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
  begin
    // m.p.    TSynEditStringList(synEditor.Lines).SaveFormat:= sf;
    synEditor.Modified := True;
    SetTabTitle('*');
    CheckSaveStatus;
    GetFile_Info(sActiveFile, synEditor.Lines, True);
    // True because is converting
  end;    }
end;
{
procedure TfrmTinnMain.SetBuffer_FileFormat(ff: TSynEditFileFormat);
begin
//sci //m.p.

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
  begin
    TSynEditStringList(synEditor.Lines).FileFormat := ff;
    synEditor.Modified := True;
    SetTabTitle('*');
    CheckSaveStatus;
    GetFile_Info(sActiveFile, synEditor.Lines, True);
    // True because is converting
  end;
end; }

procedure TfrmTinnMain.SetPreferences_Application;

  function ReadRegEntry(strSubKey, strValueName: string): string;
  var
    Key: HKey;
    Buffer: array [0 .. 255] of Char;
    Size: cardinal;

  begin
    Result := 'ERROR';
    Size := SizeOf(Buffer);
    if RegOpenKeyEx(HKEY_LOCAL_MACHINE, PChar(strSubKey), 0, KEY_READ, Key) = ERROR_SUCCESS
    then

      if RegQueryValueEx(Key, PChar(strValueName), nil, nil, @Buffer, @Size) = ERROR_SUCCESS
      then
        Result := Buffer;

    RegCloseKey(Key);
  end;

var
  i, iPos, iTmp: integer;

  slTmpFavoriteFolders, slFavoriteFolders, slSearch, slPandocHistory,
    slPandocHistoryFrom, slPandocHistoryTo: TStringList;
  slSubkeys: TStringList;

  sTmp: string;
  bTop: Boolean;

begin



  // Will always preserve the last position (not maximized) when closing
  iOldHeight := ifTinn.ReadInteger('Form', 'iHeight', 2 * Screen.Height div 3);
  iOldLeft := ifTinn.ReadInteger('Form', 'iLeft', 0);
  iOldTop := ifTinn.ReadInteger('Form', 'iTop', 0);
  iOldWidth := ifTinn.ReadInteger('Form', 'iWidth', Screen.Width);

  // My preferred
  Height := ifTinn.ReadInteger('Form', 'iHeight', 2 * Screen.Height div 3);
  Left := ifTinn.ReadInteger('Form', 'iLeft', 0);
  Top := ifTinn.ReadInteger('Form', 'iTop', 0);
  Width := ifTinn.ReadInteger('Form', 'iWidth', Screen.Width);
  WindowState := TWindowState(ifTinn.ReadInteger('Form', 'iWindowState', 0));

  // Dir and Top
  bTop := ifTinn.ReadBool('App', 'bAlwaysOnTop', False);
  sWorkingDir := trim(ifTinn.ReadString('App', 'sWorkingDir', EmptyStr));
  if (bTop) then
    actOnTopExecute(nil);


  iDefaultLexerId := ifTinn.ReadInteger('App', 'iDefaultLexerId', 86);


  bBackgroundConnectionErrorWarning := ifTinn.ReadBool('App', 'bBackgroundConnectionErrorWarning', false);

  // m.p.  SET NEW TOOOLBAR PROPERTIES HERE!

  {
    // Edit Bar
    tobEdit.Left := ifTinn.ReadInteger('App', 'iEdit.Left', tobEdit.Left);
    tobEdit.Top := ifTinn.ReadInteger('App', 'iEdit.Top', tobEdit.Top);
    tobEdit.Visible := ifTinn.ReadBool('App', 'bEdit.Visible', True);
    actTobEditVisible.Checked := tobEdit.Visible;

    // Search Bar
    tobSearch.Left := ifTinn.ReadInteger('App', 'iSearch.Left', tobSearch.Left);
    tobSearch.Top := ifTinn.ReadInteger('App', 'iSearch.Top', tobSearch.Top);
    tobSearch.Visible := ifTinn.ReadBool('App', 'bSearch.Visible', True);
    actTobSearchVisible.Checked := tobSearch.Visible;

    // Misc Bar
    tobMisc.Left := ifTinn.ReadInteger('App', 'iMisc.Left', tobMisc.Left);
    tobMisc.Top := ifTinn.ReadInteger('App', 'iMisc.Top', tobMisc.Top);
    tobMisc.Visible := ifTinn.ReadBool('App', 'bMisc.Visible', True);
    actTobMiscVisible.Checked := tobMisc.Visible;

    // Processing Bar
    tobProcessing.Left := ifTinn.ReadInteger('App', 'iProcessing.Left',
    tobProcessing.Left);
    tobProcessing.Top := ifTinn.ReadInteger('App', 'iProcessing.Top',
    tobProcessing.Top);
    tobProcessing.Visible := ifTinn.ReadBool('App', 'bProcessing.Visible', True);
    actTobProcessingVisible.Checked := tobProcessing.Visible;

    // Format Bar
    tobFormat.Left := ifTinn.ReadInteger('App', 'iFormat.Left', tobFormat.Left);
    tobFormat.Top := ifTinn.ReadInteger('App', 'iFormat.Top', tobFormat.Top);
    tobFormat.Visible := ifTinn.ReadBool('App', 'bFormat.Visible', True);
    actTobFormatVisible.Checked := tobFormat.Visible;

    // View Bar
    tobView.Left := ifTinn.ReadInteger('App', 'iView.Left', tobView.Left);
    tobView.Top := ifTinn.ReadInteger('App', 'iView.Top', tobView.Top);
    tobView.Visible := ifTinn.ReadBool('App', 'bView.Visible', True);
    actTobViewVisible.Checked := tobView.Visible;

    // Macro Bar
    tobMacro.Left := ifTinn.ReadInteger('App', 'iMacro.Left', tobMacro.Left);
    tobMacro.Top := ifTinn.ReadInteger('App', 'iMacro.Top', tobMacro.Top);
    tobMacro.Visible := ifTinn.ReadBool('App', 'bMacro.Visible', False);
    actTobMacroVisible.Checked := tobMacro.Visible;

    // Filter Bar
    tobFilter.Left := ifTinn.ReadInteger('App', 'iFilter.Left', tobFilter.Left);
    tobFilter.Top := ifTinn.ReadInteger('App', 'iFilter.Top', tobFilter.Top);
    tobFilter.Visible := ifTinn.ReadBool('App', 'bFilter.Visible', False);
    actTobFilterVisible.Checked := tobFilter.Visible;

    // Syntax Bar
    tobSyntax.Left := ifTinn.ReadInteger('App', 'iSyntax.Left', tobSyntax.Left);
    tobSyntax.Top := ifTinn.ReadInteger('App', 'iSyntax.Top', tobSyntax.Top);
    tobSyntax.Visible := ifTinn.ReadBool('App', 'bSyntax.Visible', True);
    actTobSyntaxVisible.Checked := tobSyntax.Visible;

    // Spell Bar
    tobSpell.Left := ifTinn.ReadInteger('App', 'iSpell.Left', tobSpell.Left);
    tobSpell.Top := ifTinn.ReadInteger('App', 'iSpell.Top', tobSpell.Top);
    tobSpell.Visible := ifTinn.ReadBool('App', 'bSpell.Visible', False);
    actTobSpellVisible.Checked := tobSpell.Visible;
  }
  // Misc
  bBackup := ifTinn.ReadBool('App', 'bBackup', True);
  bMinimizeTinnAfterLastFile := ifTinn.ReadBool('App',
    'bMinimizeTinnAfterLastFile', False);
  bRememberFileState := ifTinn.ReadBool('App', 'bRememberFileState', True);
  bRemoveExtension := ifTinn.ReadBool('App', 'bRemoveExtension', True);
  bReopenFiles := ifTinn.ReadBool('App', 'bReopenFiles', True);
  bUndoAfterSave := ifTinn.ReadBool('App', 'bUndoAfterSave', True);
  actOpenMaximized.Checked := ifTinn.ReadBool('App', 'bOpenMaximized', True);

  actProjectVisible.Checked := ifTinn.ReadBool('App', 'bProject.Visible', True);

  with ifTinn do
  begin
    // ---- Tool NavigationPane
    frmTools.npTools.MaximizedCount := ReadInteger('App', 'iMaximizedCount', 0);
    frmTools.npTools.ActivePageIndex :=
      ReadInteger('App', 'iPaneActivePageIndex', 1);
    // ----------- Files
    frmTools.panProj.Height := ReadInteger('App', 'ipaaProjHeight', 150);

    frmTools.panWinExplorer.Height :=
      ReadInteger('App', 'ipanWinExpHeight', 150);
    frmTools.jvflbWinExplorer.Height :=
      ReadInteger('App', 'iWinExpHeight', 150);

    // ----------- R
    frmTools.panRCard.Height := ReadInteger('App', 'ipanRCardHeight', 150);
 {   frmTools.dbgRcard.Columns[0].Width := ReadInteger('App', 'iCardCol0', 120);
    frmTools.dbgRcard.Columns[1].Width := ReadInteger('App', 'iCardCol1', 120); }
    frmTools.panExplorer.Height := ReadInteger('App', 'ipanExplorer', 150);
    frmTools.panNavi.Height := ReadInteger('App', 'ipanNaviHeight', 150);

  end;

  {
    frmTools.tbsComments.TabVisible := actDataCommentsVisible.Checked;
    frmTools.tbsDatabase.TabVisible := actDatabaseVisible.Checked;
    frmTools.tbsIniLog.TabVisible := actIniLogVisible.Checked;
    frmTools.tbsLatex.TabVisible := actLatexVisible.Checked;
    frmTools.tbsMarkup.TabVisible := actMarkupVisible.Checked;
    frmTools.tbsMisc.TabVisible := actMiscVisible.Checked;
    frmTools.tbsProject.TabVisible := actProjectVisible.Checked;
    frmTools.tbsR.TabVisible := actRVisible.Checked;
    frmTools.panRcard.Visible := actDataRcardVisible.Checked;

    frmTools.tbsResults.TabVisible := actResultsVisible.Checked;
    frmTools.panExplorer.Visible := actRExplorerVisible.Checked;

    frmTools.panRmirrors.Visible := actDataRmirrorsVisible.Checked;
    frmTools.tbsSearch.TabVisible := actSearchVisible.Checked;
    frmTools.tbsShortcuts.TabVisible := actDataShortcutsVisible.Checked;
    frmTools.tbsSpell.TabVisible := actSpellVisible.Checked;
    frmTools.tbsTxt2tags.TabVisible := actTxt2tagsVisible.Checked;
    frmTools.tbsWinExplorer.TabVisible := actWinExplVisible.Checked;
    frmTools.tbsWorkExplorer.TabVisible := actWorkExplVisible.Checked;
  }
  actShowAllBars.Checked := ifTinn.ReadBool('App', 'bShowAllBars', True);
  UpdateBars(actShowAllBars.Checked);




  //bActiveLine := ifTinn.ReadBool('App', 'bActiveLine', True);
  //clActiveLine := ifTinn.ReadInteger('App', 'clActiveLine', TColor(clInfoBk));


{  clBGApplication := ifTinn.ReadInteger('App', 'clBGApplication',
    TColor(clWindow));
  clBGForAllHighlighters := ifTinn.ReadInteger('App', 'clBGForAllHighlighters',
    TColor(clWindow));
  clBGPreferred := ifTinn.ReadInteger('App', 'clBGPreferred', TColor(clWindow));
  clBGTabSelectedNew := ifTinn.ReadInteger('App', 'clBGTabSelectedNew',
    TColor(clMedGray));
  clBrackets := ifTinn.ReadInteger('App', 'clBrackets', TColor(clRed));
  clFGApplication := ifTinn.ReadInteger('App', 'clFGApplication',
    TColor(clBlack));}
  iBackupInterval := ifTinn.ReadInteger('App', 'iBackupInterval', 30);
  iDelay := ifTinn.ReadInteger('App', 'iDelay', 100);
  iPandocFrom := ifTinn.ReadInteger('App', 'iPandocFrom', 4);
  iPandocTo := ifTinn.ReadInteger('App', 'iPandocTo', 7);
  iTransparency := ifTinn.ReadInteger('App', 'iTransparency', 0);
  iViewStyleRExplorer := ifTinn.ReadInteger('App', 'iViewStyleRExplorer', 1);


  bIPLocal := ifTinn.ReadBool('App', 'bIPLocal', True);
  iIPPortLocal := ifTinn.ReadInteger('App', 'iIPPortLocal', 8889);
  iIPPortRemote := ifTinn.ReadInteger('App', 'iIPPortLocal', 8889);
  sIPHostLocal := ifTinn.ReadString('App', 'sIPHostLocal', '127.0.0.1');
  sIPHostRemote := ifTinn.ReadString('App', 'sIPHostRemote', '000.000.000.000');

  sParDeplate := trim(ifTinn.ReadString('App', 'sParDeplate', '-f'));
  sParDviBibtex := trim(ifTinn.ReadString('App', 'sParDviBibtex',
    'bibtex --src-specials'));
  sParDviSingle := trim(ifTinn.ReadString('App', 'sParDviSingle',
    'latex -c-style-errors --src-specials'));
  sParPdfBibtex := trim(ifTinn.ReadString('App', 'sParPdfBibtex', 'bibtex'));
  sParPdfSingle := trim(ifTinn.ReadString('App', 'sParPdfSingle',
    'pdflatex -c-style-errors'));
  sParRgui := trim(ifTinn.ReadString('App', 'sParRgui', '--sdi'));
  sParRterm := trim(ifTinn.ReadString('App', 'sParRterm', '--ess'));
  sParTxt2tags := trim(ifTinn.ReadString('App', 'sParTxt2tags', '-t'));
  sPath_Pandoc := trim(ifTinn.ReadString('App', 'sPath_Pandoc', EmptyStr));
  sPathDeplate_Converter :=
    trim(ifTinn.ReadString('App', 'sPathDeplate_Converter', EmptyStr));
  sPathDeplate_Interpreter :=
    trim(ifTinn.ReadString('App', 'sPathDeplate_Interpreter', EmptyStr));
  sPathTxt2tags_Converter :=
    trim(ifTinn.ReadString('App', 'sPathTxt2tags_Converter', EmptyStr));
  sPathTxt2tags_Interpreter :=
    trim(ifTinn.ReadString('App', 'sPathTxt2tags_Interpreter', EmptyStr));
  sReformatR := trim(ifTinn.ReadString('App', 'sReformatR', EmptyStr));
  sReformatRd := trim(ifTinn.ReadString('App', 'sReformatRd',
    'Sorry, this feature is not available yet!'));

  actCloseDVIViewer.Checked := ifTinn.ReadBool('App', 'bCloseDVIViewer', False);
  actClosePDFViewer.Checked := ifTinn.ReadBool('App', 'bClosePDFViewer', True);
  actDosMinimizedAlways.Checked := ifTinn.ReadBool('App',
    'bDosMinimizedAlways', True);
  actDviOpenAlways.Checked := ifTinn.ReadBool('App', 'bDviOpenAlways', True);
  actHtmlOpenAlways.Checked := ifTinn.ReadBool('App', 'bHtmlOpenAlways', True);
  actPdfOpenAlways.Checked := ifTinn.ReadBool('App', 'bPdfOpenAlways', True);
  actRComplexDefault.Checked := ifTinn.ReadBool('App',
    'bRComplexDefault', False);
  actRSimpleDefault.Checked := ifTinn.ReadBool('App', 'bRSimpleDefault', True);
  actTextDefault.Checked := ifTinn.ReadBool('App', 'bTextDefault', False);

  bAllNames := ifTinn.ReadBool('App', 'bAllNames', True);
  bConnectionBeepOnError := ifTinn.ReadBool('App',
    'bConnectionBeepOnError', True);
  bDataCompletionAnywhere := ifTinn.ReadBool('App',
    'bDataCompletionAnywhere', True);
  bOrganizeAutomatically := ifTinn.ReadBool('App',
    'bOrganizeAutomatically', False);
  bRArchitecture64 := ifTinn.ReadBool('App', 'bRArchitecture64', True);
  bRAsServer := ifTinn.ReadBool('App', 'bRAsServer', True);
  bRestoreIniDock := ifTinn.ReadBool('App', 'bRestoreIniDock', False);
  bRget_Info := ifTinn.ReadBool('App', 'bRget_Info', True);
  bRguiReturnFocus := ifTinn.ReadBool('App', 'bRguiReturnFocus', True);
  bRmirros_Update := ifTinn.ReadBool('App', 'bRmirros_Update', False);
  bRSendAll := ifTinn.ReadBool('App', 'bRSendAll', False);
  bRSmartSend := ifTinn.ReadBool('App', 'bRSmartSend', True);
  bRsvSocket_Connect := ifTinn.ReadBool('App', 'bRsvSocketConnect', True);
  bRTCPIPConsoleEcho := ifTinn.ReadBool('App', 'bRTCPIPConsoleEcho', False);
  bRTCPIPConsoleUse := ifTinn.ReadBool('App', 'bRTCPIPConsoleUse', False);
  bRtermBeepOnError := ifTinn.ReadBool('App', 'bRtermBeepOnError', True);
  bRtermFindError := ifTinn.ReadBool('App', 'bRtermFindError', False);
  bRTinnRcom_Install := ifTinn.ReadBool('App', 'bRTinnRcomInstall', True);
  bRTinnRcom_Load := ifTinn.ReadBool('App', 'bRTinnRcomLoad', True);
  bRUseLatest := ifTinn.ReadBool('App', 'bRUseLatest', True);
  bScrollSendingLines := ifTinn.ReadBool('App', 'bScrollSendingLines', True);
  bTinnRHotKeysActive := ifTinn.ReadBool('App', 'bTinnRHotKeysActive', False);
  iReformatRSplit := ifTinn.ReadInteger('App', 'iReformatRSPlit', 1);
  iRguiRecognitionCaption := ifTinn.ReadInteger('App',
    'iRguiRecognitionCaption', 2);
  iRguiRecognitionType := ifTinn.ReadInteger('App', 'iRguiRecognitionType', 0);
  iRguiTinnRDisposition := ifTinn.ReadInteger('App',
    'iRguiTinnRDisposition', 0);
  iRguiTinnRProportion := ifTinn.ReadInteger('App', 'iRguiTinnRProportion', 58);
  sTriggerRDataCompletion :=
    trim(ifTinn.ReadString('App', 'sTriggerRDataCompletion', 'SHIFT+CTRL+D'));
  sTriggerRtip := trim(ifTinn.ReadString('App', 'sTriggerRtip', 'CTRL+D'));

  actPgFilesVisible.Checked := ifTinn.ReadBool('App', 'bPgFiles.Visible', True);
  actStatusBarVisible.Checked := ifTinn.ReadBool('App', 'bStatusBar', True);
  frmRterm.Visible := ifTinn.ReadBool('App', 'bRterm.Visible', True);
  frmTools.cbComAutoDetect_Language.Checked :=
    ifTinn.ReadBool('App', 'bComAutoDetect_Language', True);
  frmTools.cbComPriority_Line.Checked :=
    ifTinn.ReadBool('App', 'bComPriority_Line', True);
  frmTools.panCountries.Height := ifTinn.ReadInteger('App',
    'iCountries.Height', 79);
  frmTools.panRCard.Height := ifTinn.ReadInteger('App', 'iRcard.Height', 79);
  // m.p.  frmTools.panRExplorer.Width := ifTinn.ReadInteger('App',
  // 'iRExplorer.Width', 200);

  frmTools.panWinExplorer.Height := ifTinn.ReadInteger('App',
    'iWinExplorer.Height', 75);

  frmTools.Visible := ifTinn.ReadBool('App', 'bTools.Visible', True);

  if (trim(sReformatRd) <> 'Sorry, this feature is not available yet!') then
    sReformatRd := 'Sorry, this feature is not available yet!';




  pgFiles.Visible := actPgFilesVisible.Checked;

  actToolsVisible.Checked := frmTools.Visible;
  actRtermVisible.Checked := frmRterm.Visible;
  atbStatus.Visible := actStatusBarVisible.Checked;

  // Tools

  // INSERT TOOLS RELOAD HERE
  // m.p.

  iToolsDockHeight := ifTinn.ReadInteger('App', 'iToolsDock.Height', 200);
  iToolsDockWidth := ifTinn.ReadInteger('App', 'iToolsDock.Width', 100);

  // m.p.  cbSpellLanguage.ItemIndex:= ifTinn.ReadInteger('App', 'iSpellLanguage.ItemIndex', -1);
  iCountriesFilter := ifTinn.ReadInteger('App', 'iCountries.ItemIndex', 0);
//  iRcardFilter := ifTinn.ReadInteger('App', 'iRcard.ItemIndex', 0);
  iRtipFilter := ifTinn.ReadInteger('App', 'iRtip.ItemIndex', 0);
  iShortcutsFilter := ifTinn.ReadInteger('App', 'iShortcuts.ItemIndex', 0);
  iShortcutsFilter := ifTinn.ReadInteger('App', 'iShortcuts.ItemIndex', 0);

  actRguiReturnFocus.Checked := bRguiReturnFocus;

  // Rterm

  bRtermCloseWithoutAsk := ifTinn.ReadBool('App',
    'bRtermCloseWithoutAsk', False);
  bRtermHorizontal := ifTinn.ReadBool('App', 'bRtermHorizontal', True);
  bRtermSimple := ifTinn.ReadBool('App', 'bRtermSimple', False);
  frmRterm.iSciLog2Height := ifTinn.ReadInteger('App', 'iSciLog2.Height', 90);
  frmRterm.iSciLog2Width := ifTinn.ReadInteger('App', 'iciLog2.Width', 140);

  iIOSyntax := ifTinn.ReadInteger('App', 'iIOSyntax', SCLEX_R );
  iLogSyntax := ifTinn.ReadInteger('App', 'iLogSyntax', SCLEX_R);

  if iIOSyntax = SCLEX_R then
     actRtermSetIOSyntaxToR.Checked := True else
        actRtermSetIOSyntaxToText.Checked := True;

  if iLogSyntax = SCLEX_R then
     actRtermSetLogSyntaxToR.Checked := True else
        actRtermSetLogSyntaxToText.Checked := True;


  iRtermDockHeight := ifTinn.ReadInteger('App', 'iRtermDock.Height', 200);
  iRtermDockWidth := ifTinn.ReadInteger('App', 'iRtermDock.Width', 100);



  iMaxDeparseLength := ifTinn.ReadInteger('App', 'iMaxDeparseLength', 150);
  sAppSelected := ifTinn.ReadString('App', 'sAppSelected', 'General');

  // Encoding
  sEncodingDefault := ifTinn.ReadString('App', 'sEncodingDefault', 'ANSI');
  SetEncodingDefault(sEncodingDefault);

  // Search Settings
  bRememberSearchList := ifTinn.ReadBool('Search', 'bRememberSearchList', True);
  bSearchBackwards := ifTinn.ReadBool('Search', 'bSearchBackwards', False);
  bSearchCaseSensitive := ifTinn.ReadBool('Search',
    'bSearchCaseSensitive', False);
  bSearchDirectory := ifTinn.ReadBool('Search', 'bSearchDirectory', False);
  bSearchFromCursor := ifTinn.ReadBool('Search', 'bSearchFromCursor', False);
  bSearchInSub := ifTinn.ReadBool('Search', 'bSearchInSub', False);
  bSearchOpenFiles := ifTinn.ReadBool('Search', 'bSearchOpenFiles', True);
  bSearchRegExp := ifTinn.ReadBool('Search', 'bSearchRegExp', False);
  bSearchWholeWords := ifTinn.ReadBool('Search', 'bSearchWholeWords', False);
  iLastSearch := ifTinn.ReadInteger('Search', 'iLastSearch', 10);

  // Print settings
  bPrintColors := ifTinn.ReadBool('Print', 'bPrintColors', True);
  bPrintFileName := ifTinn.ReadBool('Print', 'bPrintFileName', True);
  bPrintLineNumber := ifTinn.ReadBool('Print', 'bPrintLineNumber', False);

  iPrintLineWrap := ifTinn.ReadInteger('App', 'iPrintLineWrap', SC_WRAP_WORD);

  bPrintPageNumber := ifTinn.ReadBool('Print', 'bPrintPageNumber', True);
  bPrintSyntaxColor := ifTinn.ReadBool('Print', 'bPrintSyntaxColor', True);
  iScaleMode := ifTinn.ReadInteger('Print', 'iScaleMode', 1);
  iZoomPreview := ifTinn.ReadInteger('Print', 'iZoomPreview', 90);

  // Send to R alphabetically ordered
  bEchoOn := ifTinn.ReadBool('Roptions', 'bEchoOn', True);
  actRsendEchoOn.Checked := bEchoOn;


  actRCurrentLineToTop.Visible := ifTinn.ReadBool('Roptions',
    'bRCurrentLineToTop', True);
  actRSendBlockMarked.Visible := ifTinn.ReadBool('Roptions',
    'bRSendBlockMarked', True);
  actRSendClipboard.Visible := ifTinn.ReadBool('Roptions',
    'bRSendClipboard', True);
  actRSendContiguous.Visible := ifTinn.ReadBool('Roptions',
    'bRSendContiguous', True);
  actRSendCursorToBeginningLine.Visible := ifTinn.ReadBool('Roptions',
    'bRSendCursorToBeginningLine', True);
  actRSendCursorToEndLine.Visible := ifTinn.ReadBool('Roptions',
    'bRSendCursorToEndLine', True);
  actRSendFile.Visible := ifTinn.ReadBool('Roptions', 'bRSendFile', True);
  actRSendLine.Visible := ifTinn.ReadBool('Roptions', 'bRSendLine', True);
  actRSendLinesToEndPage.Visible := ifTinn.ReadBool('Roptions',
    'bRSendLinesToEndPage', True);
  actRSendSelection.Visible := ifTinn.ReadBool('Roptions',
    'bRSendSelection', True);
  actRSendSweave.Visible := ifTinn.ReadBool('Roptions', 'bRSweave', True);
  bRKnitr := ifTinn.ReadBool('Roptions', 'bRKnitr', True);
  actRSendNavigator.Visible := ifTinn.ReadBool('Roptions', 'bRNavigator', True);
  bRKnitr := ifTinn.ReadBool('Roptions', 'bRKnitr', True);

  // Controlling R alphabetically ordered

  actRContClearAll.Visible := ifTinn.ReadBool('Roptions', 'bRClearAll', True);
  actRContClearConsole.Visible := ifTinn.ReadBool('Roptions',
    'bRClearConsole', True);
  actRContCloseAllGraphics.Visible := ifTinn.ReadBool('Roptions',
    'bRCloseAllGraphics', True);
  actRContEditVariable.Visible := ifTinn.ReadBool('Roptions',
    'bREditVariable', True);
  actRContEscape.Visible := ifTinn.ReadBool('Roptions', 'bREscape', True);
  actRContExampleSelectedWord.Visible := ifTinn.ReadBool('Roptions',
    'bRExampleSelectedWord', True);
  actRContFixVariable.Visible := ifTinn.ReadBool('Roptions',
    'bRFixVariable', True);
  actRContGuiStartClose.Visible := ifTinn.ReadBool('Roptions',
    'bRguiStartClose', True);
  actRContHelp.Visible := ifTinn.ReadBool('Roptions', 'bRHelp', True);
  actRContHelpSelectedWord.Visible := ifTinn.ReadBool('Roptions',
    'bRHelpSelectedWord', True);
  actRContListAllObjects.Visible := ifTinn.ReadBool('Roptions',
    'bRListAllObjects', True);
  actRContListVariableNames.Visible := ifTinn.ReadBool('Roptions',
    'bRListVariableNames', True);
  actRContListVariableStructure.Visible := ifTinn.ReadBool('Roptions',
    'bRListVariableStructure', True);
  actRContPackages.Visible := ifTinn.ReadBool('Roptions', 'bRPackages', True);
  actRContPlotVariable.Visible := ifTinn.ReadBool('Roptions',
    'bRPlotVariable', True);
  actRContPrintVariableContent.Visible := ifTinn.ReadBool('Roptions',
    'bRPrintVariableContent', True);
  actRContRemoveAllObjects.Visible := ifTinn.ReadBool('Roptions',
    'bRRemoveAllObjects', True);
  actRContSetWorkDirectory.Visible := ifTinn.ReadBool('Roptions',
    'bRSetWorkDir', True);
  actRContTCPConnection.Visible := ifTinn.ReadBool('Roptions',
    'bRTCPConnection', True);
  actRContTermStartClose.Visible := ifTinn.ReadBool('Roptions',
    'bRtermStartClose', True);
  actRSendSweave.Visible := ifTinn.ReadBool('Roptions', 'bRSweave', True);

  // Database status
//  iRcardBeforeChanges := ifTinn.ReadInteger('Database',
//    'iRcardBeforeChanges', 0);
  iRtipBeforeChanges := ifTinn.ReadInteger('Database', 'iRtipBeforeChanges', 0);
  iShortcutsBeforeChanges := ifTinn.ReadInteger('Database',
    'iShortcutsBeforeChanges', 0);


  // Latex Dimensional element
  LoadFromIni_LaTeX(ifTinn);


  // m.p.  tbKnitr.Visible := bRKnitr;

  hkTinnR := TfrmHotKeys.Create(Self);

  // Pandoc history
  slPandocHistory := TStringList.Create;
  ifTinn.ReadSectionValues('PandocHistory', slPandocHistory);
  if (slPandocHistory.Count > 0) then
  begin
    for i := 0 to (slPandocHistory.Count - 1) do
    begin
      sTmp := slPandocHistory.Strings[i];

      iPos := pos('=', sTmp);

      sTmp := copy(sTmp, iPos + 1, Length(sTmp));

      if (i = 0) then
        sPandocHistory := sTmp
      else
        sPandocHistory := sPandocHistory + #10 + sTmp;
    end;
  end
  else
    sPandocHistory := EmptyStr;

  // Pandoc history: From
  slPandocHistoryFrom := TStringList.Create;
  ifTinn.ReadSectionValues('PandocHistoryFrom', slPandocHistoryFrom);

  if (slPandocHistoryFrom.Count > 0) then
  begin
    for i := 0 to (slPandocHistoryFrom.Count - 1) do
    begin
      sTmp := slPandocHistoryFrom.Strings[i];

      iPos := pos('=', sTmp);

      sTmp := copy(sTmp, iPos + 1, Length(sTmp));

      if (i = 0) then
        sPandocHistoryFrom := sTmp
      else
        sPandocHistoryFrom := sPandocHistoryFrom + #10 + sTmp;
    end;
  end
  else
    sPandocHistory := EmptyStr;

  // Pandoc history: To
  slPandocHistoryTo := TStringList.Create;
  ifTinn.ReadSectionValues('PandocHistoryTo', slPandocHistoryTo);

  if (slPandocHistoryTo.Count > 0) then
  begin
    for i := 0 to (slPandocHistoryTo.Count - 1) do
    begin
      sTmp := slPandocHistoryTo.Strings[i];

      iPos := pos('=', sTmp);

      sTmp := copy(sTmp, iPos + 1, Length(sTmp));

      if (i = 0) then
        sPandocHistoryTo := sTmp
      else
        sPandocHistoryTo := sPandocHistoryTo + #10 + sTmp;
    end;
  end
  else
    sPandocHistoryTo := EmptyStr;

  if bRememberSearchList then
  begin
    slSearch := TStringList.Create;
    ifTinn.ReadSectionValues('SearchTextHistory', slSearch);
    if (slSearch.Count > 0) then
    begin
      for i := 0 to (slSearch.Count - 1) do
      begin
        sTmp := slSearch.Strings[i];

        iPos := pos('=', sTmp);

        sTmp := copy(sTmp, iPos + 1, Length(sTmp));

        if (i = 0) then
          sSearchTextHistory := sTmp
        else
          sSearchTextHistory := sSearchTextHistory + #10 + sTmp;
      end;
    end
    else
      sSearchTextHistory := EmptyStr;
  end;

  slSearch := TStringList.Create;
  sSearchDirHistory := EmptyStr;
  ifTinn.ReadSectionValues('SearchDirHistory', slSearch);

  if (slSearch.Count > 0) then
  begin
    for i := 0 to (slSearch.Count - 1) do
    begin
      sTmp := slSearch.Strings[i];

      iPos := pos('=', sTmp);

      sTmp := copy(sTmp, iPos + 1, Length(sTmp));

      if (i = 0) then
        sSearchDirHistory := sTmp
      else
        sSearchDirHistory := sSearchDirHistory + #10 + sTmp;
    end;
  end
  else
    sSearchDirHistory := EmptyStr;

  slSearch := TStringList.Create;
  ifTinn.ReadSectionValues('SearchFileMaskHistory', slSearch);

  if (slSearch.Count > 0) then
  begin
    for i := 0 to (slSearch.Count - 1) do
    begin
      sTmp := slSearch.Strings[i];

      iPos := pos('=', sTmp);

      sTmp := copy(sTmp, iPos + 1, Length(sTmp));

      if (i = 0) then
        sSearchFileMaskHistory := sTmp
      else
        sSearchFileMaskHistory := sSearchFileMaskHistory + #10 + sTmp;
    end;
  end
  else
    sSearchFileMaskHistory := EmptyStr;

  // Favorite Folders
  slTmpFavoriteFolders := TStringList.Create;
  slFavoriteFolders := TStringList.Create;
  ifTinn.ReadSectionValues('ExplorerFavorites', slTmpFavoriteFolders);
  if (slTmpFavoriteFolders.Count > 0) then
  begin
    for i := 0 to (slTmpFavoriteFolders.Count - 1) do
    begin
      sTmp := slTmpFavoriteFolders.Strings[i];

      iPos := pos('=', sTmp);

      sTmp := copy(sTmp, iPos + 1, Length(sTmp));

      slFavoriteFolders.Add(sTmp);
    end;
  end
  else
    sSearchFileMaskHistory := EmptyStr;
  frmTools.cbExplorerFavorites.Items.AddStrings(slFavoriteFolders);
  FreeAndNil(slTmpFavoriteFolders);
  FreeAndNil(slFavoriteFolders);

  iLastFile := ifTinn.ReadInteger('App', 'iLastFile', 10);

  // Read the list of fileMRU docs and add them to the menu and the drop down menu
  ifTinn.ReadSectionValues('FileMRU', slFileMRU);
  BuildMRU(menFileRecentFiles);

  // Do the same for Projects
  ifTinn.ReadSectionValues('ProjectMRU', slprojectMRU);
  BuildProjectMRU(menProjRecent);

  slTextDiff := TStringList.Create;
  ifTinn.ReadSectionValues('Options TextDiff', slTextDiff);

  // Paths and version of R
  sPathR := GetRegistryValue('SOFTWARE\R-core\R');
  sRversion := StripNonConforming(sPathR, ['.', '0' .. '9']);

  bRArchitecture64 := bRArchitecture64 and
    SysUtils.DirectoryExists(sPathR + '\bin\x64');

  // Check the latest R version installed
  if bRUseLatest then
  begin
    if (sPathR <> EmptyStr) then
    begin
      SetPathRTerm;
      SetPathRgui;
    end;
  end
  else
  begin
    // Will read from INI because the user choice is not to use the latest instaled version of R
    sPathRterm := trim(ifTinn.ReadString('App', 'sPathRterm', EmptyStr));
    if (sPathRterm = EmptyStr) or not FileExists(sPathRterm) then
    begin
      sPathR := 'UNKNOWN';
      sRversion := 'UNKNOWN';
      sPathRterm := 'UNKNOWN';
    end;

    sPathRgui := trim(ifTinn.ReadString('App', 'sPathRgui', EmptyStr));
    if (sPathRgui = EmptyStr) or not FileExists(sPathRgui) then
    begin
      sPathR := 'UNKNOWN';
      sRversion := 'UNKNOWN';
      sPathRgui := 'UNKNOWN';
    end;
  end;

  sRmirror := trim(ifTinn.ReadString('App', 'sRmirror',
    'http://cran.at.r-project.org/'));
  frmTools.stbRMirrors.Panels[1].Text := sRmirror;

  iAlphaBlendValue := 255 - (255 * iTransparency) Div 100;
end;

procedure TfrmTinnMain.SetPreferences_Editor;
begin

  with ifEditor do
  begin

    // Gutter

    actLineNumbersVisible.Checked := ReadBool('Gutter', 'bLineNumber', True);
    actMarkersVisible.Checked := ReadBool('Gutter', 'bMarkers', True);
    actFoldingVisible.Checked := ReadBool('Gutter', 'bFolding', True);
    iColorMark1 := ReadInteger('Gutter', 'iColorMark1', 14680063);
    iColorMark2 := ReadInteger('Gutter', 'iColorMark2', 11908584);

    // Line wrap

    iEditorLineWrap := ReadInteger('Editor', 'iEditorLineWrap', SC_WRAP_WORD);
    actEditorLineWrap.Checked := (iEditorLineWrap <> SC_WRAP_NONE);

    iIOLineWrap := ReadInteger('Editor', 'iIOLineWrap', SC_WRAP_WORD);
    actRtermIOLineWrap.Checked := (iIOLineWrap <> SC_WRAP_NONE);

    iLogLineWrap := ReadInteger('Editor', 'iLogLineWrap', SC_WRAP_WORD);
    actRtermLogLineWrap.Checked := (iLogLineWrap <> SC_WRAP_NONE);

    // CurrentLine
    bHighlightActiveLine := ReadBool('Editor', 'bHighlightActiveLine', True);
    iHighlightActiveLineColor := ReadInteger('Editor', 'iHighlightActiveLineColor', 14680063);

  end;



{

  // Gutter Options
  with coEditor.Gutter do
  begin
    AutoSize := ifEditor.ReadBool('Gutter', 'bAutoSize', True);
    Color := ifEditor.ReadInteger('Gutter', 'iColor', coEditor.Gutter.Color);
    DigitCount := ifEditor.ReadInteger('Gutter', 'iDigitCount', 2);
    Font.Color := ifEditor.ReadInteger('Gutter', 'iFont.Color', 0);
    Font.Name := ifEditor.ReadString('Gutter', 'sFont.Name', 'Courier New');
    Font.Size := ifEditor.ReadInteger('Gutter', 'iFont.Size', 8);
    LeadingZeros := ifEditor.ReadBool('Gutter', 'bLeadingZeros', False);

    Visible := ifEditor.ReadBool('Gutter', 'bVisible', True);
    Width := ifEditor.ReadInteger('Gutter', 'iWidth', 20);
    ZeroStart := ifEditor.ReadBool('Gutter', 'bZeroStart', False);
  end;

  // Editor Options
  with coEditor do
  begin
    ExtraLineSpacing := ifEditor.ReadInteger('Editor', 'iExtraLineSpacing', 0);
    Font.Color := ifEditor.ReadInteger('Editor', 'iFont.Color', 0);
    Font.Name := ifEditor.ReadString('Editor', 'sFont.Name', 'Courier New');
    Font.Size := ifEditor.ReadInteger('Editor', 'iFont.Size', 11);
    HideSelection := ifEditor.ReadBool('Editor', 'bHideSelection', False);
    InsertCaret := TSynEditCaretType(ifEditor.ReadInteger('Editor',
      'iInsertCaret', 0));
    Options := TSynEditorOptions(ifEditor.ReadInteger('Editor', 'iOptions',
      124618775)); // My basic preferences!
    OverwriteCaret := TSynEditCaretType(ifEditor.ReadInteger('Editor',
      'iOverWriteCaret', 3));
    RightEdge := ifEditor.ReadInteger('Editor', 'iRightEdge', 80);
    RightEdgeColor := ifEditor.ReadInteger('Editor', 'iRightEdgeColor',
      coEditor.RightEdgeColor);
    SelectedColor.Background := ifEditor.ReadInteger('Editor',
      'iSelectedColor.Background', coEditor.SelectedColor.Background);
    SelectedColor.Foreground := ifEditor.ReadInteger('Editor',
      'iSelectedColor.Foreground', coEditor.SelectedColor.Foreground);
    TabWidth := ifEditor.ReadInteger('Editor', 'iTab.Width', 2);
    WantTabs := ifEditor.ReadBool('Editor', 'bWantTabs', True);
  end;

  // These options tend to be changed very often.
  // In this way was preferred to put in acts!
  actLineNumbersVisible.Checked := coEditor.Gutter.ShowLineNumbers;
  actGutterVisible.Checked := coEditor.Gutter.Visible;
  actSpecialCharVisible.Checked := (eoShowSpecialChars in coEditor.Options);  }
end;
 {
procedure TfrmTinnMain.GetCallTip(var sRObject, sRPackage, sRTip: string;
  var bTipFound: Boolean);

// Function to receive and adequate tip from R under TCPIP
  function ReceiveTipFromTCPIP(): string;
  var
    iPosDoubleCote: integer;
    sRes: string;

  begin
    sRes := csRtip.Socket.ReceiveText;
    iPosDoubleCote := pos('"', sRes);
    Delete(sRes, 1, iPosDoubleCote);
    sRes := InvertString(sRes);
    iPosDoubleCote := pos('"', sRes);
    Delete(sRes, 1, iPosDoubleCote);
    sRes := InvertString(sRes);
    sRes := StringReplace(sRes, '\"', '''', [rfReplaceAll]);
    // Particular cases of R
    // read.table(quote="\"'"  : it is very strange!
    sRes := StringReplace(sRes, '\\''''', '\"', [rfReplaceAll]);

    Result := trim(sRes);
  end;

  procedure GetTipFrom_TCPIP(sRClassFor: string);
  var
    sCmd: string;
    i: integer;

  begin
    // Try to find tip from TCPIP
    if UseTCPIP then
    begin
      sCmd := 'trArgs(' + 'fname=' + '''' + sRObject + '''' + ', ' + 'txt=' + ''
        + ', ' + 'pkg=' + '''' + sRPackage + '''' + ', ' + 'classfor=' + '''' +
        sRClassFor + '''' + ')' + #13#10;
      csRtip.Socket.SendText(sCmd);

      i := 0;
      repeat
        sRTip := EmptyStr;

        Sleep(2 * iDelay); // This delay is very important!

        sRTip := ReceiveTipFromTCPIP;

        inc(i);
      until (sRTip <> EmptyStr) or (i = 5);

      if (sRTip <> EmptyStr) then
      begin
        bTipFound := True;
        sTipFromRServer := 'TCP/IP';
      end
      else
      begin
        stbMain.Panels[7].Text := 'Tip not found';

        if UseTCPIP then
          stbMain.Panels[8].Text := '<' + sRObject + '>' +
            ' R server linked: YES'
        else
          stbMain.Panels[8].Text := '<' + sRObject + '>' +
            ' R server linked: NOT';
      end;
    end // UseTCPIP
  end;

var
  i, j: integer;

  sLocline, sRClassFor: string;
  seEditor: TDScintilla;

  procedure GetLocLine(se: TSynEdit); overload;
  begin
    with se do
    begin
      i := CaretX;
      sLocline := LineText;
      sLocline := trim(copy(sLocline, 1, i - 1));
    end;
  end;

  procedure GetLocLine(se: TDScintilla); overload;
  begin
      i := GetCaretX(se);
      sLocline := GetCurrentLine(se);
      sLocline := trim(copy(sLocline, 1, i - 1));
  end;


begin
  seEditor := nil;

  sTipFromRServer := EmptyStr;

  i := FindTopWindow;
  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
    with (Self.MDIChildren[i] as TfrmEditor) do
      if (sActiveEditor = 'synEditor') then
        seEditor := sciEditor
      else
        seEditor := sciEditor2;

  if (iSynWithFocus = 3) then
    GetLocLine(frmRterm.sciIO)
  else
    GetLocLine(seEditor);

  if (sLocline <> EmptyStr) then
  begin
    // Find the text immediately before the last open-parenthesis (the function)
    // that doesn't have a matching close-parenthesis
    // Basic RegEx from: http://stackoverflow.com/questions/16952821/regex-word-immediately-before-the-last-opened-parenthesis?lq=1
    sRObject := RegEx(sLocline,
      '[_a-zA-Z0-9.-]+(?=\((?:[^()]*\([^()]*\))*[^()]*$)',
      // R has function with complex names: '_' '.' '-' 'numbers', ...
      False);

    if (sRObject = EmptyStr) then
      Exit; // Nothing to do!

    // Find the text immediately before ::: (the package) considering
    // the last open-parenthesis that doesn't have a matching close-parenthesis
    // Basic RegEx adapted from: http://stackoverflow.com/questions/16952821/regex-word-immediately-before-the-last-opened-parenthesis?lq=1
    sRPackage := RegEx(sLocline,
      '\w+(?=:\w+(?=\((?:[^()]*\([^()]*\))*[^()]*$))', False);

    // Find the text immediately after the latst open-parenthesis (the object) considering
    // the last open-parenthesis that doesn't have a matching close-parenthesis.
    // Basic RegEx from: http://stackoverflow.com/questions/17065448/regex-text-immediately-after-the-last-opened-parenthesis?lq=1


//      The regex '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*?(\(.*?\))?(?=[ ,]|$)(?! <-)(?<! <-)'
//      is nice, but, not match this cases:
//      mean(iris[1:10,1:4]            -> mean(iris[1:10
 //     cov(iris[1:10,1:4],            -> cov(iris[1:10
  //    plot(iris[1:10, 1:4]           -> plot(iris[1:10
   //   plot(iris[1:10, -c(4:5)],      -> plot(iris[1:10
    //  plot(iris[1:10, 1],            -> plot(iris[1:10
     // and is very hard (for me) to fix this regex!
 ////
 //     So, my option was to use a more generic regex: '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*'
  //    and to do parts of the job using Delete function (as below).


    sRClassFor := RegEx(sLocline,
      // '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*?(\(.*?\))?(?=[ ,]|$)(?! <-)(?<! <-)',
      '(?<=\()(?=([^()]*\([^()]*\))*[^()]*$).*', False);

    if (sRClassFor <> EmptyStr) then
    begin
      i := GetPosMatchingForward(sRClassFor, '(', ')');

      j := GetPosMatchingForward(sRClassFor, '[', ']');
      if (i <> 0) and (i > j) then
        Delete(sRClassFor, i + 1, Length(sRClassFor));
    end;

    if (sRClassFor <> EmptyStr) then
    begin
      if (sRClassFor[Length(sRClassFor)] = ',') then
        Delete(sRClassFor, Length(sRClassFor), 1);

      sRClassFor := StringReplace(sRClassFor, '''', '"', [rfReplaceAll]);
      // Avoid problem with read.table(file='test',
    end;

    try
      GetTipFrom_TCPIP(sRClassFor);
    finally
      // TODO
    end;
  end;

    // To debug only
 //   ShowMessage('OBJ=' +
 //   sRObject +
 //   #10#13 +
 //   'PKG=' +
  //  sRPackage +
 //   #10#13 +
 //   'CLF=' +
 //   sClassfor);

end;
  }
procedure TfrmTinnMain.GetCompletion(var sRObject, sRPackage,
  sCompletion: string);

  procedure GetInfo_ClearCompletion;
  begin
    GetRInfo(sCompletion, sRPackage, sRObject);
    // Get info, [package] and <object>, from the returned

    sCompletion := StringReplace(sCompletion, sRPackage, EmptyStr, []);

    sCompletion := StringReplace(sCompletion, sRObject, EmptyStr, []);
    sCompletion := trim(sCompletion);
  end;

// Receive and adequate tip from R under TCPIP
  procedure ReceiveCompletionFromTCPIP;
  var
    i: integer;

  begin
    sCompletion := csRtip.Socket.ReceiveText;

    GetInfo_ClearCompletion;

    // Remove first "
    i := pos('"', sCompletion);

    Delete(sCompletion, 1, i);

    // Remove latest "
    sCompletion := InvertString(sCompletion);

    i := pos('"', sCompletion);

    Delete(sCompletion, 1, i);

    // Remove latest |
    i := pos('|', sCompletion);

    Delete(sCompletion, 1, i);

    sCompletion := InvertString(sCompletion);
    sCompletion := trim(sCompletion);
  end;

  procedure CompletionGetFromTCPIP(var sCmd, sPattern: string;
    var bFound: Boolean);
  var
    i: integer;

  begin
    // Try to use TCPIP
    if UseTCPIP then
    begin
      sCmd := 'trComplete(' + '''' + sRObject + '''' + ', ' + 'pattern=' + ''''
        + sPattern + '''' + ', ' + 'sep=''|''' + ')' + #13#10;

      csRtip.Socket.SendText(sCmd);

      i := 0;
      repeat
        Sleep(iDelay); // This delay is very important!
        ReceiveCompletionFromTCPIP;
        inc(i);
      until (sCompletion <> EmptyStr) or (i = 5);

      if (sCompletion <> EmptyStr) then
      begin
        bFound := True;
        sDataCompletion := 'TCP/IP';
      end
      else
      begin
        //stbMain.Panels[7].Text := 'Completion not found';
        {if UseTCPIP then
          stbMain.Panels[8].Text := '<' + sRObject + '>' +
            ' R server linked: YES'
        else
        //  stbMain.Panels[8].Text := '<' + sRObject + '>' +
            ' R server linked: NOT';}
      end;
    end;
  end;

var
  bFound: Boolean;
  i, iX, iSavepos, iStartX: integer;
  sTmp, sLocline, sPattern: string;
  seEditor: TDScintilla;
 {
  procedure GetLocLine(se: TSynEdit); overload;
  begin
    with se do
    begin
      i := CaretX;
      sLocline := LineText;
      sLocline := trim(copy(sLocline, 1, iX - 1));
    end;
  end;  }

  procedure GetLocLine(se: TDScintilla);
  begin
      i := GetCaretX(se);
      sLocline := GetCurrentLine(se);
      sLocline := trim(copy(sLocline, 1, iX - 1));
  end;



begin
  seEditor := nil;
  sPattern := EmptyStr;
  sDataCompletion := EmptyStr;

  i := FindTopWindow;
  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
    with (Self.MDIChildren[i] as TfrmEditor) do
      if (sActiveEditor = 'sciEditor') then
        seEditor := sciEditor
      else
        seEditor := sciEditor2;

  if (iSciWithFocus = 3) then
    GetLocLine(frmRterm.sciIO)
  else
    GetLocLine(seEditor);

  // Go back from the cursor and find the first '$'
  if (iX > Length(sLocline)) then
    iX := Length(sLocline)
  else
    dec(iX);

  bFound := False;

  // This is a good place to RegEx
  while (iX > 0) and not(bFound) do
  begin
    if (sLocline[iX] = '$') then
    begin

      // Get the pattern after $
      sTmp := InvertString(sLocline);

      i := pos('$', sTmp);

      if (i > 0) then
      begin
        sTmp := copy(sTmp, 1, i - 1);

        if bDataCompletionAnywhere then
          sPattern := InvertString(sTmp)
        else
          sPattern := '^' + InvertString(sTmp)
      end;

      // We have a valid symbol '$' to completion, lets see what the word before it is
      iStartX := iX;

      {
        while (iX > 0) and
        not(sLocLine[iX] in TSynValidStringChars) do Dec(iX);
      }

      if (iX > 0) then
      begin
        iSavepos := iX;

        // Changed in version 2.2.1.0 to avoid problem with words that has '.' inside of the name
        while (iX > 0) and
        // (sLocLine[iX] in TSynValidStringChars) do dec(iX);
          (sLocline[iX] <> ' ') do
          dec(iX);
        inc(iX);

        sRObject := copy(sLocline, iX, iSavepos - iX);

        CompletionGetFromTCPIP(sRObject, sPattern, bFound);

        if not bFound then
        begin
          iX := iStartX;
          dec(iX);
        end;
      end; // if tmpX > 0
    end
    else
      dec(iX) // else if locLine[iX] = '$'
  end; // while (iX > 0) and not(foundMatch)
end;


procedure TfrmTinnMain.summaryselection1Click(Sender: TObject);
var
  sTmp: string;
  sciEditor: TDScintilla;
begin
  if not ValidRRunning then
    Exit;

  if not GetActiveEditorOrNil(sciEditor) then
    exit;

  //sTmp := trim(sciEditor.GetSelText);
  sTmp := trim(FindWord);
  if sTmp = '' then
    exit;
  sTmp := 'summary('+sTmp+')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.synEditPrintPrintLine(Sender: TObject; LineNumber,
  PageNumber: Integer);
begin

end;

(* The below enable Tinn-R to open files by Enter or Double click from Windwos Explorer *)
procedure TfrmTinnMain.DefaultHandler(var message);
begin
  if (integer(TMessage(message).msg) = WM_FINDINSTANCE) then
    TMessage(message).Result := MyUniqueConst
  else if (TMessage(message).msg = WM_RESTOREAPP) then
    PostMessage(Application.Handle, WM_SYSCOMMAND, SC_RESTORE, 0)
  else
    inherited DefaultHandler(TMessage(message));
end;

function TfrmTinnMain.GetBuildInfo: string;
var
  VerInfoSize, VerValueSize, Dummy: DWORD;

  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;

  wV1, wV2, wV3, wV4: Word;

begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
  with VerValue^ do
  begin
    wV1 := dwFileVersionMS shr 16;
    wV2 := dwFileVersionMS and $FFFF;
    wV3 := dwFileVersionLS shr 16;
    wV4 := dwFileVersionLS and $FFFF;
  end;

  FreeMem(VerInfo, VerInfoSize);

  Result := IntToStr(wV1) + '.' + IntToStr(wV2) + '.' + IntToStr(wV3) + '.' +
    IntToStr(wV4);
end;

procedure TfrmTinnMain.actFileNewExecute(Sender: TObject);
var EditorFile: TEditorFile;
begin
  inc(iFileCount);
  while FindWindowByName('Untitled' + IntToStr(iFileCount)) <> -1 do
    inc(iFileCount);

  with EditorFile do
  begin
   iId:= GetNewUniqueEditorId;
   sFile:= 'Untitled' + IntToStr(iFileCount);
   iNewFile:= 1;
   iModified:= 0;
   iUnsavedChanges:= 0;
   sMarks:= '';
   sTempFile:= '';
   iTopLine:= 0;
   iCaretPosition := 0;
   sFolding:= '';
   iLexerId:= iDefaultLexerId;
   iTabPosition:= pgFiles.PageCount + 1;
  end;
  LoadFile(EditorFile);
end;

function TfrmTinnMain.GetNewUniqueEditorId: Integer;
var
  i: integer;
begin
  Result := 0;

  for i := 0 to Self.MDIChildCount - 1 do
    if  (Self.MDIChildren[i] as TfrmEditor).EditorFile.iId >= Result then
      Result := (Self.MDIChildren[i] as TfrmEditor).EditorFile.iId + 1;
end;



procedure TfrmTinnMain.actFileOpenExecute(Sender: TObject);
var
  i: integer;

begin
  with odMain do
  begin
    DefaultFolder := sWorkingDir;

    ReLoadDialogFileExtension(OdMain.FileTypes);

    Options := Options + [fdoAllowMultiSelect];

    if Execute then
      for i := 0 to (Files.Count - 1) do
        OpenFileIntoTinn(Files[i]);

    Options := Options - [fdoAllowMultiSelect];
  end;
end;

procedure TfrmTinnMain.RMenu(bOption: Boolean);
begin
//  menR.Visible := bOption;
//  actTobRVisible.Visible := bOption;
end;



procedure TfrmTinnMain.ControlResources(bOption: Boolean);
begin
  // Main R menu and R toolbar alphabetically ordered
  actRContClearAll.Enabled := bOption;
  actRContClearConsole.Enabled := bOption;
  actRContCloseAllGraphics.Enabled := bOption;
  actRContEditVariable.Enabled := bOption and (pgFiles.PageCount > 0);
  actRContEscape.Enabled := bOption and not Rterm_Running;
  actRContExampleSelectedWord.Enabled := bOption;
  actRContFixVariable.Enabled := bOption and (pgFiles.PageCount > 0);
  actRContHelp.Enabled := bOption;
  actRContHelpSelectedWord.Enabled := bOption;
  actRContListAllObjects.Enabled := bOption;
  actRContListVariableNames.Enabled := bOption and (pgFiles.PageCount > 0);
  actRContListVariableStructure.Enabled := bOption and (pgFiles.PageCount > 0);
  actRContPacInstall.Enabled := bOption;
  actRContPacInstalled.Enabled := bOption;
  actRContPacInstallZip.Enabled := bOption;
  actRContPacInstTinnRcom.Enabled := bOption;
  actRContPacLoad.Enabled := bOption;
  actRContPacLoadTinnRcom.Enabled := bOption;
  actRContPacNew.Enabled := bOption;
  actRContPacRemove.Enabled := bOption;
  actRContPacStatus.Enabled := bOption;
  actRContPacUpdate.Enabled := bOption;
  actRContPlotVariable.Enabled := bOption and (pgFiles.PageCount > 0);
  actRContPrintVariableContent.Enabled := bOption and (pgFiles.PageCount > 0);
  actRContRemoveAllObjects.Enabled := bOption;
  actRContTCPConnection.Enabled := bOption or not bIPLocal;
  actRSendClipboard.Enabled := bOption;

  // Rterm
  actRtermIOHistory.Enabled := bOption and Rterm_Running;
  actRtermLoadHistory.Enabled := bOption and Rterm_Running;
  actRtermLoadWorkspace.Enabled := bOption and Rterm_Running;
  actRtermSaveHistory.Enabled := bOption and Rterm_Running;
  actRtermSaveWorkspace.Enabled := bOption and Rterm_Running;


  // Rcard
  actRCardExampleSelected.Enabled := bOption;
  actRCardHelpSelected.Enabled := bOption;


  // Rmirrors
  actRmirrorsSetRepos.Enabled := bOption;
  actRmirrorsUpdate.Enabled := bOption;

  // R explorer
  //if (not bOption) and (bRExplorerActive)  then
  //  modDados.ResetRObjectDatabase;

  actREnvironmentRefresh.Enabled := bOption;
  actRExplorerRefresh.Enabled := bOption;


  if Assigned(frmTools) then
  begin
    if moddados.cdRObjects.RecordCount = 0 then
        SetRExplorer(False)
      else
        SetRExplorer(bOption);
  end;

  // Project
  pmenProjRSendToR.Enabled := bOption;
  pmenProjRSetWorkDir.Enabled := bOption and (iProjecSelected = 2);

  // Menu R
  actGetInfo.Enabled := bOption;
  actRSet_trPaths.Enabled := bOption;


  // m.p. new R connection stuff
  if not bOption then
    iServerConnectionTrial := 0;

end;

procedure TfrmTinnMain.SendResources(bOption: Boolean);
var
  bMark: Boolean;
  i: integer;
  seEditor: TDScintilla;

begin
  i := 0;
  bMark := False;
  if GetActiveEditorOrNil(seEditor) then
    bMark := (seEditor.MarkerNext(-1, -1) > -1);

  // Alphabetically ordered
  actRContSetWorkDirectory.Enabled := bOption and
    FileExists((Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile);
  actRCurrentLineToTop.Enabled := bOption;
  actReformatR.Enabled := bOption;
  actRSendBlockMarked.Enabled := bOption and bMark;
  actRSendContiguous.Enabled := bOption;
  actRSendCursorToBeginningLine.Enabled := bOption;
  actRSendCursorToEndLine.Enabled := bOption;
  actRSendFile.Enabled := bOption;
  actRSendNavigator.Enabled := bOption;
  actRSendKnitPdf.Enabled := bOption;
  actRSendKnitHtml.Enabled := bOption;
  actRSendLine.Enabled := bOption;
  actRSendLinesToEndPage.Enabled := bOption;
  actRSendSweave.Enabled := bOption;
end;

procedure TfrmTinnMain.actWebSelectedTextGoogleExecute(Sender: TObject);
var
  sTmp, sWord: string;

begin
  if (pgFiles.PageCount = 0) then
    Exit;
  sWord := FindWord;

  if (sWord = EmptyStr) then
  begin
    MessageDlg('No valid word selected from the file!', mtInformation,
      [mbOk], 0);
    Exit;
  end;

  sTmp := 'www.google.com/search?q=' + sWord +
    '&domains=r-project.org&sitesearch=r-project.org&btnG=Google+Search';
  OpenUrl(sTmp);

end;

procedure TfrmTinnMain.actWebSelectedTextSiteSearchExecute(Sender: TObject);
var
  sTmp, sSelWord: string;

begin
  if (pgFiles.PageCount = 0) then
    Exit;
  sSelWord := FindWord;

  if (sSelWord = EmptyStr) then
  begin
    MessageDlg('No valid word selected from the file!', mtInformation,
      [mbOk], 0);
    Exit;
  end;

  sTmp := 'finzi.psych.upenn.edu/cgi-bin/namazu.cgi?query=' + sSelWord +
    '&max=20&Result=normal&sort=score&idxname=functions&idxname=docs&idxname=Rhelp02a';

  OpenUrl(sTmp);
end;

procedure TfrmTinnMain.actWebWebsiteExecute(Sender: TObject);
begin
  OpenUrl('www.r-project.org/');
end;

procedure TfrmTinnMain.actWindowArrangeExecute(Sender: TObject);
begin
  ArrangeIcons;
  sWindowOption := 'Arrange icons';
end;

procedure TfrmTinnMain.actWindowCascadeExecute(Sender: TObject);
begin
  Cascade;
  sWindowOption := 'Cascade';
end;

procedure TfrmTinnMain.actWindowMinimizeAllExecute(Sender: TObject);
var
  i: integer;
begin
  for i := (Self.MDIChildCount - 1) downto 0 do
    Self.MDIChildren[i].WindowState := wsMinimized;
  sWindowOption := 'Minimize all';
end;

procedure TfrmTinnMain.actWindowTileHorizontalExecute(Sender: TObject);
begin
  TileMode := tbHorizontal;
  sWindowOption := 'Tiled horizontal';
  Tile;
end;

procedure TfrmTinnMain.actWindowTileVerticalExecute(Sender: TObject);
begin
  TileMode := tbVertical;
  sWindowOption := 'Tiled vertical';
  Tile;
end;

procedure TfrmTinnMain.OpenUserGuidePDF(sWhere: string);
var
  sFile, sViewerDefault, sPathSumatra, sParameter: string;

begin
  sFile := sPathTinnR + '\doc\User guide.pdf';

  sParameter := '-reuse-instance ' + '-named-dest ' + sWhere;
  try
    sViewerDefault := GetAssociation('.pdf');

    if pos('Sumatra', sViewerDefault) > 0 then
      // Open default PDF viewer
      ShellExecute(0, 'open', PChar(sFile), PChar(sParameter), nil,
        sw_shownormal)
    else
    begin
      sPathSumatra := sPathTinnR + '\sumatra\SumatraPDF.exe';

      // Open SumatraPDF viewer
      OpenCmdLine(sPathSumatra + ' "' + sFile + '"' + sParameter,
        sw_shownormal);
    end;
  except
    MessageDlg('PDF viewer is not accessible!', mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmTinnMain.acReopenProject10Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenProject1Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenProject2Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenProject3Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenProject4Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenProject5Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenProject6Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenProject7Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenProject8Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenProject9Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acShowNotificationExecute(Sender: TObject);
begin
  MessageDlg(sNotifyLongText, mtInformation, [mbOk], 0);
end;

procedure TfrmTinnMain.actHelpAboutExecute(Sender: TObject);
begin
  with TfrmAbout.Create(Self) do
    try
      ShowModal;
    finally
      frmTinnMain.Refresh;
      FreeAndNil(frmAbout);
      //SetFocus_Main;
    end;
end;

procedure TfrmTinnMain.actHelpDeplateExecute(Sender: TObject);
begin
  OpenHelpFile('\sample\deplate.dplt');
end;



procedure TfrmTinnMain.actAlignEqualSignExecute(Sender: TObject);
var edForm: TfrmEditor;
begin
  if GetTopEditorForm(edForm) then
    edForm.AlignEqualSign;
end;

procedure TfrmTinnMain.actAlignFirstLineExecute(Sender: TObject);
var edForm: TfrmEditor;
begin
  if GetTopEditorForm(edForm) then
    edForm.AlignWithFirstLine;
end;

procedure TfrmTinnMain.WMDropFiles(var msg: TWMDropFiles);
var
  chTmp: PChar;
  i, iSize, iCount: integer;
  slFile: TStringList;

begin
  try
    chTmp := '';
    iCount := DragQueryFile(msg.Drop, $FFFFFFFF, chTmp, 255);
    slFile := TStringList.Create;
    try
      for i := 0 to (iCount - 1) do
      begin
        iSize := DragQueryFile(msg.Drop, i, nil, 0) + 1;
        chTmp := StrAlloc(iSize);

        try
          DragQueryFile(msg.Drop, i, chTmp, iSize);

          if FileExists(chTmp) then
            slFile.Add(ExpandFileName(chTmp));
        finally
          StrDispose(chTmp);
        end;
      end;

      for i := 0 to (slFile.Count - 1) do
        OpenFileIntoTinn(slFile.Strings[i]);

    finally
      FreeAndNil(slFile);
    end;
  finally
    DragFinish(msg.Drop);
  end;
end;

procedure TfrmTinnMain.WMCopyData(var msg: TWMCopyData);
var
  chReceived: PChar;
  sPathReceived: string;

begin
  chReceived := msg.CopyDataStruct.lpData;
  sPathReceived := AnsiExtractQuotedStr(chReceived, '"');
  CheckIfFileFromDvi(StringReplace(sPathReceived, '/', '\', [rfReplaceAll]));
end;

procedure TfrmTinnMain.SetFileSize_StatusBar(sfilename: string);

// Return the exact file size for a file. Return zero if the file is not found.
  function FileSize(FileName: string): Int64;
  var
    srSearch: TSearchRec;

  begin
    if (FindFirst(FileName, faAnyFile, srSearch) = 0) then // if found
      Result := Int64(srSearch.FindData.nFileSizeHigh) shl Int64(32) +
      // Calculate the size
        Int64(srSearch.FindData.nFileSizeLow)
    else
      Result := 0;
    FindClose(srSearch); // Close the find
  end;

  function BytesToString(Bytes: real; LongNames: Boolean = False;
    NrOfDecimals: integer = 2): string;

  const
    aStrings: array [0 .. 6] of string = ('B', 'KB', 'MB', 'GB', 'TB',
      'PB', 'EB');

  var
    i: integer;
    r: real;
    s: string;

  begin
    i := 0;
    r := Bytes;
    while (r > 1024) and (i < 6) do
    begin
      inc(i);
      r := r / 1024;
    end;
    str(r: 7: NrOfDecimals, s);
    Result := trim(s + ' ' + aStrings[i]);
  end;

var
  dSize: double; // Int64
  sSize: string;

begin
  if (ExtractFileExt(sfilename) = EmptyStr) and (pos('Untitled', sfilename) > 0)
  then
  begin
    //stbMain.Panels[5].Text := EmptyStr;
    atbStatus.ActionClient.Items[5].Caption := '';
    Exit;
  end
  else
    dSize := FileSize(sfilename);

  if (dSize > 0) and (pgFiles.PageCount > 0) then
  begin
    sSize := 'Size: ' + BytesToString(dSize);
    atbStatus.ActionClient.Items[5].Caption := sSize;
  end
  else
    atbStatus.ActionClient.Items[5].Caption := '';
end;

procedure TfrmTinnMain.actReadOnlyExecute(Sender: TObject);
var
  bReadOnly: Boolean;
  i: integer;

begin
  // m.p. REFACTOR - move content to frmEditor

  i := FindTopWindow;
  with (Self.MDIChildren[i] as TfrmEditor).sciEditor do
  begin
    if GetReadOnly then
    begin
      SetReadOnly(False);
      if Assigned((Self.MDIChildren[i] as TfrmEditor).sciEditor2) then
        (Self.MDIChildren[i] as TfrmEditor).sciEditor2.SetReadOnly(false);
      bReadOnly := False;
      actReadOnly.ImageIndex := 292;
    end
    else
    begin
      SetReadOnly(true);
      if Assigned((Self.MDIChildren[i] as TfrmEditor).sciEditor2) then
        (Self.MDIChildren[i] as TfrmEditor).sciEditor2.SetReadOnly(true);
      bReadOnly := True;
      actReadOnly.ImageIndex := 169;

    end;
  end;




  if not bReadOnly then
    (Self.MDIChildren[i] as TfrmEditor).EnableSave;

  actReadOnly.Checked := not(actReadOnly.Checked);

  with (Self.MDIChildren[i] as TfrmEditor) do
  begin
    if sciEditor.GetModify then
    begin
      SetTabTitle('*');
      CheckSaveStatus;
    end
    else
    begin
      SetTabTitle(EmptyStr);
      CheckSaveStatus;
    end
  end;
end;

procedure TfrmTinnMain.actEditCopyExecute(Sender: TObject);
var
  cFocus: TObject;
begin
  cFocus :=  GetFocusedObject;
    if cFocus.ClassName = 'TDScintilla' then
      (cFocus AS TDScintilla).Copy else
    if cFocus.ClassName = 'TButtonedEdit' then
      (cFocus AS TButtonedEdit).CopyToClipboard else
    if cFocus.ClassName = 'TMemo' then
      (cFocus AS TMemo).CopyToClipboard else
    if cFocus.ClassName = 'TDBEdit' then
      (cFocus AS TDBEdit).CopyToClipboard;
end;

procedure TfrmTinnMain.actEditCutExecute(Sender: TObject);
var
  cFocus: TObject;
begin
  cFocus :=  GetFocusedObject;
    if cFocus.ClassName = 'TDScintilla' then
      (cFocus AS TDScintilla).Cut else
    if cFocus.ClassName = 'TButtonedEdit' then
      (cFocus AS TButtonedEdit).CutToClipboard else
    if cFocus.ClassName = 'TMemo' then
      (cFocus AS TMemo).CutToClipboard else
    if cFocus.ClassName = 'TDBEdit' then
      (cFocus AS TDBEdit).CutToClipboard;
end;

procedure TfrmTinnMain.actEditPasteExecute(Sender: TObject);
var
  cFocus: TObject;
begin
  cFocus := GetFocusedObject;
    if cFocus.ClassName = 'TDScintilla' then
      (cFocus AS TDScintilla).Paste else
    if cFocus.ClassName = 'TButtonedEdit' then
      (cFocus AS TButtonedEdit).PasteFromClipboard else
    if cFocus.ClassName = 'TMemo' then
      (cFocus AS TMemo).PasteFromClipboard else
    if cFocus.ClassName = 'TDBEdit' then
      (cFocus AS TDBEdit).PasteFromClipboard;
end;


procedure TfrmTinnMain.actEditRedoExecute(Sender: TObject);
var
  cFocus: TObject;
begin
  cFocus :=  GetFocusedObject;

    if cFocus.ClassName = 'TDScintilla' then
      (cFocus AS TDScintilla).Redo else
    if cFocus.ClassName = 'TButtonedEdit' then
      (cFocus AS TButtonedEdit).Undo else
    if cFocus.ClassName = 'TMemo' then
      (cFocus AS TMemo).Undo else
    if cFocus.ClassName = 'TDBEdit' then
      (cFocus AS TDBEdit).Undo;

end;

procedure TfrmTinnMain.actEditSelectAllExecute(Sender: TObject);
var
  cFocus: TObject;
begin
  cFocus :=  GetFocusedObject;
    if cFocus.ClassName = 'TDScintilla' then
      (cFocus AS TDScintilla).SelectAll else
    if cFocus.ClassName = 'TButtonedEdit' then
      (cFocus AS TButtonedEdit).SelectAll else
    if cFocus.ClassName = 'TMemo' then
      (cFocus AS TMemo).SelectAll else
    if cFocus.ClassName = 'TDBEdit' then
      (cFocus AS TDBEdit).SelectAll;
end;

procedure TfrmTinnMain.actTemplateRFunctionExecute(Sender: TObject);
begin
  MakeTemplate(sPathTinnR + '\templates\R doc_function.Rd', SCLEX_R);
end;

procedure TfrmTinnMain.actTemplateRHTMLExecute(Sender: TObject);
begin
  MakeTemplate(sPathTinnR + '\templates\R html.Rhtml', SCLEX_R);
end;

procedure TfrmTinnMain.actTemplateRScriptExecute(Sender: TObject);
begin
  MakeTemplate(sPathTinnR + '\templates\R script.R', SCLEX_R);
end;

procedure TfrmTinnMain.actTestRegExExecute(Sender: TObject);
var
  res: string;

begin
  res := RegEx('Teste,,,', '[,]*$', True, ': RegEx OK!');

  showmessage(res);

end;

procedure TfrmTinnMain.SetAllTinnRPaths;
begin
  // Initiate TinnR paths
  sPathTinnRExe :=  ExtractFilePath(Application.ExeName);
  sPathTinnR := ExtractFilePath(Application.ExeName);
  Delete(sPathTinnR, Length(sPathTinnR) - 4, 5);
  // Exclude '\bin\' of Tinn-R path
  sPathRes := sPathTinnR + '\res\';
  sPathTinnRcom := sPathTinnR + '\package';
  sFileDataOrigin := sPathTinnR + '\data\data.zip';
  sUtilsOrigin := sPathTinnR + '\utils';
  sFileLatexOrigin := sPathTinnR + '\latex\latex.zip';
  sAppData := GetSpecialFolder(CSIDL_APPDATA);
  sPathIni := sAppData + '\Tinn-R';
  sPathApp := sPathIni + '\app';
  sPathBkp := sPathIni + '\bkp';
  sPathColor := sPathIni + '\colors';
  sPathData := sPathIni + '\data';
  sPathEditor := sPathIni + '\editor';
  sPathLatex := sPathIni + '\latex';
  sPathSyntax := sPathIni + '\syntax';
  sPathSyntaxBKP := sPathIni + '\syntax bkp';
  sPathTmp := sPathIni + '\tmp';
  // Ini files
  sPathIniTinn_File := sPathApp + '\Tinn.ini';
  sPathIniEditor_File := sPathEditor + '\Editor.ini';
  sPathEditor_KeyStrokes := sPathEditor + '\Editor.kst';
  sPathColor_Custom := sPathColor + '\Custom_colors.ini';
  sPathShortcuts := sPathData + '\Shortcuts.txt';

  // Files backup 1
  sPathFileBackup := sPathIni + '\recovery\';

end;

procedure TFrmTinnMain.ReLoadLexersAndExtensions;
begin
  slFilters := TStringList.Create;
  slFiltersDisplay := TStringList.Create;
  slFiltersDisplay.Add('All files');
  slFilters.Add('*.*');

  ModDados.cdLexers2.First;

  cbLexers.Clear;

  while not ModDados.cdLexers2.Eof do
  begin
    cbLexers.Items.Add(ModDados.cdLexers2.FieldByName('LexerName').AsString);

    // todo: Select default lexer menu

    if ModDados.cdLexers2.FieldByName('Extensions').AsString <> '' then
    begin
      slFiltersDisplay.Add(ModDados.cdLexers2.FieldByName('LexerName').AsString);
      slFilters.Add(ModDados.cdLexers2.FieldByName('Extensions').AsString);
    end;
    ModDados.cdLexers2.Next;
  end;


  ReLoadDialogFileExtension(sdMain.FileTypes);
  ReLoadDialogFileExtension(odMain.FileTypes);
  iFilterToSaveAs := 1;


// What a pitty!!!

// Highlighter menu on an actionbar is not viable due to performance issues and since
// the popup menu doesn't have scrollbars (there are >50 highlighters)


  //FSetHighlighter  := TList<TAction>.Create;
{  SetLength(acHighlightersCI, ModDados.cdLexers2.RecordCount);
  SetLength(acHighlighters, ModDados.cdLexers2.RecordCount);

  SetLength(acHighlightersCIDefault, ModDados.cdLexers2.RecordCount);
  SetLength(acHighlightersDefault, ModDados.cdLexers2.RecordCount);

                    }
{   for i := 0 to length(acHighlighters)-1 do
  begin


   acHighlightersCI[i] := amMain.ActionBars.ActionBars[12].Items[3].Items.Add;
    acHighlighters[i] := TAction.Create(self);
    acHighlightersCI[i].Action := acHighlighters[i];
    acHighlightersCI[i].Action.GroupIndex := 1;
    acHighlightersCI[i].Action.Caption := ModDados.cdLexers2.FieldByName('LexerName').AsString;
    acHighlightersCI[i].Action.Tag := ModDados.cdLexers2.FieldByName('LexerId').AsInteger;
    acHighlightersCI[i].Action.OnExecute := SetHighlighterGeneric;
    acHighlightersCI[i].Caption := ModDados.cdLexers2.FieldByName('LexerName').AsString;
    acHighlightersCI[i].Tag := ModDados.cdLexers2.FieldByName('LexerId').AsInteger;
    acHighlightersCI[i].Action.Enabled := false;
    acHighlightersCI[i].Visible := true;


    acHighlightersCIDefault[i] := amMain.ActionBars.ActionBars[12].Items[3].Items[2].Items.Add;
    acHighlightersDefault[i] := TAction.Create(self);
    acHighlightersCIDefault[i].Action := acHighlightersDefault[i];
    acHighlightersCIDefault[i].Action.GroupIndex := 1;
    acHighlightersCIDefault[i].Action.Caption := ModDados.cdLexers2.FieldByName('LexerName').AsString;
    acHighlightersCIDefault[i].Action.Tag := ModDados.cdLexers2.FieldByName('LexerId').AsInteger;
    acHighlightersCIDefault[i].Action.OnExecute := SetHighlighterDefaultGeneric;
    acHighlightersCIDefault[i].Caption := ModDados.cdLexers2.FieldByName('LexerName').AsString;
    acHighlightersCIDefault[i].Tag := ModDados.cdLexers2.FieldByName('LexerId').AsInteger;
    acHighlightersCIDefault[i].Visible := true;

    ModDados.cdLexers2.Next;
  end;

  frmTinnMain.actnHighlighterPesudo.Destroy;
  }
end;

procedure TfrmTinnMain.FormCreate(Sender: TObject);
var
  i, j: integer;
  miItem: TMenuItem;
  sName, sFilter: string;

  procedure UpdateSplash(sTmp: string; sInfo: String = '');
  begin
    with frmSplash do
    begin
      imSplash.Picture.LoadFromFile(sPathRes + 'sp_' + sTmp + '.jpg');
      lLoadInfo.Caption := sInfo;
      Update;
    end;
  end;

begin

  // http://stackoverflow.com/questions/1441846/how-to-get-the-index-and-caption-of-a-actionclient-childitem-added-at-runtime

  FRecentProjectActions := TList<TAction>.Create;
  FRecentProjectActions.Add(acReopenProject1);
  FRecentProjectActions.Add(acReopenProject2);
  FRecentProjectActions.Add(acReopenProject3);
  FRecentProjectActions.Add(acReopenProject4);
  FRecentProjectActions.Add(acReopenProject5);
  FRecentProjectActions.Add(acReopenProject6);
  FRecentProjectActions.Add(acReopenProject7);
  FRecentProjectActions.Add(acReopenProject8);
  FRecentProjectActions.Add(acReopenProject9);
  FRecentProjectActions.Add(acReopenProject10);

  FRecentFileActions := TList<TAction>.Create;
  FRecentFileActions.Add(acReopenFile1);
  FRecentFileActions.Add(acReopenFile2);
  FRecentFileActions.Add(acReopenFile3);
  FRecentFileActions.Add(acReopenFile4);
  FRecentFileActions.Add(acReopenFile5);
  FRecentFileActions.Add(acReopenFile6);
  FRecentFileActions.Add(acReopenFile7);
  FRecentFileActions.Add(acReopenFile8);
  FRecentFileActions.Add(acReopenFile9);
  FRecentFileActions.Add(acReopenFile10);




  // The below controls (automatically) the visibility of the menu Tools/Utils on build!
//{$IFDEF DEBUG}
//  menToolsUtils.Visible := True;
//{$ELSE}
//  menToolsUtils.Visible := False;
//{$ENDIF}
//  if (DebugHook <> 0) then
//    menToolsUtils.Visible := True;

  SetAllTinnRPaths;


//  GetPathRes;
  UpdateSplash('00', 'Load project and search controls...');

  // Initial status
  ToolsProjectControls(False);
  ToolsSearchControls(False);
  actMacroPlay.Enabled := False;
  actMacroRecord.Enabled := False;
  actReadOnly.Enabled := False;

  actREnvironmentRefresh.Checked := False;
  actRExplorerRefresh.Checked := False;

  actRtermWarningError.Visible := False;
  actSplitHorizontal.Enabled := False;
  actSplitRemove.Enabled := False;
  actSplitVertical.Enabled := False;

  DragAcceptFiles(Handle, True);

  bStartingUp := True;
  slFileMRU := TStringList.Create;
  slprojectMRU := TStringList.Create;
  UpdateSplash('01', 'Load tools...');
  try
    frmTools := TfrmTools.Create(nil);
    frmNameBrowser := TfrmNameBrowser.Create(nil);
    frmNameBrowser.Visible := False;
    UpdateSplash('02', 'Create ini files...');


    CheckIniAndData;



    ifTinn := TIniFile.Create(sPathIniTinn_File);
    ifEditor := TIniFile.Create(sPathIniEditor_File);
    //SetIniStructure;
    UpdateSplash('03', 'Load app preferences...');

    CheckVersion;

    LoadEditorKeystrokes;

    frmRterm := TfrmRterm.Create(nil);
    UpdateSplash('04');

    SetPreferences_Application;
    SetPreferences_Editor;

    //sci //m.p.
    {SetDataCompletion(synIOTip, frmRterm.sciIO, sTriggerRtip);

    SetDataCompletion(synIODataCompletion, frmRterm.sciIO,
      sTriggerRDataCompletion);
    }
    CheckIniDock;
//    UpdateSplash('05');

   // CheckData;


  except
    MessageDlg(sPathIni + #13 + #13 + 'Serious problem reading ini files!' + #13
      + 'Tinn-R can not be initiated.' + #13 + #13 +
      'Please, try to rename (or remove) the folder above and restart the program!'
      + #13 + 'If this procedure does not solve the problem, contact the developers.',
      mtError, [mbOk], 0);
    Application.Terminate;
  end;

    Application.CreateForm(TmodDados, modDados);
    UpdateSplash('05');


    StartupThreadShortcuts.Start;

    with modDados do
    begin
       UpdateSplash('06', 'Load databases...');
      try

        LoadRHelpSystem;
      except
        MessageDlg('R help system problem.', mtError, [mbOk], 0);
      end;

      try
        LoadMirrors;
        SetRmirrors;
      except
        MessageDlg('Error loading mirrors.', mtError, [mbOk], 0);
      end;

      try
        LoadCache;
      except
        MessageDlg('Error loading cache.', mtError, [mbOk], 0);
      end;

      try
        LoadComments;
      except
        MessageDlg('Error loading comments.', mtError, [mbOk], 0);
      end;

      try
        LoadLexerDB;
      except
        MessageDlg('Error loading higlighters.', mtError, [mbOk], 0);
      end;

      try
        LoadEditors;
      except
        MessageDlg('Error loading file backups.', mtError, [mbOk], 0);
      end;

      if bDatabaseRestored then
        bDatabaseRestored := False;

      InitiateRObjectDatabase;

    end;

    //SetCompletion;

    UpdateSplash('08', 'Load LaTeX...');

    // m.p. frmTools.tbsLatex.TabVisible := actLatexVisible.Checked;
    //CheckLatex(False);
    try
//    CheckEditorOptions;
    UpdateSplash('09', 'Save new ini files');

{
    // Application
    SaveNewIni_Application; // Will create a new and clean Tinn.tmp
    if FileExists(sPathIniTinn_File) then
      DeleteFile(sPathIniTinn_File); // Delete old Tinn.ini

    // Editor
    SaveNewIni_Editor; // Will create a new and clean Tinn.tmp
    if FileExists(sPathIniEditor_File) then
      DeleteFile(sPathIniEditor_File); // Delete old Tinn.ini



    RenameFile(sPathIniTinn_Tmp, sPathIniTinn_File); // Set the new Tinn.ini

    RenameFile(sPathIniEditor_Tmp, sPathIniEditor_File);
    // Set the new Editor.ini
}

  except
    MessageDlg(sPathIni + #13 + #13 + 'Serious problem reading ini files!' + #13
      + 'Tinn-R can not be initiated.' + #13 + #13 +
      'Please, try to rename (or remove) the folder above and restart the program!'
      + #13 + 'If this procedure not solve the problem, contact the developers.',
      mtError, [mbOk], 0);
    Application.Terminate;
  end;

  UpdateSplash('10', 'Load highlighters...');

  ReLoadLexersAndExtensions;




  with frmTools do
  begin
    fcbbToolsWinExplorer.Filter := slFilters.Text;
  end;
  for i := 0 to 9 do
  begin
    aImg[i] := TBitmap.Create;
    imlRexplorer.GetBitmap(i, aImg[i]);
  end;

  frmTools.cbbToolsRExplorer.ItemIndex := 0;
  frmTools.cbbToolsREnvironment.ItemIndex := 0;


  //frmTinnmain.UpdateRterm_Appearance;

  iRFormatted := -1;

  // Files backup 2
  tBackup.Interval := 1000 * iBackupInterval;
  bFirstActivated := True;
 // atbstatus.Visible := true;
 pgFiles.Visible := (pgFiles.PageCount <> 0);
end;

procedure TfrmTinnMain.LoadEditorKeystrokes;
begin
//
end;

procedure TfrmTinnMain.SaveEditorKeystrokes;
begin
  if FileExists(sPathEditor_KeyStrokes) then
    DeleteFile(sPathEditor_KeyStrokes);

  SaveKeyCommands(EditorKeyStrokes, sPathEditor_KeyStrokes);
end;

procedure TfrmTinnMain.UnpackFile(sFile, sPath, sChoice: string);
begin
  with zipKit do
  begin
    FileName := sFile;
    BaseDirectory := sPath;
    ExtractFiles(sChoice);
    CloseArchive;
  end;
end;

procedure TfrmTinnMain.ProduceDebugOutput;
begin


  with frmTools.memIniLog.Lines do
  begin
    Add('Version - ' + GetBuildInfo);

    Add('Started - ' + DateTimeToStr(Now));

    Add(EmptyStr);

    Add('1. Path of executable and sources (origin)');

    // Add('=================================');
    Add('  Tinn-R        - ' + sPathTinnR + '\bin\' +
      ExtractFileName(Application.ExeName));
    Add('  data          - ' + sFileDataOrigin);
    Add('  utils         - ' + sUtilsOrigin);
    Add('  \Rinfo_b      - ' + sUtilsOrigin + '\Rinfo_b.R');
    Add('  \Rinfo_c      - ' + sUtilsOrigin + '\Rinfo_c.R');
    Add('  \Rinfo_load_b - ' + sUtilsOrigin + '\Rinfo_load_b.R');
    Add('  \Rinfo_load_c - ' + sUtilsOrigin + '\Rinfo_load_c.R');
    Add('  \Rinstall     - ' + sUtilsOrigin + '\Rinstall.R');
    Add('  latex         - ' + sFileLatexOrigin);
  end;

  with frmTools.memIniLog.Lines do
  begin
    Add(EmptyStr);
    Add('2. Path of ini folders');
    // Add('====================');
    Add('  User data - ' + sAppData);
    Add('  Tinn-R    - ' + sPathIni);
    Add('  \' + ExtractFileName(sPathApp));
    Add('  \' + ExtractFileName(sPathBkp));
    Add('  \' + ExtractFileName(sPathColor));
    Add('  \' + ExtractFileName(sPathData));
    Add('  \' + ExtractFileName(sPathEditor));
    Add('  \' + ExtractFileName(sPathLatex));
    Add('  \' + ExtractFileName(sPathSyntax));
    Add('  \' + ExtractFileName(sPathSyntaxBKP));
    Add('  \' + ExtractFileName(sPathTmp));
  end;


end;



procedure TfrmTinnMain.SetIniStructure;
begin


end;

procedure TfrmTinnMain.CheckIniAndData;
var bDoDataBackup: Boolean;
begin
  try
    // Tinn-R
    if (not SysUtils.DirectoryExists(sPathIni)) then
      CreateDir(sPathIni);


    // Tinn-R\app
    if (not SysUtils.DirectoryExists(sPathApp)) then
      CreateDir(sPathApp);

    // Tinn-R\data
    if (not SysUtils.DirectoryExists(sPathData)) then
    begin
      CreateDir(sPathData);
      bDoDataBackup := true;
    end else bDoDataBackup := false;

    // Tinn-R\editor
    if (not SysUtils.DirectoryExists(sPathEditor)) then
      CreateDir(sPathEditor);

    if (not SysUtils.DirectoryExists(sPathFileBackup)) then
      CreateDir(sPathFileBackup);


    // Tinn-R\tmp
    if (SysUtils.DirectoryExists(sPathTmp)) then
      DeleteDir(sPathTmp); // Tinn-R was terminated abnormally
    CreateDir(sPathTmp);

  except
    raise;
    Exit;
  end;

  try
    if bDoDataBackup then
    with zipKit do
    begin
      FileName := sFileDataOrigin;
      ExtractOptions := [eoCreateDirs, eoRestorePath];
      BaseDirectory := sPathData;
      ExtractFiles('*.*');
      CloseArchive;
    end;
  except
    raise;
    Exit;
  end;

  Application.ProcessMessages;
end;



procedure TfrmTinnMain.CheckIniDock;
begin
  sIniDockFilePath := (sPathApp + '\Tinn_dock.ini');

  JvAppIniFileStorage.FileName := sIniDockFilePath;
end;

procedure TfrmTinnMain.CheckData;

  procedure CreateDataDir;
  begin
    CreateDir(sPathData);
    zipKit.FileName := sFileDataOrigin;
    zipKit.ExtractOptions := [eoCreateDirs, eoRestorePath];

    with zipKit do
    begin
      BaseDirectory := sPathData;
      ExtractFiles('*.*');
    end;

    zipKit.CloseArchive;
    frmTools.memIniLog.Lines.Add('  Folder - ' + sPathData + ': CREATED');
  end;

  procedure MakeDataBackup(sFile: string);
  begin
    zipKit.StoreOptions := [soRecurse];
    // soRecurse: will include all files of all folders and sub-folders
    with zipKit do
    begin
      FileName := sPathBkp + RemoveFileExtension(sFile) + '_bkp_' +
        IntToStr(integer(MonthOf(Date))) + '.' + IntToStr(integer(DayOf(Date)))
        + '.' + IntToStr(integer(YearOf(Date))) + '.zip';
      AddFiles(sPathData + sFile, 0);
      frmTools.memIniLog.Lines.Add('  Backup - ' + zipKit.FileName + ': DONE');
      CloseArchive;
    end;
  end;

var
  sPathReadmeDB, sFileRcard, sFileRmirrors, sFileComments,
    sFileShortcuts, sFileCache: string;

  tfTmp: TextFile;

begin
  sFileCache := sPathData + '\Cache.xml';
  sFileRcard := sPathData + '\Rcard.xml';
  sFileRmirrors := sPathData + '\Rmirrors.xml';
  sFileComments := sPathData + '\Comments.xml';
  sFileShortcuts := sPathData + '\Shortcuts.xml';

  try
    with frmTools.memIniLog.Lines do
    begin
      Add(EmptyStr);
      Add('3.2. Data');
    end;

    if not SysUtils.DirectoryExists(sPathData) then
      CreateDataDir
    else
    begin
      frmTools.memIniLog.Lines.Add('  Main folder - ' + sPathData + ': OK');

      if (bUpdate_Cache) then
        MakeDataBackup('\Cache.xml');
      if (bUpdate_Rcard) then
        MakeDataBackup('\Rcard.xml');
      if (bUpdate_Rmirrors) then
        MakeDataBackup('\Rmirrors.xml');
      if (bUpdate_Comments) then
        MakeDataBackup('\Comments.xml');
      if (bUpdate_Shortcuts) then
      begin
        MakeDataBackup('\Shortcuts.txt');
        // Shortcuts in use: = Shortcuts.xml
        if (sPathShortcuts = sPathData + '\Shortcuts.txt') then
        begin
          RenameFile(sPathData + '\Shortcuts.xml',
            sPathData + '\OldShortcuts.xml');

          UnpackFile(sFileDataOrigin, sPathData, 'Shortcuts.xml');
          // It is necessary to make a new copy from origin

          with modDados do
            // All useful information related to user preferences (shortcuts) will be add int the new Shortcuts.xml
            ShortcutsValidation(sPathData + '\OldShortcuts.xml',
              sPathData + '\Shortcuts.xml');
          DeleteFile(sPathData + '\OldShortcuts.xml');
        end
        // Shortcuts in use: <> Shortcuts.xml
        else
        begin
          UnpackFile(sFileDataOrigin, sPathData, 'Shortcuts.xml');
          // It is necessary to make a new copy from origin

          with modDados do
            // All useful information related to user preferences (shortcuts) will be add int the new Shortcuts.xml
            ShortcutsValidation(sPathShortcuts, sPathData + '\Shortcuts.sShortcutsInUse');
          DeleteFile(sPathShortcuts);
        end;

        sPathShortcuts := sPathData + '\Shortcuts.txt';
      end;
    end;

    // Cache
    if not FileExists(sFileCache) then
    begin
      UnpackFile(sFileDataOrigin, sPathData, 'Cache.xml');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileCache) +
        '(version = ' + sCurrentVersion_Cache + ')' + ': CREATED');
    end
    else
    begin
      if bUpdate_Cache then
        UnpackFile(sFileDataOrigin, sPathData, 'Cache.xml');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileCache) +
        '(version = ' + sCurrentVersion_Cache + ')' + ': OK');
    end;

    // Rcard
    if not FileExists(sFileRcard) then
    begin
      UnpackFile(sFileDataOrigin, sPathData, 'Rcard.xml');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileRcard) +
        '(version = ' + sCurrentVersion_Rcard + ')' + ': CREATED');
    end
    else
    begin
      if bUpdate_Rcard then
        UnpackFile(sFileDataOrigin, sPathData, 'Rcard.xml');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileRcard) +
        '(version = ' + sCurrentVersion_Rcard + ')' + ': OK');
    end;

    // Rmirrors
    if not FileExists(sFileRmirrors) then
    begin
      UnpackFile(sFileDataOrigin, sPathData, 'Rmirrors.xml');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileRmirrors)
        + '(version = ' + sCurrentVersion_Rmirrors + ')' + ': CREATED');
    end
    else
    begin
      if bUpdate_Rmirrors then
        UnpackFile(sFileDataOrigin, sPathData, 'Rmirrors.xml');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileRmirrors)
        + '(version = ' + sCurrentVersion_Rmirrors + ')' + ': OK');
    end;

    // Comments
    if not FileExists(sFileComments) then
    begin
      UnpackFile(sFileDataOrigin, sPathData, 'Comments.xml');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileComments)
        + '(version = ' + sCurrentVersion_Comments + ')' + ': CREATED');
    end
    else
    begin
      if bUpdate_Comments then
        UnpackFile(sFileDataOrigin, sPathData, 'Comments.xml');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileComments)
        + '(version = ' + sCurrentVersion_Comments + ')' + ': OK');
    end;

    // Shortcuts
    if not FileExists(sPathShortcuts) then
      sPathShortcuts := sPathData + '\Shortcuts.txt';
    if not FileExists(sFileShortcuts) then
    begin
      UnpackFile(sFileDataOrigin, sPathData, 'Shortcuts.txt');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileShortcuts)
        + '(version = ' + sCurrentVersion_Shortcuts + ')' + ': CREATED');
    end
    else
    begin
      if bUpdate_Shortcuts then
        UnpackFile(sFileDataOrigin, sPathData, 'Shortcuts.xml');

      frmTools.memIniLog.Lines.Add('  File - ' + ExtractFileName(sFileShortcuts)
        + '(version = ' + sCurrentVersion_Shortcuts + ')' + ': OK');
    end;
  except
    raise;
    Exit;
  end;
  sPathReadmeDB := sPathData + '\Readme.txt';

  AssignFile(tfTmp, sPathReadmeDB);

  Rewrite(tfTmp);
  WriteLn(tfTmp, 'This folder stores (by default):' + #13 +
    'The XML files ''Cache.xmk'', ''Comments.xml'', ''Rcard.xlm'',  ''Rmirrors.xml'' and ''Shortcuts.xml''.');
  CloseFile(tfTmp);
end;

procedure TfrmTinnMain.CheckLatex(bReload: Boolean);

  procedure CheckLatexDir(sDir: string; bMain: Boolean = False);
  begin
    if not SysUtils.DirectoryExists(sDir) then
      if bMain then
        frmTools.memIniLog.Lines.Add('  \' + ExtractFileName(sDir) +
          ': NOT FOUND')
      else
        frmTools.memIniLog.Lines.Add('    \' + ExtractFileName(sDir) +
          ': NOT FOUND')
    else if bMain then
      frmTools.memIniLog.Lines.Add('  \' + ExtractFileName(sDir) + ': OK')
    else
      frmTools.memIniLog.Lines.Add('    \' + ExtractFileName(sDir) + ': OK')
  end;

  procedure CreateLatexDir;
  begin
    CreateDir(sPathLatex);
    zipKit.FileName := sFileLatexOrigin;
    zipKit.ExtractOptions := [eoCreateDirs, eoRestorePath];

    with zipKit do
    begin
      BaseDirectory := sPathLatex;
      ExtractFiles('*.*');
    end;

    zipKit.CloseArchive;
    frmTools.memIniLog.Lines.Add('  Folder - ' + sPathLatex + ': CREATED');
  end;

  procedure LoadSymbols(jviTmp: TJvImagesViewer; sDir: string);
  begin
    with jviTmp do
    begin
      BeginUpdate;
      Directory := sDir;
      LoadImages;
      EndUpdate;
    end;
  end;

var
  sPathReadmeLatex: string;
  tfTmp: TextFile;

begin
  try
    with frmTools.memIniLog.Lines do
    begin
      Add(EmptyStr);
      if not bReload then
        Add('3.3. Latex' + ' (version = ' + sVersion_Latex + ')')
      else
        Add('3.3. Latex (reload)' + ' (version = ' + sVersion_Latex + ')');
    end;

    if (bUpdate_Latex) then
    begin
      if SysUtils.DirectoryExists(sPathLatex) then
      begin // Will make a backup of old latex folder
        zipKit.StoreOptions := [soRecurse];
        // soRecurse: will include all files of all folders and sub-folders

        with zipKit do
        begin
          FileName := sPathBkp + '\latex_bkp_' + IntToStr(integer(MonthOf(Date))
            ) + '.' + IntToStr(integer(DayOf(Date))) + '.' +
            IntToStr(integer(YearOf(Date))) + '.zip';
          AddFiles(sPathLatex + '\*.*', 0);
          frmTools.memIniLog.Lines.Add('  Backup - ' + zipKit.FileName +
            ': DONE');
          CloseArchive;
        end;
      end;

      DeleteDir(sPathLatex);
      CreateLatexDir;
    end
    else if SysUtils.DirectoryExists(sPathLatex) then
      frmTools.memIniLog.Lines.Add('  Main folder - ' + sPathLatex + ': OK')
    else
      CreateLatexDir;

    // Loading LaTeX Symbols
    // 01. accents
    CheckLatexDir(sPathLatex + '\' + '01. accents', True);
    LoadSymbols(frmTools.jvivAccents, sPathLatex + '\' + '01. accents');

    // 02. arrow
    CheckLatexDir(sPathLatex + '\' + '02. arrow', True);
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '01. right');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '02. down');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '03. left');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '04. up');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '05. sloped');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '06. both');
    CheckLatexDir(sPathLatex + '\' + '02. arrow' + '\' + '07. box');
    LoadSymbols(frmTools.jvivArrowRight, sPathLatex + '\' + '02. arrow' + '\' +
      '01. right');
    LoadSymbols(frmTools.jvivArrowDown, sPathLatex + '\' + '02. arrow' + '\' +
      '02. down');
    LoadSymbols(frmTools.jvivArrowLeft, sPathLatex + '\' + '02. arrow' + '\' +
      '03. left');
    LoadSymbols(frmTools.jvivArrowUp, sPathLatex + '\' + '02. arrow' + '\' +
      '04. up');
    LoadSymbols(frmTools.jvivArrowSloped, sPathLatex + '\' + '02. arrow' + '\' +
      '05. sloped');
    LoadSymbols(frmTools.jvivArrowBoth, sPathLatex + '\' + '02. arrow' + '\' +
      '06. both');
    LoadSymbols(frmTools.jvivArrowBox, sPathLatex + '\' + '02. arrow' + '\' +
      '07. box');

    // 03. bar
    CheckLatexDir(sPathLatex + '\' + '03. bar', True);
    LoadSymbols(frmTools.jvivBar, sPathLatex + '\' + '03. bar');

    // 04. bracket
    CheckLatexDir(sPathLatex + '\' + '04. bracket', True);
    LoadSymbols(frmTools.jvivBracket, sPathLatex + '\' + '04. bracket');

    // 05. dot
    CheckLatexDir(sPathLatex + '\' + '05. dot', True);
    LoadSymbols(frmTools.jvivDot, sPathLatex + '\' + '05. dot');

    // 06. geometry
    CheckLatexDir(sPathLatex + '\' + '06. geometry', True);
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '01. line');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '02. angle');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '03. triangle');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '04. star');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '05. box');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '06. diamond');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '07. circle');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '08. var');
    CheckLatexDir(sPathLatex + '\' + '06. geometry' + '\' + '09. misc');
    LoadSymbols(frmTools.jvivGeometryLine, sPathLatex + '\' + '06. geometry' +
      '\' + '01. line');
    LoadSymbols(frmTools.jvivGeometryAngle, sPathLatex + '\' + '06. geometry' +
      '\' + '02. angle');
    LoadSymbols(frmTools.jvivGeometryTriangle, sPathLatex + '\' + '06. geometry'
      + '\' + '03. triangle');
    LoadSymbols(frmTools.jvivGeometryStar, sPathLatex + '\' + '06. geometry' +
      '\' + '04. star');
    LoadSymbols(frmTools.jvivGeometryBox, sPathLatex + '\' + '06. geometry' +
      '\' + '05. box');
    LoadSymbols(frmTools.jvivGeometryDiamond, sPathLatex + '\' + '06. geometry'
      + '\' + '06. diamond');
    LoadSymbols(frmTools.jvivGeometryCircle, sPathLatex + '\' + '06. geometry' +
      '\' + '07. circle');
    LoadSymbols(frmTools.jvivGeometryVar, sPathLatex + '\' + '06. geometry' +
      '\' + '08. var');
    LoadSymbols(frmTools.jvivGeometryMisc, sPathLatex + '\' + '06. geometry' +
      '\' + '09. misc');

    // 07. greek
    CheckLatexDir(sPathLatex + '\' + '07. greek', True);
    CheckLatexDir(sPathLatex + '\' + '07. greek' + '\' + '01. lower');
    CheckLatexDir(sPathLatex + '\' + '07. greek' + '\' + '02. upper');
    CheckLatexDir(sPathLatex + '\' + '07. greek' + '\' + '03. var');
    CheckLatexDir(sPathLatex + '\' + '07. greek' + '\' + '04. misc');
    LoadSymbols(frmTools.jvivGreekLower, sPathLatex + '\' + '07. greek' + '\' +
      '01. lower');
    LoadSymbols(frmTools.jvivGreekUpper, sPathLatex + '\' + '07. greek' + '\' +
      '02. upper');
    LoadSymbols(frmTools.jvivGreekVar, sPathLatex + '\' + '07. greek' + '\' +
      '03. var');
    LoadSymbols(frmTools.jvivGreekMisc, sPathLatex + '\' + '07. greek' + '\' +
      '04. misc');

    // 08. math
    CheckLatexDir(sPathLatex + '\' + '08. math', True);
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '01. function');
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '02. logical');
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '03. set');
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '04. var');
    CheckLatexDir(sPathLatex + '\' + '08. math' + '\' + '05. misc');
    LoadSymbols(frmTools.jvivMathFunction, sPathLatex + '\' + '08. math' + '\' +
      '01. function');
    LoadSymbols(frmTools.jvivMathLogical, sPathLatex + '\' + '08. math' + '\' +
      '02. logical');
    LoadSymbols(frmTools.jvivMathSet, sPathLatex + '\' + '08. math' + '\' +
      '03. set');
    LoadSymbols(frmTools.jvivMathVar, sPathLatex + '\' + '08. math' + '\' +
      '04. var');
    LoadSymbols(frmTools.jvivMathMisc, sPathLatex + '\' + '08. math' + '\' +
      '05. misc');

    // 09. misc
    CheckLatexDir(sPathLatex + '\' + '09. misc', True);
    LoadSymbols(frmTools.jvivMisc, sPathLatex + '\' + '09. misc');

    // 10. negation
    CheckLatexDir(sPathLatex + '\' + '10. negation', True);
    LoadSymbols(frmTools.jvivNegation, sPathLatex + '\' + '10. negation');

    // 11. operator
    CheckLatexDir(sPathLatex + '\' + '11. operator', True);
    LoadSymbols(frmTools.jvivOperator, sPathLatex + '\' + '11. operator');

    // 12. relation
    CheckLatexDir(sPathLatex + '\' + '12. relation', True);
    LoadSymbols(frmTools.jvivRelation, sPathLatex + '\' + '12. relation');

    // 13. sky
    CheckLatexDir(sPathLatex + '\' + '13. sky', True);
    CheckLatexDir(sPathLatex + '\' + '13. sky' + '\' + '01. solar');
    CheckLatexDir(sPathLatex + '\' + '13. sky' + '\' + '02. astrology');
    CheckLatexDir(sPathLatex + '\' + '13. sky' + '\' + '03. var');
    LoadSymbols(frmTools.jvivSkySolar, sPathLatex + '\' + '13. sky' + '\' +
      '01. solar');
    LoadSymbols(frmTools.jvivSkyAstrology, sPathLatex + '\' + '13. sky' + '\' +
      '02. astrology');
    LoadSymbols(frmTools.jvivSkyVar, sPathLatex + '\' + '13. sky' + '\' +
      '03. var');

    // 14. user_custom
    CheckLatexDir(sPathLatex + '\' + '14. user_custom', True);
    LoadSymbols(frmTools.jvivUserCustom, sPathLatex + '\' + '14. user_custom');
  except
    raise;
    Exit;
  end;
  sPathReadmeLatex := sPathLatex + '\Readme.txt';

  AssignFile(tfTmp, sPathReadmeLatex);

  Rewrite(tfTmp);
  WriteLn(tfTmp, 'This folder stores:' + #13 + 'All LaTeX symbols of Tinn-R.' +
    #13 + 'It is user customizable!');

  CloseFile(tfTmp);
end;

//procedure TfrmTinnMain.CheckEditorOptions;
{
  procedure UpdateShortcutsDir;
  begin
    DeleteDir(sAppData + '\Tinn-R\shortcuts');
    // Related to old versions of Tinn-R
    DeleteDir(sAppData + '\Tinn-R\editor shortcuts');
    // Related to old versions of Tinn-R

    DeleteDir(sPathEditor);
    CreateDir(sPathEditor);
  end;

var
  sPathReadmeEditor: string;
  tfTmp: TextFile;
}
//begin
{  try
    with frmTools.memIniLog.Lines do
    begin
      Add(EmptyStr);
      Add('3.4. Editor options');
    end;

    LoadEditorKeystrokes;
    UpdateShortcutsDir;
    frmTools.memIniLog.Lines.Add('  Main folder - ' + sPathEditor +
      ': CREATED');

    frmTools.memIniLog.Lines.Add('  File - ' + 'Editor.kst' + ': OK');
    // Created in other place
  except
    raise;
    Exit;
  end;
  sPathReadmeEditor := sPathEditor + '\Readme.txt';

  AssignFile(tfTmp, sPathReadmeEditor);

  Rewrite(tfTmp);
  WriteLn(tfTmp, 'This folder stores:' + #13 +
    '''Editor.ini'' and ''Editor.kst'' files.' + #13 +
    'Notice: the latest is always deleted when Tinn-R starts and recreated (storing the user preferences) when the application finishes.');

  CloseFile(tfTmp);    }
//end;

procedure TfrmTinnMain.SetPathRTerm;
begin
  if (sRversion <> EmptyStr) and IsValidNumber_RVersion(sRversion) and
  // In the R version 2.12.0 the path of executables was changed
    (AnsiCompareStr(sRversion, '2.12.0') < 0) then
    sPathRterm := sPathR + '\bin\Rterm.exe'
  else if bRArchitecture64 then
    sPathRterm := sPathR + '\bin\x64\Rterm.exe'
  else
    sPathRterm := sPathR + '\bin\i386\Rterm.exe';
end;

procedure TfrmTinnMain.SetPathRgui;
begin
  if (sRversion <> EmptyStr) and IsValidNumber_RVersion(sRversion) and
  // In the R version 2.12.0 the path of executables was changed
    (AnsiCompareStr(sRversion, '2.12.0') < 0) then
    sPathRgui := sPathR + '\bin\Rgui.exe'
  else if bRArchitecture64 then
    sPathRgui := sPathR + '\bin\x64\Rgui.exe'
  else
    sPathRgui := sPathR + '\bin\i386\Rgui.exe';
end;

procedure TfrmTinnMain.SetRcard;
begin

end;

procedure TfrmTinnMain.SetCompletion;
begin
  // Create items in lbCompletion from strListCompletionGroups create in uModDados
  with modDados do
  begin
    FreeAndNil(slCompletion_Groups);
  end;

end;

procedure TfrmTinnMain.SetRmirrors;
begin
  // Create items in lbCountries from slRmirrors_Countries create in uModDados
  with modDados do
  begin
    frmTools.lbCountries.Items := slRmirrors_Countries;
    frmTools.lbCountries.Refresh;
    FreeAndNil(slRmirrors_Countries);
  end;

  // To prevent some problem
  if (iCountriesFilter < 0) or
    (iCountriesFilter > frmTools.lbCountries.Count - 1) then
    iCountriesFilter := 0;
  frmTools.lbCountries.Selected[iCountriesFilter] := True;
  frmTools.lbCountriesClick(Self);
end;

procedure TfrmTinnMain.BuildMRU(var miItem: TMenuItem);
var
  i: integer;
  miMRU: TMenuItem;
  sFile: string;
  miMRUAction: TActionClientItem;
begin
  amMain.ActionBars.ActionBars[6].Items[1].Items.Clear;
  pmenMainMRU.Items.Clear;
  miItem.Clear;
  if (slFileMRU.Count > 0) then
  begin
    for i := 0 to (slFileMRU.Count - 1) do
    begin
      if (i < iLastFile) then
      begin
        sFile := slFileMRU.Values[IntToStr(i)];
        if (sFile <> EmptyStr) then
        begin
          miMRU := newItem(slFileMRU.Values[IntToStr(i)], 0, False, True,
            RecentFileClick, 0, format('File%d', [i]));
          miMRU.Tag := i;
          miItem.Add(miMRU);
          miMRU := newItem(slFileMRU.Values[IntToStr(i)], 0, False, True,
            RecentFileClick, 0, format('File%d', [i]));
          pmenMainMRU.Items.Add(miMRU);

          miMRUAction := amMain.ActionBars.ActionBars[6].Items[1].Items.Add;
          miMRUAction.Action := FRecentFileActions[i];
          miMRUAction.Action.Caption := slFileMRU.Values[IntToStr(i)];
          miMRUAction.Visible := True;

        end;
      end;
    end;
  end;
end;

procedure TfrmTinnMain.UpdateMRU(var miItem: TMenuItem; sfilename: string);
var
  i, j: integer;
  slTmp: TStringList;
  sTmp: string;

begin
  slTmp := TStringList.Create;
  // Puts the opened file in at the top of the list
  sTmp := StringReplace(sfilename, '&', '&&', [rfReplaceAll]);

  if FileExists(sfilename) then
  begin
    slTmp.Insert(0, '0=' + sTmp);
    j := 1;
  end
  else
    j := 0;

  // Stores Data and remove from menu
  for i := 0 to (slFileMRU.Count - 1) do
  begin
    if (CompareText(sTmp, slFileMRU.Values[IntToStr(i)]) <> 0) then
    begin
      slTmp.Add(IntToStr(j) + '=' + slFileMRU.Values[IntToStr(i)]);
      inc(j);
    end;
  end;

  slFileMRU.Text := slTmp.Text;
  BuildMRU(miItem);
  FreeAndNil(slTmp);
end;

procedure TfrmTinnMain.AfterLibraryUpdate;
begin
  with modDados do
  begin
    sqlMainBase.Connected := true;
    sqlMainBase.Open;
    sqldsMainBaseTools.Active := true;
    sqldsMainBaseTools.Refresh;
    sqlMainBase.Close;
    cdMainBase.Refresh;
    UpdateLexerKeyWords(1);
  end;
end;

function TfrmTinnMain.GetFocusedObject: TWinControl;
begin
  //menHelp.Caption := {ActiveControl.Name+' '+ }Screen.ActiveForm.ActiveControl.Name;
  Result := Screen.FocusedForm.ActiveControl;
 // Result := Screen.ActiveControl;
  if not assigned(Result) then
    begin
      Result := nil;
      //showmessage('strange');
      exit;
    end;
  if ansipos('sciLog', Result.Name) > 0 then
  begin
    Result := frmRterm.sciLog;
  end;
  label1.Caption := Result.Name;

  if Screen.ActiveControl.Name <> Result.Name then
  begin
    Result := Screen.ActiveControl;
    label1.Caption :=label1.Caption+' mismatch1: '+inttostr((random(98999)))+ ' '+ Result.Name;
  end;
  if self.MDIChildCount > 0 then
    if (self.MDIChildren[FindTopWindow] as TFrmEditor).sciEditor.Focused then
      if (self.MDIChildren[FindTopWindow] as TFrmEditor).sciEditor <> Result then
      begin

        Result := (self.MDIChildren[FindTopWindow] as TFrmEditor).sciEditor;
        label3.Caption :='mismatch3: '+inttostr((random(98999)))+' '+Result.Name;
      end;
// label4.caption := label4.caption+' ' +  Result.Name;

end;



function TfrmTinnMain.WriteAppDataToIniFile(ifFile: TIniFile;
  DeleteslprojectMRU: Boolean = False): Boolean;
var
  slSearch, slPandocHistory, slPandocHistoryFrom, slPandocHistoryTo
    : TStringList;

  i: integer;
begin

  with ifFile do
  begin

    WriteBool('App', 'bBackgroundConnectionErrorWarning', bBackgroundConnectionErrorWarning);
    // Version control
    WriteString('App', 'sCacheVersion', sVersion_Cache);
    WriteString('App', 'sCommentsVersion', sVersion_Comments);
    WriteString('App', 'sIniVersion', GetBuildInfo);
    WriteString('App', 'sLatexVersion', sVersion_Latex);
    WriteString('App', 'sRcardVersion', sVersion_Rcard);
    WriteString('App', 'sRmirrosVersion', sVersion_Rmirrors);
    WriteString('App', 'sShortcutsVersion', sVersion_Shortcuts);
    // Form state and position
    if (WindowState = wsNormal) then
    begin
      WriteInteger('Form', 'iHeight', Self.Height);
      WriteInteger('Form', 'iLeft', Self.Left);
      WriteInteger('Form', 'iTop', Self.Top);
      WriteInteger('Form', 'iWidth', Self.Width);
    end
    else
    begin
      WriteInteger('Form', 'iHeight', iOldHeight);
      WriteInteger('Form', 'iLeft', iOldLeft);
      WriteInteger('Form', 'iTop', iOldTop);
      WriteInteger('Form', 'iWidth', iOldWidth);
    end;
    WriteInteger('Form', 'iWindowState', integer(WindowState));
    // Last path
    WriteString('App', 'sWorkingDir', sWorkingDir);
    // On top
    WriteBool('App', 'bAlwaysOnTop', actOnTop.Checked);
    // Max files in fileMRU
    WriteInteger('App', 'iLastFile', iLastFile);
    WriteInteger('App', 'iDefaultLexerId', iDefaultLexerId);
    // Toolbars
    { WriteBool('App', 'bEdit.Visible',      tobEdit.Visible);
      WriteBool('App', 'bFile.Visible',       tobFile.Visible);
      WriteBool('App', 'bFilter.Visible',     tobFilter.Visible);
      WriteBool('App', 'bFormat.Visible',     tobFormat.Visible);
      WriteBool('App', 'bMacro.Visible',      tobMacro.Visible);
      WriteBool('App', 'bMisc.Visible',       tobMisc.Visible);
      WriteBool('App', 'bProcessing.Visible', tobProcessing.Visible);

      WriteBool('App', 'bSearch.Visible',     tobSearch.Visible);
      WriteBool('App', 'bSpell.Visible',      tobSpell.Visible);
      WriteBool('App', 'bSyntax.Visible',     tobSyntax.Visible);
      WriteBool('App', 'bView.Visible',       tobView.Visible);
    }
    WriteBool('App', 'bRterm.Visible', actRtermVisible.Checked);
    WriteBool('App', 'bTools.Visible', frmTools.Visible);

    WriteInteger('App', 'iCountries.Height', frmTools.panCountries.Height);
    WriteInteger('App', 'iCountries.ItemIndex', frmTools.lbCountries.ItemIndex);
    {
      WriteInteger('App', 'iEdit.Left', tobEdit.Left);
      WriteInteger('App', 'iEdit.Top', tobEdit.Top);
      WriteInteger('App', 'iFile.Left', tobFile.Left);
      WriteInteger('App', 'iFile.Top', tobFile.Top);
      WriteInteger('App', 'iFilter.Left', tobFilter.Left);
      WriteInteger('App', 'iFilter.Top', tobFilter.Top);
      WriteInteger('App', 'iFormat.Left', tobFormat.Left);
      WriteInteger('App', 'iFormat.Top', tobFormat.Top);
      WriteInteger('App', 'iMacro.Left', tobMacro.Left);
      WriteInteger('App', 'iMacro.Top', tobMacro.Top);
      WriteInteger('App', 'iMisc.Left', tobMisc.Left);
      WriteInteger('App', 'iMisc.Top', tobMisc.Top);
      WriteInteger('App', 'iProcessing.Left', tobProcessing.Left);
      WriteInteger('App', 'iProcessing.Top', tobProcessing.Top);
    }
    WriteInteger('App', 'iRcard.Height', frmTools.panRCard.Height);
    WriteInteger('App', 'iRcard.ItemIndex', frmTools.lbRcard.ItemIndex);
    // WriteInteger('App', 'iRExplorer.Width', frmTools.panRExplorer.Width);
    { WriteInteger('App', 'iSearch.Left', tobSearch.Left);
      WriteInteger('App', 'iSearch.Top', tobSearch.Top);

      WriteInteger('App', 'iSpell.Left', tobSpell.Left);
      WriteInteger('App', 'iSpell.Top', tobSpell.Top);
      // m.p.    WriteInteger('App', 'iSpellLanguage.ItemIndex', cbSpellLanguage.ItemIndex);
      {    WriteInteger('App', 'iSyntax.Left', tobSyntax.Left);
      WriteInteger('App', 'iSyntax.Top', tobSyntax.Top);
      WriteInteger('App', 'iView.Left', tobView.Left);
      WriteInteger('App', 'iView.Top', tobView.Top); }
    WriteInteger('App', 'iWinExplorer.Height', frmTools.panWinExplorer.Height);
    WriteInteger('App', 'iPanelHeightNavi', frmTools.panNavi.Height);
    // Rterm
    WriteBool('App', 'bRtermCloseWithoutAsk', bRtermCloseWithoutAsk);
    WriteBool('App', 'bRtermHorizontal', bRtermHorizontal);
    WriteBool('App', 'bRtermSimple', bRtermSimple);
    WriteInteger('App', 'iIOSyntax', iIOSyntax);
    WriteInteger('App', 'iLogSyntax', iLogSyntax);
    WriteInteger('App', 'iRtermDock.Height', iRtermDockHeight);
    WriteInteger('App', 'iRtermDock.Width', iRtermDockWidth);
    WriteInteger('App', 'iSciLog2.Height', frmRterm.iSciLog2Height);
    WriteInteger('App', 'iSciLog2.Width', frmRterm.iSciLog2Width);
    // Tools
    // ---- Dock

    WriteInteger('App', 'iToolsDock.Height', iToolsDockHeight);
    WriteInteger('App', 'iToolsDock.Width', iToolsDockWidth);

    // ---- Tool NavigationPane
    WriteInteger('App', 'iMaximizedCount', frmTools.npTools.MaximizedCount);
    WriteInteger('App', 'iPaneActivePageIndex',
      frmTools.npTools.ActivePageIndex);

    // ----------- Files
    WriteInteger('App', 'ipaaProjHeight', frmTools.panProj.Height);

    WriteInteger('App', 'ipanWinExpHeight', frmTools.panWinExplorer.Height);
    WriteInteger('App', 'iWinExpHeight', frmTools.jvflbWinExplorer.Height);

    // ----------- R
    WriteInteger('App', 'ipanExplorerHeight', frmTools.panExplorer.Height);
    WriteInteger('App', 'ipanRCardHeight', frmTools.panRCard.Height);
  {  WriteInteger('App', 'iCardCol0', frmTools.dbgRcard.Columns[0].Width);
    WriteInteger('App', 'iCardCol1', frmTools.dbgRcard.Columns[1].Width); }
    WriteInteger('App', 'ipanNaviHeight', frmTools.panNavi.Height);


    WriteBool('App', 'bBackup', bBackup);
    WriteBool('App', 'bCloseDVIViewer', actCloseDVIViewer.Checked);
    WriteBool('App', 'bClosePDFViewer', actClosePDFViewer.Checked);
    WriteBool('App', 'bComAutoDetect_Language',
      frmTools.cbComAutoDetect_Language.Checked);
    WriteBool('App', 'bComPriority_Line', frmTools.cbComPriority_Line.Checked);
    WriteBool('App', 'bConnectionBeepOnError', bConnectionBeepOnError);
    WriteBool('App', 'bDataCompletionAnywhere', bDataCompletionAnywhere);
    WriteBool('App', 'bDosMinimizedAlways', actDosMinimizedAlways.Checked);
    WriteBool('App', 'bDviOpenAlways', actDviOpenAlways.Checked);

    WriteBool('App', 'bHtmlOpenAlways', actHtmlOpenAlways.Checked);
    WriteBool('App', 'bIniLog.Visible', actIniLogVisible.Checked);

    WriteBool('App', 'bIPLocal', bIPLocal);


    WriteBool('App', 'bMinimizeTinnAfterLastFile', bMinimizeTinnAfterLastFile);
    WriteBool('App', 'bOpenMaximized', actOpenMaximized.Checked);
    WriteBool('App', 'bOrganizeAutomatically', bOrganizeAutomatically);
    WriteBool('App', 'bPdfOpenAlways', actPdfOpenAlways.Checked);
    WriteBool('App', 'bPgFiles.Visible', actPgFilesVisible.Checked);
    WriteBool('App', 'bProject.Visible', actProjectVisible.Checked);
    WriteBool('App', 'bRArchitecture64', bRArchitecture64);
    WriteBool('App', 'bRAsServer', bRAsServer);
    WriteBool('App', 'bRComplexDefault', actRComplexDefault.Checked);
    WriteBool('App', 'bReformatR', actReformatR.Visible);
    WriteBool('App', 'bRememberFileState', bRememberFileState);
    WriteBool('App', 'bRemoveExtension', bRemoveExtension);
    WriteBool('App', 'bReopenFiles', bReopenFiles);
    WriteBool('App', 'bRestoreIniDock', bRestoreIniDock);
    WriteBool('App', 'bRget_Info', bRget_Info);
    WriteBool('App', 'bRguiReturnFocus', bRguiReturnFocus);
    WriteBool('App', 'bRmirros_Update', bRmirros_Update);
    WriteBool('App', 'bRSendAll', bRSendAll);
    WriteBool('App', 'bRSimpleDefault', actRSimpleDefault.Checked);
    WriteBool('App', 'bRSmartSend', bRSmartSend);
    WriteBool('App', 'bRsvSocketConnect', bRsvSocket_Connect);
    WriteBool('App', 'bRTCPIPConsoleEcho', bRTCPIPConsoleEcho);
    WriteBool('App', 'bRTCPIPConsoleUse', bRTCPIPConsoleUse);
    WriteBool('App', 'bRtermBeepOnError', bRtermBeepOnError);
    WriteBool('App', 'bRtermFindError', bRtermFindError);
    WriteBool('App', 'bRTinnRcomInstall', bRTinnRcom_Install);
    WriteBool('App', 'bRTinnRcomLoad', bRTinnRcom_Load);
    WriteBool('App', 'bRUseLatest', bRUseLatest);
    WriteBool('App', 'bScrollSendingLines', bScrollSendingLines);
    WriteBool('App', 'bShowAllBars', actShowAllBars.Checked);
    WriteBool('App', 'bStatusBar', actStatusBarVisible.Checked);
    WriteBool('App', 'bTextDefault', actTextDefault.Checked);
    WriteBool('App', 'bTinnRHotKeysActive', bTinnRHotKeysActive);
    WriteBool('App', 'bUndoAfterSave', bUndoAfterSave);

{    WriteInteger('App', 'clBGApplication', TColor(clBGApplication));
    WriteInteger('App', 'clBGForAllHighlighters',
      TColor(clBGForAllHighlighters));
    WriteInteger('App', 'clBGPreferred', TColor(clBGPreferred));
    WriteInteger('App', 'clBGTabSelectedNew', TColor(clBGTabSelectedNew));
    WriteInteger('App', 'clBrackets', TColor(clBrackets));
    WriteInteger('App', 'clFGApplication', TColor(clFGApplication));}
    WriteInteger('App', 'Delay', iDelay);
    WriteInteger('App', 'iBackupInterval', iBackupInterval);
    WriteInteger('App', 'iIPPortLocal', iIPPortLocal);
    WriteInteger('App', 'iIPPortRemote', iIPPortRemote);
    WriteInteger('App', 'iMaxDeparseLength', iMaxDeparseLength);
    WriteInteger('App', 'iPandocFrom', iPandocFrom);
    WriteInteger('App', 'iPandocTo', iPandocTo);

    WriteInteger('App', 'iPgRterm.TabsPosition',
      integer(frmRterm.pgRterm.TabPosition));
    WriteInteger('App', 'iReformatRSplit', iReformatRSplit);
    WriteInteger('App', 'iRguiRecognitionCaption', iRguiRecognitionCaption);
    WriteInteger('App', 'iRguiRecognitionType', iRguiRecognitionType);
    WriteInteger('App', 'iRguiTinnRDisposition', iRguiTinnRDisposition);
    WriteInteger('App', 'iRguiTinnRProportion', iRguiTinnRProportion);
    WriteInteger('App', 'iTransparency', iTransparency);
    WriteInteger('App', 'iViewStyleRExplorer', iViewStyleRExplorer);
    WriteString('App', 'sAppSelected', sAppSelected);
    WriteString('App', 'sEncodingDefault', GetEncodingDefault);
    WriteString('App', 'sEndComment', sEndComment);
    WriteString('App', 'sIPHostLocal', sIPHostLocal);
    WriteString('App', 'sIPHostRemote', sIPHostRemote);
    WriteString('App', 'sParDeplate', sParDeplate);
    WriteString('App', 'sParDviBibtex', sParDviBibtex);
    WriteString('App', 'sParDviSingle', sParDviSingle);
    WriteString('App', 'sParPdfBibtex', sParPdfBibtex);
    WriteString('App', 'sParPdfSingle', sParPdfSingle);
    WriteString('App', 'sParRgui', sParRgui);
    WriteString('App', 'sParRterm', sParRterm);
    WriteString('App', 'sParTxt2tags', sParTxt2tags);
    WriteString('App', 'sPath_Pandoc', sPath_Pandoc);
    WriteString('App', 'sPathDeplate_Converter', sPathDeplate_Converter);
    WriteString('App', 'sPathDeplate_Interpreter', sPathDeplate_Interpreter);
    WriteString('App', 'sPathRgui', sPathRgui);
    WriteString('App', 'sPathRterm', sPathRterm);
    WriteString('App', 'sPathTxt2tags_Converter', sPathTxt2tags_Converter);
    WriteString('App', 'sPathTxt2tags_Interpreter', sPathTxt2tags_Interpreter);
    WriteString('App', 'sReformatR', sReformatR);
    WriteString('App', 'sReformatRd', sReformatRd);
    WriteString('App', 'sRmirror', sRmirror);

    WriteString('App', 'sTriggerRDataCompletion', sTriggerRDataCompletion);
    WriteString('App', 'sTriggerRtip', sTriggerRtip);
    // Search settings
    WriteBool('Search', 'bRememberSearchList', bRememberSearchList);
    WriteBool('Search', 'bSearchBackwards', bSearchBackwards);
    WriteBool('Search', 'bSearchCaseSensitive', bSearchCaseSensitive);
    WriteBool('Search', 'bSearchDirectory', bSearchDirectory);
    WriteBool('Search', 'bSearchFromCursor', bSearchFromCursor);
    WriteBool('Search', 'bSearchInSub', bSearchInSub);
    WriteBool('Search', 'bSearchOpenFiles', bSearchOpenFiles);
    WriteBool('Search', 'bSearchRegExp', bSearchRegExp);
    WriteBool('Search', 'bSearchWholeWords', bSearchWholeWords);
    WriteInteger('Search', 'iLastSearch', iLastSearch);
    // Print settings
    WriteBool('Print', 'bPrintColors', bPrintColors);
    WriteBool('Print', 'bPrintFileName', bPrintFileName);
    WriteBool('Print', 'bPrintLineNumber', bPrintLineNumber);
    WriteInteger('Print', 'iPrintLineWrap', iPrintLineWrap);
    WriteBool('Print', 'bPrintPageNumber', bPrintPageNumber);
    WriteBool('Print', 'bPrintSyntaxColor', bPrintSyntaxColor);
    WriteInteger('Print', 'iScaleMode', iScaleMode);
    WriteInteger('Print', 'iZoomPreview', iZoomPreview);
    // Send To R alphabetically ordered
    WriteBool('Roptions', 'bEchoOn', bEchoOn);
    WriteBool('Roptions', 'bRCurrentLineToTop', actRCurrentLineToTop.Visible);
    WriteBool('Roptions', 'bRKnitr', bRKnitr);
    WriteBool('Roptions', 'bRSendBlockMarked', actRSendBlockMarked.Visible);
    WriteBool('Roptions', 'bRSendClipboard', actRSendClipboard.Visible);
    WriteBool('Roptions', 'bRSendContiguous', actRSendContiguous.Visible);
    WriteBool('Roptions', 'bRSendCursorToBeginningLine',
      actRSendCursorToBeginningLine.Visible);
    WriteBool('Roptions', 'bRSendCursorToEndLine',
      actRSendCursorToEndLine.Visible);
    WriteBool('Roptions', 'bRSendFile', actRSendFile.Visible);
    WriteBool('Roptions', 'bRSendLine', actRSendLine.Visible);
    WriteBool('Roptions', 'bRSendLinesToEndPage',
      actRSendLinesToEndPage.Visible);
    WriteBool('Roptions', 'bRSendSelection', actRSendSelection.Visible);
    WriteBool('Roptions', 'bRSweave', actRSendSweave.Visible);
    WriteBool('Roptions', 'bRNavigator', actRSendNavigator.Visible);
    // Controlling R alphabetically ordered
    WriteBool('Roptions', 'bRClearAll', actRContClearAll.Visible);
    WriteBool('Roptions', 'bRClearConsole', actRContClearConsole.Visible);
    WriteBool('Roptions', 'bRCloseAllGraphics',
      actRContCloseAllGraphics.Visible);
    WriteBool('Roptions', 'bREditVariable', actRContEditVariable.Visible);
    WriteBool('Roptions', 'bREscape', actRContEscape.Visible);
    WriteBool('Roptions', 'bRExampleSelectedWord',
      actRContExampleSelectedWord.Visible);
    WriteBool('Roptions', 'bRFixVariable', actRContFixVariable.Visible);
    WriteBool('Roptions', 'bRguiStartClose', actRContGuiStartClose.Visible);
    WriteBool('Roptions', 'bRHelp', actRContHelp.Visible);
    WriteBool('Roptions', 'bRHelpSelectedWord',
      actRContHelpSelectedWord.Visible);
    WriteBool('Roptions', 'bRListAllObjects', actRContListAllObjects.Visible);
    WriteBool('Roptions', 'bRListVariableNames',
      actRContListVariableNames.Visible);
    WriteBool('Roptions', 'bRListVariableStructure',
      actRContListVariableStructure.Visible);
    WriteBool('Roptions', 'bRPackages', actRContPackages.Visible);
    WriteBool('Roptions', 'bRPlotVariable', actRContPlotVariable.Visible);
    WriteBool('Roptions', 'bRPrintVariableContent',
      actRContPrintVariableContent.Visible);
    WriteBool('Roptions', 'bRRemoveAllObjects',
      actRContRemoveAllObjects.Visible);
    WriteBool('Roptions', 'bRSetWorkDir', actRContSetWorkDirectory.Visible);
    WriteBool('Roptions', 'bRTCPConnection', actRContTCPConnection.Visible);
    WriteBool('Roptions', 'bRtermStartClose', actRContTermStartClose.Visible);
    // Database status
//    WriteInteger('Database', 'iRcardBeforeChanges', iRcardBeforeChanges);
    WriteInteger('Database', 'iRtipBeforeChanges', iRtipBeforeChanges);
    WriteInteger('Database', 'iShortcutsBeforeChanges',
      iShortcutsBeforeChanges);
    // Latex Dimensional
    WriteIni_LaTeX(ifFile);


  end;
  // Pandoc history
  slPandocHistory := TStringList.Create;
  slPandocHistory.Text := sPandocHistory;
  i := 0;
  while (slPandocHistory.Count >= 1) and (i < 10) do
  begin
    if (trim(slPandocHistory.Strings[0]) <> EmptyStr) then
    begin
      ifFile.WriteString('PandocHistory', IntToStr(i),
        slPandocHistory.Strings[0]);
      inc(i);
    end;
    slPandocHistory.Delete(0);
  end;

  FreeAndNil(slPandocHistory);

  // Pandoc history: From
  slPandocHistoryFrom := TStringList.Create;
  slPandocHistoryFrom.Text := sPandocHistoryFrom;

  i := 0;
  while (slPandocHistoryFrom.Count >= 1) and (i < 10) do
  begin
    if (trim(slPandocHistoryFrom.Strings[0]) <> EmptyStr) then
    begin
      ifFile.WriteString('PandocHistoryFrom', IntToStr(i),
        slPandocHistoryFrom.Strings[0]);
      inc(i);
    end;
    slPandocHistoryFrom.Delete(0);
  end;

  FreeAndNil(slPandocHistoryFrom);

  // Pandoc history: To
  slPandocHistoryTo := TStringList.Create;
  slPandocHistoryTo.Text := sPandocHistoryTo;

  i := 0;
  while (slPandocHistoryTo.Count >= 1) and (i < 10) do
  begin
    if (trim(slPandocHistoryTo.Strings[0]) <> EmptyStr) then
    begin
      ifFile.WriteString('PandocHistoryTo', IntToStr(i),
        slPandocHistoryTo.Strings[0]);
      inc(i);
    end;
    slPandocHistoryTo.Delete(0);
  end;
  FreeAndNil(slPandocHistoryTo);

  if bRememberSearchList then
  begin
    slSearch := TStringList.Create;
    slSearch.Text := sSearchTextHistory;

    i := 0;
    while (slSearch.Count >= 1) and (i < iLastSearch) do
    begin
      if (trim(slSearch.Strings[0]) <> EmptyStr) then
      begin
        ifFile.WriteString('SearchTextHistory', IntToStr(i),
          slSearch.Strings[0]);
        inc(i);
      end;
      slSearch.Delete(0);
    end;
    FreeAndNil(slSearch);
  end;

  slSearch := TStringList.Create;
  slSearch.Text := sSearchDirHistory;
  i := 0;
  while (slSearch.Count >= 1) do
  begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then
    begin
      ifFile.WriteString('SearchDirHistory', IntToStr(i), slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  slSearch := TStringList.Create;
  slSearch.Text := sSearchFileMaskHistory;

  i := 0;
  while (slSearch.Count >= 1) do
  begin
    if (trim(slSearch.Strings[0]) <> EmptyStr) then
    begin
      ifFile.WriteString('SearchFileMaskHistory', IntToStr(i),
        slSearch.Strings[0]);
      inc(i);
    end;
    slSearch.Delete(0);
  end;
  FreeAndNil(slSearch);

  for i := 0 to (frmTools.cbExplorerFavorites.Items.Count - 1) do
    ifFile.WriteString('ExplorerFavorites', IntToStr(i),
      frmTools.cbExplorerFavorites.Items.Strings[i]);

  i := 0;
  while (slFileMRU.Count >= 1) and (i < iLastFile) do
  begin
    ifFile.WriteString('FileMRU', IntToStr(i), slFileMRU.Values[IntToStr(i)]);
    inc(i);
  end;

  i := 0;
  while (slprojectMRU.Count >= 1) and (i < iLastFile) do
  begin
    ifFile.WriteString('ProjectMRU', IntToStr(i),
      slprojectMRU.Values[IntToStr(i)]);
    inc(i);

    if DeleteslprojectMRU then
      slprojectMRU.Delete(0);

  end;

  if Assigned(slTextDiff) then
    with slTextDiff do
    begin
      if (Count >= 1) then
        for i := 0 to (Count - 1) do
          ifFile.WriteString('Options TextDiff', Names[i], ValueFromIndex[i]);
      FreeAndNil(slTextDiff);
    end;

  for i := 1 to 20 do
    ifFile.WriteString('R Hotkeys', ('RHK' + IntToStr(i)),
      hkTinnR.strgDefault.Cells[1, i]);

  for i := 1 to 20 do
    ifFile.WriteString('R Custom', ('RC' + IntToStr(i)),
      hkTinnR.strgCustom.Cells[0, i]);

  for i := 1 to 20 do
    ifFile.WriteString('R Hotkeys Custom', ('RHKC' + IntToStr(i)),
      hkTinnR.strgCustom.Cells[1, i]);
end;

procedure TfrmTinnMain.RecentFileClick(Sender: TObject);
var
  sTmp: string;

begin
  sTmp := StringReplace(TMenuItem(Sender).Caption, '&', EmptyStr, []);

  sTmp := StringReplace(sTmp, '&&', '&', [rfReplaceAll]);

  if FileExists(sTmp) then
    OpenFileIntoTinn(sTmp)
  else
    // Takes it off the fileMRU list
    if (MessageDlg(sTmp + #13 + #13 + 'File does not exist.' + #13 +
      'Would you like to remove it from MRU (Most Recent Used) list?',
      mtInformation, [mbYes, mbNo], 0) = mrYes) then
      UpdateMRU(menFileRecentFiles, sTmp);
end;

function TfrmTinnMain.FindTabByName(sName: string): integer;
var
  i, iTab: integer;
  bFound: Boolean;
begin
  sName := ansilowercase(sName);

  for i := (Self.MDIChildCount - 1) downto 0 do
    if ansilowercase((Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile) = sName then
    begin
      iTab := (Self.MDIChildren[i] as TfrmEditor).EditorFile.iTabPosition;
      bFound := True;
      break;
    end;

  if bFound then
    Result := iTab
  else
    Result := -1;
end;



function TfrmTinnMain.GetIdByFileName(sName: string): integer;
var
  i, Id: integer;
  bFound: Boolean;
begin
  sName := ansilowercase(sName);

  for i := (Self.MDIChildCount - 1) downto 0 do
    if ansilowercase((Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile) = sName then
    begin
      Id:= (Self.MDIChildren[i] as TfrmEditor).EditorFile.iId;
      bFound := True;
      break;
    end;

  if bFound then
    Result := Id
  else
    Result := -1;
end;

function TfrmTinnMain.FindWindowById(Id: integer): integer;
var
  i: integer;
  bFound: Boolean;
begin
  bFound := False;
  if Id > 0 then
    for i := (Self.MDIChildCount - 1) downto 0 do
    begin
      if (Self.MDIChildren[i]).Tag = Id then
      begin
        bFound := True;
        break;
      end;
    end;


  if bFound then
    Result := i
  else
    Result := -1;
end;


function TfrmTinnMain.FindWindowByName(sName: string): integer;
var
  i, Id: integer;
  bFound: Boolean;
begin
  bFound := False;

  sName := ansilowercase(sName);
  for i := (Self.MDIChildCount - 1) downto 0 do
    if ansilowercase((Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile) = sName then
    begin
      bFound := True;
      break;
    end;

  if bFound then
    Result := i
  else
    Result := -1;
end;

function TfrmTinnMain.FindTopWindow: integer;
var
  i: integer;
  bFound: Boolean;

begin
  bFound := False;
  for i := (Self.MDIChildCount - 1) downto 0 do
  begin
    if (Self.MDIChildren[i].Active = True) then
    begin
      bFound := True;
      break;
    end;
  end;
  if bFound then
    Result := i
  else
    Result := -1;
end;

function TfrmTinnMain.GetTopEditorForm(var edForm: TfrmEditor): Boolean;
var
  i: integer;
begin
  Result := False;
  if Self.ActiveMDIChild <> nil then
    if self.ActiveMDIChild is TfrmEditor then
    begin
      edForm := Self.ActiveMDIChild as TfrmEditor;
      Result := true;
    end;


  for i := (Self.MDIChildCount - 1) downto 0 do
  begin
    if (Self.MDIChildren[i].Active = True) then
    begin
      if edForm <> Self.MDIChildren[i] as TfrmEditor  then
        Label5.caption := 'Mismatch: ' + inttostr(random(9999));
      edForm := Self.MDIChildren[i] as TfrmEditor;
      Result := true;

      break;
    end;
  end;

end;



procedure TfrmTinnMain.actRguiReturnFocusExecute(Sender: TObject);
begin
  if not actRguiReturnFocus.Checked then
  begin
    bRguiReturnFocus := True;
    actRguiReturnFocus.Checked := True;
  end
  else
  begin
    bRguiReturnFocus := False;
    actRguiReturnFocus.Checked := False;
  end;
end;

procedure TfrmTinnMain.actRLibAddSnippetExecute(Sender: TObject);
var sciEditor: TDscintilla;
    sText: String;
begin
  if not GetActiveEditorOrNil(sciEditor) then
    exit;

  sText := trim(sciEditor.GetSelText);

  if length(sText) = 0 then
    exit;

  Application.CreateForm(TfrmRcard, frmRcard);
  try
    frmRcard.LoadSnippetAdd(sText);
    frmRcard.ShowModal;
  finally
    FreeAndNil(frmRcard);
  end;
end;

procedure TfrmTinnMain.actRLibDeleteEntryExecute(Sender: TObject);
var sName, sEnvironment:String;
begin
if frmTools.cgMainBase.PanelIndex <> -1 then
with modDados do
begin
  if MessageDlg('Do you want to delete the current library entry?', mtConfirmation, [mbyes, mbabort], 0) = mrYes then
  begin
    sName := dsMainBase.DataSet.FieldByName('Name').AsString;
    sEnvironment := dsMainBase.DataSet.FieldByName('Envir').AsString;
    modDados.sqlMainBase.ExecuteDirect('DELETE FROM UserDefined WHERE Name like '+AnsiQuotedStr(trim(sName),'"')+ ' AND Envir like '+AnsiQuotedStr((sEnvironment),'"'));
    modDados.sqlMainBase.ExecuteDirect('DELETE FROM Objects WHERE Name like '+AnsiQuotedStr(trim(sName),'"')+ ' AND Envir like '+AnsiQuotedStr((sEnvironment),'"'));
    frmTinnMain.AfterLibraryUpdate;

  end;
end;
end;

procedure TfrmTinnMain.actRmirrorsCopyHostExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText := cdRmirrorsHost.Text;
end;

procedure TfrmTinnMain.actRmirrorsCopyURLExecute(Sender: TObject);
begin
  with modDados do
    Clipboard.AsText := cdRmirrorsURL.Text;
end;

procedure TfrmTinnMain.actRmirrorsEditExecute(Sender: TObject);
begin
  sRmirrorsBookMark := modDados.cdRmirrors.Bookmark;
  actDoMirrorsExecute(nil);
  //SetFocus_Main;
end;

procedure TfrmTinnMain.actRmirrorsHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Mirrors (R)"');
end;

procedure TfrmTinnMain.actRmirrorsOpenURLDefaultExecute(Sender: TObject);
begin
  OpenUrl(frmTools.stbRMirrors.Panels[1].Text);
end;

procedure TfrmTinnMain.actRmirrorsOpenURLCurrentExecute(Sender: TObject);
begin
  OpenUrl(frmTools.dbeRmirrorsURL.Text);
end;

procedure TfrmTinnMain.actRmirrorsSetReposExecute(Sender: TObject);
var
  sTmp: string;

begin
  sRmirror := modDados.cdRmirrorsURL.Text;

  sTmp := 'options(''repos''=' + '''' + sRmirror + '''' + ')';

  DoSend(sTmp);

  frmTools.stbRMirrors.Panels[1].Text := sRmirror;
end;

procedure TfrmTinnMain.RmirrorsInterface_Update;
begin
  // TfrmRmirrors.FormActivate
  with modDados do
  begin
    cdRmirrors.Filtered := False;

    with frmTinnMain do
      frmTools.lbCountries.Selected[iCountriesFilter] := False;

    cdRmirrors.Bookmark := frmTinnMain.sRmirrorsBookMark;
  end;

  // TfrmRmirrors.FormCloseQuery
  with modDados.cdRmirrors do
  begin
    IndexDefs.Clear;

    with IndexDefs.AddIndexDef do
    begin
      Name := 'RmirrorsDefaultIndex';
      Fields := 'Country;Name;URL';
      Options := [ixPrimary, ixUnique];
    end;

    IndexName := 'RmirrorsDefaultIndex';
  end;

  // TfrmRmirrors.ActualizeCountries
  with modDados do
  begin
    RmirrorsCountriesFilter(nil);

    with frmTinnMain do
    begin
      frmTools.lbCountries.Items := slRmirrors_Countries;
      frmTools.lbCountries.Refresh;
    end;

    FreeAndNil(slRmirrors_Countries);
  end;

  // TfrmRmirrors.FormClose
  with frmTools do
  begin
    lbCountries.ItemIndex := frmTinnMain.iCountriesFilter;
    lbCountriesClick(Self);
  end;

 { with stbMain do
  begin
    Panels[7].Text := 'Done!';
    Panels[8].Text := 'The file ' + '''mirrors.xml'' ' + 'was updated in ' +
      sPathData;
  end; }
end;

procedure TfrmTinnMain.actRmirrorsUpdateExecute(Sender: TObject);
var
  i: integer;
  sPath, sTmp: string;

begin
  if Rterm_Running and (not frmRterm.cRterm.bRterm_Ready) then
    Exit
  else
    Sleep(10 * iDelay);

  sPath := sUtilsOrigin + '\Rinfo_c.R';
  // c: complete (will update CRAN mirrors)

  sTmp := 'source(''' + sPath + ''')';

  sTmp := DosPathToUnixPath(sTmp);
  DoSend(sTmp);

  sPath := sPathTmp + '\Rmirrors.txt';

  i := 1;
  repeat
    Sleep(iDelay);
    if FileExists(sPath) then
      break
    else
      inc(i);
  until (i = 20);

  if (FileExists(sPath)) then
    with modDados do
      if (not Rmirrors_Update(sPath)) then
      begin
        MessageDlg
          ('Sorry, it was not possible to update the dataset from CRAN mirrors!',
          mtWarning, [mbOk], 0);
        Exit;
      end;

  RmirrorsInterface_Update;
end;

procedure TfrmTinnMain.actRQuickCommandExecute(Sender: TObject);
var
  sTmp: string;
  sciEditor: TDScintilla;
begin
  if not ValidRRunning then
    Exit;

  if not GetActiveEditorOrNil(sciEditor) then
    exit;

  //sTmp := trim(sciEditor.GetSelText);
  sTmp := trim(FindWord);
  if sTmp = '' then
    exit;
  sTmp := 'head('+sTmp+')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actTemplateRNoWebExecute(Sender: TObject);
begin
  MakeTemplate(sPathTinnR + '\templates\R_noweb.Rnw', SCLEX_R);
end;

procedure TfrmTinnMain.OnTop(hHandle: HWND);
var
  hOption: HWND;

begin
  if bOnTop then
    hOption := HWND_TOPMOST
  else
    hOption := HWND_NOTOPMOST;

  SetWindowPos(hHandle, hOption, 0, 0, 0, 0, SWP_NOACTIVATE or SWP_NOMOVE or
    SWP_NOSIZE or SWP_NOSENDCHANGING);
end;

procedure TfrmTinnMain.actOnTopExecute(Sender: TObject);
begin
  if not actOnTop.Checked then
  begin
    bOnTop := True;
    OnTop(Application.Handle);
    actOnTop.Checked := bOnTop;
  end
  else
  begin
    bOnTop := False;
    OnTop(Application.Handle);
    actOnTop.Checked := bOnTop;
  end;
end;

procedure TfrmTinnMain.UpdateCursorPos(Sender: TDScintilla);
var
  iLineCount: integer;
begin
   iLineCount := Sender.GetLineCount;
  if (iLineCount = 0) then
    iLineCount := 1;
  frmtinnmain.actGotoLine.Caption :=
  { stbMain.Panels[2].Text :=} format('%d/%d: %d', [Sender.LineFromPosition(Sender.GetCurrentPos)+1 , iLineCount,
    Sender.GetColumn(Sender.GetCurrentPos)]);

  if iLineCount <> (Sender.Parent AS TfrmEditor).iLineOldCount then
  begin
    SetLineTextVisibility(actLineNumbersVisible.Checked, (Sender.Parent AS TfrmEditor).sciEditor);
    if assigned((Sender.Parent AS TfrmEditor).sciEditor2) then
     SetLineTextVisibility(actLineNumbersVisible.Checked, (Sender.Parent AS TfrmEditor).sciEditor2);
  end;
  (Sender.Parent AS TfrmEditor).iLineOldCount := iLineCount;
end;



procedure TfrmTinnMain.SetHighlighterCombo(iLexerId: Integer);
var
  i: integer;
begin
  for i := 0 to length(acHighlighters)-1 do
  begin
    if  acHighlighters[i].Tag = iLexerId then
    begin
      iFilterToSaveAs := i + 1;
      amMain.ActionBars.ActionBars[12].Items[3].Caption := acHighlighters[i].caption;
    end else
    acHighlighters[i].Checked := false;
  end;
end;

procedure TfrmTinnMain.FormCloseQuery(Sender: TObject; var bCanClose: Boolean);
var i: Integer;
begin

  bRtermOptionCancel := False;
  if Rterm_Running then
    actRContTermStartCloseExecute(nil);
  bCanClose := not bRtermOptionCancel; // If the choice is 'Cancel' don't close
  if bCanClose then
  begin
    CheckIfProjectWasChanged;
    Application.ProcessMessages;

    // Save layout
    SaveDockTreeToAppStorage(JvAppIniFileStorage);

    DeleteDir(sPathTmp);

    if not bRestored then
    begin
      WriteIniFile_Application(False);
      WriteIniFile_Editor(False);
    end;

    FreeAndNil(slProject);
    slProjectChanges.Free;


    if Assigned(frmTools) then
      with frmTools do
      begin
        Close;
        FreeAndNil(frmTools);
      end;

    if Assigned(frmRterm) then
      with frmRterm do
      begin
       // FreeAndNil(sciIO);
       // FreeAndNil(sciLog);
        Close;
        FreeAndNil(frmRterm);
      end;

    if Assigned(frmDiffMain) then
    begin
      with frmDiffMain do
      begin
        Close;
        FreeAndNil(frmDiffMain);
      end;
    end;

    if Assigned(frmAsciiChart) then
    begin
      with frmDiffMain do
      begin
        Close;
        FreeAndNil(frmDiffMain);
      end;
    end;


    // Destroy StringList
    FreeAndNil(slFilters);
    FreeAndNil(slRLibPaths);

    // Terminate
    Application.Terminate;
  end;
end;

procedure TfrmTinnMain.DrawSelectionMode(iSelMode: integer);
begin

end;

procedure TfrmTinnMain.pgFilesChange(Sender: TObject);
var
  i: integer;

  sNodeToSelect, sPageSelected, sTmp: string;

begin
  sPageSelected := pgFiles.ActivePage.Hint;
  with frmTools.tvProject do
  begin
    for i := 1 to (Items.Count - 1) do
    begin
      if Items[i].Level = 2 then
      begin
        sNodeToSelect := trim(PChar(Items[i].Data));
        if (sNodeToSelect = sPageSelected) then
          Items[i].ImageIndex := 4
        else
          Items[i].ImageIndex := 2;
      end;
    end;
  end;
  //m.p.statusbar
  {
  with stbMain do
  begin
    Panels[7].Text := EmptyStr;
    Panels[8].Text := EmptyStr;
  end; }

  with actRtermWarningError do
  begin
    Visible := False;
    Checked := False;
  end;

  sTmp := pgFiles.ActivePage.Hint;
  i := FindWindowByName(sTmp);

  if (i > -1) then
  begin
    if Self.MDIChildren[i].WindowState = wsMinimized then
      Self.MDIChildren[i].WindowState := wsNormal
    else
    begin
      // Check if the active form (position 0) is maximized
      if Self.MDIChildren[0].WindowState = wsMaximized then
      begin
        // Size new window to fit mainform
        Self.MDIChildren[i].Width := Width;
        Self.MDIChildren[i].Height := Height;
      end;
      Self.MDIChildren[i].BringToFront;
    end;


  end;

  pgFiles.Hint := sTmp;
//  i := FindTopWindow;

  pgFiles.Visible := (pgFiles.PageCount <> 0);
  UpdateCloseFileOptions;
end;

procedure TfrmTinnMain.actPrintExecute(Sender: TObject);
var
    edForm: TfrmEditor;
    seEditor: TDScintilla;
begin
  if not GetTopEditorForm(edForm) then
    Exit;

  edForm.GetActiveEditorOnForm(seEditor);

  if (seEditor.GetSelText <> '') then
    bselectedToPreview := True
    else
    bselectedToPreview := False;

  frmConfigurePrint := TfrmConfigurePrint.Create(Self);
  try
    frmConfigurePrint.ShowDialog(seEditor);
   finally
      FreeAndNil(frmConfigurePrint);
  end;
end;

procedure TfrmTinnMain.actMarkColor1Execute(Sender: TObject);
var edForm: TfrmEditor;
begin
  if GetTopEditorForm(edForm) then
    edForm.MarkSelectionColor(1);
end;

procedure TfrmTinnMain.actMarkColor2Execute(Sender: TObject);
var edForm: TfrmEditor;
begin
  if GetTopEditorForm(edForm) then
    edForm.MarkSelectionColor(2);
end;

procedure TfrmTinnMain.actMarkersVisibleExecute(Sender: TObject);
var
  i, j: integer;
  iWidth : Integer;
begin

  actMarkersVisible.Checked := not actMarkersVisible.Checked;

  if actMarkersVisible.Checked then
    iWidth  := 20 else   iWidth  := 0;


  if (Self.MDIChildCount > 0) then
    for i := (Self.MDIChildCount - 1) downto 0 do
      with (Self.MDIChildren[i] as TfrmEditor) do
       begin

         sciEditor.SetMarginWidthN(MARGIN_BOOKMARKS, iWidth);
        if Assigned(sciEditor2) then
          sciEditor.SetMarginWidthN(MARGIN_BOOKMARKS, iWidth);
      end;
end;

procedure TfrmTinnMain.actLineNumbersVisibleExecute(Sender: TObject);
var
  i, j: integer;

begin
  actLineNumbersVisible.Checked := not(actLineNumbersVisible.Checked);

  if (Self.MDIChildCount > 0) then
    for i := (Self.MDIChildCount - 1) downto 0 do
      with (Self.MDIChildren[i] as TfrmEditor) do
       begin
         SetLineTextVisibility(actLineNumbersVisible.Checked, sciEditor);
        if Assigned(sciEditor2) then
        begin
          SetLineTextVisibility(actLineNumbersVisible.Checked, sciEditor2);
        end
      end;
end;

procedure TfrmTinnMain.actOpenMaximizedExecute(Sender: TObject);
begin
  actOpenMaximized.Checked := not(actOpenMaximized.Checked);
end;

procedure TfrmTinnMain.actFileSaveAllExecute(Sender: TObject);
var
  i, iChildID, iActivePage: integer;
  sTmp: string;

begin
  if (pgFiles.PageCount > 0) then
  begin
    // Get the starting window ID
    iActivePage := pgFiles.ActivePageIndex;

    // Loop through all windows and save files
    for i := 0 to (pgFiles.PageCount - 1) do
    begin
      pgFiles.ActivePageIndex := i;
      sTmp := pgFiles.ActivePage.Hint;
      iChildID := FindWindowByName(sTmp);
      MDIChildren[iChildID].BringToFront;
      Application.ProcessMessages;
      iChildID := FindWindowByName(sTmp);
      with (Self.MDIChildren[iChildID] as TfrmEditor) do
        if EditorFile.iModified = 1 then
          actFileSaveExecute(Sender);
    end;

    // Bring back the starting window
    pgFiles.ActivePageIndex := iActivePage;
    sTmp := pgFiles.ActivePage.Hint;
    iChildID := FindWindowByName(sTmp);
    MDIChildren[iChildID].BringToFront;
  end;
  actFileSaveAll.Enabled := False;
end;

procedure TfrmTinnMain.tBackupTimer(Sender: TObject);
begin
  modDados.BackupFiles;
end;

procedure TfrmTinnMain.actChaLinEndMACExecute(Sender: TObject);
begin
//  SetBuffer_FileFormat(sffMAC);
end;

procedure TfrmTinnMain.actChaLinEndUnixExecute(Sender: TObject);
begin
 // SetBuffer_FileFormat(sffUNIX);
end;

procedure TfrmTinnMain.actChaLinEndWINExecute(Sender: TObject);
begin
//  SetBuffer_FileFormat(sffDOS);
end;

procedure TfrmTinnMain.actColorsPreferenceExecute(Sender: TObject);
var
 // dlg: TfrmColors;
 // i: integer;

  sSyntaxBackupFile: string;

begin
  if not assigned(frmColors) then
    frmColors := TfrmColors.Create(Self);
  frmColors.ShowModal;
  LoopAllEditorsReSetProperties;
  {
  try


    dlg := TfrmColors.Create(Self);
    if (dlg.ShowModal = mrOK) then
    begin // OK
      with dlg do
      begin
        clActiveLine := cbActiveLine.SelectedColor;
        clBrackets := cbBrackets.SelectedColor;
        clBGForAllHighlighters := cbBGAllHighlighters.SelectedColor;
        clBGPreferred := cbBGPreferred.SelectedColor;
        bActiveLine := cbActiveLineBG.Checked;
      end;
    end
    else
    begin }// Cancel: will restore a prior backup o all ini syntax files
     { sSyntaxBackupFile := sPathSyntaxBKP + '\syntax_bkp.zip';

      try
        DeleteDir(sPathSyntax);
        zipKit.ExtractOptions := [eoCreateDirs, eoRestorePath];

        with zipKit do
        begin
          FileName := sSyntaxBackupFile;
          BaseDirectory := ExtractFileDrive(sPathIni) + '\';
          ExtractFiles('*.*');
        end;

        zipKit.CloseArchive;
        if FileExists(sSyntaxBackupFile) then
          DeleteFile(sSyntaxBackupFile);
      except
        // TODO
      end;
      dmSyn.LoadSyntaxFromIni;  }
{  end;
  finally    }
 {   SynURIOpener.Editor := nil; // Don't remove from here!
    FreeAndNil(dlg); }
//  end;
  {
  for i := (Self.MDIChildCount - 1) downto 0 do
  begin
    with (Self.MDIChildren[i] as TfrmEditor).sciEditor do
    begin
      if bActiveLine then
        ActiveLineColor := TColor(clActiveLine)
      else
        ActiveLineColor := TColor(clNone);
      WordWrap := actEditorLineWrap.Checked;
    end;
    (Self.MDIChildren[i] as TfrmEditor).Repaint;
  end;

  UpdateAppearance(False);    }
 // SetFocus_Main;
end;

procedure TfrmTinnMain.actStatusBarVisibleExecute(Sender: TObject);
begin
  atbStatus.Visible := not(atbStatus.Visible);
  actStatusBarVisible.Checked := atbStatus.Visible;
end;

procedure TfrmTinnMain.actStringReplaceExecute(Sender: TObject);
var
  i: integer;

  seEditor, seTmp: TDScintilla;

begin
  i := FindTopWindow;
  if not Assigned(Self.MDIChildren[i] as TfrmEditor) then
    Exit;

  with (Self.MDIChildren[i] as TfrmEditor) do
    if (sActiveEditor = 'sciEditor') then
      seEditor := sciEditor
    else
      seEditor := sciEditor2;

  seTmp := TDScintilla.Create(Self);
  seTmp.Parent := panInvisibleParent;

  seTmp.Lines := seEditor.Lines;

  i := 0;
  with seTmp do
  begin
    Lines.BeginUpdate;

    repeat
      Lines.Strings[i] := StringReplace(Lines.Strings[i], '//', '', []);
      inc(i)
    until (i = Lines.Count);

    Lines.EndUpdate;
  end;

  seEditor.SelectAll;
  seTmp.SelectAll;

  SavePriorClipboardText;
  seTmp.Cut;
  seEditor.Paste;
  RestorePriorClipboardText;

  FreeAndNil(seTmp);
end;

procedure TfrmTinnMain.actSpecialCharVisibleExecute(Sender: TObject);
var
  i, j: integer;

begin
  actSpecialCharVisible.Checked := not(actSpecialCharVisible.Checked);

  // Update all open files
  if (Self.MDIChildCount > 0) then
    for i := (Self.MDIChildCount - 1) downto 0 do
      with (Self.MDIChildren[i] as TfrmEditor) do
      begin
        SetSpecialChars(actSpecialCharVisible.Checked, sciEditor);

        if Assigned(sciEditor2) then
          SetSpecialChars(actSpecialCharVisible.Checked, sciEditor2);
      end;
end;

procedure TfrmTinnMain.SetTabTitle(sStat: string);
begin
//m.p.settabtitles
  if (pgFiles.PageCount > 0) then
  begin
    if (not actReadOnly.Checked) then
      pgFiles.ActivePage.Caption := StripPath(pgFiles.ActivePage.Hint) + sStat
    else
      pgFiles.ActivePage.Caption := '<' + StripPath(pgFiles.ActivePage.Hint) +
        sStat + '>'
  end;
end;

procedure TfrmTinnMain.RemoveTab(iId: integer);
var
  j, i: integer;

begin
  j := 0;
  while (j <= pgFiles.PageCount - 1) do
  begin
    if (pgFiles.Pages[j].Tag = iId) then
      pgFiles.Pages[j].Free;
    inc(j);
  end;
  for i := (Self.MDIChildCount - 1) downto 0 do
  begin
 //   (Self.MDIChildren[i] as TfrmEditor).Repaint;
  end;
  ReRecordTabOrder;

  UpdateCloseFileOptions;
end;

procedure TfrmTinnMain.actOpenMRUExecute(Sender: TObject);
var
  i: integer;
  slTmp: TStringList;

begin
  // Open all files in fileMRU
  slTmp := TStringList.Create;

  for i := 0 to (menFileRecentFiles.Count - 1) do
    slTmp.Add(menFileRecentFiles.Items[i].Caption);

  for i := 0 to (slTmp.Count - 1) do
  begin
    if FileExists(slTmp.Strings[i]) then
      OpenFileIntoTinn(slTmp.Strings[i])
    else
    begin
      // Take it off the fileMRU list
      if (MessageDlg(slTmp.Strings[i] + #13 + #13 + 'File does not exist.' + #13
        + 'Would you like to remove it from MRU (Most Recent Used) list?',
        mtInformation, [mbYes, mbNo], 0) = mrYes) then
        UpdateMRU(menFileRecentFiles, slTmp.Strings[i]);
    end;
  end;

  FreeAndNil(slTmp);
end;

procedure TfrmTinnMain.actProjectOpenNodeExecute(Sender: TObject);
begin
  with frmTools do
    DoProjectOpenNode;
end;

procedure TfrmTinnMain.SearchInOpenFiles(var iFileCount, iMatchCount: integer);
var
  bFileFind: Boolean;

  i, j: integer;

  sLine, sfilename, sNotify: string;

  tnSearch, tnFile, tnOccurence: TTreeNode;

begin
  tnFile := nil;

  with frmTools.tvSearch do
  begin
    Items.BeginUpdate;
    tnSearch := Items.Add(nil, 'Opened files');
    tnSearch.ImageIndex := 0;
    tnSearch.SelectedIndex := 0;
  end;

  for i := (Self.MDIChildCount - 1) downto 0 do
  begin
    with (Self.MDIChildren[i] as TfrmEditor) do
    begin
      bFileFind := False;

      sfilename := (Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile;

      if (Length(sfilename) > 100) then
        sNotify:= 'Search in file ' +  ExtractFileDrive(sfilename) + '\...\' +
            ExtractFileName(sfilename)
        else
        sNotify:= 'Search in file ' + ExtractFileName(sfilename);

      frmTinnMain.ShowNotification(sNotify, sNotify);


      for j := 0 to (sciEditor.Lines.Count - 1) do
      begin
        sLine := trim(sciEditor.Lines.Strings[j]);

        if rsSearch.IsMatch(sLine) then
        //if rsSearch.Exec(sLine) then
        begin
          if not bFileFind then
          begin
            with frmTools.tvSearch do
            begin
              tnFile := Items.AddChild(tnSearch, sfilename);
              tnFile.ImageIndex := 2;
              tnFile.SelectedIndex := 2;
            end;
          end;

          bFileFind := True;
          inc(iMatchCount);

          with frmTools.tvSearch do
          begin
            tnOccurence := Items.AddChild(tnFile, '(' + IntToStr(j + 1) +
              '): ' + sLine);
            SetLength(aOpenFileSearch, Length(aOpenFileSearch)+1);
            aOpenFileSearch[Length(aOpenFileSearch)-1] := (Self.MDIChildren[i] as TfrmEditor).EditorFile.iId;
            tnOccurence.data := @aOpenFileSearch[Length(aOpenFileSearch)-1];
            tnOccurence.ImageIndex := 3;
            tnOccurence.SelectedIndex := 3;
          end;
        end;
      end;
    end;
    if bFileFind then
      inc(iFileCount);
  end;

  with frmTools.tvSearch do
    Items.EndUpdate;

{  with stbMain do
  begin
    Panels[7].Text := EmptyStr;
    Panels[8].Text := EmptyStr;
    Refresh;
  end;  }

  with actRtermWarningError do
  begin
    Visible := False;
    Checked := False;
  end;

end;

procedure TfrmTinnMain.ClearMRU;
begin
  slFileMRU.Clear;
  pmenMainMRU.Items.Clear;
  while (menFileRecentFiles.Count > 0) do
    menFileRecentFiles.Delete(0);
end;

procedure TfrmTinnMain.MinimizeTinnAfterLastFile;
begin
  if bMinimizeTinnAfterLastFile then
    Application.Minimize;
end;

procedure TfrmTinnMain.SearchInDirectories(const sDir, sMask: string;
  var iFileCount, iMatchCount, iTotFileCount: integer);
var
  bFileFind: Boolean;

  i, j, iPosSlash, iDirLen, iLinePos: integer;

  seTmp: TStringList;
  slFile: TStringList;

  sPath, lastChar, tmpLine, sNotify: string;

  tnSearch, tnFile, tnOccurence: TTreeNode;

begin
  tnFile := nil;
  with frmTools.tvSearch do
  begin
    if (Items.Count > 0) and not bSearchOpenFiles then
    begin
      Items.Clear;
      frmTools.tvSearch.Refresh;
    end;
    tnSearch := Items.Add(nil, 'Directories');
    tnSearch.ImageIndex := 1;
    tnSearch.SelectedIndex := 1;
  end;

  try
    slFile := TStringList.Create;
    seTmp := TStringList.Create;
    try
      // Make sure the file path has a '\' at the end
      iDirLen := Length(sDir);
      lastChar := copy(sDir, iDirLen, 1);

      iPosSlash := pos('\', lastChar);

      if (iPosSlash = 0) then
        sPath := sDir + '\'
      else
        sPath := sDir;

      // Get a file list
      TraverseDir(sPath, slFile, sMask);

      for i := 0 to (slFile.Count - 1) do
      begin

        if (Length(slFile[i]) > 100) then
        sNotify:= 'Search in file ' +  ExtractFileDrive(slFile[i]) + '\...\' +
            ExtractFileName(slFile[i])
        else
        sNotify:= 'Search in file ' + ExtractFileName(slFile[i]);

      frmTinnMain.ShowNotification(sNotify, sNotify);

     {   with stbMain do
        begin
          Panels[7].Text := 'Search in directory(ies)';
          if (Length(slFile[i]) > 100) then
            Panels[8].Text := ExtractFileDrive(slFile[i]) + '\...\' +
              ExtractFileName(slFile[i])
          else
            Panels[8].Text := slFile[i];
          Refresh;
        end;    }


        bFileFind := False;

        j := 0;
        seTmp.LoadFromFile(slFile.Strings[i]);
        for iLinePos := 0 to (seTmp.Count - 1) do
        begin
          tmpLine := seTmp[iLinePos];
          if rsSearch.IsMatch(tmpLine) then
          //if rsSearch.Exec(tmpLine) then
          begin
            tmpLine := trim(tmpLine);
            if not bFileFind then
            begin
              with frmTools.tvSearch do
              begin
                tnFile := Items.AddChild(tnSearch, slFile.Strings[i]);
                tnFile.ImageIndex := 2;
                tnFile.SelectedIndex := 2;
              end;
            end;
            bFileFind := True;
            inc(iMatchCount);
            with frmTools.tvSearch do
            begin
              tnOccurence := Items.AddChild(tnFile, '(' + IntToStr(j + 1) +
                '): ' + tmpLine);
              tnOccurence.ImageIndex := 3;
              tnOccurence.SelectedIndex := 3;
            end;
          end; // if regex match
          inc(j);
        end;
        if bFileFind then
          inc(iFileCount);
      end;
      iTotFileCount := slFile.Count;
    except
      on e: exception do
        // tsResultList.Add(e.Message);
    end;
  finally
 {   with stbMain do
    begin
      Panels[7].Text := EmptyStr;
      Panels[8].Text := EmptyStr;
      Refresh;
    end;  }

    with actRtermWarningError do
    begin
      Visible := False;
      Checked := False;
    end;

    FreeAndNil(slFile);
    FreeAndNil(seTmp);
  end;

  with frmTools.tvSearch do
    Items.EndUpdate;
end;

function TfrmTinnMain.StripRegExPower(sSearchText: string): string;
begin
  sSearchText := StringReplace(sSearchText, '*', '\*', [rfReplaceAll]);
  sSearchText := StringReplace(sSearchText, '\', '\\', [rfReplaceAll]);
  sSearchText := StringReplace(sSearchText, '[', '\[', [rfReplaceAll]);
  sSearchText := StringReplace(sSearchText, '(', '\(', [rfReplaceAll]);
  sSearchText := StringReplace(sSearchText, '+', '\+', [rfReplaceAll]);
  sSearchText := StringReplace(sSearchText, '?', '\?', [rfReplaceAll]);
  sSearchText := StringReplace(sSearchText, '^', '\^', [rfReplaceAll]);
  sSearchText := StringReplace(sSearchText, '$', '\$', [rfReplaceAll]);
  sSearchText := StringReplace(sSearchText, '.', '\.', [rfReplaceAll]);
  Result := sSearchText;
end;

procedure TfrmTinnMain.SetupSearchParameters(sSearchText: string);
begin
  //showmessage('feature not available');

  //if rsSearch = nil then



  if (Length(trim(sSearchText)) = 0) then
    sSearchText := ' ';
  if not bSearchRegExp then
    sSearchText := StripRegExPower(sSearchText);
  if bSearchWholeWords then
    sSearchText := sSearchText + '\W';

  //rsSearch.ModifierI := not bSearchCaseSensitive;
  //rsSearch.Expression := sSearchText;

  if not bSearchCaseSensitive then
    rsSearch := TRegEx.Create(sSearchText, [roIgnoreCase])
 else
    rsSearch := TRegEx.Create(sSearchText, []);
end;

procedure TfrmTinnMain.TraverseDir(sPath: string; var tsFileList: TStringList;
  sMask: string);
var
  curFile: WIN32_FIND_DATA;
  hHandle: THandle;

  i, iDirFound: integer;

  slPath: TStringList;
  srDir: TSearchRec;
  sTmp: string;

begin
  // Get the files for the current directory
  hHandle := FindFirstFile(PChar(sPath + sMask), curFile);
  if FileExists(sPath + curFile.cFilename) then
    tsFileList.Add(sPath + curFile.cFilename);

  while FindNextFile(hHandle, curFile) do

    if FileExists(sPath + curFile.cFilename) then
      tsFileList.Add(sPath + curFile.cFilename);

  if bSearchInSub then
  begin
    // Ok to search sub directories
    slPath := TStringList.Create;
    try
      // Get the list of sub directories
      iDirFound := FindFirst(sPath + '*.*', faDirectory, srDir);

      while (iDirFound = 0) do
      begin
        if (srDir.Attr and faDirectory > 0) and (srDir.Name[1] <> '.') then
          slPath.Add(srDir.Name);
        iDirFound := FindNext(srDir);
      end;

      for i := 0 to (slPath.Count - 1) do
      begin
        // Traverse the directories
        sTmp := sPath + slPath.Strings[i] + '\';
        TraverseDir(sTmp, tsFileList, sMask);
      end;
    finally
      FreeAndNil(slPath);
    end;
  end;
end;

procedure TfrmTinnMain.RecordActions(baAction: TBasicAction;
  var bHandled: Boolean);
//var
//  aEvent: TActionMacroEvent;

begin
{  try
    if not bInExecute and (baAction <> actMacroRecord) and
      (baAction <> actMacroPlay) then

      with synMR do
      begin
        aEvent := TActionMacroEvent.Create;
        aEvent.ActionName := baAction.Name;

        with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
          aEvent.ActionLists.Add(alMain);
        AddCustomEvent(TSynMacroEvent(aEvent));
        bInExecute := True;
        try
          baAction.Execute;
          bHandled := True;
        finally
          bInExecute := False;
        end;
      end;
  except
    on e: exception do
      MessageDlg(e.message, mtError, [mbOk], 0);
  end;    }
end;

procedure TfrmTinnMain.tbReloadClick(Sender: TObject);
begin
  actReloadExecute(nil);
end;

procedure TfrmTinnMain.tDataConflictTimer(Sender: TObject);
begin
  tDataConflict.Enabled := false;
  if not assigned(frmTools) then
    exit;
 
  actRExplorerRefresh.Execute; 
end;

procedure TfrmTinnMain.tNotifyTimerTimer(Sender: TObject);
begin
  tNotifyTimer.Enabled := false;
  acShowNotification.Visible := false;
  acShowNotification.Enabled := false;
end;

procedure TfrmTinnMain.panProjectDockSiteDockDrop(Sender: TObject;
  Source: TDragDockObject; X, Y: integer);
begin
  panProjectDockSite.Constraints.MinWidth := 20;
  panProjectDockSite.Width := 150;
  // splTools.Visible                       := True;
end;

procedure TfrmTinnMain.actProjectNewExecute(Sender: TObject);
var
  sFileExt: string;

begin
  // New Project
  CheckIfProjectWasChanged;
  Application.ProcessMessages;

  with sdMain do
  begin
    DefaultFolder := sWorkingDir;
    //Filter := 'Tinn-R project space (*.tps)|*.tps';
    //DefaultExt := '*.tps';
    if Execute then
    begin
      sProjectName := sdMain.FileName;
      sFileExt := lowerCase(ExtractFileExt(sProjectName));
      // John Fox suggestion

      if not(sFileExt = '.tps') then
        sProjectName := FileName + '.tps';

      if FileExists(sProjectName) then
        if (MessageDlg(sProjectName + #13 + #13 +
          'Do you want to overwrite this file?', mtConfirmation,
          [mbYes, mbCancel], 0) <> idYes) then
          Exit;

      CreateProject;
      SaveProject;
      UpdateProjectMRU(menProjRecent, sProjectName);
      ToolsProjectControls(True);
    end;
    frmTinnMain.ReLoadDialogFileExtension(frmTinnMain.sdMain.FileTypes);
  end;
end;

procedure TfrmTinnMain.panProjectDockSiteUnDock(Sender: TObject;
  Client: TControl; NewTarget: TWinControl; var Allow: Boolean);
begin
  panProjectDockSite.Constraints.MinWidth := 1;
  panProjectDockSite.Width := 0;
  // splTools.Visible                       := False;
end;

procedure TfrmTinnMain.actFilesAddCurrentExecute(Sender: TObject);
var
  i: integer;

begin
  // Add the current file to the project
  if (pgFiles.PageCount = 0) then
    Exit;
  if (frmTools.tvProject.SelectionCount <= 0) then
    Exit;
  if (frmTools.tvProject.Selected.Level = 1) or
    (frmTools.tvProject.Selected.Level = 2) then
  begin
    if (slProjectChanges = nil) then
      slProjectChanges := TStringList.Create;

    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    begin
      slProjectChanges.Add(EditorFile.sFile);
      i := slProjectChanges.IndexOf(EditorFile.sFile);
    end;

    AddFile(slProjectChanges[i]);
  end;
end;

procedure TfrmTinnMain.actProjectOpenExecute(Sender: TObject);
var
  od: TOpenDialog;
  sFile: string;

begin
  // Open an existing project
  od := TOpenDialog.Create(Self);
  try
    od.InitialDir := sWorkingDir;
    od.Filter := 'Tinn project space (*.tps)|*.tps';

    if od.Execute then
    begin
      sFile := od.FileName;
      OpenFileIntoTinn(sFile);
    end;
  finally
    FreeAndNil(od);
  end;
  Self.Repaint;
end;

procedure TfrmTinnMain.actProjectSaveExecute(Sender: TObject);
begin
  SaveProject;
  UpdateProjectMRU(menProjRecent, sProjectName);
end;

procedure TfrmTinnMain.actFilesRemoveExecute(Sender: TObject);
begin
  // Remove selected file
  with frmTools.tvProject do
  begin
    if (SelectionCount <= 0) then
      Exit;
    if (Selected.Level = 2) then
    begin
      Selected.Delete;
      bProjectChanged := True;
    end;
  end;
end;

procedure TfrmTinnMain.CheckIfProjectWasChanged;
var
  i: integer;

begin
  if not bProjectChanged then
    Exit;

  // Bring to front the textual project, if it is opened
  i := FindWindowByName(sProjectName);
  if (i > -1) then
    Self.MDIChildren[i].BringToFront;

  if (MessageDlg(sProjectName + #13 + #13 + 'This project was changed!' + #13 +
    'Do you like to save the changes?', mtConfirmation, [mbYes, mbNo], 0)
    = mrYes) then
    actProjectSaveExecute(nil);
end;

procedure TfrmTinnMain.ClearStatusBar;
var
  i: integer;

begin
{  i := 0;
  repeat
    with stbMain do
      Panels[i].Text := EmptyStr;
    inc(i)
  until (i > 5);
  Application.ProcessMessages; }
end;

procedure TfrmTinnMain.ClearStatusBarProject;
begin
  with frmTools.stbProject do
  begin
    Panels[1].Text := EmptyStr;
    Panels[3].Text := EmptyStr;
    Panels[5].Text := EmptyStr;
    Refresh;
  end;
end;

procedure TfrmTinnMain.actProjectCloseExecute(Sender: TObject);
var
  iPos: integer;

begin
  CheckIfProjectWasChanged;
  Application.ProcessMessages;
  if not CloseAllFilesOfProject then
    Exit;

  // Close also the *.tps project file
  iPos := FindWindowByName(sProjectName);
  try
    if (iPos > -1) then
      (Self.MDIChildren[iPos] as TfrmEditor).Close;
    if (pgFiles.PageCount = 0) then
      ClearStatusBar
  except
    MessageDlg(sProjectName + #13 + #13 +
      'The project file above was not found!', mtInformation, [mbOk], 0);
  end;

  ToolsProjectControls(False);

  with frmTools.tvProject.Items do
  begin
    BeginUpdate;
    Clear;
    EndUpdate;
  end;

  if Assigned(slProjectChanges) then
    slProjectChanges.Clear;
  bProjectChanged := False;
  ClearStatusBarProject;
end;

procedure TfrmTinnMain.actFilesOpenAllExecute(Sender: TObject);
begin
  OpenAllFiles;
end;

procedure TfrmTinnMain.actFilesCloseAllExecute(Sender: TObject);
begin
  // Close all files of the active project;
  CloseAllFilesOfProject;
end;

procedure TfrmTinnMain.OpenProjectIntoTinn(sProjectName: string);
begin
    if not frmTools.Visible then
       actToolsVisibleExecute(nil);

  frmTools.npTools.ActivePage := frmTools.ppFiles;

  OpenProject;
  bProjectChanged := False;
  ToolsProjectControls(True);

  UpdateProjectMRU(menProjRecent, sProjectName);
  SortProject;
  ClearStatusBarProject;

  with frmTools.stbProject do
  begin
    Panels[1].Text := IntToStr(frmTools.tvProject.Items.Count);
    Refresh;
  end;

  with frmTools.tvProject do
    Selected := Items.GetFirstNode;
end;

procedure TfrmTinnMain.BuildProjectMRU(var miItem: TMenuItem);
var
  i: integer;
  miMRU: TMenuItem;
  prjTmp: string;
  miMRUAction: TActionClientItem;

begin
  amMain.ActionBars.ActionBars[5].Items[0].Items.Clear;

  pmenProjectMRU.Items.Clear;
  miItem.Clear;
  if (slprojectMRU.Count > 0) then
  begin
    for i := 0 to (slprojectMRU.Count - 1) do
    begin
      if (i < iLastFile) then
      begin
        prjTmp := slprojectMRU.Values[IntToStr(i)];
        if (prjTmp <> EmptyStr) then
        begin
          miMRU := newItem(slprojectMRU.Values[IntToStr(i)], 0, False, True,
            RecentProjectFileClick, 0, format('File%d', [i]));
          miMRU.Tag := i;

          miItem.Add(miMRU);

          miMRU := newItem(slprojectMRU.Values[IntToStr(i)], 0, False, True,
            RecentProjectFileClick, 0, format('File%d', [i]));
          pmenProjectMRU.Items.Add(miMRU);

          miMRUAction := amMain.ActionBars.ActionBars[5].Items[0].Items.Add;
          miMRUAction.Action := FRecentProjectActions[i];
          miMRUAction.Action.Caption := slprojectMRU.Values[IntToStr(i)];
          miMRUAction.Visible := True;
          // miMRUAction.Action.OnExecute := RecentProjectFileClick;

        end;
      end;
    end;
  end;
end;

procedure TfrmTinnMain.Button1Click(Sender: TObject);
var sString: String;
    tst: TfrmEditor;
begin

  if not GetTopEditorForm(tst) then
     Exit;
    tst.sciEditor.SetMarginWidthN(3, 3);
   tst.sciEditor.SetMarginTypeN(3, SC_MARGIN_BACK);
     tst.sciEditor.SetMarginMaskN(3, SC_MARGIN_SYMBOL);

        tst.sciEditor.MarkerSetBack(SC_MARK_FULLRECT, clGreen);;
   tst.sciEditor.MarkerSetFore(SC_MARK_FULLRECT, clGreen);
 //   tst.sciEditor.MarkerSetBack(SC_MARK_LEFTRECT, clGreen);
    tst.sciEditor.MarkerAdd(1, SC_MARK_LEFTRECT);
    tst.sciEditor.MarkerAdd(2, SC_MARK_LEFTRECT);
   tst.sciEditor.MarkerAdd(3, SC_MARK_LEFTRECT);

end;

procedure TfrmTinnMain.Button2Click(Sender: TObject);
var sString: String;
    tst: TfrmEditor;
begin
 csREnvironment.Socket.SendText(Edit4.Text+#13#10);

 Exit ;
frmtinnmain.UpdateRterm_Appearance;
exit;
  if not GetTopEditorForm(tst) then
    showmessage('no children')
    else
  begin
  //   showmessage(tst.sciEditor.GetText);
    //tst.sciEditor.mark
    tst.sciEditor.MarkerSetBack(SC_Mark_Background, clMoneyGreen);
    tst.sciEditor.MarkerAdd(1, SC_Mark_Background);
  //  tst.sciEditor.MarkerAddSet(1, SC_Mark_Background);

    tst.sciEditor.MarkerSetBack(SC_MARK_DOTDOTDOT, clMaroon);
    tst.sciEditor.MarkerAdd(2, SC_MARK_DOTDOTDOT);
 //   tst.sciEditor.MarkerAddSet(1, SC_MARK_DOTDOTDOT);
  end;
//frmRTerm.pgRtermResize(self);
Exit;

with frmRTerm.sciIO do
begin
  Lines.BeginUpdate;
  sString := '101+2 "ABC" test'#13#10'1+2 "ABC test'+#13#10+'> "test test" more'+#13#10+'101+2 "ABC" test'+#13#10+'1+2 "ABC test'+#13#10+'> "test test" more'+#13#10+'no problem'+#13#10+'> test'+#13#10+'open ''string'+#13#10+'> test';
  {Lines.Add(sString);
  Update;
  //showmessage('look');
  ResetHighlighter(length(sString));
  Lines.EndUpdate;
  }
  frmRTerm.cRTerm.OnReceiveOutput(self, sString);
end;
end;

procedure TfrmTinnMain.cbLexersSelect(Sender: TObject);
begin
  if cbLexers.ItemIndex >-1 then
  if (Self.MDIChildCount > 0) then
      (Self.ActiveMDIChild AS TfrmEditor).SetEditorLexerById(modDados.GetLexerIdByName(cbLexers.Items[cbLexers.ItemIndex]));
end;

procedure TfrmTinnMain.edFilterRightButtonClick(Sender: TObject);
var
  i, iNewFile: integer;

  rsGrep: TRegEx;
  sciOrig: TDScintilla;
begin
  if (pgFiles.PageCount = 0) then
  begin
    MessageDlg('No file is opened!', mtInformation, [mbOk], 0);
    edFilter.Text := EmptyStr;
    Exit;
  end;

  if (edFilter.Text = EmptyStr) then
  begin
    MessageDlg('You need to define a RegEx filter before running it!',
      mtInformation, [mbOk], 0);
    Exit;
  end;


  // Grep and filter
  rsGrep := TRegEx.Create(edFilter.Text);
  try
    // For every line in the current on top window that matches, put it into another editor window
    sciOrig := (Self.MDIChildren[FindTopWindow] as TfrmEditor).sciEditor;

    // Create new tab and window
    actFileNewExecute(Sender);
    iNewFile := FindTopWindow;

    for i := 0 to (sciOrig.Lines.Count - 1) do
    begin
      // Look at each line and if it matches, add it to the new child

      if rsGrep.IsMatch(sciOrig.Lines[i]) then
        (Self.MDIChildren[iNewFile] as TfrmEditor).sciEditor.Lines.Add(sciOrig.Lines[i]);
    end;

    with ((Self.MDIChildren[iNewFile] as TfrmEditor).sciEditor.Lines) do
      if (Count = 0) then
        Add('No matches found.');
  finally
  end;
end;

procedure TfrmTinnMain.UpdateProjectMRU(var miItem: TMenuItem;
  sfilename: string);
var
  i, j: integer;

  slTmp: TStringList;
  sTmp: string;

begin
  slTmp := TStringList.Create;

  // Put the opened file in at the top of the list
  sTmp := StringReplace(sfilename, '&', '&&', [rfReplaceAll]);

  if FileExists(sfilename) then
  begin
    slTmp.Insert(0, '0=' + sTmp);
    j := 1;
  end
  else
    j := 0;

  // Store Data and remove from menu
  for i := 0 to (slprojectMRU.Count - 1) do
  begin
    if (sTmp <> slprojectMRU.Values[IntToStr(i)]) then
    begin
      slTmp.Add(IntToStr(j) + '=' + slprojectMRU.Values[IntToStr(i)]);
      inc(j);
    end;
  end;

  slprojectMRU.Text := slTmp.Text;
  BuildProjectMRU(miItem);
  FreeAndNil(slTmp);
end;

procedure TfrmTinnMain.RecentProjectFileClick(Sender: TObject);
var
  sTmp: string;

begin
  sTmp := StringReplace(TMenuItem(Sender).Caption, '&', EmptyStr, []);

  sTmp := StringReplace(sTmp, '&&', '&', [rfReplaceAll]);

  if FileExists(sTmp) then
    OpenFileIntoTinn(sTmp)
  else
  begin
    // Take it off the fileMRU list
    if (MessageDlg(sTmp + #13 + #13 + 'File does not exist.' + #13 +
      'Would you like to remove it from MRU (Most Recent Used) list?',
      mtInformation, [mbYes, mbNo], 0) = mrYes) then
      UpdateProjectMRU(menProjRecent, sTmp);
  end;
end;

procedure TfrmTinnMain.pgFilesMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var
  i: integer;

begin
  pgFiles.BeginDrag(False);
  i := pgFiles.IndexOfTabAt(X, Y);

  if (Button = mbRight) and (pgFiles.ActivePageIndex = i) then
    TabMenuPopup(pgFiles, X, Y);
end;

procedure TfrmTinnMain.pgFilesDragDrop(Sender, Source: TObject; X, Y: integer);
const
  TCM_GETITEMRECT = $130A;

var
  i: integer;
  r: TRect;

begin
  if not(Sender is TPageControl) then
    Exit;

  with pgFiles do
  begin
    for i := 0 to (PageCount - 1) do
    begin
      Perform(TCM_GETITEMRECT, i, lParam(@r));

      if PtInRect(r, Point(X, Y)) then
      begin
        if (i <> ActivePage.PageIndex) then
          ActivePage.PageIndex := i;
        break;
      end;
    end;
  end;
  ReRecordTabOrder;
end;

procedure TfrmTinnMain.ReRecordTabOrder;
var
  i: integer;
begin
  if pgFiles.PageCount > 0 then
    for i := 0 to pgFiles.PageCount - 1 do
      (Self.MDIChildren[FindWindowById(pgFiles.Pages[i].Tag)] as TfrmEditor).EditorFile.iTabPosition := i + 1;
end;



procedure TfrmTinnMain.pgFilesDragOver(Sender, Source: TObject; X, Y: integer;
  State: TDragState; var Accept: Boolean);
begin
  if Sender is TPageControl then
    Accept := True;
end;

function TfrmTinnMain.UseTCPIP: Boolean;
begin
  Result := False;
  if bRAsServer then
    if csREnvironment.Active and csRExplorer.Active and csRGeneral.Active and
      csRtip.Active then
      Result := True;
end;

procedure TfrmTinnMain.CheckTop;
begin
  OnTop(Application.Handle);
end;

procedure TfrmTinnMain.SetFocus_Rgui(iDelay: integer);
begin
  Sleep(iDelay);
  if bRguiReturnFocus then
    SetForegroundWindow(Application.Handle);
end;

function TfrmTinnMain.FindWord: string;
var
  seTmp: TDSCintilla;

begin
  seTmp := nil;
  case iSciWithFocus of
    0:
      Exit;
    1:
       seTmp := (Self.MDIChildren[FindTopWindow] as TfrmEditor).sciEditor;
    2:
        seTmp := (Self.MDIChildren[FindTopWindow] as TfrmEditor).sciEditor2;
    3: seTmp := frmRterm.sciIO;
    4: seTmp := frmRterm.sciLog;
  end;

  with seTmp do
    if (GetSelText <> '') and (SelStartLine(seTmp) =  SelEndLine(seTmp)) then
      Result := GetSelText
    else
      Result := GetWordFromPos(GetCurrentPos, seTmp);
end;

procedure TfrmTinnMain.actEditorLineWrapExecute(Sender: TObject);
var
  i: integer;

begin
  actEditorLineWrap.Checked := not actEditorLineWrap.Checked;

  if actEditorLineWrap.Checked  then
    iEditorLineWrap := SC_WRAP_WORD
  else  iEditorLineWrap := SC_WRAP_NONE;

  if (Self.MDIChildCount > 0) then
    for i := (Self.MDIChildCount - 1) downto 0 do
    begin
      ToggleWrapMode((Self.MDIChildren[i] as TfrmEditor).sciEditor, iEditorLineWrap);
      if Assigned((Self.MDIChildren[i] as TfrmEditor).sciEditor2) then
        ToggleWrapMode((Self.MDIChildren[i] as TfrmEditor).sciEditor2, iEditorLineWrap);
    end;
end;

procedure TfrmTinnMain.tUpdateOptionsTimer(Sender: TObject);
begin
  try
    UpdateOptions;
  except
    // TODO
  end;
end;

procedure TfrmTinnMain.tRRuningTimer(Sender: TObject);

  procedure Rgui(bRunning: Boolean);
  begin
    with actRContGuiStartClose do
      if bRunning then
      begin
        Caption := 'Rgui (close)';
        ImageIndex := 82
      end
      else
      begin
        Caption := 'Rgui (start)';
        ImageIndex := 81;
      end;

    actRContGuiStartClose.Update;

    if bRunning and (frmAppOptions = nil) and bOrganizeAutomatically and not bAlreadyOrganized
    then
      actOrganizeScreenExecute(Self);
  end;

  procedure Rterm(bRunning: Boolean);
  begin
    with actRContTermStartClose do
      if bRunning then
      begin
        Caption := 'Rterm (close)';
        ImageIndex := 245
      end
      else
      begin
        Caption := 'Rterm (start)';
        ImageIndex := 244
      end;
    actRContTermStartClose.Update;
  end;

// R is running
  procedure R_Is_Running;
  var
    seEditor: TDScintilla;

  begin
    RMenu(True);

    ControlResources(True);

    if (pgFiles.PageCount = 0) then
      SendResources(False)
    else
    begin
      SendResources(True);
      with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
        if (sActiveEditor = 'sciEditor') then
          seEditor := sciEditor
        else
          seEditor := sciEditor2;
      with seEditor do
      begin
        actRSendSelection.Enabled := GetSelText <> '';
      end;
    end;

  {  if bTinnRHotKeysActive then
      stbMain.Panels[6].Text := 'R hotkeys active'
    else
      stbMain.Panels[6].Text := 'R hotkeys inactive';
       }
    actRContClearConsole.Enabled := True;
    actRContHelp.Enabled := True;

    // m.p.
    {actRContClearConsole.Enabled := True;
    actRContHelp.Enabled := True;
     m.p. TBRClearConsole.Enabled := True;
      TBRRHelp.Enabled := True; }

    // m.p.
    {
    if bRget_Info then
      CheckTinnRcom_Package;
    }


  //  if not actRContTCPConnection.Checked then
  //    ConnectRSocketServer;
    //CheckTinnRcom_Package

    if bRObjectsUpdate and frmRTerm.cRTerm.bRterm_Ready then
    begin
      bRObjectsUpdate := false;
      frmTinnMain.actREnvironmentRefresh.Execute;
      frmTinnMain.actRExplorerRefresh.Execute;
    end;

  end;

// R isn't running
  procedure R_Not_Running;
  begin
    RMenu(True);

    ControlResources(False);

    SendResources(False);

  {  if (stbMain.Panels[6].Text <> EmptyStr) then
      stbMain.Panels[6].Text := EmptyStr;   }

    actRSendSelection.Enabled := False;
    bAlreadyOrganized := False;
    bTCPIPRunning := False;
    bRTinnRcom_Loaded := False;
    bRTinnRcom_Info := False;
    sPathR_Connected := 'UNKNOWN';
    sPathTinnRcom_Installed := 'UNKNOWN';
    sVersion_TinnRcomInstalled := 'UNKNOWN';
    if Assigned(slRLibPaths) then
      FreeAndNil(slRLibPaths);
  end;

begin

  try
    if Rgui_Running then
      Rgui(True)
    else
      Rgui(False);

    Rterm(Rterm_Running);

    if Rgui_Running or Rterm_Running or bIPRemoteConnected then
      R_Is_Running
    else
      R_Not_Running;
  except
    // TODO
  end;
end;

procedure TfrmTinnMain.OpenHelpFile(sFileToOpen: string);
var
  sPathFile: string;

begin
  sPathFile := sPathTinnR + sFileToOpen;
  if FileExists(sPathFile) then
    OpenFileIntoTinn(sPathFile)
  else
    MessageDlg(sPathFile + #13 + #13 + 'The file was not found.' + #13 +
      'Please, reinstall the program!', mtWarning, [mbOk], 0);
end;

function TfrmTinnMain.MessageDlg(const sMsg: string; mdType: TMsgDlgType;
  mdButtons: TMsgDlgButtons; iHelp: integer): integer;
begin
  with CreateMessageDialog(sMsg, mdType, mdButtons) do
    try
      Position := poOwnerFormCenter;
      Result := ShowModal
    finally
      Free;
    end
end;

procedure TfrmTinnMain.sdMainShow(Sender: TObject);
begin
  sdMainTypeChange(Self);
end;

procedure TfrmTinnMain.sdMainTypeChange(Sender: TObject);
var
  iSelectedIndex, iPeriodPos, iEndPos: integer;

  sfilename, sTmp: string;

begin
  sfilename := sdMain.FileName;
  sTmp := EmptyStr;
  iSelectedIndex := sdMain.FileTypeIndex;

  sTmp := sdMain.FileTypes.Items[iSelectedIndex- 1].FileMask;
  sFileExtensions := sTmp; // All extensions of the highlighter

  iPeriodPos := pos('*', sTmp);

  iEndPos := pos(';', sTmp)-1;

  if (iEndPos = -1) then
    iEndPos := length(sTmp);

  sTmp := copy(sTmp, iPeriodPos + 1, (iEndPos - iPeriodPos) );
  sSaveAsFileExt := sTmp; // First file extension    { }
end;

procedure TfrmTinnMain.menWebRGuiRStudioClick(Sender: TObject);
begin
;
end;

procedure TfrmTinnMain.menWebRguiJGRClick(Sender: TObject);
begin
  OpenUrl('http://stats.math.uni-augsburg.de/JGR/');
end;

procedure TfrmTinnMain.FormDragOver(Sender, Source: TObject; X, Y: integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if Source is TShellListView then
    Accept := True
  else if Source is TTreeView then
    Accept := True
  else if Source is TListView then
    Accept := True
  else if (Source is TJvFileListBox) then
    Accept := True;
end;

procedure TfrmTinnMain.FormResize(Sender: TObject);
begin
  ctbMain.Realign;
end;

procedure TfrmTinnMain.FormDragDrop(Sender, Source: TObject; X, Y: integer);
var
  i: integer;

begin
  // The below will avoid to try to open file (and related error message)
  // when dragging any selection inside of the editor
  i := FindTopWindow;
  if Assigned(Self.MDIChildren[i] as TfrmEditor) then
    if (Source = (Self.MDIChildren[i] as TfrmEditor).sciEditor) or
      (Source = (Self.MDIChildren[i] as TfrmEditor).sciEditor2) then
      Exit;

  // Object was draged from Search interface
  if (Source = frmTools.tvSearch) then
  begin
    if not(iDragLevel = 2) then
      Exit;
    if FileExists(trim(sDragSource)) then
      OpenFileIntoTinn(sDragSource, StrToIntDef(sDragSourceLine, 0))
    else
      MessageDlg(trim(sDragSource) + #13 + #13 +
        'The file above was not found!', mtWarning, [mbOk], 0);

    Sleep(iDelay div 2);

    if (pgFiles.PageCount > 0) then
      with TfrmEditor(MDIChildren[0]).sciEditor do
      begin
        SetFirstVisibleLine(StrToInt(sDragSourceLine));
        (Self.MDIChildren[i] as TfrmEditor).sciEditor.LineEnd;
        (Self.MDIChildren[i] as TfrmEditor).sciEditor.DocumentStartExtend;
        {TopLine := StrToInt(sDragSourceLine);
        ExecuteCommand(ecLineEnd, #0, nil);
        ExecuteCommand(ecSelLineStart, #0, nil);}
      end;
    Exit;
  end;

  // Object was draged from R explorer interface
  if (Source = frmTools.cgObjects) then
  begin
    if FileExists(sDragSource) then
    begin
      OpenFileIntoTinn(sDragSource, 0, False, False);
      DeleteFile(sDragSource);
    end
    else
      MessageDlg(sDragSource + #13 + #13 + 'The file above was not found!',
        mtWarning, [mbOk], 0);
    Exit;
  end;

  // Object was draged from Project interface
  if (Source = frmTools.tvProject) then
  begin
    if (iDragLevel = 0) then
      OpenAllFiles;
    if (iDragLevel = 1) then
      OpenAllFilesOfGroup;
    if (sDragSource = EmptyStr) then
      Exit;
  end;

  if FileExists(sDragSource) then
    OpenFileIntoTinn(sDragSource)
  else
    MessageDlg(sDragSource + #13 + #13 + 'The file above was not found!',
      mtWarning, [mbOk], 0);
end;

procedure TfrmTinnMain.menHelpEnglishChanges_t2tClick(Sender: TObject);
begin
  OpenHelpFile('\doc\Tinn-R_changes.t2t');
end;

{$HINTS OFF}

procedure TfrmTinnMain.CreateProject;
var
  tnProject: TTreeNode;

begin
  with frmTools.tvProject do
  begin
    Items.BeginUpdate;

    if Assigned(slProjectChanges) then
      slProjectChanges.Clear;

    if (Items.Count > 0) then
    begin
      Items.Clear;
      frmTools.tvProject.Refresh;
    end;

    SortType := stText;
    tnProject := Items.Add(nil, ExtractFileName(sProjectName));
    tnGenericGroup := Items.AddChild(tnProject, 'generic group*');
    tnGenericGroup.ImageIndex := 1;
    tnGenericGroup.SelectedIndex := 1;
    FullExpand;
    Items.EndUpdate;
  end;
end;
{$HINTS ON}
{$WARNINGS OFF}

function TfrmTinnMain.GenericGroupExists: Boolean;
var
  i: integer;
  meTmp: TMemo;
  sTmp: string;

begin
  meTmp := TMemo.Create(nil);
  try
    meTmp.Parent := panInvisibleParent;
    meTmp.Width := 1000;
    try
      meTmp.Lines.LoadFromFile(sProjectName);
      Result := False;
      for i := 0 to (meTmp.Lines.Count - 1) do
      begin
        sTmp := trim(meTmp.Lines[i]);
        if (pos('generic group*', lowerCase(sTmp)) <> 0) then
        begin
          Result := True;
          Exit;
        end;
      end;
    except
      on e: EFOpenError do
      begin
        MessageDlg(sProjectName + #13 + #13 + 'File not found!', mtError,
          [mbOk], 0);
        Exit;
      end; // em E: EFOpenError fazer
    end; // except
  finally
    FreeAndNil(meTmp);
  end;
end;
{$WARNINGS ON}

procedure TfrmTinnMain.SortProject;
var
  j: integer;

begin
  with frmTools.tvProject do
  begin
    Items.BeginUpdate;
    for j := 0 to (Items.Count - 1) do
      if (Items[j].Level <= 1) then
        Items[j].AlphaSort(True);
    Items.EndUpdate;
  end;
end;

procedure TfrmTinnMain.OpenProject;
var
  sTmp, sGroupName: string;

  tnProject, tnGroupToAdd, tnFileToAdd: TTreeNode;

  procedure MakeTree;
  var
    i: integer;

  begin
    tnProject := nil;
    tnGroupToAdd := nil;
    tnFileToAdd := nil;
    frmTools.tvProject.SortType := stText;
    tnProject := frmTools.tvProject.Items.Add(tnProject,
      ExtractFileName(sProjectName));
    if not GenericGroupExists then
    begin
      tnGenericGroup := frmTools.tvProject.Items.AddChild(tnProject,
        'generic group*');
      tnGenericGroup.ImageIndex := 1;
      tnGenericGroup.SelectedIndex := 1;
    end;

    for i := 0 to (slProject.Count - 1) do
    begin
      sTmp := trim(slProject.Strings[i]);
      if (sTmp <> EmptyStr) then
      begin
        if (sTmp[1] = '\') then
        begin // Is a group
          sGroupName := StringReplace(sTmp, '\', EmptyStr, []);

          tnGroupToAdd := frmTools.tvProject.Items.AddChild(tnProject,
            sGroupName);

          tnGroupToAdd.ImageIndex := 1;
          tnGroupToAdd.SelectedIndex := 1;
        end
        else // Is not a group
        begin
          if (sGroupName <> EmptyStr) then
          begin // Is file and file pertain at last group
            tnFileToAdd := frmTools.tvProject.Items.AddChild(tnGroupToAdd,
              ExtractFileName(sTmp));
            tnFileToAdd.Data := PChar(slProject.Strings[i]);
            tnFileToAdd.ImageIndex := 2;
            tnFileToAdd.SelectedIndex := 3;
          end
          else
          begin // Is file and file pertain at project (root): it will be put into the generic group*
            tnFileToAdd := frmTools.tvProject.Items.AddChild(tnGenericGroup,
              ExtractFileName(sTmp));
            tnFileToAdd.Data := PChar(slProject.Strings[i]);
            tnFileToAdd.ImageIndex := 2;
            tnFileToAdd.SelectedIndex := 3;
          end;
        end;
      end;
    end; // for
  end;

begin
  try // Exception id file not exixts
    if Assigned(slProject) then
      slProject.Clear;
    slProject := TStringList.Create;
    slProject.LoadFromFile(sProjectName);
  except
    on e: EFOpenError do
    begin
      MessageDlg(sProjectName + #13 + #13 + 'File not found!', mtError,
        [mbOk], 0);
      Exit;
    end;
  end; // except

  with frmTools.tvProject do
  begin
    Items.BeginUpdate;
    Items.Clear;
    MakeTree;
    Items[0].Expanded := True;
    Items.EndUpdate;
  end;
end;

procedure TfrmTinnMain.AddFile(iFile: string);

  function VerifyGenericGroup: Boolean;
  var
    i: integer;

  begin
    Result := False;

    with frmTools.tvProject do
      for i := 0 to (Items.Count - 1) do
        if (Items[i].Level = 1) then
          if (lowerCase(Items[i].Text) = 'generic group*') then
          begin
            Items[i].Selected := True;
            Result := True;
            Exit;
          end;
  end;

var
  iGroupPos: integer;
  tnChildNode: TTreeNode;

begin
  if (frmTools.tvProject.Selected = nil) then
    Exit;

  // Check to see if the file has already been added
  if (FileExistsAsNode(iGroupPos, iFile)) then
  begin
    if (MessageDlg(iFile + #13 + #13 +
      'The file above already exists in the active project at position:' + #13 +
      'Index: ' + IntToStr(iGroupPos + 1) + #13 + #13 +
      'Do you like to add this file anyway?', mtWarning, [mbYes, mbNo], 0) <>
      mrYes) then
      Exit;
  end;

  if (frmTools.tvProject.Selected.Level = 1) then
  begin
    tnChildNode := frmTools.tvProject.Items.AddChild
      (frmTools.tvProject.Selected, ExtractFileName(iFile));
    tnChildNode.Data := PChar(iFile);
    tnChildNode.ImageIndex := 2;
    tnChildNode.SelectedIndex := 3;
    frmTools.tvProject.Selected.Expand(True);
    bProjectChanged := True;
    frmTools.tvProject.AlphaSort;
  end
  else if (frmTools.tvProject.Selected.Level = 2) then
  begin
    tnChildNode := frmTools.tvProject.Items.Add(frmTools.tvProject.Selected,
      ExtractFileName(iFile));
    tnChildNode.Data := PChar(iFile);
    tnChildNode.ImageIndex := 2;
    tnChildNode.SelectedIndex := 3;
    frmTools.tvProject.Selected.Expand(True);
    bProjectChanged := True;
    frmTools.tvProject.AlphaSort;
  end
  else
  begin
    if VerifyGenericGroup then
    begin // Generic group exists then select it
      tnChildNode := frmTools.tvProject.Items.AddChild
        (frmTools.tvProject.Selected, ExtractFileName(iFile));
      tnChildNode.Data := PChar(iFile);
      tnChildNode.ImageIndex := 2;
      tnChildNode.SelectedIndex := 3;
      frmTools.tvProject.Selected.Expand(True);
      bProjectChanged := True;
      frmTools.tvProject.AlphaSort;
    end
    else if (MessageDlg(iFile + #13 + #13 +
      'No group was selected to this task!' + #13 +
      'So, is not possible to add the file above because not exists a generic group*.'
      + #13 + 'Would you like to do this now?', mtConfirmation,
      [mbYes, mbCancel], 0) = mrYes) then
    begin
      CreateGroup('generic group*');
      AddFile(iFile);
    end;
  end;
end;

procedure TfrmTinnMain.SaveProject;
var
  i: integer;

  meTmp: TMemo;

  sTmpData, sTmpText: string;

begin
  // Save the file list to the project name
  meTmp := TMemo.Create(nil);
  meTmp.Parent := panInvisibleParent;
  with frmTools.tvProject do
  begin
    for i := 1 to (Items.Count - 1) do
    begin
      sTmpData := string(Items[i].Data);
      sTmpText := string(Items[i].Text);
      sTmpText := StringReplace(sTmpText, '\', EmptyStr, []);

      if (Items[i].Level = 1) then
      begin // Always save the groups
        if (sTmpText <> EmptyStr) then
          meTmp.Lines.Add('\' + sTmpText) // Control new groups created
        else
          meTmp.Lines.Add('\generic group*');
      end
      else if (Items[i].Level = 2) then
      begin
        if sTmpData[1] = ' ' then
          meTmp.Lines.Add(sTmpData)
        else
          meTmp.Lines.Add('  ' + sTmpData)
      end;
    end;
  end;
  meTmp.Lines.SaveToFile(sProjectName);
  FreeAndNil(meTmp);
  bProjectChanged := False;

  // Update the textual project, if it is opened
  i := FindWindowByName(sProjectName);
  if (i > -1) then
  begin
    Self.MDIChildren[i].BringToFront;
    actReloadExecute(nil);
  end;
end;

function TfrmTinnMain.GroupExistsAsNode(sGroupName: string): Boolean;
var
  i: integer;

begin
  Result := False;
  for i := 0 to (frmTools.tvProject.Items.Count - 1) do
  begin
    if (frmTools.tvProject.Items[i].Text = sGroupName) then
    begin
      Result := True;
      break;
    end;
  end;
end;

function TfrmTinnMain.FileExistsAsNode(var iPos: integer;
  sFile: string): Boolean;
var
  i: integer;

begin
  Result := False;
  for i := 0 to (frmTools.tvProject.Items.Count - 1) do
    if (lowerCase(trim(PChar(frmTools.tvProject.Items[i].Data)))
      = lowerCase(trim(sFile))) then
    begin
      iPos := i;
      Result := True;
      break;
    end;
end;

procedure TfrmTinnMain.CreateGroup(sGroupName: string);
var
  tnNewGroup: TTreeNode;

begin
  try
    tnNewGroup := frmTools.tvProject.Items.AddChild(frmTools.tvProject.Items[0],
      sGroupName);
    tnNewGroup.ImageIndex := 1;
    tnNewGroup.SelectedIndex := 1;
  except
    on ETreeViewError do
      MessageDlg('It is necessary first to open or to create a project!',
        mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmTinnMain.OpenAllFiles;
var
  bIgnoreAll: Boolean;

  i, j: integer;

  sTmp: string;

  userOption: TModalResult;

begin
  with frmTools.tvProject do
  begin
    bIgnoreAll := False;
    for j := 1 to (Items.Count - 1) do
    begin
      if (Items[j].Level = 2) then
      begin
        sTmp := trim(string(Items[j].Data));

        if FileExists(sTmp) then
          OpenFileIntoTinn(sTmp)
        else if not bIgnoreAll then
        begin
          userOption := MessageDlg(sTmp + #13 + #13 +
            'The file above was not found!' + #13 +
            'Would you like to ignore it?', mtConfirmation,
            [mbYes, mbYesToAll, mbCancel], 0);

          i := FindTopWindow;
          if Assigned(Self.MDIChildren[i] as TfrmEditor) then
            (Self.MDIChildren[i] as TfrmEditor).Refresh;

          case userOption of
            mrYesToAll:
              bIgnoreAll := True;
            mrCancel:
              Exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure TfrmTinnMain.OpenAllFilesOfGroup;
var
  bIgnoreAll: Boolean;

  i, j, iFiles: integer;

  sTmp: string;

  tnCurNode: TTreeNode;
  userOption: TModalResult;

begin
  with frmTools.tvProject do
  begin
    if (Selected = nil) or (Selected.Level <> 1) then
      Exit;
    bIgnoreAll := False;
    j := Selected.AbsoluteIndex;
    tnCurNode := Items[j]; // Important don't remove!
    iFiles := Items[j].Count;

    while iFiles > 0 do
    begin
      tnCurNode := tnCurNode.GetNext;
      sTmp := trim(string(tnCurNode.Data));

      if FileExists(sTmp) then
        OpenFileIntoTinn(sTmp)
      else if not bIgnoreAll then
      begin
        userOption := MessageDlg(sTmp + #13 + #13 +
          'The file above was not found!' + #13 +
          'Would you like to ignore it?', mtConfirmation,
          [mbYes, mbYesToAll, mbCancel], 0);
        i := FindTopWindow;
        if Assigned(Self.MDIChildren[i] as TfrmEditor) then
          (Self.MDIChildren[i] as TfrmEditor).Refresh;

        case userOption of
          mrYesToAll:
            bIgnoreAll := True;
          mrCancel:
            Exit;
        end;
      end;
      dec(iFiles);
    end;
  end;
end;

function TfrmTinnMain.CloseAllFilesOfProject: Boolean;
var
  i, iPos: integer;

  sfilename: string;

begin
  // Close all the files of the current project
  Result := True;
  with frmTools.tvProject do
    for i := 0 to (Items.Count - 1) do
      if (Items[i].Level = 2) then
      begin
        sfilename := trim(string(Items[i].Data));
        iPos := FindWindowByName(sfilename);
        try
          if (iPos > -1) then
            with (MDIChildren[iPos] as TfrmEditor) do
            begin
              bCloseCanceled := False;
              Close;
              if bCloseCanceled then
              begin
                Result := False;
                Exit;
              end;
            end;
        except
          MessageDlg(sfilename + #13 + #13 +
            'The file above occurs more than a time in the project!',
            mtInformation, [mbOk], 0);
        end;
      end;
end;

procedure TfrmTinnMain.CloseAllFilesOfGroup;
var
  iPos, j, iFiles: integer;

  sTmp: string;

  tnCurNode: TTreeNode;

begin
  // Close all the files of the current project
  with frmTools.tvProject do
  begin
    if (Selected = nil) or (Selected.Level <> 1) then
      Exit;
    j := Selected.AbsoluteIndex;
    tnCurNode := Items[j]; // Important not remove!
    iFiles := Items[j].Count;

    while iFiles > 0 do
    begin
      tnCurNode := tnCurNode.GetNext;
      sTmp := trim(string(tnCurNode.Data));
      iPos := FindWindowByName(sTmp);
      try
        if (iPos > -1) then
          (MDIChildren[iPos] as TfrmEditor).Close;
      except
        MessageDlg(sTmp + #13 + #13 +
          'The file above occurs more than a time in this group!',
          mtInformation, [mbOk], 0);
      end;
      dec(iFiles);
    end;
  end;
end;

procedure TfrmTinnMain.actGrouptNewExecute(Sender: TObject);
var
  newGroup: TfrmNewGroup;

begin
  newGroup := TfrmNewGroup.Create(Self);
  with newGroup do
  begin
    if (ShowModal = mrOK) then
    begin
      if (edtNewGroup.Text <> EmptyStr) then
      begin
        if not GroupExistsAsNode(edtNewGroup.Text) then
        begin
          CreateGroup(edtNewGroup.Text);
          bProjectChanged := True;
        end
        else
          MessageDlg(edtNewGroup.Text + #13 + #13 +
            'A group with this name already exists in this project!', mtError,
            [mbOk], 0);
      end;
      Close;
    end;
  end;
  FreeAndNil(newGroup);
  SortProject;
end;

Procedure TfrmTinnMain.UpdateRterm_Appearance(bUpdate_FontSize: Boolean = True);
begin
  SetScintillaProperties(frmRterm.sciIO);
  SetScintillaProperties(frmRterm.sciLog);
end;

Procedure TfrmTinnMain.UpdateAppearance(bFontSize: Boolean = True);
begin
  //frmtinnmain.UpdateRterm_Appearance;
  // Update transparency
  //AlphaBlendValue := iAlphaBlendValue;

  //UpdateRterm_Appearance(bFontSize);
  {
 }

end;

procedure TfrmTinnMain.FormShow(Sender: TObject);
begin


  with frmTools.jvflbWinExplorer do
  begin
    Items.BeginUpdate;
    Refresh;
    Items.EndUpdate;
  end;

  ctbMain.Realign; // Don't remove!
  UpdateAppearance;

  // Check user option related to dock satus
  if FileExists(sIniDockFilePath) and bRestoreIniDock then
  begin
    frmTools.Visible := True;
    actToolsVisible.Checked := True;
    frmRterm.Visible := True;
    actRtermVisible.Checked := True;
    DeleteFile(sIniDockFilePath); // Delete old Tinn_dock.ini
    bRestoreIniDock := False;
  end;

  // Load the dock satus from the Tinn_doc.ini file
  if FileExists(sIniDockFilePath) then
    // LoadDockTreeFromAppStorage(JvAppIniFileStorage, JvAppIniFileStorage.FileName); // Released in the version 2.1.1.1
    LoadDockTreeFromAppStorage(JvAppIniFileStorage);

  with frmRterm.pgRterm do
    ActivePage := frmRterm.tbsIO;

  // Rterm
  if bRtermSimple then // IO and Log in the same view
    if bRtermHorizontal then
      actRtermIOSplitHorizontalExecute(nil)
    else
      actRtermIOSplitVerticalExecute(nil)
  else // IO and Log in distinct view
    actRtermIOSplitRemoveExecute(nil);



  if FileExists(sPathColor_Custom) then
    cdMain.CustomColors.LoadFromFile(sPathColor_Custom);

  tRRuning.Enabled := True; // Do no remove from here!

  AlphaBlendValue := iAlphaBlendValue;

  // Very nice: from http://stackoverflow.com/questions/374304/how-can-i-make-delphi-2009-open-my-application-in-the-second-monitor-by-default?rq=1
  if (DebugHook <> 0) and (Screen.MonitorCount > 1) then
    Left := Screen.Monitors[1].Left;
end;

procedure TfrmTinnMain.actGroupDeleteCurrentExecute(Sender: TObject);
begin
  with frmTools.tvProject do
    if (Selected = nil) or (Selected.Level <> 1) then
      Exit;

  with frmTools.tvProject.Selected do
    if (Level = 1) then
    begin
      Delete;
      bProjectChanged := True;
      SortProject;
    end;
end;

procedure TfrmTinnMain.actGroupDeleteAllExecute(Sender: TObject);
begin
  with frmTools.tvProject.Items[0] do
    if (Count > 0) then
    begin
      DeleteChildren;
      bProjectChanged := True;
    end;
end;

procedure TfrmTinnMain.actProjectDeleteCurrentExecute(Sender: TObject);
var
  intPos: integer;

begin
  if (MessageDlg(sProjectName + #13 + #13 +
    'Confirm the delection of the current project?', mtConfirmation,
    [mbOk, mbCancel], 0) = mrOK) then
  begin
    CloseAllFilesOfProject;

    ToolsProjectControls(False);
    if Assigned(slProjectChanges) then
      slProjectChanges.Clear;
    frmTools.tvProject.Items.Clear;
    DeleteFile(sProjectName);

    // Close project file if is open.
    intPos := FindWindowByName(sProjectName);
    if (intPos > -1) then
      (MDIChildren[intPos] as TfrmEditor).Close;
    UpdateMRU(menFileRecentFiles, sProjectName);

    UpdateProjectMRU(menProjRecent, sProjectName);
    with frmTools.jvflbWinExplorer do
    begin
      Items.BeginUpdate;
      Refresh;
      Items.EndUpdate;
    end;
  end;
end;

procedure TfrmTinnMain.actGroupRenameExecute(Sender: TObject);
var
  renGroup: TfrmGroupRename;

begin
  with frmTools.tvProject do
    if (Selected = nil) or (Selected.Level <> 1) then
      Exit;
  renGroup := TfrmGroupRename.Create(Self);

  with renGroup do
  begin
    edtOldGroupName.Text := frmTools.tvProject.Selected.Text;
    edtNewGroupName.Text := frmTools.tvProject.Selected.Text;
    if (ShowModal = mrOK) then
    begin
      if (edtNewGroupName.Text = EmptyStr) then
        Exit;
      if not GroupExistsAsNode(edtNewGroupName.Text) then
      begin
        frmTools.tvProject.Selected.Text := edtNewGroupName.Text;
        bProjectChanged := True;
      end
      else
        MessageDlg(edtNewGroupName.Text + #13 + #13 +
          'A group with this name already exists in this project!', mtError,
          [mbOk], 0);
      Close;
    end;
  end;

  FreeAndNil(renGroup);
  SortProject;
end;

procedure TfrmTinnMain.actProjectSaveAsExecute(Sender: TObject);
var
  i: integer;

  meTmp: TMemo;

  sName, sTmpData, sTmpText: string;

  wFileAtt: Word;

begin
  sdMain.DefaultFolder := sWorkingDir;
  sName := StringReplace(sProjectName, '*', EmptyStr, [rfReplaceAll]);
  if bRemoveExtension then
    sName := RemoveFileExtension(sName);

  with sdMain do
  begin
    FileName := sName;
//    Filter := 'Tinn-R project space (*.tps)|*.tps';
//    DefaultExt := '*.tps';
  end;

  if sdMain.Execute then
  begin
    sName := sdMain.FileName;

    if FileExists(sName) then
      if (MessageDlg(sName + #13 + #13 + 'Do you want to overwrite this file?',
        mtConfirmation, [mbYes, mbCancel], 0) <> idYes) then
        Exit;

    wFileAtt := FileGetAttr(sName);
    wFileAtt := wFileAtt and not SysUtils.faReadOnly;
    FileSetAttr(sName, wFileAtt);

    // Save the file list to the project name
    meTmp := TMemo.Create(nil);
    meTmp.Parent := panInvisibleParent;

    with frmTools.tvProject do
    begin
      for i := 1 to (Items.Count - 1) do
      begin
        sTmpData := string(Items[i].Data);
        sTmpText := string(Items[i].Text);
        sTmpText := StringReplace(sTmpText, '\', EmptyStr, []);
        if (Items[i].Level = 1) then
        begin
          if (sTmpText <> EmptyStr) then
            meTmp.Lines.Add('\' + sTmpText)
          else
            meTmp.Lines.Add('\generic group*');
        end
        else if (Items[i].Level = 2) then
        begin
          if (sTmpData[1] = ' ') then
            meTmp.Lines.Add(sTmpData)
          else
            meTmp.Lines.Add('  ' + sTmpData);
        end
      end;
    end;

    meTmp.Lines.SaveToFile(sName);
    FreeAndNil(meTmp);
    bProjectChanged := False;

    UpdateProjectMRU(menProjRecent, sName);

    with frmTools.tvProject do
    begin
      Items[0].Collapse(True);
      Items.Clear;
    end;
    Sleep(iDelay div 3);
    sProjectName := sName;
    OpenFileIntoTinn(sProjectName);
  end;
  ReLoadDialogFileExtension(frmTinnMain.sdMain.FileTypes);
end;

{$WARNINGS ON}

procedure TfrmTinnMain.actFilesRemoveAllOfProjectExecute(Sender: TObject);
var
  i: integer;

begin
  try
    with frmTools.tvProject do
      for i := 1 to (Items.Count - 1) do
        if (Items[i].Level = 1) then
        begin
          Items[i].DeleteChildren;
          if not bProjectChanged then
            bProjectChanged := True;;
        end;
  except
    Exit;
  end;
end;

procedure TfrmTinnMain.actFilesRemoveAllOfGroupExecute(Sender: TObject);
begin
  with frmTools.tvProject.Selected do
    if (Level = 1) then
    begin
      DeleteChildren;
      bProjectChanged := True;
    end;
end;

procedure TfrmTinnMain.actFilesAddExecute(Sender: TObject);
var
  i, j: integer;

begin
  // If (Sender is TTreeView) then
  with frmTools.tvProject do
  begin
    if (SelectionCount <= 0) then
      Exit;
    if (Selected.Level = 1) or (Selected.Level = 2) then
    begin
      with odMain do
      begin
        DefaultFolder := sWorkingDir;
//        InitialDir := sWorkingDir;
//        Filter := sdMain.Filter;
        //m.p.open
        Options := Options + [fdoAllowMultiSelect];

        if Execute then
          with Files do
          begin
            if (slProjectChanges = nil) then
              slProjectChanges := TStringList.Create;
            for i := 0 to (Count - 1) do
            begin
              slProjectChanges.Add(Strings[i]);
              j := slProjectChanges.IndexOf(Strings[i]);
              AddFile(slProjectChanges[j]);
            end;
          end;
        Options := Options - [fdoAllowMultiSelect];
      end;
    end;
  end;
end;

procedure TfrmTinnMain.actFilesOpenAllOfGroupExecute(Sender: TObject);
begin
  OpenAllFilesOfGroup;
end;

procedure TfrmTinnMain.actFilesCloseAllOfGroupExecute(Sender: TObject);
begin
  CloseAllFilesOfGroup;
end;

procedure TfrmTinnMain.ToolsProjectControls(bOption: Boolean);
begin
  actFilesAdd.Enabled := bOption;
  actFilesAddCurrent.Enabled := bOption;
  actFilesCloseAll.Enabled := bOption;
  actFilesCloseAllOfGroup.Enabled := bOption;
  actFilesFullPathUnix.Enabled := bOption;
  actFilesFullPathWindows.Enabled := bOption;
  actFilesOpenAll.Enabled := bOption;
  actFilesOpenAllOfGroup.Enabled := bOption;
  actFilesRemove.Enabled := bOption;
  actFilesRemoveAllOfGroup.Enabled := bOption;
  actFilesRemoveAllOfProject.Enabled := bOption;
  actGroupCollapseAll.Enabled := bOption;
  actGroupDeleteAll.Enabled := bOption;
  actGroupDeleteCurrent.Enabled := bOption;
  actGroupExpandAll.Enabled := bOption;
  actGroupRename.Enabled := bOption;
  actGrouptNew.Enabled := bOption;
  actProjectClose.Enabled := bOption;
  actProjectDeleteCurrent.Enabled := bOption;
  actProjectEdit.Enabled := bOption;
  actProjectOpenNode.Enabled := bOption;
  actProjectReload.Enabled := bOption;
  actProjectSave.Enabled := bOption;
  actProjectSaveAs.Enabled := bOption;
end;

procedure TfrmTinnMain.ToolsSearchControls(bOption: Boolean);
begin
  actSearchCollapseAll.Enabled := bOption;
  actSearchCollapseOne.Enabled := bOption;
  actSearchExpandAll.Enabled := bOption;
  actSearchExpandOne.Enabled := bOption;
end;

procedure TfrmTinnMain.edFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    edFilter.OnRightButtonClick(Self);
end;

procedure TfrmTinnMain.edFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TfrmTinnMain.actGroupExpandAllExecute(Sender: TObject);
var
  tnSelected, tnOldSelected: TTreeNode;

begin
  with frmTools.tvProject do
  begin
    if (Items.Count = 0) then
      Exit;
    tnOldSelected := Selected;

    if (Selected.Level > 1) then
      tnSelected := Selected.Parent
    else
      tnSelected := Selected;
    Items.BeginUpdate;
    FullExpand;
    TopItem := tnSelected;
    Selected := tnOldSelected;
    Items.EndUpdate;
  end;
end;

procedure TfrmTinnMain.actGroupCollapseAllExecute(Sender: TObject);
var
  tnSelected: TTreeNode;

begin
  with frmTools.tvProject do
  begin
    if (Items.Count = 0) then
      Exit;
    if (Selected.Level > 1) then
      tnSelected := Selected.Parent
    else
      tnSelected := Selected;

    Items.BeginUpdate;
    FullCollapse;
    Items[0].Expanded := True;
    TopItem := tnSelected;
    Items.EndUpdate;
  end;
end;

procedure TfrmTinnMain.actBlockMarkExecute(Sender: TObject);
var
  seEditor: TDScintilla;
begin
  if not GetActiveEditorOrNil(seEditor) then
    exit;

  if (SelStartLine(seEditor) <> SelEndLine(seEditor)) then
  with seEditor do
  begin
    MarkerDeleteAll(0);
    MarkerDeleteAll(1);
    MarkerAdd(SelStartLine(seEditor), 0);
    MarkerAdd(SelEndLine(seEditor), 1);
  end;
end;

procedure TfrmTinnMain.actBlockUnmarkExecute(Sender: TObject);
var
  seEditor: TDScintilla;
begin
  if not GetActiveEditorOrNil(seEditor) then
    exit;

  seEditor.MarkerDeleteAll(0);
  seEditor.MarkerDeleteAll(1);
end;

procedure TfrmTinnMain.actUnmarkAllExecute(Sender: TObject);
var
  seEditor: TDScintilla;
  i: integer;
begin
  if not GetActiveEditorOrNil(seEditor) then
    exit;

  for i := 0 to 9 do
    seEditor.MarkerDeleteAll(i);
end;

procedure TfrmTinnMain.actUnMarkColorExecute(Sender: TObject);
var edForm: TfrmEditor;
begin
  if GetTopEditorForm(edForm) then
    edForm.MarkSelectionColor(0);
end;

procedure TfrmTinnMain.actShowAppOptionsExecute(Sender: TObject);
var
  dlg: TfrmAppOptions;
  i: integer;

begin
{  coEditor.Gutter.Visible := actGutterVisible.Checked;
  coEditor.Gutter.ShowLineNumbers := actLineNumbersVisible.Checked;

  if actSpecialCharVisible.Checked then
    coEditor.Options := coEditor.Options + [eoShowSpecialChars]
  else
    coEditor.Options := coEditor.Options - [eoShowSpecialChars];
 }
  try
    dlg := TfrmAppOptions.Create(Self);
    with dlg do
    begin
      if bIPLocal then
        rdgRTCPIPType.ItemIndex := 0
      else
        rdgRTCPIPType.ItemIndex := 1;

    // Main (not complete list, still messy)
      // -- Remember
      tbLastFile.Position := iLastFile;
      tbLastSearch.Position := iLastSearch;
      cbRememberSearchList.Checked := bRememberSearchList;
      // -- Settings
      cbRememberFileState.Checked := bRememberFileState;
      cbMinimizeTinn.Checked := bMinimizeTinnAfterLastFile;
      cbRemoveExtension.Checked := bRemoveExtension;
      cbUndoAfterSave.Checked := bUndoAfterSave;
      // -- Comment
      cbComPriority_Line.Checked := frmTools.cbComPriority_Line.Checked;
      cbComAutoDetect_Language.Checked :=
        frmTools.cbComAutoDetect_Language.Checked;
      // -- Backup
      cbBackupOn.Checked := bBackup;
      cbReopenFiles.Checked := bReopenFiles;
      tbBackup.Position := iBackupInterval;
      // -- Internet connection
      // bellow
      // -- Sync
      tbDelay.Position := iDelay;


    // Editor options

      // Marks
      cbColorMark1.SelectedColor := iColorMark1;
      cbColorMark2.SelectedColor := iColorMark2;


      // Messy

      cbPdfOpenAlways.Checked := actPdfOpenAlways.Checked;
      tbTransparency.Position := iTransparency;
      tbRguiTinnRProportion.Position := iRguiTinnRProportion;
      cbAllNames.Checked := bAllNames;
      cbCloseDVIViewer.Checked := actCloseDVIViewer.Checked;
      cbClosePDFViewer.Checked := actClosePDFViewer.Checked;

      cbDosMinimizedAlways.Checked := actDosMinimizedAlways.Checked;
      cbDviOpenAlways.Checked := actDviOpenAlways.Checked;
      cbHtmlOpenAlways.Checked := actHtmlOpenAlways.Checked;

      cbRguiOrganizeAutomatically.Checked := bOrganizeAutomatically;
      cbRguiReturnFocus.Checked := bRguiReturnFocus;
      cbRTCPIPConsoleEcho.Checked := bRTCPIPConsoleEcho;
      cbRTCPIPConsoleUse.Checked := bRTCPIPConsoleUse;

      edMaxDeparseLength.Text := IntToStr(iMaxDeparseLength);
      edParDeplate.Text := sParDeplate;
      edParDviBibtex.Text := sParDviBibtex;
      edParDviSingle.Text := sParDviSingle;
      edParPdfBibtex.Text := sParPdfBibtex;
      edParPdfSingle.Text := sParPdfSingle;
      edParRgui.Text := sParRgui;
      edParRterm.Text := sParRterm;
      edParTxt2tags.Text := sParTxt2tags;
      edPath_Pandoc.Text := sPath_Pandoc;
      edPathDeplate_Converter.Text := sPathDeplate_Converter;
      edPathDeplate_Interpreter.Text := sPathDeplate_Interpreter;
      edPathRgui.Text := sPathRgui;
      edPathRterm.Text := sPathRterm;
      edPathTxt2tags_Converter.Text := sPathTxt2tags_Converter;
      edPathTxt2tags_Interpreter.Text := sPathTxt2tags_Interpreter;
      edPathR_Connected.Text := sPathR_Connected;
      edReformatR.Text := sReformatR;
      edReformatRd.Text := sReformatRd;
      edPathTinnRcom_Installed.Text := sPathTinnRcom_Installed;
      edVersion_TinnRcomInstalled.Text := sVersion_TinnRcomInstalled;
      edtIPHostLocal.Text := sIPHostLocal;
      edtIPHostRemote.Text := sIPHostRemote;
      edtIPPortLocal.Text := IntToStr(iIPPortLocal);
      edtIPPortRemote.Text := IntToStr(iIPPortRemote);
      rgRguiTinnRDisposition.ItemIndex := iRguiTinnRDisposition;

{      // Appearance
      cbTab.SelectedColor := clBGTabSelectedNew;
      cbBackground.SelectedColor := clBGApplication;
      cbForeground.SelectedColor := clFGApplication; }

      // Send to R
      cbRCurrentLineToTop.Checked := actRCurrentLineToTop.Visible;
      cbRSendBlockMarked.Checked := actRSendBlockMarked.Visible;
      cbRSendClipboard.Checked := actRSendClipboard.Visible;
      cbRSendContiguous.Checked := actRSendContiguous.Visible;
      cbRSendCursorToBeginningLine.Checked :=
        actRSendCursorToBeginningLine.Visible;
      cbRSendCursorToEndLine.Checked := actRSendCursorToEndLine.Visible;
      cbRSendFile.Checked := actRSendFile.Visible;
      cbRSendKnitr.Checked := bRKnitr;
      cbRSendLine.Checked := actRSendLine.Visible;
      cbRSendLinesToEndPage.Checked := actRSendLinesToEndPage.Visible;
      cbRSendSelection.Checked := actRSendSelection.Visible;
      cbRSendSweave.Checked := actRSendSweave.Visible;
      cbRSendNavigator.Checked := actRSendNavigator.Visible;

      // Controlling R
      cbRClearAll.Checked := actRContClearAll.Visible;
      cbRClearConsole.Checked := actRContClearConsole.Visible;
      cbRCloseAllGraphics.Checked := actRContCloseAllGraphics.Visible;
      cbREditVariable.Checked := actRContEditVariable.Visible;
      cbREscape.Checked := actRContEscape.Visible;
      cbRExampleSelectedWord.Checked := actRContExampleSelectedWord.Visible;
      cbRFixVariable.Checked := actRContFixVariable.Visible;
      cbRguiStartClose.Checked := actRContGuiStartClose.Visible;
      cbRHelp.Checked := actRContHelp.Visible;
      cbRHelpSelectedWord.Checked := actRContHelpSelectedWord.Visible;
      cbRListAllObjects.Checked := actRContListAllObjects.Visible;
      cbRListVariableNames.Checked := actRContListVariableNames.Visible;
      cbRListVariableStructure.Checked := actRContListVariableStructure.Visible;
      cbRPackages.Checked := actRContPackages.Visible;
      cbRPlotVariable.Checked := actRContPlotVariable.Visible;
      cbRPrintVariableContent.Checked := actRContPrintVariableContent.Visible;
      cbRRemoveAllObjects.Checked := actRContRemoveAllObjects.Visible;
      cbRSetWorkDirectory.Checked := actRContSetWorkDirectory.Visible;
      cbRTCPConnection.Checked := actRContTCPConnection.Visible;
      cbRtermStartClose.Checked := actRContTermStartClose.Visible;

      // Tips
      with cbbTriggerRtip do
      begin
        if (sTriggerRtip = 'CTRL+D') then
          ItemIndex := 0
        else if (sTriggerRtip = 'CTRL+Q') then
          ItemIndex := 1
        else
          ItemIndex := -1;
      end;

      // Data completion
      with cbbTriggerRDataCompletion do
      begin
        if (sTriggerRDataCompletion = 'SHIFT+CTRL+D') then
          ItemIndex := 0
        else if (sTriggerRDataCompletion = 'SHIFT+CTRL+Q') then
          ItemIndex := 1
        else
          ItemIndex := -1;
      end;

      if bRSmartSend then
        rdgRSmartSend.ItemIndex := 0
      else
        rdgRSmartSend.ItemIndex := 1;

      if bRSendAll then
        rdgRComments.ItemIndex := 0
      else
        rdgRComments.ItemIndex := 1;

      if bRUseLatest then
        rdgRUseLatest.ItemIndex := 0
      else
        rdgRUseLatest.ItemIndex := 1;

      if bRArchitecture64 then
        rdgRArchitecture.ItemIndex := 1
      else
        rdgRArchitecture.ItemIndex := 0;

      if bScrollSendingLines then
        rdgRScrollSendingLines.ItemIndex := 0
      else
        rdgRScrollSendingLines.ItemIndex := 1;

      if bDataCompletionAnywhere then
        rdgDataCompletion_Pattern.ItemIndex := 0
      else
        rdgDataCompletion_Pattern.ItemIndex := 1;

      if bRget_Info then
        rdgRget_Info.ItemIndex := 0
      else
        rdgRget_Info.ItemIndex := 1;

      if bRmirros_Update then
        rdgRmirros_Update.ItemIndex := 0
      else
        rdgRmirros_Update.ItemIndex := 1;

      if bRtermFindError then
        rdgRtermFindError.ItemIndex := 0
      else
        rdgRtermFindError.ItemIndex := 1;

      if bRtermBeepOnError then
        rdgRtermBeepOnError.ItemIndex := 0
      else
        rdgRtermBeepOnError.ItemIndex := 1;

      if bConnectionBeepOnError then
        rdgConnectionBeepOnError.ItemIndex := 0
      else
        rdgConnectionBeepOnError.ItemIndex := 1;

      rdgRguiRecognitionCaption.ItemIndex := iRguiRecognitionCaption;
      rdgRguiRecognitionType.ItemIndex := iRguiRecognitionType;
      rdgReformatRSplit.ItemIndex := iReformatRSplit;

      with rdgLineWraping do
        if actEditorLineWrap.Checked then
          ItemIndex := 0
        else
          ItemIndex := 1;

      with rdgRtermType do
        if bRtermSimple then
          ItemIndex := 0
        else
          ItemIndex := 1;

      rdgRtermDisposition.Enabled := bRtermSimple;

      with rdgRtermDisposition do
        if bRtermHorizontal then
          ItemIndex := 0
        else
          ItemIndex := 1;
 { //sci //m.p.
      with rdgRtermIOSyntax do
        if (frmRterm.synIO.Highlighter = dmSyn.synText) then
          ItemIndex := 0
        else
          ItemIndex := 1;
      with rdgRtermLogSyntax do
        if (frmRterm.sciLog.Highlighter = dmSyn.synText) then
          ItemIndex := 0
        else
          ItemIndex := 1;   }

      with rdgRtermClose do
        if bRtermCloseWithoutAsk then
          ItemIndex := 0
        else
          ItemIndex := 1;

      with rdgRsvSocketConnect do
        if bRsvSocket_Connect then
          ItemIndex := 0
        else
          ItemIndex := 1;

      with rdgRTinnRcomInstall do
        if bRTinnRcom_Install then
          ItemIndex := 0
        else
          ItemIndex := 1;

      with rdgRTinnRcomLoad do
        if bRTinnRcom_Load then
          ItemIndex := 0
        else
          ItemIndex := 1;

      if Assigned(slRLibPaths) then
        mRLibPaths.Lines.Assign(slRLibPaths);

      if Assigned(slFilters) then
        mFiles.Lines.Assign(slFilters);

      tbLastFileChange(nil);
      tbLastSearchChange(nil);
      tbRguiTinnRProportionChange(nil);

      LoadEditorStatus;
      //Status_Editor(coEditor);
      iAlphaBlendValue := 255 - (255 * tbTransparency.Position) Div 100;
    end;

    if bStartOptionsWithRPage then
    begin
      sAppSelected := 'Path (R)';
      bStartOptionsWithRPage := False;
    end
    else if bStartOptionsWithProcessingPage then
    begin
      sAppSelected := 'Processing';
      bStartOptionsWithProcessingPage := False;
    end;

    if (dlg.ShowModal = mrOK) then
    begin
      with dlg do
      begin


    // Editor options

      // Marks
      iColorMark1 := cbColorMark1.SelectedColor;
      iColorMark2 := cbColorMark2.SelectedColor;


        // Send to R alphabetically ordered
        actRCurrentLineToTop.Visible := cbRCurrentLineToTop.Checked;
        actRSendBlockMarked.Visible := cbRSendBlockMarked.Checked;
        actRSendClipboard.Visible := cbRSendClipboard.Checked;
        actRSendContiguous.Visible := cbRSendContiguous.Checked;
        actRSendCursorToBeginningLine.Visible :=
          cbRSendCursorToBeginningLine.Checked;
        actRSendCursorToEndLine.Visible := cbRSendCursorToEndLine.Checked;
        actRSendFile.Visible := cbRSendFile.Checked;
        actRSendNavigator.Visible := cbRSendNavigator.Checked;

        bRKnitr := cbRSendKnitr.Checked;
        actRSendLine.Visible := cbRSendLine.Checked;
        actRSendLinesToEndPage.Visible := cbRSendLinesToEndPage.Checked;
        actRSendSelection.Visible := cbRSendSelection.Checked;
        actRSendSweave.Visible := cbRSendSweave.Checked;

   

        // Controlling R alphabetically ordered
        actRContClearAll.Visible := cbRClearAll.Checked;
        actRContClearConsole.Visible := cbRClearConsole.Checked;
        actRContCloseAllGraphics.Visible := cbRCloseAllGraphics.Checked;
        actRContEditVariable.Visible := cbREditVariable.Checked;
        actRContEscape.Visible := cbREscape.Checked;
        actRContExampleSelectedWord.Visible := cbRExampleSelectedWord.Checked;
        actRContFixVariable.Visible := cbRFixVariable.Checked;
        actRContGuiStartClose.Visible := cbRguiStartClose.Checked;
        actRContHelp.Visible := cbRHelp.Checked;
        actRContHelpSelectedWord.Visible := cbRHelpSelectedWord.Checked;
        actRContListAllObjects.Visible := cbRListAllObjects.Checked;
        actRContListVariableNames.Visible := cbRListVariableNames.Checked;
        actRContListVariableStructure.Visible :=
          cbRListVariableStructure.Checked;
        actRContPackages.Visible := cbRPackages.Checked;
        actRContPlotVariable.Visible := cbRPlotVariable.Checked;
        actRContPrintVariableContent.Visible := cbRPrintVariableContent.Checked;
        actRContRemoveAllObjects.Visible := cbRRemoveAllObjects.Checked;
        actRContSetWorkDirectory.Visible := cbRSetWorkDirectory.Checked;
        actRContTCPConnection.Visible := cbRTCPConnection.Checked;
        actRContTermStartClose.Visible := cbRtermStartClose.Checked;



        actCloseDVIViewer.Checked := cbCloseDVIViewer.Checked;
        actClosePDFViewer.Checked := cbClosePDFViewer.Checked;
        actDosMinimizedAlways.Checked := cbDosMinimizedAlways.Checked;
        actDviOpenAlways.Checked := cbDviOpenAlways.Checked;
        actHtmlOpenAlways.Checked := cbHtmlOpenAlways.Checked;

        actPdfOpenAlways.Checked := cbPdfOpenAlways.Checked;
        bAllNames := cbAllNames.Checked;
        bMinimizeTinnAfterLastFile := cbMinimizeTinn.Checked;
        bOrganizeAutomatically := cbRguiOrganizeAutomatically.Checked;
        bRememberFileState := cbRememberFileState.Checked;
        bRememberSearchList := cbRememberSearchList.Checked;
        bRemoveExtension := cbRemoveExtension.Checked;
        bRestoreIniDock := cbRestoreIniDock.Checked;
        bRguiReturnFocus := cbRguiReturnFocus.Checked;
        bRTCPIPConsoleEcho := cbRTCPIPConsoleEcho.Checked;
        bRTCPIPConsoleUse := cbRTCPIPConsoleUse.Checked;
        bUndoAfterSave := cbUndoAfterSave.Checked;
 {       clBGApplication := cbBackground.SelectedColor;
        clFGApplication := cbForeground.SelectedColor;
        frmTinnMain.clBGTabSelectedNew := cbTab.SelectedColor; }
        iIPPortLocal := StrToInt(edtIPPortLocal.Text);
        iIPPortRemote := StrToInt(edtIPPortRemote.Text);
        iLastFile := tbLastFile.Position;
        iLastSearch := tbLastSearch.Position;
        iMaxDeparseLength := StrToInt(edMaxDeparseLength.Text);
        iRguiTinnRDisposition := rgRguiTinnRDisposition.ItemIndex;
        iRguiTinnRProportion := tbRguiTinnRProportion.Position;
        sIPHostLocal := edtIPHostLocal.Text;
        sIPHostRemote := edtIPHostRemote.Text;
        sParDeplate := edParDeplate.Text;
        sParDviBibtex := edParDviBibtex.Text;
        sParDviSingle := edParDviSingle.Text;
        sParPdfBibtex := edParPdfBibtex.Text;
        sParPdfSingle := edParPdfSingle.Text;
        sParRgui := edParRgui.Text;
        sParRterm := edParRterm.Text;
        sParTxt2tags := edParTxt2tags.Text;
        sPath_Pandoc := edPath_Pandoc.Text;
        sPathDeplate_Converter := edPathDeplate_Converter.Text;
        sPathDeplate_Interpreter := edPathDeplate_Interpreter.Text;
        sPathRgui := edPathRgui.Text;
        sPathRterm := edPathRterm.Text;
        sPathTxt2tags_Converter := edPathTxt2tags_Converter.Text;
        sPathTxt2tags_Interpreter := edPathTxt2tags_Interpreter.Text;
        sReformatR := edReformatR.Text;
        sReformatRd := edReformatRd.Text;

        frmTools.cbComPriority_Line.Checked := cbComPriority_Line.Checked;
        frmTools.cbComAutoDetect_Language.Checked :=
          cbComAutoDetect_Language.Checked;

        if (rdgRTCPIPType.ItemIndex = 0) then
          bIPLocal := True
        else
          bIPLocal := False;

        // Set the 'Tip' configuration in run tyme
        case cbbTriggerRtip.ItemIndex of
          0:
            sTriggerRtip := 'CTRL+D';
          1:
            sTriggerRtip := 'CTRL+Q';
        end;

        i := FindTopWindow;
        if Assigned(Self.MDIChildren[i] as TfrmEditor) then
        begin
        //sci //m.p.
        {
          SetDataCompletion(sciEditorTip, (Self.MDIChildren[i] as TfrmEditor)
            .sciEditor, sTriggerRtip);

          SetDataCompletion(sciEditor2Tip, (Self.MDIChildren[i] as TfrmEditor)
            .sciEditor2, sTriggerRtip);    }
        end;

        //sci //m.p.
        //SetDataCompletion(synIOTip, frmRterm.synIO, sTriggerRtip);

        // Set the 'Data Completion' configuration in run tyme
        case cbbTriggerRDataCompletion.ItemIndex of
          0:
            sTriggerRDataCompletion := 'SHIFT+CTRL+D';
          1:
            sTriggerRDataCompletion := 'SHIFT+CTRL+Q';
        end;

        if Assigned(Self.MDIChildren[i] as TfrmEditor) then
        begin
         //sci //m.p.
         {
          SetDataCompletion(sciEditorDataCompletion,
            (Self.MDIChildren[i] as TfrmEditor).sciEditor,
            sTriggerRDataCompletion);

          SetDataCompletion(sciEditor2DataCompletion,
            (Self.MDIChildren[i] as TfrmEditor).sciEditor2,
            sTriggerRDataCompletion);  }
        end;

                //sci //m.p.
        //SetDataCompletion(synIODataCompletion, frmRterm.synIO,
         // sTriggerRDataCompletion);

        if bOrganizeAutomatically then
          bAlreadyOrganized := False;

        if (rdgLineWraping.ItemIndex = 0) then
          actEditorLineWrap.Checked := True
        else
          actEditorLineWrap.Checked := False;

        if (rdgRSmartSend.ItemIndex = 0) then
          bRSmartSend := True
        else
          bRSmartSend := False;

        if (rdgRComments.ItemIndex = 0) then
          bRSendAll := True
        else
          bRSendAll := False;

        if (rdgRUseLatest.ItemIndex = 0) then
          bRUseLatest := True
        else
          bRUseLatest := False;

        if (rdgRArchitecture.ItemIndex = 1) then
          bRArchitecture64 := True
        else
          bRArchitecture64 := False;

        if (rdgRtermFindError.ItemIndex = 0) then
          bRtermFindError := True
        else
          bRtermFindError := False;

        if (rdgRtermBeepOnError.ItemIndex = 0) then
          bRtermBeepOnError := True
        else
          bRtermBeepOnError := False;

        if (rdgRtermClose.ItemIndex = 0) then
          bRtermCloseWithoutAsk := True
        else
          bRtermCloseWithoutAsk := False;

        if (rdgRsvSocketConnect.ItemIndex = 0) then
          bRsvSocket_Connect := True
        else
          bRsvSocket_Connect := False;

        if (rdgRTinnRcomInstall.ItemIndex = 0) then
          bRTinnRcom_Install := True
        else
          bRTinnRcom_Install := False;

        if (rdgRTinnRcomLoad.ItemIndex = 0) then
          bRTinnRcom_Load := True
        else
          bRTinnRcom_Load := False;

        if (rdgRScrollSendingLines.ItemIndex = 0) then
          bScrollSendingLines := True
        else
          bScrollSendingLines := False;

        if (rdgDataCompletion_Pattern.ItemIndex = 0) then
          bDataCompletionAnywhere := True
        else
          bDataCompletionAnywhere := False;

        if (rdgRget_Info.ItemIndex = 0) then
          bRget_Info := True
        else
          bRget_Info := False;

        if (rdgRmirros_Update.ItemIndex = 0) then
          bRmirros_Update := True
        else
          bRmirros_Update := False;

        iRguiRecognitionCaption := rdgRguiRecognitionCaption.ItemIndex;
        iRguiRecognitionType := rdgRguiRecognitionType.ItemIndex;
        iReformatRSplit := rdgReformatRSplit.ItemIndex;

        case rdgRtermType.ItemIndex of
          0:
            case rdgRtermDisposition.ItemIndex of
              0:
                actRtermIOSplitHorizontalExecute(nil);
              1:
                actRtermIOSplitVerticalExecute(nil);
            end;
          1:
            actRtermIOSplitRemoveExecute(nil);
        end;

        case rdgRtermIOSyntax.ItemIndex of
          0:
            actRtermSetIOSyntaxToTextExecute(nil);
          1:
            actRtermSetIOSyntaxToRExecute(nil);
        end;

        case rdgRtermLogSyntax.ItemIndex of
          0:
            actRtermSetLogSyntaxToTextExecute(nil);
          1:
            actRtermSetLogSyntaxToRExecute(nil);
        end;

        actRguiReturnFocus.Checked := bRguiReturnFocus;
        iDelay := tbDelay.Position;

        iTransparency := tbTransparency.Position;
        iAlphaBlendValue := 255 - (255 * iTransparency) Div 100;
        frmTinnMain.AlphaBlendValue := iAlphaBlendValue;

        SaveEditorStatus;
        //NewStatus_Editor(coEditor);

        // m.p.   tbKnitr.Visible := bRKnitr;

        // Backup
        bBackup := cbBackupOn.Checked;
        iBackupInterval := tbBackup.Position;
        bReopenFiles := cbReopenFiles.Checked;

        if not bBackup then
          BackupCleanUp;
        tBackup.Interval := iBackupInterval * 1000;
        tBackup.Enabled := bBackup;

      end;

      //actGutterVisible.Checked := coEditor.Gutter.Visible;
      //actLineNumbersVisible.Checked := coEditor.Gutter.ShowLineNumbers;
      //actSpecialCharVisible.Checked := (eoShowSpecialChars in coEditor.Options);

      // Update all opened files
      for i := (Self.MDIChildCount - 1) downto 0 do
      begin
        SetScintillaProperties( (Self.MDIChildren[i] as TfrmEditor).sciEditor);
        if Assigned((Self.MDIChildren[i] as TfrmEditor).sciEditor2) then
          SetScintillaProperties( (Self.MDIChildren[i] as TfrmEditor).sciEditor);
        (Self.MDIChildren[i] as TfrmEditor).Repaint;
      end;


      // Update Rterm
    //  UpdateRterm_Appearance;

    end;
  finally
    FreeAndNil(dlg);
    SetFocus_Main;
  end;
end;

procedure TfrmTinnMain.actShowMenuHotkeysExecute(Sender: TObject);
begin
  hkTinnR.ShowModal;
  SetFocus_Main;
end;

procedure TfrmTinnMain.WMSysCommand;
begin
  inherited;
  CheckTop;
end;

procedure TfrmTinnMain.SetRExplorer(bOption: Boolean);
begin
  actRExplorerContent.Enabled := bOption;
  actRExplorerEdit.Enabled := bOption;
  actRExplorerExampleSelected.Enabled := bOption;
  actRExplorerExpAscii.Enabled := bOption;
  actRExplorerExpHtml.Enabled := bOption;
  actRExplorerExpRaw.Enabled := bOption;
  actRExplorerExpTeX.Enabled := bOption;
  actRExplorerFix.Enabled := bOption;
  actRExplorerHelpSelected.Enabled := bOption;
  actRExplorerNames.Enabled := bOption;
  actRExplorerPlot.Enabled := bOption;
  actRExplorerRemove.Enabled := bOption;
  actRExplorerRemoveAllObjects.Enabled := bOption;
  actRExplorerSendNameToClipboard.Enabled := bOption;
  actRExplorerSendNameToEditor.Enabled := bOption;
  actRExplorerStructure.Enabled := bOption;
  actRExplorerSummary.Enabled := bOption;
end;





procedure TfrmTinnMain.menRtermHistoryNextClick(Sender: TObject);
begin
  if not frmTinnMain.Rterm_Running then
    Exit;

  with frmRterm.sciIO do
  begin
  //sci //m.p.
{    CaretY := Lines.Count;
    if (SelText <> EmptyStr) then
      Exit;
    if frmRterm.bRterm_Plus then
      LineText := '+ ' + frmTinnMain.RHistory.GetNext
    else if frmRterm.bRUnderDebug_Function or frmRterm.bRUnderDebug_Package then
      LineText := frmRterm.sRDebugPrefix + ' ' + frmTinnMain.RHistory.GetNext
    else
      LineText := '> ' + frmTinnMain.RHistory.GetNext;
    ExecuteCommand(ecLineEnd, #0, nil);  }
  end;
end;

procedure TfrmTinnMain.menRtermHistoryPriorClick(Sender: TObject);
begin
  if not frmTinnMain.Rterm_Running then
    Exit;

  with frmRterm do
  begin     //sci //m.p.
 {   synIO.CaretY := synIO.Lines.Count;
    if (synIO.SelText <> EmptyStr) then
      Exit;
    if bRterm_Plus then
      synIO.LineText := '+ ' + frmTinnMain.RHistory.GetPrior
    else if bRUnderDebug_Function or bRUnderDebug_Package then
      synIO.LineText := sRDebugPrefix + ' ' + frmTinnMain.RHistory.GetPrior
    else
      synIO.LineText := '> ' + frmTinnMain.RHistory.GetPrior;
    synIO.ExecuteCommand(ecLineEnd, #0, nil);    }
  end;
end;

procedure TfrmTinnMain.csRGeneralConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  //showmessage('');
  //modDados.ResetRObjectDatabase;

  bConectionError := False;
  actRContTCPConnection.Checked := True;
  //LoadTinnRCommunicationScripts;

  if assigned(frmRTerm) then
    frmRTerm.pgRtermResize(frmRTerm);

  if Assigned(frmRServer) then
  begin
    with frmRServer do
    begin
      chbIPConnected.Checked := True;
      edtIPClientIP.Text := Socket.LocalAddress;
      edtIPClient.Text := Socket.LocalHost;
      btnConnectTCPIP.Enabled := False;
      btnDisconnectTCPIP.Enabled := True;
      btnSendTCPIP.Enabled := True;
      edtSend.SetFocus;
    end;
  end;
  if not bIPLocal then
    bIPRemoteConnected := True;
end;


procedure TfrmTinnMain.csRGeneralDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
var
  i: integer;
  sTmp: string;

begin

  if bConectionError then
    Exit;
  actRContTCPConnection.Checked := False;
  // The server sends '' when disconnect fine
  sTmp := Socket.ReceiveText;

  i := pos(#$D, sTmp);
  if (i <= 1) then
    sTmp := 'Local R socket server disconnected.' + #13#10 { #$D#$A };

  if Assigned(frmRServer) then
  begin
    with frmRServer do
    begin
      memRTCPIP.Lines.Add(sTmp);
      chbIPConnected.Checked := False;
      edtIPClientIP.Text := EmptyStr;
      edtIPClient.Text := EmptyStr;
      btnConnectTCPIP.Enabled := True;
      btnDisconnectTCPIP.Enabled := False;
      btnSendTCPIP.Enabled := False;
      edtSend.SetFocus;
    end;
    Exit;
  end;

  if not bIPLocal then
    bIPRemoteConnected := False;
  frmRterm.sciIO.Lines.Add(sTmp);

end;

procedure TfrmTinnMain.csMainBaseError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  ErrorCode := 0;
  Socket.Close;
end;

procedure TfrmTinnMain.csMainBaseRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  sRecText, sOldSelection: String;
begin
  sRecText := trim(Socket.ReceiveText);
  if ansipos('!!update!!', sRecText)>0 then
    AfterLibraryUpdate;

  //if ansipos('!!TinnRMSG:Adding', sRecText)>0 then
  //ShowNotification(copy(sRecText, ansipos('!!TinnRMSG:Adding', sRecText)+11, 999), copy(sRecText, ansipos('!!TinnRMSG:Adding', sRecText)+11, 999)+' This might takes a while.');
end;

procedure TfrmTinnMain.csREnvironmentError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: integer);
begin
  ErrorCode := 0;
  Socket.Close;
end;

procedure TfrmTinnMain.csRExplorerConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
      frmTinnMain.actREnvironmentRefresh.Execute;
end;

procedure TfrmTinnMain.csRExplorerError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: integer);
begin
  ErrorCode := 0;
  Socket.Close;
end;

procedure TfrmTinnMain.csRExplorerRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  sRecText: String;
  iMsgPos: Integer;
  //sTables: TStringList;
begin
  if not assigned(frmTools) then
    exit;
  sRecText := trim(Socket.ReceiveText);

  // Explorer update
  iMsgPos := ansipos('TinnRMSG:update:', sRecText);

  if iMsgPos>0 then
  if copy(sRecText,iMsgPos + 16 ,ansipos('<',sRecText)-iMsgPos-16) = frmTools.cbbToolsREnvironment.Items[ frmTools.cbbToolsREnvironment.ItemIndex]  then
  with modDados do
  begin
    try
   //   frmTinnMain.bRExplorerActive := true;

      try
        SQLConnection.Open;
        //sTables := TStringList.Create;

        //SQLConnection.GetTableNames(sTables);
        //if sTables.IndexOf('Objects') > -1 then
        //begin
          sqldsRObjects.Active := true;
          sqldsRObjects.Refresh;
          SQLConnection.Close;
          cdRObjects.Refresh;
          UpdateLexerKeyWords(2);
        //end else  tDataConflict.Enabled := true;
      except
         tDataConflict.Enabled := true;
      end;


    finally
      SQLConnection.Close;
      //sTables.Free;
    end;
  end;



  // Names popup
  iMsgPos := ansipos('TinnRMSG:ObjectInfo:', sRecText);
   if iMsgPos>0 then
  if iMsgPos>0 then
  if copy(sRecText,iMsgPos + 20 ,ansipos('<',sRecText)-iMsgPos-20) = inttostr(iObjectCallID)  then
    ShowNamesPopup;

end;

procedure TfrmTinnMain.csRExplorerWrite(Sender: TObject;
  Socket: TCustomWinSocket);
begin
// showmessage('');
end;

procedure TfrmTinnMain.csRGeneralError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: integer);
begin
  if (ErrorCode = 10061) then
    MessageDlg('Error: ' + IntToStr(ErrorCode) + #13 + #13 +
      'R is not in server mode.' + #13 +
      'Please, start R and/or run the startSocketServer() function' + #13 +
      'available in svSocket package!', mtError, [mbOk], 0)
  else if (ErrorCode = 10053) and not bRsvSocket_Connect then
    MessageDlg('Error: ' + IntToStr(ErrorCode) + #13 + #13 +
      'R is not more in server mode.' + #13 +
      'The connection with R server was lost!', mtError, [mbOk], 0);

  if Assigned(frmRServer) then
  begin
    with frmRServer do
    begin
      chbIPConnected.Checked := False;
      edtIPClientIP.Text := EmptyStr;
      edtIPClient.Text := EmptyStr;
      btnConnectTCPIP.Enabled := True;
      btnDisconnectTCPIP.Enabled := False;
      btnSendTCPIP.Enabled := False;
    end;
  end;

  ErrorCode := 0;
  bConectionError := True;
  Socket.Close;
  actRContTCPConnection.Checked := False;
end;

procedure TfrmTinnMain.csREnvironmentRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  sRecText, sOldSelection: String;
begin
  sRecText := trim(Socket.ReceiveText);

  if ansipos('!!update!!', sRecText)>0 then
  begin
    sRecText := copy(sRecText, ansipos('!!update!!', sRecText)+11, length(sRecText));
    sRecText := copy(sRecText, 1, length(sRecText)-1);
   // frmTinnMain.bRExplorerActive := true;


    if assigned(frmTools) then
    with frmTools.cbbToolsREnvironment do
    begin


      if ItemIndex > -1 then
      sOldSelection := Items[ItemIndex]
        else sOldSelection := '';
      Items.BeginUpdate;
      Items.CommaText := sRecText;
      if Items.IndexOf(sOldSelection)> -1 then
              ItemIndex := Items.IndexOf(sOldSelection) else
            ItemIndex := 0;
      Items.EndUpdate;

        if sOldSelection <> Items[ItemIndex] then
        begin
          frmTools.ResetRExplorerFilter;
        end;
      modDados.CheckForNewPackages;
    end;
  end;
end;

procedure TfrmTinnMain.csRGeneralRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  aBuffer: array [0 .. 4095] of Char;
  buf: PChar;
  iReceived: integer;

  muStream_1, muStream_2: TMultiStream;

  meStream, mePriorContent: TMemoryStream;
  sRec: String;
  edForm: TfrmEditor;
begin
  sRec := csRGeneral.Socket.ReceiveText;

  if ansipos('TinnRMSG:TidyReady', sRec)>0 then
  begin
    if bTidying then
    begin
      if assigned(frmTidyAbort) then
      begin
        frmTidyAbort.Close;
        bTidying :=  false;
        if getTopEditorForm(edForm) then
          edForm.ProcessTidy;
      end;
    end;
    Exit;
  end
  else
  if ansipos('TinnRMSG:TidyFailed', sRec)>0 then
  begin
    if bTidying then
    begin
      if assigned(frmTidyAbort) then
      begin
        frmTidyAbort.Close;
        MessageDlg('Tinn-R was unable to tidy your source code.', mtError, [mbOK], 0);
        bTidying :=  false;
      end;
    end;
    Exit;
  end;



  meStream := TMemoryStream.Create;
  mePriorContent := TMemoryStream.Create;
  muStream_1 := TMultiStream.Create;
  muStream_2 := TMultiStream.Create;
  try
    while True do
    begin
      Sleep(iDelay div 6);
      iReceived := Socket.ReceiveBuf(aBuffer, SizeOf(aBuffer));
      if (iReceived <= 0) then
        break
      else
        meStream.Write(aBuffer, iReceived);
    end;

    meStream.Position := 0;

    if (meStream.Size <> 0) then
    begin
      GetMem(buf, 1024);
      // R server output
      if Assigned(frmRServer) then
        if (frmRServer.Visible) then
          with frmRServer.memRTCPIP do
          begin
            Lines.BeginUpdate;
            Lines.SaveToStream(mePriorContent);
            muStream_1.AddStream(mePriorContent);
            muStream_1.AddStream(meStream);
            ZeroMemory(buf, 1024);
            Lines.LoadFromStream(muStream_1);
            PostMessage(Handle, WM_VSCROLL, SB_BOTTOM, 0);
            Lines.EndUpdate;
          end;

    {m.p. //sci  // R output
      with frmRterm.synIO do
      begin
        Lines.BeginUpdate;
        Lines.Add(EmptyStr);
        mePriorContent.Clear;
        Lines.SaveToStream(mePriorContent);
        muStream_2.AddStream(mePriorContent);
        muStream_2.AddStream(meStream);
        ZeroMemory(buf, 1024);

        Lines.LoadFromStream(muStream_2);
        ExecuteCommand(ecEditorBottom, #0, nil);

        LineText := '> ';
        ExecuteCommand(ecEditorBottom, #0, nil);
        Lines.EndUpdate;
      end; }

      // R output
      with frmRterm.sciIO do
      begin
        Lines.BeginUpdate;
        Lines.Add(EmptyStr);
        mePriorContent.Clear;
        Lines.SaveToStream(mePriorContent);
        muStream_2.AddStream(mePriorContent);
        muStream_2.AddStream(meStream);
        ZeroMemory(buf, 1024);

        Lines.LoadFromStream(muStream_2);
        //sci ExecuteCommand(ecEditorBottom, #0, nil);
        SetCurrentPos(GetLength);
        SetSelectionStart(GetCurrentPos);

        Lines[LineFromPosition(GetCurrentPos)] := '> ';
        //LineText := '> ';
        //sci ExecuteCommand(ecEditorBottom, #0, nil);
        SetCurrentPos(GetLength);
        SetSelectionStart(GetCurrentPos);

        Lines.EndUpdate;
      end;

    end;
  finally
    FreeAndNil(meStream);
    FreeAndNil(mePriorContent);
    FreeAndNil(muStream_1);
    FreeAndNil(muStream_2);
  end;
end;

procedure TfrmTinnMain.csRtipError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: integer);
begin
  ErrorCode := 0;
  Socket.Close;
end;

procedure TfrmTinnMain.PrintMessage(sInstruction: string; bNewLine: Boolean;
  sSignal: string = '> ');
begin
  if not bRTCPIPConsoleUse or not bRTCPIPConsoleEcho then
    Exit;
  sInstruction := TrimRight(sInstruction);

  with frmRterm.sciIO do
  begin
    Lines.BeginUpdate;
    if bNewLine then
      Lines.Add(sSignal + sInstruction)
    else

      Lines[LineFromPosition(GetCurrentPos)] := GetCurrentLine(frmRTerm.sciIO) + sInstruction;

    SetCursorToBottom(frmRterm.sciIO);
    //sci ExecuteCommand(ecEditorBottom, #0, nil);
    Lines.EndUpdate;
  end;


{
  with frmRterm.synIO do
  begin
    Lines.BeginUpdate;
    if bNewLine then
      Lines.Add(sSignal + sInstruction)
    else
      LineText := LineText + sInstruction;
    ExecuteCommand(ecEditorBottom, #0, nil);
    Lines.EndUpdate;
  end;
}

end;

procedure TfrmTinnMain.pmenProjRSendToRClick(Sender: TObject);

  procedure SendToR(var sTmp: string);
  begin
    DoSend(sTmp);
  end;

  procedure PrepareToSendToR(sFilePath: string; var sTmp: string);
  var
    sUnixPath, sToSend: string;

  begin
    sUnixPath := DosPathToUnixPath(sFilePath);
    if Rterm_Running or bIPRemoteConnected then
    begin
      if sTmp = EmptyStr then
        sTmp := 'source(''' + sUnixPath + ''')'
      else
        sTmp := sTmp + '; ' + 'source(''' + sUnixPath + ''')';
      Exit;
    end
    else // Rgui is running!
      sToSend := 'source(''' + sUnixPath + ''')';
    DoSend(sToSend);
  end;

var
  bIgnoreAll: Boolean;

  j, iFiles: integer;

  sFilePath, sTmp: string;

  tnCurNode: TTreeNode;
  userOption: TModalResult;

begin
  with frmTools.tvProject do
  begin
    if (Selected = nil) then
      Exit;

    // Send all files of the open project to R
    if (Selected.Level = 0) then
    begin
      bIgnoreAll := False;

      for j := 1 to (Items.Count - 1) do
      begin
        if (Items[j].Level = 2) then
        begin
          sFilePath := trim(string(Items[j].Data));
          if FileExists(sFilePath) then
            PrepareToSendToR(sFilePath, sTmp)
          else if not bIgnoreAll then
          begin
            userOption := MessageDlg(sFilePath + #13 + #13 +
              'File above was not found!' + #13 + 'Ignore?', mtConfirmation,
              [mbYes, mbYesToAll, mbCancel], 0);

            case userOption of
              mrYesToAll:
                bIgnoreAll := True;
              mrCancel:
                Exit;
            end;
          end;
        end;
      end;
    end
    // Send all files of the selected group to R
    else if (Selected.Level = 1) then
    begin
      bIgnoreAll := False;
      j := Selected.AbsoluteIndex;
      tnCurNode := Items[j]; // Important not remove!
      iFiles := Items[j].Count;

      while iFiles > 0 do
      begin
        tnCurNode := tnCurNode.GetNext;
        sFilePath := trim(string(tnCurNode.Data));
        if FileExists(sFilePath) then
          PrepareToSendToR(sFilePath, sTmp)
        else if not bIgnoreAll then
        begin
          userOption := MessageDlg(sFilePath + #13 + #13 +
            'File above was not found!' + #13 + 'Ignore it?', mtConfirmation,
            [mbYes, mbYesToAll, mbCancel], 0);

          case userOption of
            mrYesToAll:
              bIgnoreAll := True;
            mrCancel:
              Exit;
          end;
        end;
        dec(iFiles);
      end;
    end
    // Send selected file to R
    else if (Selected.Level = 2) then
    begin
      sFilePath := trim(string(Selected.Data));
      if FileExists(sFilePath) then
        PrepareToSendToR(sFilePath, sTmp)
      else
        MessageDlg(trim(sFilePath) + #13 + #13 + 'File not found!', mtWarning,
          [mbOk], 0);
    end;

    if (sTmp <> EmptyStr) then
      SendToR(sTmp);
  end;
end;

procedure TfrmTinnMain.pmenProjRSetWorkDirClick(Sender: TObject);

  procedure SendToR(filePath: string);
  var
    unixPath, sToSend: string;

  begin
    unixPath := DosPathToUnixPath(filePath);
    sToSend := 'setwd(''' + unixPath + ''')';
    DoSend(sToSend);
  end;

var
  sFilePath: string;

begin
  with frmTools.tvProject do
  begin
    if (Selected = nil) then
      Exit;
    // Send selected file to R
    if (Selected.Level = 2) then
    begin
      sFilePath := trim(string(Selected.Data));
      if FileExists(sFilePath) then
        SendToR(ExtractFilePath(sFilePath))
      else
        MessageDlg(trim(sFilePath) + #13 + #13 + 'File not found!', mtWarning,
          [mbOk], 0);
    end;
  end;
end;

procedure TfrmTinnMain.actRExplorerHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Tools interface"');
end;

procedure TfrmTinnMain.actRExplorerHelpSelectedExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'help(''' +  modDados.cdRObjects.FieldByName('Name').AsString + ''')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerExampleSelectedExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

   if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'example(''' +  modDados.cdRObjects.FieldByName('Name').AsString + ''')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerNamesExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

   if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'names(' + modDados.cdRObjects.FieldByName('Name').AsString + ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerStructureExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'str(' + modDados.cdRObjects.FieldByName('Name').AsString + ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerSummaryExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'summary(' + modDados.cdRObjects.FieldByName('Name').AsString + ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerEditExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'edit(' + modDados.cdRObjects.FieldByName('Name').AsString + ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerFixExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'fix(' + modDados.cdRObjects.FieldByName('Name').AsString + ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerPlotExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'plot(' + modDados.cdRObjects.FieldByName('Name').AsString + ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerRemoveExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'rm(' + modDados.cdRObjects.FieldByName('Name').AsString + ')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerRemoveAllObjectsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  // sTmp:= 'rm(list=ls(all=TRUE))';
  sTmp := 'rm(list=ls())';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerContentExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := modDados.cdRObjects.FieldByName('Name').AsString;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerSendNameToEditorExecute(Sender: TObject);

begin
  InsertDatabaseEntry('Name', modDados.cdRObjects);
end;

procedure TfrmTinnMain.actRExplorerSendNameToClipboardExecute(Sender: TObject);
begin
  if not modDados.cdRObjects.FieldByName('Name').IsNull then
    Clipboard.AsText := modDados.cdRObjects.FieldByName('Name').AsString
end;

procedure TfrmTinnMain.actRExplorerExpRawExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'trExport(''' + modDados.cdRObjects.FieldByName('Name').AsString + '''' + ', ' +
    'type=''raw'')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerExpAsciiExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'trExport(''' + modDados.cdRObjects.FieldByName('Name').AsString + '''' + ', ' +
    'type=''ascii'')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerExpHtmlExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'trExport(''' + modDados.cdRObjects.FieldByName('Name').AsString + '''' + ', ' +
    'type=''html'')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRExplorerExpTeXExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not assigned(modDados) then
    Exit;

  if modDados.cdRObjects.FieldByName('Name').IsNull then
    Exit;
  sTmp := 'trExport(''' + modDados.cdRObjects.FieldByName('Name').AsString + '''' + ', ' +
    'type=''latex'')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRCardHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Card (R)"');
end;

procedure TfrmTinnMain.actRCardHelpSelectedExecute(Sender: TObject);
{
  function GetWord: string;
  var
    iPos: integer;
    sTmp: string;

  begin
    Result := EmptyStr;

    sTmp := modDados.cdRcardFunction.AsString;

    iPos := pos('(', sTmp);

    if (iPos <> 0) then
      sTmp := copy(sTmp, 0, (iPos - 1));

    if (sTmp = '') then
    begin
      MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
      Exit;
    end;

    Result := 'help(''' + sTmp + ''')';
  end;

var
  sTmp: string;  }

begin
 { sTmp := GetWord;
  if (sTmp = EmptyStr) then
    Exit;
  DoSend(sTmp);  }
end;

procedure TfrmTinnMain.actRcardInsertExecute(Sender: TObject);
begin
  InsertDatabaseEntry('InsertText', modDados.cdMainBase);
end;

procedure TfrmTinnMain.actRcardInsertNoArgsExecute(Sender: TObject);
begin
  InsertDatabaseEntry('InsertText', modDados.cdMainBase, false);
end;

procedure TfrmTinnMain.actRCardExampleSelectedExecute(Sender: TObject);
{
  function GetWord: string;
  var
    iPos: integer;
    sTmp: string;

  begin
    Result := EmptyStr;

    sTmp := modDados.cdRcardFunction.AsString;

    iPos := pos('(', sTmp);

    if (iPos <> 0) then
      sTmp := copy(sTmp, 0, (iPos - 1));

    if (sTmp = EmptyStr) then
    begin
      MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
      Exit;
    end;

    Result := 'example(''' + sTmp + ''')';
  end;

var
  sTmp: string;     }

begin
{  sTmp := GetWord;
  if (sTmp = EmptyStr) then
    Exit;
  DoSend(sTmp);  }
end;

procedure TfrmTinnMain.actRcardCopyFunctionExecute(Sender: TObject);
begin
 { with modDados do
    Clipboard.AsText := cdRcardFunction.Text;}
end;

procedure TfrmTinnMain.actRcardEditExecute(Sender: TObject);
begin
  actDoRCardExecute(nil);
end;

procedure TfrmTinnMain.UpdateOptions;
var
  seEditor: TDScintilla;
  SelAvail: Boolean;
begin

    if GetActiveEditorOrNil(seEditor) then
      SelAvail := seEditor.GetSelText <> ''
    else SelAvail := false;

    actCopyFormattedHtml.Enabled := SelAvail;
    actCopyFormattedRtf.Enabled := SelAvail;
    actCopyFormattedTeX.Enabled := SelAvail;
    actIndentBlock.Enabled := SelAvail;
    actUnindentBlock.Enabled := SelAvail;


end;

procedure TfrmTinnMain.actSplitVerticalExecute(Sender: TObject);
var
  i: integer;

begin
//  SynURIOpener.Editor := nil;
  i := FindTopWindow;

  with (Self.MDIChildren[i] as TfrmEditor) do
    EditorSplit(False);

  //sci //m.p.
  {
  SetDataCompletion(sciEditor2Tip, (Self.MDIChildren[i] as TfrmEditor)
    .sciEditor2, sTriggerRtip);

  SetDataCompletion(sciEditor2DataCompletion,
    (Self.MDIChildren[i] as TfrmEditor).sciEditor2, sTriggerRDataCompletion);
      }
  SetFocus_Main;
end;

procedure TfrmTinnMain.actSetANSIExecute(Sender: TObject);
begin
  //SetBuffer_SaveFormat(sfANSI);
end;

procedure TfrmTinnMain.actSetUTF16BEExecute(Sender: TObject);
begin
//  SetBuffer_SaveFormat(sfUTF16MSB)
end;

procedure TfrmTinnMain.actSetUTF16LEExecute(Sender: TObject);
begin
  //SetBuffer_SaveFormat(sfUTF16LSB);
end;

procedure TfrmTinnMain.actSetUTF8Execute(Sender: TObject);
begin
 // SetBuffer_SaveFormat(sfUTF8);
end;

procedure TfrmTinnMain.actSplitHorizontalExecute(Sender: TObject);
var
  i: integer;

begin
//  SynURIOpener.Editor := nil;

  i := FindTopWindow;
  with (Self.MDIChildren[i] as TfrmEditor) do
    EditorSplit;

   //sci //m.p.
   {
  SetDataCompletion(sciEditor2Tip, (Self.MDIChildren[i] as TfrmEditor)
    .sciEditor2, sTriggerRtip);

  SetDataCompletion(sciEditor2DataCompletion,
    (Self.MDIChildren[i] as TfrmEditor).sciEditor2, sTriggerRDataCompletion);
      }
  SetFocus_Main;
end;

procedure TfrmTinnMain.actSplitRemoveExecute(Sender: TObject);
begin
//  SynURIOpener.Editor := nil;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    EditorRemoveSplit;

  //sci //m.p.
  {
  with sciEditor2Tip do
  begin
    Editor := nil;
    EndOfTokenChr := EmptyStr;
    ShortCut := TextToShortCut(EmptyStr);
  end;   }
end;

procedure TfrmTinnMain.actRExplorerStyleExecute(Sender: TObject);
begin

end;

{$WARNINGS OFF}

procedure TfrmTinnMain.actSearchInFilesExecute(Sender: TObject);
var
  dlg: TfrmSearchInFiles;

  iMatchCount, iFoundFileCount, iTotFileCount: integer;

  lSavedCursor: TCursor;

  sSearchText, sSearchDirectoryText, sSearchFileMask: string;

begin
  dlg := TfrmSearchInFiles.Create(Self);

  with dlg do
  begin
    if (sSearchFileMaskHistory <> EmptyStr) then
      SearchFileMaskHistory := sSearchFileMaskHistory;
    SearchCaseSensitive := bSearchCaseSensitive;
    SearchDirectory := bSearchDirectory;
    SearchDirectoryText := sSearchDirectoryText;
    SearchDirHistory := sSearchDirHistory;
    SearchInSub := bSearchInSub;
    SearchOpenFiles := bSearchOpenFiles;
    SearchRegularExpression := bSearchRegExp;
    SearchTextHistory := sSearchTextHistory;
    SearchWholeWords := bSearchWholeWords;
  end;

  iMatchCount := 0;
  iFoundFileCount := 0;

  if (Self.MDIChildCount > 0) then
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
      if (sciEditor.GetSelText <> '') and
        (SelStartLine(sciEditor) = SelEndLine(sciEditor)) then
        dlg.SearchText := sciEditor.GetSelText
      else
        dlg.SearchText :=  GetWordFromPos(sciEditor.GetCurrentPos, sciEditor);
  if (dlg.ShowModal = mrOK) then
  begin
    // Set cursor to 'busy'
    if (MDIChildCount > 0) then
    begin
      lSavedCursor := TfrmEditor(MDIChildren[0]).sciEditor.Cursor;
      TfrmEditor(MDIChildren[0]).sciEditor.Cursor := crHourglass;
    end
    else
      Screen.Cursor := crHourglass;

    frmTools.npTools.ActivePage := frmTools.ppSearch;

    with frmTools.stbSearch do
    begin
      Panels[1].Text := EmptyStr;
      Panels[3].Text := EmptyStr;
      Panels[5].Text := EmptyStr;
    end;
    with frmTools.tvSearch do
    begin
      if (Items.Count > 0) then
      begin
        Items.BeginUpdate;
        Items.Clear;
        Refresh;
        Items.EndUpdate;
      end;
    end;
    try
      with dlg do
      begin
        bSearchCaseSensitive := SearchCaseSensitive;
        bSearchDirectory := SearchDirectory;
        bSearchInSub := SearchInSub;
        bSearchOpenFiles := SearchOpenFiles;
        bSearchRegExp := SearchRegularExpression;
        bSearchWholeWords := SearchWholeWords;
        sSearchDirectoryText := SearchDirectoryText;
        sSearchDirHistory := SearchDirHistory;
        sSearchFileMask := SearchFileMask;
        sSearchFileMaskHistory := SearchFileMaskHistory;
        sSearchText := SearchText;
      end;

      with dlg do
      begin
        iTimerCounter := 0;
        iTotFileCount := 0;
        SetupSearchParameters(sSearchText);
        SetLength(aOpenFileSearch, 0);

        if bSearchOpenFiles then
        begin
          SearchInOpenFiles(iFoundFileCount, iMatchCount);
          iTotFileCount := Self.MDIChildCount;
        end;
        if bSearchDirectory then
        begin
          SearchInDirectories(sSearchDirectoryText, sSearchFileMask,
            iFoundFileCount, iMatchCount, iTotFileCount);
        end;
        sSearchTextHistory := dlg.SearchTextHistory;
      end;
    finally
      if (MDIChildCount > 0) then
        TfrmEditor(frmTinnMain.MDIChildren[0]).sciEditor.Cursor := lSavedCursor
      else
        Screen.Cursor := crDefault;

      with frmTools.stbSearch do
        Panels[1].Text := IntToStr(frmTools.tvSearch.Items.Count);

      FreeAndNil(dlg);

      with frmTools.tvSearch do
      begin
        Selected := Items.GetFirstNode;
        actSearchExpandOneExecute(Self);
        if (Items.Count > 2) then
          ToolsSearchControls(True)
        else
          ToolsSearchControls(False);
      end;
    end;
  end;
end;
{$WARNINGS ON}

function TfrmTinnMain.ValidRRunning: Boolean;
begin
  Result := True;
  if not Rterm_Running and not Rgui_Running and not bIPRemoteConnected then
    Result := False;
end;

procedure TfrmTinnMain.SendToConsole(sTmp: string);
var
  iPos: integer;
  sTmpPrior: string;

begin

 RHistory.Add(trim(sTmp));
  with frmRterm.sciIO do
  begin
    SetCursorToBottom(frmRTerm.sciIO);
    //ExecuteCommand(ecEditorBottom, #0, nil);

    if frmRterm.bRterm_Plus then
    begin
      SetCurrentLine('+ ' + sTmp, frmRterm.sciIO);
      //LineText := '+ ' + sTmp;
      frmRterm.bRterm_Plus := False;
    end
    else if (trim(GetCurrentLine(frmRterm.sciIO)) = '>') or (GetCurrentLine(frmRterm.sciIO) = EmptyStr) then
      SetCurrentLine('> ' + sTmp, frmRterm.sciIO)
    else
    begin
      sTmpPrior := GetCurrentLine(frmRterm.sciIO);

      // Remove any trash
      iPos := pos('>', sTmpPrior);
      if (iPos <> 0) then
        Delete(sTmpPrior, iPos + 1, Length(sTmpPrior));

      // Check if under debug function
      iPos := pos(']>', sTmpPrior);
      if (iPos <> 0) then
        Delete(sTmpPrior, iPos + 2, Length(sTmpPrior));

      // Final Result
       SetCurrentLine(sTmpPrior + ' ' + sTmp, frmRterm.sciIO)
    end;
    SetCursorToBottom(frmRterm.sciIO);
    //ExecuteCommand(ecEditorBottom, #0, nil);
  end;
 {sci
  RHistory.Add(trim(sTmp));
  with frmRterm.synIO do
  begin
    ExecuteCommand(ecEditorBottom, #0, nil);

    if frmRterm.bRterm_Plus then
    begin
      LineText := '+ ' + sTmp;
      frmRterm.bRterm_Plus := False;
    end
    else if (trim(LineText) = '>') or (LineText = EmptyStr) then
      LineText := '> ' + sTmp
    else
    begin
      sTmpPrior := LineText;

      // Remove any trash
      iPos := pos('>', sTmpPrior);
      if (iPos <> 0) then
        Delete(sTmpPrior, iPos + 1, Length(sTmpPrior));

      // Check if under debug function
      iPos := pos(']>', sTmpPrior);
      if (iPos <> 0) then
        Delete(sTmpPrior, iPos + 2, Length(sTmpPrior));

      // Final Result
      LineText := sTmpPrior + ' ' + sTmp;
    end;

    ExecuteCommand(ecEditorBottom, #0, nil);
  end; }
end;




procedure TfrmTinnMain.CheckRterm;
begin
  DoUndoAutoHideRterm;
  if not frmRterm.Visible then
  begin
    actRtermVisibleExecute(nil);
    actRtermDivideExecute(nil);
  end;
end;

function TfrmTinnMain.GetFile(var bSingleLine: Boolean): string;
var
  sTmp, sFilePath: string;

begin
  Result := EmptyStr;
  if not ValidRRunning then
    Exit;
  sTmp := (Self.MDIChildren[FindTopWindow] as TfrmEditor).sciEditor.GetText;
  if not bRSendAll then
    RemoveLine_Commented(sTmp);
  RemoveLine_Empty(sTmp);

  if bRSmartSend and SingleLine(sTmp) then
  begin
    bSingleLine := True;
    Result := StringReplace(sTmp, #13#10, EmptyStr, [rfReplaceAll]);
    Exit;
  end;

  sFilePath := sPathTmp + '\file.r';
  if FileSaveFast(sFilePath, sTmp) then
  begin
    // if (RHistory = nil) then RHistory:= TRHistory.Create;
    // RHistory.LoadFromFile(sFilePath);
    Result := '.trPaths[4]';
  end;
end;

function TfrmTinnMain.GetPathFile(bFull: Boolean = False): string;
var
  sDos: string;
  i: integer;

begin
  Result := EmptyStr;

  if not ValidRRunning then
    Exit;
  i := FindTopWindow;

  if ((Self.MDIChildren[i] as TfrmEditor).EditorFile.iModified = 1) then
    actFileSaveExecute(Self);
  sDos := (Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile;

  if bFull then
    Result := DosPathToUnixPath(sDos)
  else
    Result := DosPathToUnixPath(ExtractFilePath(sDos));
end;

procedure TfrmTinnMain.actRSendFileExecute(Sender: TObject);
begin
  RSendFile(bEchoOn);
end;

procedure TfrmTinnMain.actRSendSelectionExecute(Sender: TObject);
begin
  RSendSelection(bEchoOn);
end;

procedure TfrmTinnMain.actRSendClipboardExecute(Sender: TObject);
begin
  RSendClipboard(bEchoOn);
end;

procedure TfrmTinnMain.actRSendBlockMarkedExecute(Sender: TObject);
begin
  RSendBlockMarked(bEchoOn);
end;

procedure TfrmTinnMain.actRSendContiguousExecute(Sender: TObject);
begin
  RSendContiguous(bEchoOn);
end;

procedure TfrmTinnMain.actRSendLineExecute(Sender: TObject);
begin
  RSendLine;
end;

procedure TfrmTinnMain.actRSendLinesToEndPageExecute(Sender: TObject);
begin
  RSendLinesToEndPage(bEchoOn);
end;

procedure TfrmTinnMain.actRSendNavigatorExecute(Sender: TObject);
begin
  RSendNavigator(bEchoOn);
end;

procedure TfrmTinnMain.actRCurrentLineToTopExecute(Sender: TObject);
begin
  RSendCurrentLineToTop(bEchoOn);
end;

procedure TfrmTinnMain.actRSendCursorToBeginningLineExecute(Sender: TObject);
begin
  // well, outsourcing the code didn't really make sens for this one here, but
  // for consistentcy...
  RSendCursorToBeginningLine;
end;

procedure TfrmTinnMain.actRSendCursorToEndLineExecute(Sender: TObject);
begin
  RSendCursorToEndLine;
end;

procedure TfrmTinnMain.actRsendEchoOnExecute(Sender: TObject);
begin
  bEchoOn := not bEchoOn;
  actRsendEchoOn.Checked := bEchoOn;
end;

procedure TfrmTinnMain.actRSendSweaveExecute(Sender: TObject);
begin
  showmessage('Feature not ready.');
  Exit;
  RSendSweave;
end;

procedure TfrmTinnMain.actRserverExecute(Sender: TObject);
begin
  try
    frmRServer := TfrmRServer.Create(nil);
    frmRServer.ShowModal;
  finally
    FreeAndNil(frmRServer);
    SetFocus_Main;
  end;
  frmTinnMain.Refresh;
end;

procedure TfrmTinnMain.actRSet_trPathsExecute(Sender: TObject);
var
  sTinnRPaths: string;

begin

  sTinnRPaths := '.trPaths <- file.path(Sys.getenv(''APPDATA''), ' +
    '''Tinn-R'', ' + '''tmp'', ' + 'c('''', ' + '''search.txt'', ' +
    '''objects.txt'', ' + '''file.r'', ' + '''selection.r'', ' + '''block.r'', '
    + '''lines.r'', ' + '''reformat-input.r'', ' + '''reformat-output.r''), ' +
    'fsep=''\\'')';

  DoSend(sTinnRPaths);

end;

procedure TfrmTinnMain.actRSendKnitPdfExecute(Sender: TObject);
begin
  showmessage('Feature not ready.');
  Exit;
  RSendKnitPdf;
end;

procedure TfrmTinnMain.actRSendKnitHtmlExecute(Sender: TObject);
begin
  showmessage('Feature not ready.');
  Exit;
  RSendKnitHtml;
end;

procedure TfrmTinnMain.actRContSetWorkDirectoryExecute(Sender: TObject);
var
  sTmp, sUnix: string;

begin
  sUnix := GetPathFile;
  if (sUnix = EmptyStr) then
    Exit;

  sTmp := 'setwd(''' + sUnix + ''')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContListAllObjectsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := 'ls()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPrintVariableContentExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := FindWord;

  if (sTmp = EmptyStr) then
  begin
    MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
    Exit;
  end;

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContListVariableNamesExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := FindWord;

  if (sTmp = EmptyStr) then
  begin
    MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
    Exit;
  end;
  sTmp := 'names(' + sTmp + ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContListVariableStructureExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := FindWord;

  if (sTmp = EmptyStr) then
  begin
    MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
    Exit;
  end;
  sTmp := 'str(' + sTmp + ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContObjNamesExecute(Sender: TObject);
var
  sTmp: String;
begin
  if not ValidRRunning then
    Exit;
  if Self.MDIChildCount = 0 then
    Exit;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor).sciEditor do
  begin
    sTmp := trim(GetSelText);
    if sTmp <> '' then
    begin
      Self.LookupRObjectNames(sTmp,
        (Self.MDIChildren[FindTopWindow] as TfrmEditor).sciEditor, -2);
    end;
  end;
end;

procedure TfrmTinnMain.actRContEditVariableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := FindWord;

  if (sTmp = EmptyStr) then
  begin
    MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
    Exit;
  end;
  sTmp := 'edit(' + sTmp + ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContFixVariableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := FindWord;

  if (sTmp = EmptyStr) then
  begin
    MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
    Exit;
  end;
  sTmp := 'fix(' + sTmp + ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPlotVariableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := FindWord;

  if (sTmp = EmptyStr) then
  begin
    MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
    Exit;
  end;
  sTmp := 'plot(' + sTmp + ')';

  DoSend(sTmp);
end;

procedure TfrmTinnMain.SendRCustom(sRC: string);
var
  bSingleLine: Boolean;

  sTmp, sToSend: string;

begin
  if not ValidRRunning then
    Exit;

  if (pos('%f', sRC) > 0) then
  begin
    if (pgFiles.PageCount = 0) then
      Exit;
    sToSend := GetFile(bSingleLine); // Get file
    if (sToSend = EmptyStr) then
      Exit;

    sTmp := StringReplace(sRC, '%f', sToSend, [rfReplaceAll]);
  end
  else if (pos('%s', sRC) > 0) then
  begin
    if (pgFiles.PageCount = 0) then
      Exit;
    sToSend := GetSelection(bSingleLine); // Get slection

    if (sToSend = EmptyStr) then
    begin
      sToSend := FindWord; // Get word

      if (sToSend = EmptyStr) then
      begin
        MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
        Exit;
      end;
    end;
    sTmp := StringReplace(sRC, '%s', sToSend, [rfReplaceAll]);
  end
  else
    sTmp := sRC;

  DoSend(sTmp);
end;

procedure TfrmTinnMain.DoClearConsole;
var
  sToSend: string;

begin
  if not ValidRRunning then
    Exit;

  // Rterm: priority 1
  if Rterm_Running then
  begin
    CheckRterm;

    if frmRterm.bRUnderDebug_Function or frmRterm.bRUnderDebug_Package then
    begin

      with frmRterm do
      begin
        SetCurrentLine(sRDebugPrefix + ' ', sciIO);
        SetCursorToLineEnd(sciIO);
        {
        synIO.LineText := sRDebugPrefix + ' ';
        synIO.ExecuteCommand(ecLineEnd, #0, nil); }
      end;
    end
    else
      sToSend := EmptyStr + #13#10;

    frmRterm.cRterm.SendInput(sToSend);
    Exit;
  end;

  // Rgui: priority 2
  if Rgui_Running then
  begin
    sToSend := '^l';
    fCodeSender.DoPrepare;
    fCodeSender.SendString(sToSend);
    CheckTop;
    SetFocus_Rgui(iDelay);
    Exit;
  end;

  // R remote: priority 3
  if bIPRemoteConnected then
  begin
    if not UseTCPIP then
      Exit;
    frmRTerm.SciIO.Lines.Clear;
    sToSend := EmptyStr + #13#10;
    csRGeneral.Socket.SendText(sToSend);
    SetFocus_Rgui(iDelay div 4);
  end;
end;

procedure TfrmTinnMain.actRContClearConsoleExecute(Sender: TObject);
begin
  actRtermIOandLogClearExecute(nil);
end;

procedure TfrmTinnMain.actRContCloseAllGraphicsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := 'graphics.off()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContRemoveAllObjectsExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := 'rm(list=ls())';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContClearAllExecute(Sender: TObject);
var
  i: integer;

  sTmp, sToSend: string;

  seLog: TDScintilla;

begin
  if not ValidRRunning then
    Exit;
  sTmp := 'rm(list=ls()); graphics.off()';
  DoSend(sTmp);
  // Rterm: priority 1
  if Rterm_Running then
  begin
    Sleep(2 * iDelay);

    ClearAllBookmarks(frmRTerm.SciIO);
    frmRTerm.SciIO.Lines.Clear;


    // Log
    seLog := frmRterm.sciLog;

    ClearAllBookmarks(seLog);
    seLog.Lines.Clear;

    Exit;
  end;

  // Rgui: priority 2
  if Rgui_Running then
  begin
    sToSend := '^l';
    fCodeSender.DoPrepare;
    fCodeSender.SendString(sToSend);
    CheckTop;
    SetFocus_Rgui(iDelay div 2);
    Exit;
  end;

  // R remote: priority 3
  if bIPRemoteConnected then
  begin
    if not UseTCPIP then
      Exit;

    ClearAllBookmarks(frmRTerm.SciIO);
    frmRTerm.SciIO.Lines.Clear;


    sToSend := EmptyStr + #13#10;
    csRGeneral.Socket.SendText(sToSend);
    SetFocus_Rgui(iDelay div 4);
  end;
end;

procedure TfrmTinnMain.actRContEscapeExecute(Sender: TObject);
var
  sTmp: string;

begin
 // stbMain.Panels[8].Text := EmptyStr;
  with actRtermWarningError do
  begin
    Visible := False;
    Checked := False;
  end;

  if not(Rgui_Running) then
    Exit;
  // if UseTCPIP then Exit;
  sTmp := '{ESC}';
  fCodeSender.DoPrepare;
  fCodeSender.SendString(sTmp);
  CheckTop;
  SetFocus_Rgui(iDelay);
end;

procedure TfrmTinnMain.actRContHelpSelectedWordExecute(Sender: TObject);

  function GetWord: string;
  var
    sTmp: string;

  begin
    Result := EmptyStr;
    if not ValidRRunning then
      Exit;
    sTmp := FindWord;

    if (sTmp = EmptyStr) then
    begin
      MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
      Exit;
    end;
    Result := 'help(' + sTmp + ')';
  end;

var
  sTmp: string;

begin
  sTmp := GetWord;
  if (sTmp = EmptyStr) then
    Exit;
  if csMainBase.Active then
    csMainBase.Socket.SendText(sTmp+#13#10)
  else
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContExampleSelectedWordExecute(Sender: TObject);

  function GetWord: string;
  var
    sTmp: string;

  begin
    Result := EmptyStr;
    if not ValidRRunning then
      Exit;
    sTmp := FindWord;

    if (sTmp = EmptyStr) then
    begin
      MessageDlg('No valid word selected!', mtInformation, [mbOk], 0);
      Exit;
    end;

    Result := 'example(' + sTmp + ')';
  end;

var
  sTmp: string;

begin
  sTmp := GetWord;
  if (sTmp = EmptyStr) then
    Exit;
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContHelpExecute(Sender: TObject);
var
  sTmp: string;

begin
  if not ValidRRunning then
    Exit;
  sTmp := 'help.start(update=FALSE)';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actREnvironmentRefreshExecute(Sender: TObject);
var
 sToSend: string;
begin
  try

    if Rterm_Running then
      if (csREnvironment.Active) then
      begin
         sToSend := 'TinnR$trEnvironmentUpdate()'+ #13#10;
         csREnvironment.Socket.SendText(sToSend);
      end;
  finally

    // TODO
  end;
end;

procedure TfrmTinnMain.SendLibraryUpdate;
var
 sToSend, smessage: string;
begin
  if not Assigned(frmTools) then
    Exit;

  if not ValidRRunning then
  begin
    Exit;
  end;
  try
    if Rterm_Running then
      if (csMainBase.Active) then
      begin
        if not bBackgroundConnectionErrorWarning then
        begin
         sMessage:= 'Due to an unsolved bug, Tinn-R’s communication that should take place in the background blocks the terminal. ';
         SMessage:= sMessage + 'Generally, this should not disturb your work – unless you load packages that have not yet been imported into Tinn-R’s library.'+#13#10;
         sMessage:= sMessage +'Unfortunately, this is happening right now. Depending on the number of packages, your R terminal might be blocked for several minutes. ';
         sMessage:= sMessage +'There are two ways to deal with this bug in future: a) Start R via Tinn-R and load all your packages at once during a coffee break.  B) Go to GitHub and solve the bug.';
         MessageDlg(sMessage, mtWarning, [mbOK], 0);


         bBackgroundConnectionErrorWarning := true;
        end;


        sToSend := 'TinnR$TinnRLibraryUpdate()' + #13#10;
        csMainBase.Socket.SendText(sToSend);
      end;

  except
    // TODO
  end;

end;



procedure TfrmTinnMain.actRExplorerRefreshExecute(Sender: TObject);
var
 sToSend: string;
begin
  if not Assigned(frmTools) then
    Exit;

  if not ValidRRunning then
  begin
    Exit;
  end;

  try
    if Rterm_Running then
      if (csRExplorer.Active) then
      begin
        sToSend := 'TinnRExplorer(envir = '''+frmTools.cbbToolsREnvironment.Items[frmTools.cbbToolsREnvironment.ItemIndex]+''')' + #13#10;
        csRExplorer.Socket.SendText(sToSend);
      end;

  except
    // TODO
  end;

end;

procedure TfrmTinnMain.actProjectReloadExecute(Sender: TObject);
begin
  CheckIfProjectWasChanged;
  Application.ProcessMessages;

  ToolsProjectControls(False);
  with frmTools.tvProject.Items do
  begin
    BeginUpdate;
    Clear;
    EndUpdate;
  end;
  if Assigned(slProjectChanges) then
    slProjectChanges.Clear;
  bProjectChanged := False;

  ClearStatusBarProject;
  OpenFileIntoTinn(sProjectName);
end;

procedure TfrmTinnMain.actProjectEditExecute(Sender: TObject);
begin
  OpenFileIntoTinn(sProjectName, 0, True);
end;

procedure TfrmTinnMain.BackupSystemConfiguration(bStarting: Boolean);
var
  sBackup: string;
  sd: TSaveDialog;

begin
  sd := TSaveDialog.Create(Self);

  with sd do
  begin
    InitialDir := sWorkingDir;
    if not bStarting then
      FileName := 'Tinn-R_' + GetBuildInfo + '_full_bkp'
    else
      FileName := 'Tinn-R_prior_to2_bkp';
    Filter := 'Tinn backup (*.zip)|*.zip';
    DefaultExt := '.zip';
  end;

  try
    if sd.Execute then
    begin
      if not bStarting then
        frmTinnMain.Refresh;
      sBackup := sd.FileName;
      if FileExists(sBackup) then
      begin
        if (MessageDlg(sBackup + #13 + #13 +
          'Do you want to overwrite this file?', mtConfirmation,
          [mbYes, mbCancel], 0) <> idYes) then
          Exit;
        DeleteFile(sBackup);
      end;

      try
        if not bStarting then
        begin
          WriteIniFile_Application(True);
          WriteIniFile_Editor(True);
        end;
        zipKit.StoreOptions := [soRecurse];
        // soRecurse: will include all files of all folders and sub-folders

        with zipKit do
        begin
          FileName := sBackup;
          AddFiles(sPathIni + '\*.*', 0);
          CloseArchive;
        end;

        if not bStarting then
          MessageDlg(sBackup + #13 + #13 + 'The backup of Tinn-R INI was done' +
            #13 + 'successfully in the file above!', mtInformation, [mbOk], 0)
        else
          MessageDlg(sBackup + #13 + #13 +
            'The backup of old Tinn-R INI was done' + #13 +
            'successfully in the file above!', mtInformation, [mbOk], 0);
      except
        if not bStarting then
          MessageDlg(sBackup + #13 + #13 +
            'The path above is no allowed for your system previleges.' + #13 +
            'It is not possible to make a backup of the Tinn-R INI!', mtError,
            [mbOk], 0)
        else
          MessageDlg(sBackup + #13 + #13 +
            'The path above is no allowed for your system previleges.' + #13 +
            'It is not possible to make a backup of the Tinn-R INI!', mtError,
            [mbOk], 0);
        Exit;
      end; // try
    end; // if (sd.Execute)
  finally
    FreeAndNil(sd);
  end;
end;

procedure TfrmTinnMain.actBackupSystemConfigurationExecute(Sender: TObject);
begin
  BackupSystemConfiguration(False);
  SetFocus_Main;
end;

procedure TfrmTinnMain.actBackupDatabaseExecute(Sender: TObject);
var
  sBackup: string;

  sd: TSaveDialog;

begin
  sd := TSaveDialog.Create(Self);
  sd.InitialDir := sWorkingDir;
  sd.FileName := 'Tinn-R_' + GetBuildInfo + '_database_bkp';
  sd.Filter := 'Tinn backup (*.zip)|*.zip';
  sd.DefaultExt := '.zip';

  try
    if sd.Execute then
    begin
      frmTinnMain.Refresh;
      sBackup := sd.FileName;

      if FileExists(sBackup) then
      begin
        if (MessageDlg(sBackup + #13 + #13 +
          'Do you want to overwrite this file?', mtConfirmation,
          [mbYes, mbCancel], 0) <> idYes) then
          Exit;
        DeleteFile(sBackup);
      end;

      try
        zipKit.StoreOptions := [soRecurse];
        // soRecurse: will include all files of all folders and sub-folders
        with zipKit do
        begin
          FileName := sBackup;

          // Save database

        with modDados do
        begin
            with cdShortcuts do
            begin
              Edit;
              try
                Post;
                MergeChangeLog;
                SaveToFile();
                iShortcutsBeforeChanges := SavePoint;
              except
              end;
            end;
          end;

          with modDados do
          begin
            AddFiles(sPathData + '\*.*', 0);
            CloseArchive;
          end;
        end;
        MessageDlg(sBackup + #13 + #13 + 'The backup of DATABASE was done' + #13
          + 'successfully in the path above!', mtInformation, [mbOk], 0);
      except
        MessageDlg(sBackup + #13 + #13 +
          'The path above is no allowed for your system previleges.' + #13 +
          'It is not possible to make a DATABASE backup!', mtError, [mbOk], 0);
        Exit;
      end; // try
    end; // if (sd.Execute)
  finally
    FreeAndNil(sd);
    SetFocus_Main;
  end;
end;

procedure TfrmTinnMain.actRestoreSystemConfigurationExecute(Sender: TObject);
var
  bRestart: Boolean;

  cTinnR: PChar;

  i, j: integer;

  od: TOpenDialog;

  sBackup, sTmp: string;

begin
  od := TOpenDialog.Create(Self);
  od.InitialDir := sWorkingDir;
  od.FileName := EmptyStr;
  od.Filter := 'Tinn backup (*.zip)|*.zip';
  try
    if od.Execute then
    begin
      frmTinnMain.Refresh;
      sBackup := od.FileName;
      if FileExists(sBackup) then
      begin
        zipKit.FileName := sBackup;

        j := 0;
        for i := 0 to (zipKit.Count - 1) do
        begin
          sTmp := zipKit.Items[i].FileName;
          if (pos('Tinn.ini', sTmp) > 0) or (pos('Editor.ini', sTmp) > 0) then
            inc(j);
        end;

        if (j < 2) then
        begin
          MessageDlg(sBackup + #13 + #13 + 'Restore of Tinn-R INI' + #13 +
            'The file above isn''t a valid backup of the Tinn-R!' + #13 +
            'Please, try another file.', mtWarning, [mbOk], 0);
          Exit;
        end;
        try
          DeleteDir(sPathApp); // Will remove all ini files and subfolders
          zipKit.ExtractOptions := [eoCreateDirs, eoRestorePath];

          with zipKit do
          begin
            BaseDirectory := ExtractFileDrive(sPathIni) + '\';
            ExtractFiles('*.*');
            bRestart := True;
          end;
          zipKit.CloseArchive;

          if bRestart then
          begin
            with modDados do
              //DataModuleCreate(nil);
            if (MessageDlg('The Tinn-R INI was successfully restored.' + #13 +
              'Please, Tinn-R must be restarted!' + #13 + #13 +
              'Do you want to do it now?' + #13 + #13 +
              'PS: If nothing happens, please, restart it manually!',
              mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
            begin

              cTinnR := PChar(Application.ExeName);
              bRestored := True; // Will be used in OnCloseQuery event
              Close; // Check for unsaved files and project

              ShellExecute(Handle, 'open', cTinnR, nil, nil, sw_shownormal);
              Application.Terminate;
            end;
          end;
        except
          // TODO
        end;
      end
      else
      begin
        MessageDlg(ExtractFilePath(sBackup) + #13 + #13 +
          'It wasn''t possible to found a backup of the Tinn-R INI' + #13 +
          'from the choice path above!' + #13 +
          'Please, try another valid path.', mtWarning, [mbOk], 0);

        //with modDados do
        //  DataModuleCreate(nil);
      end;
    end; // if (od.Execute)
  finally
    FreeAndNil(od);
  end;
end;

procedure TfrmTinnMain.actRestoreDatabaseExecute(Sender: TObject);
var
  i, j: integer;

  od: TOpenDialog;

  sBackup, sTmp: string;

begin
  try
    od := TOpenDialog.Create(Self);
    od.InitialDir := sWorkingDir;
    od.FileName := EmptyStr;
    od.Filter := 'Tinn backup (*.zip)|*.zip';

    if od.Execute then
    begin
      frmTinnMain.Refresh;
      sBackup := od.FileName;

      if FileExists(sBackup) then
      begin
        zipKit.FileName := sBackup;

        j := 0;
        for i := 0 to (zipKit.Count - 1) do
        begin
          sTmp := zipKit.Items[i].FileName;
          if (pos('Rtip.xml', sTmp) > 0) or (pos('Rcard.xml', sTmp) > 0) or
            (pos('Completion.xml', sTmp) > 0) then
            inc(j);
        end;

        if (j < 2) then
        begin
          MessageDlg(sBackup + #13 + #13 + 'Restore of DATABASE:' + #13 +
            'The file above isn''t a valid backup of the Tinn-R!' + #13 +
            'Please, try another file.', mtWarning, [mbOk], 0);
          Exit;
        end;


        DeleteDir(sPathData);

        zipKit.ExtractOptions := [eoCreateDirs, eoRestorePath];
        with zipKit do
        begin
          BaseDirectory := ExtractFileDrive(sPathIni) + '\';
          ExtractFiles('*.*');
        end;
        zipKit.CloseArchive;

        bDatabaseRestored := True;
        //with modDados do
        //  DataModuleCreate(nil);
        MessageDlg('The DATABASE was successfully restored.' + #13 + #13 +
          'You can continue your work normally!', mtInformation, [mbOk], 0);
      end
      else
        MessageDlg(ExtractFilePath(sBackup) + #13 + #13 +
          'It wasn''t possible to found a backup of the DATABASE' + #13 +
          'from the choice path above!' + #13 +
          'Please, try another valid path.', mtWarning, [mbOk], 0);
    end; // if (od.Execute)
  finally
    FreeAndNil(od);
  end; // try
end;

procedure TfrmTinnMain.actMacroRecordExecute(Sender: TObject);
var
  i: integer;

begin
 //sci //m.p.
{  synMR.Editor := frmRterm.synIO;
  i := FindTopWindow;
  with (Self.MDIChildren[i] as TfrmEditor) do
    if (sActiveEditor = 'sciEditor2') then
      synMR.Editor := (Self.MDIChildren[i] as TfrmEditor).sciEditor2
    else
      synMR.Editor := (Self.MDIChildren[i] as TfrmEditor).sciEditor;

  if (actMacroRecord.ImageIndex = 89) then
  begin
    synMR.RecordMacro(synMR.Editor);
    actMacroRecord.Hint := 'Stop';
    actMacroRecord.ImageIndex := 90;
  end
  else
  begin
    synMR.Stop;
    actMacroRecord.Hint := 'Record';
    actMacroRecord.ImageIndex := 89;
  end;   }
end;

procedure TfrmTinnMain.actMacroPlayExecute(Sender: TObject);
begin
//  synMR.PlaybackMacro(synMR.Editor);
end;

procedure TfrmTinnMain.actAsciiChartExecute(Sender: TObject);
var
  dlgAscii: TfrmAsciiChart;

begin
  dlgAscii := TfrmAsciiChart.Create(Self);
  dlgAscii.Show;
end;

procedure TfrmTinnMain.actDifferencesExecute(Sender: TObject);
begin
  if (frmDiffMain = nil) then
    Application.CreateForm(TfrmDiffMain, frmDiffMain);
  frmDiffMain.Show;
end;

procedure TfrmTinnMain.CheckProcessingPath(sPath: string);
begin
  if (sPath = EmptyStr) then
  begin
    if (MessageDlg
      ('The path of interpreter, conversor or viewer was not defined.' + #13 +
      'Do you desire to do this now?', mtConfirmation, [mbYes, mbNo], 0) = mrYes)
    then
    begin

      bStartOptionsWithProcessingPage := True;
      actShowAppOptionsExecute(Self);
      frmTinnMain.Refresh;
    end
    else
      Exit;
  end;
end;

procedure TfrmTinnMain.FileConversion(sParameter, sExtension,
  sPathConversor: string; sPathInterpreter: string = ''; bWait: Boolean = True);

  procedure CopyFile(const sourcefilename, targetfilename: string);
  var
    s, t: TFileStream;

  begin
    s := TFileStream.Create(sourcefilename, fmOpenRead);
    try
      t := TFileStream.Create(targetfilename, fmOpenWrite or fmCreate);
      try
        t.CopyFrom(s, s.Size);
      finally
        t.Free;
      end;
    finally
      s.Free;
    end;
  end;

var
  oldCursor: TCursor;

  sTmpFile, sTmpPar, sLatexFile, sNewFile: string;

  i: integer;

  procedure LatexToSweave;
  begin
    sNewFile := ChangeFileExt(sTmpFile, '.rnw');
    sLatexFile := ChangeFileExt(sTmpFile, '.tex');

    if FileExists(sLatexFile) then
    begin
      CopyFile(sLatexFile, sNewFile);
      DeleteFile(sLatexFile);
    end;
  end;

begin
  i := FindTopWindow;
  sTmpFile := (Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile;

  oldCursor := (Self.MDIChildren[i] as TfrmEditor).Cursor;
  (Self.MDIChildren[i] as TfrmEditor).Cursor := crHourglass;
  actFileSaveExecute(Self);

  CheckProcessingPath(sPathInterpreter);
  CheckProcessingPath(sPathConversor);

  try
    if (sPathInterpreter <> EmptyStr) then
      sTmpPar := sPathInterpreter + ' ' + sPathConversor + ' ' + sParameter +
        ' ' + sTmpFile
    else
      sTmpPar := sParameter + ' ' + sTmpFile;

    SetCurrentDir(ExtractFilePath(sTmpFile));
    // Set the OS directory to the current file prior to make the conversion

    if bWait then
    begin
      if ExecCmdLineAndWait(sTmpPar, SW_HIDE) then
      begin
        if (sExtension = '.rnw') then
          LatexToSweave
        else
          sNewFile := ChangeFileExt(sTmpFile, sExtension);
        OpenFileIntoTinn(sNewFile, 0, False, True, True);
      end
      else
      begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor := oldCursor;
        MessageDlg(sTmpPar + #13 + #13 +
          'Sorry, it wasn''t possible to do the conversion!', mtError,
          [mbOk], 0);
      end;
    end
    else
    begin
      if OpenCmdLine(sTmpPar, SW_HIDE) then
      begin
        if (sExtension = '.rnw') then
          LatexToSweave
      end
      else
      begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor := oldCursor;
        MessageDlg(sTmpPar + #13 + #13 +
          'Sorry, it wasn''t possible to do the conversion!', mtError,
          [mbOk], 0);
      end;
    end;
  except
    // TODO
  end;
  (Self.MDIChildren[i] as TfrmEditor).Cursor := oldCursor;
end;

procedure TfrmTinnMain.PandocConversion(sPandocInstruction, sPandocFrom,
  sPandocTo: string; bWait: Boolean = True);
var
  oldCursor: TCursor;

  i: integer;

begin
  i := FindTopWindow;
  oldCursor := (Self.MDIChildren[i] as TfrmEditor).Cursor;
  (Self.MDIChildren[i] as TfrmEditor).Cursor := crHourglass;
  actFileSaveExecute(Self);

  CheckProcessingPath(sPath_Pandoc);

  sPandocInstruction := StringReplace(sPandocInstruction, 'pandoc',
    sPath_Pandoc, []);
  try
    if bWait then
      if ExecCmdLineAndWait(sPandocInstruction, SW_HIDE) then
        OpenFileIntoTinn(sPandocTo, 0, False, True, True)
      else
      begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor := oldCursor;
        MessageDlg(sPandocInstruction + #13 + #13 +
          'Sorry, it wasn''t possible to do the conversion!', mtError,
          [mbOk], 0);
      end
    else
    begin
      if OpenCmdLine(sPandocInstruction, SW_HIDE) then
      else
      begin
        (Self.MDIChildren[i] as TfrmEditor).Cursor := oldCursor;
        MessageDlg(sPandocInstruction + #13 + #13 +
          'Sorry, it wasn''t possible to do the conversion!', mtError,
          [mbOk], 0);
      end;
    end;
  except
    // TODO
  end;
  (Self.MDIChildren[i] as TfrmEditor).Cursor := oldCursor;
end;

procedure TfrmTinnMain.actDeplateToLaTeXDramatistExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' latex-dramatist', '.tex',
    sPathDeplate_Converter, sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToLaTeXExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' latex', '.tex', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToPhpExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' php', '.php', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToPlainExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' plain', '.text', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToLatexExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' tex', '.tex', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToLoutExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' lout', '.lout', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToManExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' man', '.man', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToMgpExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' mgp', '.mgp', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToMoinExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' moin', '.moin', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToPm6Execute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' pm6', '.pm6', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToSweaveExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' latex', '.rnw', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToXhtmlMathMlExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' xhtml11m', '.xhtml', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToXhtmlTransitionalExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' xhtml10t', '.xhtml', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToSgmlExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' sgml', '.sgml', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
  if actHtmlOpenAlways.Checked then
    actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmTinnMain.actTxt2tagsToSweaveExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' tex', '.rnw', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToTxtExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' txt', '.txt', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToWikiExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' wiki', '.wiki', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToXhtmlExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' xhtml', '.xhtml', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
  if actHtmlOpenAlways.Checked then
    actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmTinnMain.actDeleteCategoryExecute(Sender: TObject);
begin
  frmRcard.DeleteCategory;
end;

procedure TfrmTinnMain.actDeplateToDocbookArticleExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' dbk-article', '.xml', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToDocbookBookExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' dbk-book', '.xml', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToDocbookReferenceExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' dbk-ref', '.xml', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
end;

procedure TfrmTinnMain.actDeplateToHtmlExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' html', '.html', sPathDeplate_Converter,
    sPathDeplate_Interpreter);
  if actHtmlOpenAlways.Checked then
    actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmTinnMain.actDeplateToHtmlSiteExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' htmlsite', '.html', sPathDeplate_Converter,
    sPathDeplate_Interpreter, False);
end;

procedure TfrmTinnMain.actDeplateToHtmlSlidesExecute(Sender: TObject);
begin
  FileConversion(sParDeplate + ' htmlslides', '.html', sPathDeplate_Converter,
    sPathDeplate_Interpreter, False);
end;

procedure TfrmTinnMain.actTxt2tagsExecute(Sender: TObject);
begin
  OpenHelpFile('\sample\txt2tags.t2t');
end;

procedure TfrmTinnMain.actTxt2tagsToDokuExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' doku', '.doku', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToGwikiExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' gwiki', '.gwiki', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
end;

procedure TfrmTinnMain.actTxt2tagsToHtmlExecute(Sender: TObject);
begin
  FileConversion(sParTxt2tags + ' html', '.html', sPathTxt2tags_Converter,
    sPathTxt2tags_Interpreter);
  if actHtmlOpenAlways.Checked then
    actHtmlOpenCurrentFileExecute(nil);
end;

procedure TfrmTinnMain.CompileLaTeX(sMikPar, sBibPar, sExtension: string;
  bWait: Boolean);
var
  oldCursor: TCursor;

  sTmpDir, sMikParameter, sBibParameter, sTmpFile, sTmpParameter: string;

  wOption: Word;

  tmpHandle: HWND;

  i: integer;

  procedure CloseCompileLaTeX;
  begin
    (Self.MDIChildren[FindTopWindow] as TfrmEditor).Cursor := oldCursor;
    MessageDlg('Sorry, it wasn''t possible to do the compilation!',
      mtInformation, [mbOk], 0);
    Abort;
  end;

  procedure ProblemOpeningCompiled;
  begin
    MessageDlg('Sorry, it wasn''t possible to open the file: ' + sTmpDir +
      sTmpFile + #13 + #13 + 'The instruction sent to the OS was: ' +
      sTmpParameter, mtInformation, [mbOk], 0);
    Abort;
  end;

  procedure CheckViewer(sTmp1, sTmp2: string; actTmp: TAction);
  begin
    if (sTmp1 = sTmp2) and actTmp.Checked then
    begin // Avoid multiple instance of viewer and break compiling Pdf files
      tmpHandle := GetWindowHandle(PChar(ChangeFileExt(sTmpFile, sExtension)),
        True); // Will close the instance of application with the opened .pdf file

      if not(PostMessage(tmpHandle, WM_Close, 0, 0)) then
        showmessage('Sorry, it was not possible to close the default ' + sTmp2 +
          ' viewer!')
    end;
  end;

begin
  i := FindTopWindow;
  sTmpFile := ExtractFileName((Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile);;
  if (lowerCase(ExtractFileExt(sTmpFile)) <> '.tex') then
    Exit;
  oldCursor := (Self.MDIChildren[i] as TfrmEditor).Cursor;
  (Self.MDIChildren[i] as TfrmEditor).Cursor := crHourglass;
  actFileSaveExecute(Self);
  sTmpDir := ExtractFilePath((Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile);

  try
    SetCurrentDir(sTmpDir);
    sMikParameter := sMikPar + ' ' + ChangeFileExt(sTmpFile, EmptyStr);

    if actDosMinimizedAlways.Checked then
      wOption := SW_SHOWMINIMIZED
    else
      wOption := SW_RESTORE;

    CheckViewer(sExtension, '.dvi', actCloseDVIViewer);

    CheckViewer(sExtension, '.pdf', actClosePDFViewer);

    if bWait then
    begin
      if (sBibPar <> 'N') then
      begin
        sBibParameter := sBibPar + ' ' + RemoveFileExtension(sTmpFile);
        // The three steps below are necessary to incorporate the complete citations from bibtex resource

        if ExecCmdLineAndWait(sMikParameter, wOption) then
        else
          CloseCompileLaTeX;

        if ExecCmdLineAndWait(sBibParameter, wOption) then
        else
          CloseCompileLaTeX;

        if ExecCmdLineAndWait(sMikParameter, wOption) then
        else
          CloseCompileLaTeX;
      end;

      if ExecCmdLineAndWait(sMikParameter, wOption) then
      begin
        if (sExtension = '.dvi') and actDviOpenAlways.Checked then
          ShellExecute(Handle, 'open', PChar(ChangeFileExt(sTmpFile, sExtension)
            ), '', '', sw_shownormal);

        if (sExtension = '.pdf') and actPdfOpenAlways.Checked then
          ShellExecute(Handle, 'open', PChar(ChangeFileExt(sTmpFile, sExtension)
            ), '', '', sw_shownormal);
      end
      else
        CloseCompileLaTeX;
    end
    else
    begin
      if OpenCmdLine(sMikParameter, wOption) then // Nothing to do
      else
        ProblemOpeningCompiled;
    end;
  except
    // TODO
  end;
  (Self.MDIChildren[i] as TfrmEditor).Cursor := oldCursor;
end;

procedure TfrmTinnMain.actLatexToDviSingleExecute(Sender: TObject);
begin
  CompileLaTeX(sParDviSingle, 'N', '.dvi', actDviOpenAlways.Checked);
end;

procedure TfrmTinnMain.actLatexToDviBibtexExecute(Sender: TObject);
begin
  CompileLaTeX(sParDviSingle, sParDviBibtex, '.dvi', actDviOpenAlways.Checked);
end;

procedure TfrmTinnMain.actLatexToPdfSingleExecute(Sender: TObject);
begin
  CompileLaTeX(sParPdfSingle, 'N', '.pdf', actPdfOpenAlways.Checked)
end;

procedure TfrmTinnMain.actLatexToPdfBibtexExecute(Sender: TObject);
begin
  CompileLaTeX(sParPdfSingle, sParPdfBibtex, '.pdf', actPdfOpenAlways.Checked)
end;

// Reload file from disk
procedure TfrmTinnMain.actReloadExecute(Sender: TObject);
var

  bcPos, i, iResp, iTopLine: integer;

begin
  // Check for modification
  i := FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor).EditorFile.iModified = 1) then
  begin
    iResp := MessageDlg((Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile + #13 +
      #13 + 'If you reload this file, you will loose all changes.' + #13 +
      'Do you want to reload the file?', mtConfirmation, [mbYes, mbCancel], 0);

    case iResp of
      idCancel:
        Abort;
    end;
  end;

  with (Self.MDIChildren[i] as TfrmEditor) do
  begin
    if not FileExists(EditorFile.sFile) then
    begin
      MessageDlg(EditorFile.sFile + #13 + #13 + 'The file does not exist anymore.',
        mtWarning, [mbOk], 0);
      Exit;
    end;
    sciEditor.Lines.BeginUpdate;
    iTopLine := sciEditor.GetFirstVisibleLine;
    bcPos := sciEditor.GetCurrentPos;

    sciEditor.Lines.LoadFromFile(EditorFile.sFile);
    //seeEncoding := LoadFromFile(sciEditor.Lines, sActiveFile,
    //  GetEncoding(sActiveFile, bbBOM), bbBOM);

    //GetFile_Info(sActiveFile, sciEditor.Lines);

    EditorFile.iModified := 0;
    showmessage('sci migration: check Modify status');
    //sciEditor.Modified := False;
    SetFileSize_StatusBar(EditorFile.sFile);
    CheckSaveStatus;
    SetTitles;

    sciEditor.SetCurrentPos(bcPos);

    sciEditor.SetFirstVisibleLine(iTopLine);
    sciEditor.Lines.EndUpdate;
  end;
end;

(*
  // It is not working nice for PDF under Windows 7 -> replaced for the below
  procedure TfrmTinnMain.OpenFileWithViewer(sFilter, sDefaultExt, sPathViewer: string);
  var
  od         : TOpenDialog;
  sFile,
  sParameter: string;

  begin
  od           := TOpenDialog.Create(Self);
  od.InitialDir:= sWorkingDir;
  od.FileName  := EmptyStr;
  od.Filter    := sFilter;
  od.DefaultExt:= sDefaultExt;
  try
  if od.Execute then begin
  frmTinnMain.Refresh;
  sFile:= od.FileName;
  if FileExists(sFile) then begin
  try
  CheckProcessingPath(sPathViewer);
  if (ExtractFileExt(sFile)= '.pdf') then begin
  sParameter:= sPathViewer + ' ' + sFile;
  OpenCmdLine(sParameter, SW_SHOWNORMAL);
  end
  else begin
  sParameter:= sPathViewer + ' --single-instance ' + sFile;
  OpenCmdLine(sParameter, SW_HIDE);
  end;
  except
  MessageDlg(sFile + #13 + #13 +
  'It wasn''t possible to open the file above!',
  mtError, [mbOk], 0);
  Exit;
  end;  // try
  end;  // if (od.Execute)
  end;
  finally
  FreeAndNil(od);
  end;
  end;
*)

procedure TfrmTinnMain.OpenFileWithViewer(sFilter, sDefaultExt: string);
var
  od: TOpenDialog;
  sFile: string;

begin
  od := TOpenDialog.Create(Self);
  od.InitialDir := sWorkingDir;
  od.FileName := EmptyStr;
  od.Filter := sFilter;
  od.DefaultExt := sDefaultExt;
  try
    if od.Execute then
    begin
      frmTinnMain.Refresh;
      sFile := od.FileName;

      if FileExists(sFile) then
      begin
        try
          ShellExecute(Handle, 'open', PChar(sFile), '', '', sw_shownormal);
        except
          MessageDlg(sFile + #13 + #13 +
            'It wasn''t possible to open the file above!', mtError, [mbOk], 0);
          Exit;
        end;
      end;

    end;
  finally
    FreeAndNil(od);
  end;
end;

procedure TfrmTinnMain.actDviOpenFileExecute(Sender: TObject);
begin
  OpenFileWithViewer('Dvi (*.dvi)|*.dvi', '.dvi');
end;

procedure TfrmTinnMain.actPdfOpenFileExecute(Sender: TObject);
begin
  OpenFileWithViewer('Pdf (*.pdf)|*.pdf', '.pdf');
end;

procedure TfrmTinnMain.actHtmlOpenFileExecute(Sender: TObject);
begin
  OpenFileWithViewer('Html (*.html, *.htm)|*.html; *.htm', '.html; .htm')
end;

procedure TfrmTinnMain.actHtmlOpenCurrentFileExecute(Sender: TObject);
var
  sFile: string;
  i: integer;

begin
  i := FindTopWindow;

  if not Assigned(Self.MDIChildren[i] as TfrmEditor) then
    Exit;
  sFile := (Self.MDIChildren[i] as TfrmEditor).EditorFile.sFile;

  if (ExtractFileExt(sFile) <> '.html') then
    Exit;
  try
    ShellExecute(0, 'open', PChar(sFile), nil, nil, sw_shownormal);
  except
    MessageDlg('Browser is not accessible!', mtInformation, [mbOk], 0);
  end;
end;

procedure TfrmTinnMain.actDviOpenAlwaysExecute(Sender: TObject);
begin
  actDviOpenAlways.Checked := not actDviOpenAlways.Checked;
end;

procedure TfrmTinnMain.actToolsPandocConversionExecute(Sender: TObject);
var
  dlg: TfrmPandoc;

begin
  try
    dlg := TfrmPandoc.Create(Self);
    with dlg do
    begin
      rdgFrom.ItemIndex := iPandocFrom;
      rdgTo.ItemIndex := iPandocTo;
      PandocHistory := sPandocHistory;
    end;

    if (dlg.ShowModal = mrOK) then
    begin
      with dlg do
      begin
        iPandocFrom := rdgFrom.ItemIndex;
        iPandocTo := rdgTo.ItemIndex;
        sPandocHistory := PandocHistory;
        sPandocHistoryFrom := PandocHistoryFrom;
        sPandocHistoryTo := PandocHistoryTo;
        PandocConversion(sPandocInstruction, sPandocFrom, sPandocTo);

        if actHtmlOpenAlways.Checked then
          actHtmlOpenCurrentFileExecute(nil);
      end;
    end;
  finally
    with dlg do
    begin
      iPandocFrom := rdgFrom.ItemIndex;
      iPandocTo := rdgTo.ItemIndex;
    end;

    FreeAndNil(dlg);
  end;
end;

procedure TfrmTinnMain.actPdfOpenAlwaysExecute(Sender: TObject);
begin
  actPdfOpenAlways.Checked := not actPdfOpenAlways.Checked;
end;

procedure TfrmTinnMain.actHtmlOpenAlwaysExecute(Sender: TObject);
begin
  actHtmlOpenAlways.Checked := not actHtmlOpenAlways.Checked;
end;

procedure TfrmTinnMain.SetToolbarProcessing(sFileExtension: string);

  function MatchExtension(sTmp: string; aTmp: array of string): Boolean;
  var
    i: integer;

  begin
    Result := False;
    for i := low(aTmp) to high(aTmp) do
      if (sTmp = aTmp[i]) then
      begin
        Result := True;
        Exit;
      end;
  end;

  procedure SetBrowser(bTmp: Boolean);
  begin
    actHtmlOpenCurrentFile.Enabled := bTmp;
  end;

  procedure SetDeplate(bTmp: Boolean);
  begin
    actDeplateToLaTeX.Enabled := bTmp;
    actDeplateToLaTeXDramatist.Enabled := bTmp;
    actDeplateToSweave.Enabled := bTmp;
    actDeplateToPlain.Enabled := bTmp;
    actDeplateToHtml.Enabled := bTmp;
    actDeplateToHtmlSite.Enabled := bTmp;
    actDeplateToHtmlSlides.Enabled := bTmp;
    actDeplateToXhtmlTransitional.Enabled := bTmp;
    actDeplateToXhtmlMathMl.Enabled := bTmp;
    actDeplateToPhp.Enabled := bTmp;
    actDeplateToDocbookArticle.Enabled := bTmp;
    actDeplateToDocbookBook.Enabled := bTmp;
    actDeplateToDocbookReference.Enabled := bTmp;
  end;

  procedure SetMarkdown(bTmp: Boolean);
  begin
    // TODO
  end;

  procedure SetTxt2tags(bTmp: Boolean);
  begin
    actTxt2tagsToLatex.Enabled := bTmp;
    actTxt2tagsToSweave.Enabled := bTmp;
    actTxt2tagsToHtml.Enabled := bTmp;
    actTxt2tagsToTxt.Enabled := bTmp;
    actTxt2tagsToXhtml.Enabled := bTmp;
    actTxt2tagsToSgml.Enabled := bTmp;
    actTxt2tagsToLout.Enabled := bTmp;
    actTxt2tagsToMan.Enabled := bTmp;
    actTxt2tagsToMgp.Enabled := bTmp;
    actTxt2tagsToWiki.Enabled := bTmp;
    actTxt2tagsToGwiki.Enabled := bTmp;
    actTxt2tagsToDoku.Enabled := bTmp;
    actTxt2tagsToMoin.Enabled := bTmp;
    actTxt2tagsToPm6.Enabled := bTmp;
  end;

  procedure SetTex(bTmp: Boolean);
  begin
    actLatexToDviSingle.Enabled := bTmp;
    actLatexToDviBibtex.Enabled := bTmp;
    actLatexToPdfSingle.Enabled := bTmp;
    actLatexToPdfBibtex.Enabled := bTmp;
    actLatexMakeIndex.Enabled := bTmp;
  end;

const
  aBrowser: array [0 .. 3] of string = ('.htm', '.html', '.php', '.xhtml');

  aDeplate: array [0 .. 4] of string = ('.dp', '.dpt', '.dplt',
    '.deplate', '.txt');

  aTxt2tags: array [0 .. 3] of string = ('.t2', '.t2t', '.txt2tags', '.txt');

var
  sExt: string;

begin
  sExt := lowerCase(sFileExtension);
  if (sExt = EmptyStr) then
    Exit;

  // Browser
  if (MatchExtension(sExt, aBrowser)) then
    SetBrowser(True)
  else
    SetBrowser(False);

  (*
    // Deplate
    if (MatchExtension(sExt, aDeplate)) then SetDeplate(True)
    else SetDeplate(False);
  *)
  SetDeplate(True); // any file extension

  (*
    // Txt2tags
    if (MatchExtension(sExt, aTxt2tags)) then SetTxt2tags(True)
    else SetTxt2tags(False);
  *)
  SetTxt2tags(True); // any file extension

  // MikTeX
  if (sExt = '.tex') then
    SetTex(True)
  else
    SetTex(False);
end;

procedure TfrmTinnMain.actDoCommentsExecute(Sender: TObject);
var
  pTmp: Pointer;

begin
  with modDados.cdComments do
    pTmp := GetBookmark;
  Application.CreateForm(TfrmComments, frmComments);

  with frmComments do
    try
      ShowModal;
    finally
      frmTinnMain.Refresh;
      FreeAndNil(frmComments);
    end;

  with modDados.cdComments do
  begin
    if BookmarkValid(pTmp) then
      GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;



procedure TfrmTinnMain.actDoMirrorsExecute(Sender: TObject);
var
  pTmp: Pointer;

begin
  with modDados.cdRmirrors do
    pTmp := GetBookmark;
  Application.CreateForm(TfrmRmirrors, frmRmirrors);

  with frmRmirrors do
    try
      ShowModal;
    finally
      frmTinnMain.Refresh;
      FreeAndNil(frmRmirrors);
    end;

  with modDados.cdRmirrors do
  begin
    if BookmarkValid(pTmp) then
      GoToBookmark(pTmp);
    FreeBookmark(pTmp);
  end;
end;

procedure TfrmTinnMain.actDoRCardExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmRcard, frmRcard);
  try
    frmRcard.LoadExistingCard;
    frmRcard.ShowModal;
  finally
    FreeAndNil(frmRcard);
  end;
end;

procedure TfrmTinnMain.actDosMinimizedAlwaysExecute(Sender: TObject);
begin
  actDosMinimizedAlways.Checked := not actDosMinimizedAlways.Checked;
end;

procedure TfrmTinnMain.pmenResultsOpenLinkMeasureItem(Sender: TObject;
  ACanvas: TCanvas; var Width, Height: integer);
begin
  with frmTools.tvSearch do
    if (Selected = nil) or (Selected.Level < 2) then
      pmenResultsOpenLink.Enabled := False
    else
      pmenResultsOpenLink.Enabled := True;
end;

procedure TfrmTinnMain.pmenRResContTCPConnectionClick(Sender: TObject);
begin
end;
{
procedure TfrmTinnMain.UpdateFile(var seEditor: TSynEdit;
  var smOption: TSynSelectionMode);
var
  bcPos: TBufferCoord;
  iLine: integer;
  pMemo: TPoint;

begin
  if (pgFiles.PageCount < 1) or not SavePriorClipboardText then
  begin
    seEditor.SelectionMode := smOption;
    MessageDlg('No memory available.' + #13 + 'Please, repeat the action!',
      mtInformation, [mbOk], 0);
    Exit;
  end;

  with seEditor do
  begin
    iLine := TopLine;
    bcPos := CaretXY;
  end;
  -- m.p. Spell disabled
    with frmTools.memSpell do
    begin
    pMemo := CaretPos;
    Clipboard.AsText := Text;
    // This option is to enable undo and redo after the correction
    CaretPos := pMemo;
    end;
  --
  with seEditor do
  begin
    BeginUpdate;
    if SelAvail then
      PasteFromClipboard // Partial correction
    else
    begin
      ExecuteCommand(ecEditorTop, #0, nil);
      ExecuteCommand(ecSelectAll, #0, nil);
      PasteFromClipboard;
      ExecuteCommand(ecDeleteLastChar, #0, nil);
      // The spell add a not desired empty line to the end
    end;
    TopLine := iLine;
    CaretXY := bcPos;
    SelectionMode := smOption;
    EndUpdate;
  end;
  RestorePriorClipboardText;
end;
}
procedure TfrmTinnMain.TabMenuPopup(pcTmp: TPageControl; X, Y: integer);
var
  hi: TTCHitTestInfo;
  p: TPoint;

begin
  hi.pt.X := X;
  hi.pt.Y := Y;
  hi.flags := 0;
  p.X := pcTmp.Left + X;
  p.Y := pcTmp.Top + Y;
  p := ClientToScreen(p);
  pabPgFiles.Popup(p.X, p.Y)
end;

procedure TfrmTinnMain.actAplicationExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmTinnMain.actShortcutsCustomizationSaveExecute(Sender: TObject);
begin
  //
end;

procedure TfrmTinnMain.actShortcutsEditExecute(Sender: TObject);
var
  pTmp: Pointer;
  n: integer;

  sShortcuts: array of string;

  procedure RemoveShortcuts;
  var
    i: integer;

  begin
    // Reset all shortcuts
    with frmTinnMain.alMain do
    begin
      n := ActionCount;
      SetLength(sShortcuts, n);

      for i := 0 to n - 1 do
        If (Actions[i] is TAction) then
        begin
          sShortcuts[i] := ShortCutToText(TAction(Actions[i]).ShortCut);
          TAction(Actions[i]).ShortCut := TextToShortCut('None');
        end;
    end;
  end;

begin
  with modDados.cdShortcuts do
    pTmp := GetBookmark;
  Application.CreateForm(TfrmShortcuts, frmShortcuts);

  with frmShortcuts do
    try
  //    RemoveShortcuts;
      ShowModal;
  {    with modDados.cdShortcuts do
      begin
        if BookmarkValid(pTmp) then
          GoToBookmark(pTmp);
        FreeBookmark(pTmp);
      end;      }
    finally
{      frmTinnMain.Refresh;
      FreeAndNil(frmShortcuts);
      DatasetToActionList(Self);
      SetFocus_Main;    }
    end;
end;

procedure TfrmTinnMain.actShortcutsHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Shortcuts"');
end;

procedure TfrmTinnMain.actFindExecute(Sender: TObject);
var seEditor: TDScintilla;
begin
  seEditor := frmTinnMain.GetEditorWithFocus;
  sciLastSearchEditor :=seEditor;

  if seEditor = nil then
    exit;
  Find(seEditor);
end;

procedure TfrmTinnMain.actFindAgainExecute(Sender: TObject);
var seEditor: TDScintilla;
begin
  seEditor := frmTinnMain.GetEditorWithFocus;
  if seEditor = nil then
    exit;

    FindAgain;
end;

procedure TfrmTinnMain.actReplaceExecute(Sender: TObject);
var seEditor: TDScintilla;
begin
  seEditor := frmTinnMain.GetEditorWithFocus;
  if seEditor = nil then
    exit;
  Replace(seEditor);
end;

procedure TfrmTinnMain.actGotoLineExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    GotoLine;
end;

procedure TfrmTinnMain.actCopyFormattedRtfExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    CopyFormattedRtf;
end;

procedure TfrmTinnMain.actCopyFormattedHtmlExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    CopyFormattedHtml;
end;

procedure TfrmTinnMain.actCopyFormattedTeXExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    CopyFormattedTeX;
end;

procedure TfrmTinnMain.actFileSaveExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
  begin
    FileSave(Self);
  //  GetFile_Info(sActiveFile, sciEditor.Lines);
  end;
end;

procedure TfrmTinnMain.actFileSaveAsExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
  begin
    FileSaveAs(Self);
   // GetFile_Info(sActiveFile, sciEditor.Lines);
  end;
end;

procedure TfrmTinnMain.actFullPathUnixExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    FullPathUnix;

  SetFocus_Main;
end;

procedure TfrmTinnMain.actFullPathWindowsExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    FullPathWindows;

  SetFocus_Main;
end;

procedure TfrmTinnMain.actDateStampExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    DateStamp;
end;

procedure TfrmTinnMain.actIndentBlockExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    IndentBlock;
end;

procedure TfrmTinnMain.actEditUndoExecute(Sender: TObject);

var
  cFocus: TObject;

begin

  cFocus :=  GetFocusedObject;

    if cFocus.ClassName = 'TDScintilla' then
      (cFocus AS TDScintilla).Undo else
    if cFocus.ClassName = 'TButtonedEdit' then
      (cFocus AS TButtonedEdit).Undo else
    if cFocus.ClassName = 'TMemo' then
      (cFocus AS TMemo).Undo else
    if cFocus.ClassName = 'TDBEdit' then
      (cFocus AS TDBEdit).Undo;

end;





procedure TfrmTinnMain.actExplorerRefreshExecute(Sender: TObject);
begin
  frmTools.jvflbWinExplorer.Refresh;
end;

procedure TfrmTinnMain.actUnindentBlockExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    UnindentBlock;
end;

procedure TfrmTinnMain.actUpperCaseExecute(Sender: TObject);
begin
  (Self.MDIChildren[FindTopWindow] as TfrmEditor).EdUpperCase;
end;

procedure TfrmTinnMain.actHelpUserGuideExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Contents"');
end;

procedure TfrmTinnMain.actHelpWhatsNewExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"What is new?"');
end;

procedure TfrmTinnMain.actANSIExecute(Sender: TObject);
begin
 { actANSI.Checked := True;
  seeEncoding_NewFile := seANSI;
  sefDefault := sfANSI;    }
end;

procedure TfrmTinnMain.actUTF8Execute(Sender: TObject);
begin
 { actUTF8.Checked := True;
  seeEncoding_NewFile := seUTF8;
  sefDefault := sfUTF8; }
end;

procedure TfrmTinnMain.actUTF16LEExecute(Sender: TObject);
begin
{  actUTF16LE.Checked := True;
  seeEncoding_NewFile := seUTF16LE;
  sefDefault := sfUTF16LSB;  }
end;

procedure TfrmTinnMain.actUTF16BEExecute(Sender: TObject);
begin
{  actUTF16BE.Checked := True;
  seeEncoding_NewFile := seUTF16BE;
  sefDefault := sfUTF16MSB;  }
end;

procedure TfrmTinnMain.actLowerCaseExecute(Sender: TObject);
begin
  (Self.MDIChildren[FindTopWindow] as TfrmEditor).EdLowerCase;
end;

procedure TfrmTinnMain.actInvertCaseExecute(Sender: TObject);
begin
  (Self.MDIChildren[FindTopWindow] as TfrmEditor).EdInvertCase;
end;

procedure TfrmTinnMain.MatchBracket(seEditor: TDScintilla);
var
  cTmp: WideChar;
  iPos, ibm: integer;

  sAtCursor: String;

begin
  with seEditor do
  begin
    if (GetSelectionStart <> GetSelectionend) then
      Exit;
    iPos := GetSelectionStart;
    cTmp := chr(GetCharAt(iPos ));
    sAtCursor := cTmp;

    if not(CharInSet(cTmp, AllBrackets)) then
      Exit;

    ibm := BraceMatch(iPos );
    if ibm <> -1 then
    begin
      SetCurrentPos(ibm);
      SetAnchor(GetCurrentPos);
      BraceHighlight(ibm, iPos);
      ScrollCaret;
      EnsureVisible(seeditor.GetCurLine(sAtCursor));
    end;
  end
end;

procedure TfrmTinnMain.menChaLinEndWINClick(Sender: TObject);
begin
  //SetBuffer_FileFormat(sffDOS);
end;

procedure TfrmTinnMain.menChaLinEndMACClick(Sender: TObject);
begin
 // SetBuffer_FileFormat(sffMAC);
end;

procedure TfrmTinnMain.MakeTemplate(sTemplateFile: string; iHiglighterID: Integer);
var EditorFile: TEditorFile;
begin
  inc(iFileCount);
  while FindWindowByName('Untitled' + IntToStr(iFileCount)) <> -1 do
    inc(iFileCount);

  with EditorFile do
  begin
   iId:= GetNewUniqueEditorId;
   sFile:= 'Untitled' + IntToStr(iFileCount);
   iNewFile:= 1;
   iModified:= 0;
   iUnsavedChanges:= 0;
   sMarks:= '';
   sTempFile:= sTemplateFile;
   iTopLine:= 0;
   iCaretPosition := 0;
   sFolding:= '';
   iLexerId:= iHiglighterID;
   iTabPosition:= pgFiles.PageCount + 1;
  end;
  LoadFile(EditorFile);
end;

procedure TfrmTinnMain.actTemplateREmptyExecute(Sender: TObject);
begin
  MakeTemplate(sPathTinnR + '\templates\R doc_empty.Rd', SCLEX_R);
end;

procedure TfrmTinnMain.menFileTemplateRhtmlClick(Sender: TObject);
begin
  MakeTemplate(sPathTinnR + '\templates\R html.Rhtml', SCLEX_R);
end;

procedure TfrmTinnMain.actMatchBracketExecute(Sender: TObject);
var
  seEditor: TDScintilla;
begin
  seEditor := frmtinnmain.GetEditorWithFocus;
  if seEditor = nil then
    exit;

  MatchBracket(seEditor);
end;

procedure TfrmTinnMain.actCommentsEditExecute(Sender: TObject);
begin
  sCommentsBookMark := modDados.cdComments.Bookmark;
  actDoCommentsExecute(nil);
  SetFocus_Main;
end;

procedure TfrmTinnMain.actCommentsHelpExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Comments"');
end;

procedure TfrmTinnMain.actCompletionExecute(Sender: TObject);
begin
    DoCompletionInsert(True);
end;



procedure TfrmTinnMain.actRtermLogLineWrapExecute(Sender: TObject);
var
  seLog: TDScintilla;

begin
  actRtermLogLineWrap.Checked := not actRtermLogLineWrap.Checked;

  if actRtermLogLineWrap.Checked  then
    iLogLineWrap := SC_WRAP_WORD
  else  iLogLineWrap := SC_WRAP_NONE;

  seLog := frmRterm.sciLog;

  ToggleWrapMode(seLog, iLogLineWrap);
end;

procedure TfrmTinnMain.actInvertSelectionExecute(Sender: TObject);
begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    InvertSelection;
end;

procedure TfrmTinnMain.actRtermIOLineWrapExecute(Sender: TObject);
begin
  actRtermIOLineWrap.Checked := not actRtermIOLineWrap.Checked;

  if actRtermIOLineWrap.Checked  then
    iIOLineWrap := SC_WRAP_WORD
  else  iIOLineWrap := SC_WRAP_NONE;

   ToggleWrapMode(frmRterm.sciIO, iIOLineWrap);
end;

procedure TfrmTinnMain.GetComments;
var
 // scHighlighter, scBBHighlighter, scBEHighlighter: TSynCustomHighlighter;

  sLanguage: string;

begin
  sBeginComment := '#';
  sEndComment := '';
  {// Get Highlighter (and check for mistake selection in multisyn case)
  if frmTools.cbComAutoDetect_Language.Checked then
  begin
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    begin
      if (sciEditor.GetSelText <> '') then
      begin
        //scBBHighlighter := GetBBHighLighter; // Highlighter of the block begin
        //scBEHighlighter := GetBEHighLighter; // Highlighter of the block end

        if (scBBHighlighter <> scBEHighlighter) then
          Exit; // Will no be commented!
      end;

     // scHighlighter := GetCurrentHighLighter;
    end;

    sLanguage := scHighlighter.GetFriendlyLanguageName;
    modDados.SetCurrentHighlighter(sLanguage);
  end;

  with modDados do
  begin
    // SetCurrentHighlighter(sLanguage);
    with cdComments do
    begin
      DisableControls;
      sLineComment := Fields[1].AsString; // Line
      sBeginComment := Fields[2].AsString; // Begin
      sEndComment := Fields[3].AsString; // End
      EnableControls;
    end;
  end;

  if (frmTools.cbComPriority_Line.Checked) and (sLineComment <> EmptyStr) then
  begin
    // Line by line
    sBeginComment := sLineComment;
    sEndComment := EmptyStr;
  end
  else if (sBeginComment = EmptyStr) or (sEndComment = EmptyStr) then
  begin
    // Line by line if and only if one (Begin or End) is empty
    sBeginComment := sLineComment;
    sEndComment := EmptyStr;
  end;}
end;

procedure TfrmTinnMain.actCommentExecute(Sender: TObject);
begin
  sBeginComment := EmptyStr; // Initial status

  GetComments;
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    Comment(sBeginComment, sEndComment);
end;

procedure TfrmTinnMain.actUnfoldAllExecute(Sender: TObject);
var seEditor: TDscintilla;
    iFold: Integer;
begin
  if not GetActiveEditorOrNil(seEditor) then
    exit;


  iFold := -1;
  repeat
    iFold := seEditor.ContractedFoldNext(iFold);
    if iFold > -1 then
      seEditor.ToggleFold(iFold);
  until iFold = -1;
end;

procedure TfrmTinnMain.actUncommentExecute(Sender: TObject);
begin
  sBeginComment := EmptyStr; // Initial status

  GetComments;
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    Uncomment(sBeginComment, sEndComment);
end;

procedure TfrmTinnMain.actFileCloseExecute(Sender: TObject);
begin
  (Self.MDIChildren[FindTopWindow] as TfrmEditor).Close;
  if (pgFiles.PageCount > 0) then
    pgFilesChange(nil);
end;

procedure TfrmTinnMain.actFileCloseOthersExecute(Sender: TObject);
var
  i, iChildID: integer;

  sTmp, sActiveChild: string;

begin
  i := 0;
  sActiveChild := pgFiles.ActivePage.Hint;
  while (pgFiles.PageCount > 1) do
  begin
    pgFiles.ActivePageIndex := i;
    sTmp := pgFiles.ActivePage.Hint;
    if (sTmp <> sActiveChild) then
    begin
      iChildID := FindWindowByName(sTmp);

      with (Self.MDIChildren[iChildID] as TfrmEditor) do
      begin
        bCloseCanceled := False;
        Close;
        if bCloseCanceled then
          Exit;
      end;

    end
    else
      i := 1; // activeChild has now index = 0
  end;
  pgFiles.ActivePageIndex := 0;
end;

procedure TfrmTinnMain.actFileCloseAllExecute(Sender: TObject);
var
  iChildID: integer;
  sTmp: string;

begin
  while (pgFiles.PageCount > 0) do
  begin
    pgFiles.ActivePageIndex := 0;
    sTmp := pgFiles.ActivePage.Hint;
    iChildID := FindWindowByName(sTmp);

    with (Self.MDIChildren[iChildID] as TfrmEditor) do
    begin
      bCloseCanceled := False;
      Close;
      if bCloseCanceled then
        Exit;;
    end;

  end;
  if (pgFiles.PageCount = 0) then
    ClearStatusBar;
end;

procedure TfrmTinnMain.actFileCloseRightExecute(Sender: TObject);
var
  iTotPages, iPos, iNumToClose, iChildID: integer;
  sTmp: string;

begin
  iPos := pgFiles.ActivePageIndex;
  iTotPages := pgFiles.PageCount - 1;
  iNumToClose := iTotPages - iPos;
  if (iNumToClose = 0) then
    Exit;
  repeat
    sTmp := pgFiles.Pages[iPos + 1].Hint;
    iChildID := FindWindowByName(sTmp);

    with (Self.MDIChildren[iChildID] as TfrmEditor) do
    begin
      bCloseCanceled := False;
      Close;
      if bCloseCanceled then
        Exit;
    end;

    dec(iNumToClose);
  until (iNumToClose = 0);
  pgFiles.ActivePageIndex := iPos;
end;

procedure TfrmTinnMain.actFileCloseLeftExecute(Sender: TObject);
var
  iPos, iChildID: integer;
  sTmp: string;

begin
  iPos := pgFiles.ActivePageIndex;
  if (iPos = 0) then
    Exit;
  repeat
    sTmp := pgFiles.Pages[iPos - 1].Hint;
    iChildID := FindWindowByName(sTmp);

    with (Self.MDIChildren[iChildID] as TfrmEditor) do
    begin
      bCloseCanceled := False;
      Close;
      if bCloseCanceled then
        Exit;;
    end;

    dec(iPos);
  until (iPos = 0);
  pgFiles.ActivePageIndex := iPos;
end;

procedure TfrmTinnMain.actCopyFileListExecute(Sender: TObject);
var
  strl: TStringList;
  i: integer;
begin
  //
  // Possible extension:
  // -
  // - show an option window on execute
  // - options:
  // - chose destionation (current editor, .csv, R data.frame...)
  // - chose format ( un/quoted, line breaks, include or exculde file extension and path)
  //
  if (pgFiles.PageCount = 0) then
    Exit;

  with frmTools.jvflbWinExplorer do
  begin
    if Count > 0 then
    begin
      strl := TStringList.Create;
      strl.CommaText := Items.CommaText;

      for i := 0 to Count - 1 do
        strl[i] := quotedstr(ChangeFileExt(strl[i], '')) + ', ';
      strl[0] := 'c(' + strl[0];
      strl[Count - 1] := copy(strl[Count - 1], 1, Length(strl[Count - 1])
        - 2) + ')';

      i := FindTopWindow;

      {
        if (MDIChildren[i] as TfrmEditor).sciEditor.SelAvail then }
      (MDIChildren[i] as TfrmEditor).sciEditor.ReplaceSel(strl.Text); { else
        begin
        (MDIChildren[i] as TfrmEditor).sciEditor.SelStart := 0;
        (MDIChildren[i] as TfrmEditor).sciEditor.SelLength := 0;
        (MDIChildren[i] as TfrmEditor).sciEditor.SelText := strl.Text
        end; }
      strl.Free;
    end;
  end;
end;

procedure TfrmTinnMain.actCopyFormattedExecute(Sender: TObject);
begin
  // Nothing, but don't remove!
end;

procedure TfrmTinnMain.actRExplorerBasicExecute(Sender: TObject);
begin
  // Nothing, but don't remove!
end;

procedure TfrmTinnMain.MySort(iSort: integer);

  procedure UpdateSort;
  var
    tmpTopLine: integer;
    seEditor: TDScintilla;

  begin
    if (pgFiles.PageCount < 1) then
      Exit;
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
      if sActiveEditor = 'sciEditor' then
        seEditor := sciEditor
      else
        seEditor := sciEditor2;

    with seEditor do
    begin
      tmpTopLine := getFirstVisibleLine;
      if not (GetSelText  <> '') then
        SelectAll;
      Paste;
      SetFirstVisibleLine(tmpTopLine);
    end;
  end;

var
  bSorted: Boolean;
  meTmp: TMemo;
  seEditor: TDScintilla;
  slTmp: TStringList;

  function SortMemo: Boolean;
  var
    sStructure: string;
    wYear, wMonth, wDay: Word;

  begin
    Result := False;
    bSorted := False;
    try
      slTmp.Text := TrimRight(meTmp.Text);
      case iSort of
        1:
          slTmp.Sort;
        2:
          slTmp.CustomSort(SortInteger);
        3:
          slTmp.CustomSort(SortDate);
      end;

      meTmp.Text := TrimRight(slTmp.Text);
      Result := True;
      bSorted := True;
    except
      on e: exception do
      begin
        DecodeDate(Now, wYear, wMonth, wDay);

        sStructure := '   Month: ' + IntToStr(wMonth) + #13 + '   Day    : ' +
          IntToStr(wDay) + #13 + '   Year   : ' + IntToStr(wYear);

        MessageDlg(e.message + '!' + #13 + #13 + 'Your date system is set as ' +
          DateToStr(Now) + #13 + sStructure + #13 + #13 +
          'So, please, before to repeat this procedure,' + #13 +
          'change the system or correct the dates!', mtWarning, [mbOk], 0);
      end;
    end;
  end;

begin
  if not SavePriorClipboardText then
    Exit;
  try
    slTmp := TStringList.Create;
    meTmp := TMemo.Create(nil);
    meTmp.Parent := panInvisibleParent;

    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
      if (sActiveEditor = 'sciEditor') then
        seEditor := sciEditor
      else
        seEditor := sciEditor2;

    with seEditor do
    begin
      if GetSelText <>'' then
        meTmp.Text := GetSelText;
      // else meTmp.Lines:= Lines;

      if SortMemo then
      begin
        meTmp.SelectAll;
        meTmp.CopyToClipboard;
      end;

    end;

    if bSorted then
      UpdateSort;
  finally
    RestorePriorClipboardText;
    FreeAndNil(slTmp);
    FreeAndNil(meTmp);
  end;
end;

procedure TfrmTinnMain.namesselection1Click(Sender: TObject);
var
  sTmp: string;
  sciEditor: TDScintilla;
begin
  if not ValidRRunning then
    Exit;

  if not GetActiveEditorOrNil(sciEditor) then
    exit;

  //sTmp := trim(sciEditor.GetSelText);
  sTmp := trim(FindWord);
  if sTmp = '' then
    exit;
  sTmp := 'names('+sTmp+')';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actSortStringExecute(Sender: TObject);
begin
  MySort(1); // String
end;

procedure TfrmTinnMain.actSortNumberExecute(Sender: TObject);
begin
  MySort(2); // Number
end;

procedure TfrmTinnMain.actSortDateExecute(Sender: TObject);
begin
  MySort(3); // Date
end;

procedure TfrmTinnMain.actOrganizeScreenExecute(Sender: TObject);
var
  i: integer;

begin
  if not Rgui_Running then
    Exit;

  (*
    0: Tinn-R on top
    1: Tinn-R on bottom
    2: Tinn-R on left
    3: Tinn-R on right

    SetWindowPos(hwnd,
    -1,
    left,
    top,
    width,
    high,
    SWP_SHOWWINDOW)
  *)

  for i := 1 to 2 do
    // Once just is not enough for all flavors of the OS Windows!
    case iRguiTinnRDisposition of
      0:
        begin // 0: Tinn-R on top
          // Set Tinn-R position
          SetWindowPos(frmTinnMain.Handle, HWND_TOP, 0, 0, Screen.Width,
            (Screen.Height * iRguiTinnRProportion div 100), SWP_SHOWWINDOW);

          // Set Rgui position
          SetWindowPos(hRgui, HWND_TOP, 0,
            (Screen.Height * iRguiTinnRProportion div 100), Screen.Width,
            Screen.Height - (Screen.Height * iRguiTinnRProportion div 100) - 30,
            SWP_SHOWWINDOW);
        end;
      1:
        begin // 1: Tinn-R on bottom
          // Tinn-R
          SetWindowPos(frmTinnMain.Handle, HWND_TOP, 0,
            Screen.Height - (Screen.Height * iRguiTinnRProportion div 100),
            Screen.Width, (Screen.Height * iRguiTinnRProportion div 100) - 30,
            SWP_SHOWWINDOW);

          // Rgui
          SetWindowPos(hRgui, HWND_TOP, 0, 0, Screen.Width,
            Screen.Height - (Screen.Height * iRguiTinnRProportion div 100),
            SWP_SHOWWINDOW);
        end;
      2:
        begin // 2: Tinn-R on left
          // Tinn-R
          SetWindowPos(frmTinnMain.Handle, HWND_TOP, 0, 0,
            (Screen.Width * iRguiTinnRProportion div 100), Screen.Height - 30,
            SWP_SHOWWINDOW);

          // Rgui
          SetWindowPos(hRgui, HWND_TOP,
            (Screen.Width * iRguiTinnRProportion div 100), 0,
            Screen.Width - (Screen.Width * iRguiTinnRProportion div 100),
            Screen.Height - 30, SWP_SHOWWINDOW);
        end;
      3:
        begin // 3: Tinn-R on right
          // Tinn-R
          SetWindowPos(frmTinnMain.Handle, HWND_TOP,
            Screen.Width - (Screen.Width * iRguiTinnRProportion div 100), 0,
            (Screen.Width * iRguiTinnRProportion div 100), Screen.Height - 30,
            SWP_SHOWWINDOW);

          // Rgui
          SetWindowPos(hRgui, HWND_TOP, 0, 0,
            Screen.Width - (Screen.Width * iRguiTinnRProportion div 100),
            Screen.Height - 30, SWP_SHOWWINDOW);
        end;
    end;

  bAlreadyOrganized := True;
  Self.WindowState := wsNormal;
  SetFocus_Rgui(iDelay);
end;

procedure TfrmTinnMain.DoIPConnection(sIPHost: string; iIPPort: integer;
  bActive: Boolean);
begin
  csREnvironment.Host := sIPHost;
  csREnvironment.Port := iIPPort;
  csRExplorer.Host := sIPHost;
  csRExplorer.Port := iIPPort;
  csRGeneral.Host := sIPHost;
  csRGeneral.Port := iIPPort;
  csRtip.Host := sIPHost;
  csRtip.Port := iIPPort;

  csMainBase.Host := sIPHost;
  csMainBase.Port := iIPPort;

  csMainBase.Active := bActive;
  csREnvironment.Active := bActive;
  csRExplorer.Active := bActive;



  csRGeneral.Active := bActive;
  csRtip.Active := bActive;
  bTCPIPRunning := bActive;



  //showmessage(csRexplorer.Socket.LocalAddress);
  //showmessage(inttostr(csRexplorer.Socket.LocalPort));

end;

procedure TfrmTinnMain.DoRConnection(sTmp: string; bActive, bSendTask: Boolean);
var
  sToSend: string;
begin

  if bSendTask then
  begin // Rterm local must be running!
    CheckRterm;
    sToSend := sTmp + #13#10;
    frmRterm.cRterm.SendInput(sToSend);
    SendToConsole(sTmp);
  end;

  SetFocus_Rgui(iDelay div 4);
  if bIPLocal then
    DoIPConnection(sIPHostLocal, iIPPortLocal, bActive)
  else
    DoIPConnection(sIPHostRemote, iIPPortRemote, bActive);
end;

procedure TfrmTinnMain.DoRguiConnection(sTmp: string; bActive: Boolean);
begin
  if not Rgui_Running then
    Exit;
  fCodeSender.SendChar(sTmp, hRgui);

  Sleep(2 * iDelay div 3);
  if bIPLocal then
    DoIPConnection(sIPHostLocal, iIPPortLocal, bActive)
  else
    DoIPConnection(sIPHostRemote, iIPPortRemote, bActive);
end;

procedure TfrmTinnMain.actRContTCPConnectionExecute(Sender: TObject);
var
  sStart, sStop: string;

begin
  if bIPLocal then
  begin
    sStart := 'startSocketServer(port=' + IntToStr(iIPPortLocal) + ')';

    sStop := 'stopSocketServer(port=' + IntToStr(iIPPortLocal) + ')'
  end
  else
  begin
    sStart := 'startSocketServer(port=' + IntToStr(iIPPortRemote) + ')';

    sStop := 'stopSocketServer(port=' + IntToStr(iIPPortRemote) + ')';
  end;

  try
    // It will connect
    if not actRContTCPConnection.Checked then
    begin
      // Related to Rterm local
      if Rterm_Running and bIPLocal then
      begin
        DoRConnection(sStart, True, True);
        Exit;
      end;

      // Related to R (gui or term) remote
      if not bIPLocal then
      begin
        DoRConnection(sStart, True, False);
        if (RHistory = nil) then
          RHistory := TRHistory.Create;

        Exit;
      end;

      // Related to Rgui local
      if Rgui_Running then
      begin
        DoRguiConnection(sStart, True);

      end;
    end
    // It will disconnect
    else
    begin
      bTCPIPRunning := False; // For all R

      // Related to Rterm local
      if Rterm_Running and bIPLocal then
      begin
        DoRConnection(sStop, False, True);
        Exit;
      end;

      // Related to R (gui or term) remote
      if not bIPLocal then
      begin
        DoRConnection(sStop, False, False);
        Exit;
      end;

      // Related to Rgui local
      if Rgui_Running then
        DoRguiConnection(sStop, False);
    end;
  except
    // TODO
  end
end;

procedure TfrmTinnMain.actRContGuiStartCloseExecute(Sender: TObject);
var
  resShellExecute: HINST;
  sTmp: string;

  procedure DefineRWorkDir;
  begin
    with pgFiles do
      if (PageCount > 0) and FileExists(ActivePage.Hint) then
        sTmp := ExtractFilePath(ActivePage.Hint)
      else
        sTmp := ExtractFilePath(sPathRgui);
  end;

  function IsRQuestionRunning(sCaption: string): Boolean;
  var
    tmpHandle: HWND;

  begin
    Result := False;
    tmpHandle := GetWindowHandle(PChar(sCaption));
    if (tmpHandle <> 0) then
      Result := True;
  end;

  procedure ReturnPreviousStates;
  begin
    // On Top
    if bOnTop then
    begin
      OnTop(Application.Handle);
      actOnTop.Checked := True;
      CheckTop;
    end
    else
    begin
      OnTop(Application.Handle);
      actOnTop.Checked := False;
    end;

    // ReturnFocus
    if bRguiReturnFocus then
    begin
      actRguiReturnFocus.Checked := True;
      SetFocus_Rgui(iDelay);
    end
    else
      actRguiReturnFocus.Checked := False;
  end;

begin
  if (actRContGuiStartClose.Caption = 'Rgui (start)') then
  begin
    // Will check the path of Rgui executable
    if (sPathRgui = EmptyStr) then
    begin
      if (MessageDlg('The preferred Rterm was not defined.' + #13 +
        'Do you desire to set this now?', mtConfirmation, [mbYes, mbNo], 0)
        = mrYes) then
      begin
        bStartOptionsWithRPage := True;
        actShowAppOptionsExecute(Self);
      end
      else
        Exit;
    end;

    if not FileExists(sPathRgui) or (ExtractFileExt(sPathRgui) <> '.exe') then
    begin
      sTmp := sPathRgui;
      if (sTmp = EmptyStr) then
        sTmp := 'Empty';
      MessageDlg(sTmp + #13 + #13 + 'The file above is not executable!' + #13 +
        'Please, set Rgui path at: Options/Application/R/Path (R)/Rgui',
        mtError, [mbOk], 0);
      Exit;
    end;

    // Will open preferred Rgui
    DefineRWorkDir;
    resShellExecute := RunFile(sPathRgui, sParRgui, sTmp);
    if (resShellExecute <= 32) then
      PSendMessage(resShellExecute); // function fail
    if (RHistory = nil) then
      RHistory := TRHistory.Create;
    bRRequireKnitr := True;
  end
  else
  begin // Close preferred Rgui
    // Disable OnTop (Temporary)
    if bOnTop then
    begin
      SetWindowPos(Application.Handle, HWND_NOTOPMOST, 0, 0, 0, 0,
        SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE or SWP_NOSENDCHANGING);

      actOnTop.Checked := False;
    end;

    // Disable ReturnFocus (Temporary)
    if bRguiReturnFocus then
      actRguiReturnFocus.Checked := False;
    Application.ProcessMessages;

    if UseTCPIP then
    begin
      sTmp := 'q()' + #13#10;
      PrintMessage(sTmp, True);
      csRGeneral.Socket.SendText(sTmp)
    end
    else if Rgui_Running then
    begin
      sTmp := 'q()';
      fCodeSender.SendChar(sTmp, hRgui);
      bRRequireKnitr := False;
    end;

    Sleep(iDelay);
    while IsRQuestionRunning('Question') do;

    ReturnPreviousStates;
  end;
end;

procedure TfrmTinnMain.actFilesFullPathUnixExecute(Sender: TObject);
var
  sFilePath: string;

begin
  with frmTools.tvProject do
  begin
    SetFocus;

    if (Selected.Level = 2) then
    begin
      sFilePath := trim(string(Selected.Data));
      if FileExists(sFilePath) then
        Clipboard.AsText := DosPathToUnixPath(sFilePath)
      else
        MessageDlg(trim(sFilePath) + #13 + #13 + 'File not found!', mtWarning,
          [mbOk], 0);
    end
    else
      MessageDlg('Please, choice a valid file!', mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmTinnMain.actFilesFullPathWindowsExecute(Sender: TObject);
var
  sFilePath: string;

begin
  with frmTools.tvProject do
  begin
    SetFocus;

    if (Selected.Level = 2) then
    begin
      sFilePath := trim(string(Selected.Data));
      if FileExists(sFilePath) then
        Clipboard.AsText := sFilePath
      else
        MessageDlg(trim(sFilePath) + #13 + #13 + 'File not found!', mtWarning,
          [mbOk], 0);
    end
    else
      MessageDlg('Please, choice a valid file!', mtWarning, [mbOk], 0);
  end;
end;

procedure TfrmTinnMain.DoTxt2Tag(iButton: integer);
var
  seEditor: TDScintilla;

begin
  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if sActiveEditor = 'sciEditor' then
      seEditor := sciEditor
    else
      seEditor := sciEditor2;

  with seEditor do
  begin
    case iButton of
      // =============================
      // Marks
      // =============================
      // Title 1
      1:
        if GetSelText <>'' then
          ReplaceSel( '= ' + GetSelText + ' =')
        else
        begin
          ReplaceSel( '= ' + ' =');
          SetCaretX(GetCaretX(seEditor)- 2, seEditor);
        end;
      // Title 2
      2:
        if GetSelText <>'' then
          ReplaceSel( '== ' + GetSelText + ' ==')
        else
        begin
          ReplaceSel( '== ' + ' ==');
          SetCaretX(GetCaretX(seEditor)- 3, seEditor);
        end;
      // Title 3
      3:
        if GetSelText <>'' then
          ReplaceSel( '=== ' + GetSelText + ' ===')
        else
        begin
          ReplaceSel( '=== ' + ' ===');
          SetCaretX(GetCaretX(seEditor)- 4, seEditor);
        end;
      // Title 4
      4:
        if GetSelText <>'' then
          ReplaceSel( '==== ' + GetSelText + ' ====')
        else
        begin
          ReplaceSel( '==== ' + ' ====');
          SetCaretX(GetCaretX(seEditor)- 5, seEditor);
        end;
      // Title 5
      5:
        if GetSelText <>'' then
          ReplaceSel( '===== ' + GetSelText + ' =====')
        else
        begin
          ReplaceSel( '===== ' + ' =====');
          SetCaretX(GetCaretX(seEditor)- 6, seEditor);
        end;
      // Title num. 1
      6:
        if GetSelText <>'' then
          ReplaceSel( '+ ' + GetSelText + ' +')
        else
        begin
          ReplaceSel( '+ ' + ' +');
          SetCaretX(GetCaretX(seEditor)- 2, seEditor);
        end;
      // Title num. 2
      7:
        if GetSelText <>'' then
          ReplaceSel( '++ ' + GetSelText + ' ++')
        else
        begin
          ReplaceSel( '++ ' + ' ++');
          SetCaretX(GetCaretX(seEditor)- 3, seEditor);
        end;
      // Title num. 3
      8:
        if GetSelText <>'' then
          ReplaceSel( '+++ ' + GetSelText + ' +++')
        else
        begin
          ReplaceSel( '+++ ' + ' +++');
          SetCaretX(GetCaretX(seEditor)- 4, seEditor);
        end;
      // Title num. 4
      9:
        if GetSelText <>'' then
          ReplaceSel( '++++ ' + GetSelText + ' ++++')
        else
        begin
          ReplaceSel( '++++ ' + ' ++++');
          SetCaretX(GetCaretX(seEditor)- 5, seEditor);
        end;
      // Title num. 5
      10:
        if GetSelText <>'' then
          ReplaceSel( '+++++ ' + GetSelText + ' +++++')
        else
        begin
          ReplaceSel( '+++++ ' + ' +++++');
          SetCaretX(GetCaretX(seEditor)- 6, seEditor);
        end;
      // Bold
      11:
        if GetSelText <>'' then
          ReplaceSel( '**' + GetSelText + '**')
        else
        begin
          ReplaceSel( '**' + '**');
          SetCaretX(GetCaretX(seEditor)- 2, seEditor);
        end;
      // Italic
      12:
        if GetSelText <>'' then
          ReplaceSel( '//' + GetSelText + '//')
        else
        begin
          ReplaceSel( '//' + '//');
          SetCaretX(GetCaretX(seEditor)- 2, seEditor);
        end;
      // Underline
      13:
        if GetSelText <>'' then
          ReplaceSel( '__' + GetSelText + '__')
        else
        begin
          ReplaceSel( '__' + '__');
          SetCaretX(GetCaretX(seEditor)- 2, seEditor);
        end;
      // Mono
      14:
        if GetSelText <>'' then
          ReplaceSel( '``' + GetSelText + '``')
        else
        begin
          ReplaceSel( '``' + '``');
          SetCaretX(GetCaretX(seEditor)- 2, seEditor);
        end;
      // Quote
      15:
        if GetSelText <>'' then
          ReplaceSel( '  ' + GetSelText)
        else
          ReplaceSel( '  ');
      // List
      16:
        if GetSelText <>'' then
          ReplaceSel( '- ' + GetSelText)
        else
          ReplaceSel( '-');
      // List num.
      17:
        if GetSelText <>'' then
          ReplaceSel( '+ ' + GetSelText)
        else
          ReplaceSel( '+');
      // List def.
      18:
        if GetSelText <>'' then
          ReplaceSel( ': ' + GetSelText)
        else
          ReplaceSel( ':');
      // Link
      19:
        if GetSelText <>'' then
          ReplaceSel( '[' + GetSelText + ']')
        else
        begin
          ReplaceSel( '[]');
          SetCaretX(GetCaretX(seEditor)- 1, seEditor);
        end;
      // Anchor
      20:
        if GetSelText <>'' then
          ReplaceSel( '[' + GetSelText + ']')
        else
        begin
          ReplaceSel( '[]');
          SetCaretX(GetCaretX(seEditor)- 1, seEditor);
        end;
      // Verbatin line
      21:
        if GetSelText <>'' then
          ReplaceSel( '``` ' + GetSelText)
        else
          ReplaceSel( '```');
      // Verbatin area
      22:
        if GetSelText <>'' then
        begin
          ReplaceSel( '```' + #13 + GetSelText + #13 + '```');
          SetCaretX(GetCaretX(seEditor)- 3, seEditor);
          LineDown;

        end
        else
        begin
          ReplaceSel( '```' + #13 + #13 + '```');
          SetCaretX(GetCaretX(seEditor)- 3, seEditor);
          LineUp;
        end;
      // Raw text
      23:
        if GetSelText <>'' then
          ReplaceSel( '""' + GetSelText + '""')
        else
        begin
          ReplaceSel( '""' + '""');
          SetCaretX(GetCaretX(seEditor)- 2, seEditor);
        end;
      // Raw line
      24:
        if GetSelText <>'' then
          ReplaceSel( '"""' + GetSelText)
        else
          ReplaceSel( '""" ');
      // Raw area
      25:
        if GetSelText <>'' then
        begin
          ReplaceSel( '"""' + #13 + GetSelText + #13 + '"""');
          SetCaretX(GetCaretX(seEditor)- 3, seEditor);
          LineDown;
        end
        else
        begin
          ReplaceSel( '"""' + #13 + #13 + '"""');
          SetCaretX(GetCaretX(seEditor)- 3, seEditor);
          LineUp;
        end;
      // Image
      26:
        if GetSelText <>'' then
          ReplaceSel( '[' + GetSelText + ']')
        else
        begin
          ReplaceSel( '[]');
          SetCaretX(GetCaretX(seEditor)- 1, seEditor);
        end;
      // Comments
      27:
        if GetSelText <>'' then
          ReplaceSel( '% ' + GetSelText)
        else
          ReplaceSel( '% ');
      // Table
      28:
        if GetSelText <>'' then
          ReplaceSel( '|' + GetSelText)
        else
          ReplaceSel( '|');
      // Line sep.
      29:
        if GetSelText <>'' then
          ReplaceSel( '--------------------' + GetSelText)
        else
          ReplaceSel( '--------------------');
      // Line sep. double
      30:
        if GetSelText <>'' then
          ReplaceSel( '=====================' + GetSelText)
        else
          ReplaceSel( '=====================');
      // =============================
      // Macros
      // =============================
      // Date
      31:
        if GetSelText <>'' then
          ReplaceSel( '%%date() ' + GetSelText)
        else
          ReplaceSel( '%%date()');
      // Modification time
      32:
        if GetSelText <>'' then
          ReplaceSel( '%%mtime() ' + GetSelText)
        else
          ReplaceSel( '%%mtime()');
      // Path source
      33:
        if GetSelText <>'' then
          ReplaceSel( '%%infile() ' + GetSelText)
        else
          ReplaceSel( '%%infile()');
      // Path destination
      34:
        if GetSelText <>'' then
          ReplaceSel( '%%outfile() ' + GetSelText)
        else
          ReplaceSel( '%%outfile()');
      // Table of content
      35:
        if GetSelText <>'' then
          ReplaceSel( '%%toc ' + GetSelText)
        else
          ReplaceSel( '%%toc ');
      // Document title
      36:
        begin
          seEditor.DocumentStart ;

          ReplaceSel( 'Document title' + #13 + 'Author name, email' + #13 +
            '%%date(%b/%d/%Y)' + #13 + #13);
        end;
      // =============================
      // Settings
      // =============================
      // Target
      37:
        if GetSelText <>'' then
          ReplaceSel( '%!target: ' + GetSelText)
        else
          ReplaceSel( '%!target: ');
      // Options
      38:
        if GetSelText <>'' then
          ReplaceSel( '%!options(): ' + GetSelText)
        else
          ReplaceSel( '%!options(): ');
      // Pre processor
      39:
        if GetSelText <>'' then
          ReplaceSel( '%!preproc: ' + GetSelText)
        else
          ReplaceSel( '%!preproc: ');
      // Post processor
      40:
        if GetSelText <>'' then
          ReplaceSel( '%!postproc(): '+ GetSelText)
        else
          ReplaceSel( '%!postproc(): ');
      // Encoding
      41:
        if GetSelText <>'' then
          ReplaceSel( '%!encoding: ' + GetSelText)
        else
          ReplaceSel( '%!encoding: ');
      // Style
      42:
        if GetSelText <>'' then
          ReplaceSel( '%!style: ' + GetSelText)
        else
          ReplaceSel( '%!style: ');
    end;
  end;
end;

procedure TfrmTinnMain.LabelClick(Sender: TObject);
var
  i: integer;

begin
  i := FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then
    Exit;
  DoTxt2Tag((Sender as TLabel).Tag);
  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
    WM_SETFOCUS, 0, 0);
end;

procedure TfrmTinnMain.UdatePgFiles;
begin

end;

procedure TfrmTinnMain.UpdateBars(bOption: Boolean);
begin

  with ctbMain do
  begin
    Align := alTop;
    Visible := bOption;
  end;
  UdatePgFiles;
end;

procedure TfrmTinnMain.actShowAllBarsExecute(Sender: TObject);
begin
  with actShowAllBars do
  begin
    Checked := not Checked;
    UpdateBars(Checked)
  end;
end;

procedure TfrmTinnMain.actRContPackagesExecute(Sender: TObject);
begin
  // Don't remove!
end;

procedure TfrmTinnMain.actRContPacAvailableExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (CheckConnection = False) then
    Exit;

  sTmp := 'available.packages()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacInstallExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (CheckConnection = False) then
    Exit;

  sTmp := 'utils:::menuInstallPkgs()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacInstallZipExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp := 'utils:::menuInstallLocal()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacInstalledExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp := 'installed.packages()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacLoadExecute(Sender: TObject);
var
  sTmp: string;

begin
  (* Don't working inside of Rterm
    sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE)))' + #13 +
    '  if(nchar(pkg)) library(pkg, character.only=TRUE)})';' +
  *)
  sTmp := 'local({pkg <- select.list(sort(.packages(all.available = TRUE))); if(nchar(pkg)) library(pkg, character.only=TRUE)})';
  DoSend(sTmp);
end;

// Install TinnRcom from TinnRcom_X.X.X.zip
procedure TfrmTinnMain.actRContPacInstTinnRcomExecute(Sender: TObject);

  function IsPackageInstalled(sName: string): Boolean;
  var
    i, j: integer;

  begin
    Result := False;

    i := 1;
    repeat
      Sleep(10 * iDelay);

      for j := 0 to (slRLibPaths.Count - 1) do
        if SysUtils.DirectoryExists(slRLibPaths.Strings[j] + sName) then
        begin
          Result := True;
          Exit;
        end;

      inc(i);
    until (i = 50);
  end;

  procedure InstallPackage(var sName: string);
  var
    sTmp, sDepends, sFull, sFilePath, sToSend: string;

  begin
    // Will install the package
    sTmp := 'install.packages(' + '''' + sName + '''' + ', ' +
      'repos=NULL' + ')';

    sDepends := FileToString(sUtilsOrigin + '\Rinstall.R');

    sDepends := StringReplace(sDepends, '%repos', sRmirror, []);

    sFull := sDepends + #13 + sTmp;

    sFilePath := sPathTmp + '\fTmp.R';

    if FileSaveFast(sFilePath, sFull) then
      sToSend := 'source(' + '''' + DosPathToUnixPath(sFilePath) + '''' + ')';

    DoSend(sToSend);

    //stbMain.Panels[7].Text := 'Please, wait...';
    //stbMain.Panels[8].Text := 'Installing package: ' + sName;

    Application.ProcessMessages;
  end;

var
  i: integer;

  sToInstall, sLatest: string;

  uOption: TModalResult;
  srTmp: TSearchRec;
  bNot: Boolean;

const
  sName = '\TinnRcom';

begin
  uOption := mrNone;

  if (CheckConnection = False) then
  begin
    Beep;
    Exit;
  end;

  Screen.Cursor := crHourglass;

  tRRuning.Enabled := False; // It is important!

  bNot := False;

  // The user can be more than one source of the package.
  // So will install the latest version
  sLatest := 'TinnRcom_00.00.00.zip';

  try
    // Try to find the source of TinnRcom package
    if FindFirst(sPathTinnRcom + '\TinnRcom_?.?.??.zip', faAnyFile, srTmp) = 0
    then
    begin
      repeat
        if (AnsiCompareStr(srTmp.Name, sLatest) > 0) then
          sLatest := srTmp.Name;
      until FindNext(srTmp) <> 0;

      // Must free up resources used by these successful finds
      FindClose(srTmp);
    end;

    if (sLatest = 'TinnRcom_0.0.0.zip') then
    begin
      MessageDlg(sPathTinnRcom + '\' + #13 + #13 +
        'It was not possible to found a valid version of TinnRcom package in the path above.'
        + #13 + #13 +
        'If it was manual (or accidentally) removed, please make a dowload and try it again!',
        mtError, [mbOk], 0);
      bNot := True;
      Exit;
    end;

    // TinnRcom package
    sToInstall := DosPathToUnixPath(sPathTinnRcom + '\' + sLatest);

    if not Assigned(slRLibPaths) then
    begin
      MessageDlg
        ('The necessary information about ''TinnRcom package'' from R are not available.'
        + #13 + #13 +
        'Please, enable it at: ''Options/Application/R/Basic/Get information/TinnRcom (package)''!',
        mtWarning, [mbOk], 0);
      Exit;
    end;

    for i := 0 to (slRLibPaths.Count - 1) do
      if SysUtils.DirectoryExists(slRLibPaths.Strings[i] + sName) then
      begin
        if bRTinnRcom_Updating then
          MessageDlg('Package to install: ' + sLatest + #13 + #13 +
            'Package installed: ' + 'TinnRcom' + '_' +
            sVersion_TinnRcomInstalled + #13 + '(' + slRLibPaths.Strings[i] +
            sName + ')' + #13 + #13 +
            'The TinnRcom package will be updated to the latest version!',
            mtWarning, [mbOk], 0)
        else
          uOption := MessageDlg('Package to install: ' + sLatest + #13 + #13 +
            'Package installed: ' + 'TinnRcom' + '_' +
            sVersion_TinnRcomInstalled + #13 + '(' + slRLibPaths.Strings[i] +
            sName + ')' + #13 + #13 +
            'Do you really want to install/reinstall it?', mtConfirmation,
            [mbYes, mbNo], 1);
        case uOption of
          mrNo:
            begin
              bNot := True;
              Exit;
            end;
        end;
      end;

    InstallPackage(sToInstall);

    bRTinnRcom_Installed := IsPackageInstalled(sName);

    if (bRTinnRcom_Installed) then
    begin
      Sleep(5 * iDelay); // R is not fast to install TinnRcom package

      //stbMain.Panels[7].Text := 'Done!';
      //stbMain.Panels[8].Text := 'Installed package: TinnRcom';

      bRTinnRcom_Updating := False;
      Application.ProcessMessages;
    end
    else
    begin
      //stbMain.Panels[7].Text := 'Error!';
      //stbMain.Panels[8].Text := 'Not installed package: TinnRcom';

      Application.ProcessMessages;
    end;
  finally
    tRRuning.Enabled := True;



    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;

procedure TfrmTinnMain.actRContPacLoadTinnRcomExecute(Sender: TObject);
var
  sTmp: string;

begin
  Screen.Cursor := crHourglass;
  sTmp := 'library(TinnRcom)';
  DoSend(sTmp);
  Sleep(10 * iDelay);
  bRTinnRcom_Loaded := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmTinnMain.actRContPacNewExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (CheckConnection = False) then
    Exit;

  sTmp := 'new.packages()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacRemoveExecute(Sender: TObject);
var
  sTmp: string;

begin
  (* Don't working inside of Rterm
    sTmp:= 'local({pkg <- select.list(sort(.packages(all.available = TRUE)))' + #13 +
    '  if(nchar(pkg)) remove.packages(pkg)})';
  *)
  sTmp := 'local({pkg <- select.list(sort(.packages(all.available = TRUE))); if(nchar(pkg)) remove.packages(pkg)})';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacStatusExecute(Sender: TObject);
var
  sTmp: string;

begin
  if (CheckConnection = False) then
    Exit;

  sTmp := 'packageStatus()';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actRContPacUpdateExecute(Sender: TObject);
var
  sTmp: string;

begin
  // sTmp:= 'update.packages(ask=''graphics'')';
  if (CheckConnection = False) then
    Exit;

  sTmp := 'update.packages(checkBuilt=TRUE, ask=FALSE)';
  DoSend(sTmp);
end;

procedure TfrmTinnMain.actnReopenPseudoExecute(Sender: TObject);
begin
  //
end;

procedure TfrmTinnMain.actnReopenPseudoFileExecute(Sender: TObject);
begin
  //
end;

procedure TfrmTinnMain.acReopenFile10Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenFile2Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenFile3Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenFile4Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenFile5Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenFile6Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenFile7Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenFile8Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenFile9Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.acReopenFile1Execute(Sender: TObject);
begin
  RecentProjectOpen((Sender as TAction).Caption);
end;

procedure TfrmTinnMain.Action1Execute(Sender: TObject);
begin
  //
end;

procedure TfrmTinnMain.actWebRWikiExecute(Sender: TObject);
begin
  OpenUrl('http://wiki.r-project.org');
end;

procedure TfrmTinnMain.actWebRInfoCRANExecute(Sender: TObject);
begin
  OpenUrl('cran.r-project.org/');
end;

procedure TfrmTinnMain.actWebRNewsExecute(Sender: TObject);
begin
  OpenUrl('cran.r-project.org/doc/Rnews/');
end;

procedure TfrmTinnMain.actHelpEfficientUseExecute(Sender: TObject);
begin
  OpenUserGuidePDF('"Some Secrets for an Efficient Use"');
end;

procedure TfrmTinnMain.actHelpPandocExecute(Sender: TObject);
begin
  OpenHelpFile('\sample\pandoc.markdown');
end;

procedure TfrmTinnMain.actHelpRecognizedWordsExecute(Sender: TObject);
begin
  OpenHelpFile('\doc\Tinn-R_recognized words.r');
end;

procedure TfrmTinnMain.actHelpScriptExecute(Sender: TObject);
begin
  OpenHelpFile('\sample\Tinn-R_example of script.r');
end;

procedure TfrmTinnMain.actnHighlighterPesudoExecute(Sender: TObject);
begin
//showmessage((Sender AS TAction).Caption);
end;

procedure TfrmTinnMain.actPseudoEncodingExecute(Sender: TObject);
begin
  //
end;

procedure TfrmTinnMain.actQuoteExecute(Sender: TObject);
begin
  (Self.MDIChildren[FindTopWindow] as TfrmEditor).QuoteWords;
end;

procedure TfrmTinnMain.UpdateCloseFileOptions;
begin
  if (pgFiles.PageCount > 1) then
  begin
    if (pgFiles.ActivePageIndex = 0) then
    begin // First
      actFileCloseAll.Enabled := True;
      actFileCloseOthers.Enabled := True;
      actFileCloseLeft.Enabled := False;
      actFileCloseRight.Enabled := True;
    end
    else if (pgFiles.ActivePageIndex = (pgFiles.PageCount - 1)) then
    begin // Last
      actFileCloseAll.Enabled := True;
      actFileCloseOthers.Enabled := True;
      actFileCloseLeft.Enabled := True;
      actFileCloseRight.Enabled := False;
    end
    else
    begin // Among
      actFileCloseAll.Enabled := True;
      actFileCloseOthers.Enabled := True;
      actFileCloseLeft.Enabled := True;
      actFileCloseRight.Enabled := True;
    end;
  end
  else
  begin // < 1
    actFileCloseAll.Enabled := False;
    actFileCloseOthers.Enabled := False;
    actFileCloseLeft.Enabled := False;
    actFileCloseRight.Enabled := False;
    actFileSaveAll.Enabled := False;
  end;
end;

function TfrmTinnMain.Rterm_Running: Boolean;
begin

  Result := False;

  if Assigned(frmRterm) then
    with frmRterm do
      Result := bRterm_Running;

  with actRguiReturnFocus do
    if Result then
      Enabled := False
    else
      Enabled := True
end;

function TfrmTinnMain.Rgui_Running: Boolean;
begin
  Result := false;
  //m.p. Rgui turned off !!!!!!!!!!!!!!!!
  exit;
  try
    Result := IsGuiRunning(hRgui, sGuiRRunning, iRguiRecognitionCaption,
      iRguiRecognitionType);

    if Result then
    begin
      fCodeSender.GuiHandle := hRgui;
      fCodeSender.GuiCaption := sGuiRRunning;
    end;
  except
    showmessage('''Rgui_Running'' error.');
  end;
end;

procedure TfrmTinnMain.LatexAccents(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
var sciEditor: TDScintilla;
    i: Integer;
begin
  if GetActiveEditorOrNil(sciEditor) then
  with Sender as TJvImagesViewer do
  begin
    i := SelectedIndex;
    if (i >= 0) then
      LatexAccents_Sub(sciEditor, ExtractFileName(Items[i].FileName));
  end;
end;

procedure TfrmTinnMain.actLatexDimensionalExecute(Sender: TObject);
var sciEditor: TDScintilla;
begin
  if GetActiveEditorOrNil(sciEditor) then
    LatexDimensional(sciEditor);
end;

procedure TfrmTinnMain.actLatexMakeIndexExecute(Sender: TObject);
var sciEditor: TDScintilla;
begin
  if GetActiveEditorOrNil(sciEditor) then
    LatexMakeIndex(sciEditor);
end;

procedure TfrmTinnMain.LatexHeader(Sender: TObject);
var sciEditor: TDScintilla;
begin
  if GetActiveEditorOrNil(sciEditor) then
    LatexHeader_Sub(sciEditor, (Sender as TAction).Tag);
end;

procedure TfrmTinnMain.LatexFont(Sender: TObject);
var sciEditor: TDScintilla;
begin
  if GetActiveEditorOrNil(sciEditor) then
    LatexFont_Sub(sciEditor, (Sender as TAction).Tag);
end;

procedure TfrmTinnMain.LatexFontSize(Sender: TObject);
var sciEditor: TDScintilla;
begin
  if GetActiveEditorOrNil(sciEditor) then
    LatexFontSize_Sub(sciEditor, (Sender as TAction).Tag);
end;

procedure TfrmTinnMain.LatexFormat(Sender: TObject);
var sciEditor: TDScintilla;
begin
  if GetActiveEditorOrNil(sciEditor) then
    LatexFormat_Sub(sciEditor, (Sender as TAction).Tag);
end;

procedure TfrmTinnMain.actLatexAlgebricFracExecute(Sender: TObject);
var sciEditor: TDScintilla;
begin
  if GetActiveEditorOrNil(sciEditor) then
    LatexAlgebricFrac(sciEditor);
end;

procedure TfrmTinnMain.actLatexAlgebricSqrtExecute(Sender: TObject);
var sciEditor: TDScintilla;
begin
  if GetActiveEditorOrNil(sciEditor) then
    LatexAlgebricSqrt(sciEditor);
end;

procedure TfrmTinnMain.actLatexAlgebricSqrtNExecute(Sender: TObject);
var sciEditor: TDScintilla;
begin
  if GetActiveEditorOrNil(sciEditor) then
    LatexAlgebricSqrtN(sciEditor);
end;


procedure TfrmTinnMain.actReloadLatexSymbolsExecute(Sender: TObject);
begin
  CheckLatex(True);
end;


procedure TfrmTinnMain.actRemoveLineBreaksExecute(Sender: TObject);
begin
  (Self.MDIChildren[FindTopWindow] as TfrmEditor).RemoveLineBreaks;
end;


procedure TfrmTinnMain.actCountExecute(Sender: TObject);

  function StripSpaces(s: string): string;
  var
    i, j, l: integer;

  begin
    i := 1;
    j := 1;
    l := Length(s);

    SetLength(Result, l);
    repeat
      if (s[i] > #32) then
      begin
        Result[j] := s[i];
        inc(j);
      end;
      inc(i);
    until (i = l + 1);
    SetLength(Result, j - 1);
  end;

  function Seps(cTmp: Char): Boolean;
  begin
    Result := CharInSet(cTmp, [#0 .. #$1F, ' ', '.', ',', '?', ':', ';', '(', ')',
      '/', '\']);
  end;

  function WordsCount(sTmp: string): longint;
  var
    i, iCount: longint;

  begin
    i := 1;
    iCount := 0;

    while (i <= Length(sTmp)) do
    begin
      while (i <= Length(sTmp)) and Seps(sTmp[i]) do
        inc(i);

      if (i <= Length(sTmp)) then
      begin
        inc(iCount);
        while (i <= Length(sTmp)) and (not Seps(sTmp[i])) do
          inc(i);
      end;
    end;

    Result := iCount;
  end;

var
  seEditor: TDScintilla;

  sTmp: string;

  dlg: TfrmCount;

  iChars, iCharsStripSpaces: integer;

  dWords, dChars, dCharsStripSpaces: double;

begin
  if ((Self.MDIChildren[FindTopWindow] as TfrmEditor) = nil) then
    Exit;

  with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    if sActiveEditor = 'sciEditor' then
      seEditor := sciEditor
    else
      seEditor := sciEditor2;

  with seEditor do
    if GetSelText <> '' then
      sTmp := GetSelText
    else
      sTmp := Text;

  dlg := TfrmCount.Create(Self);

  with dlg do
  begin
    iChars := Length(sTmp);

    if (sTmp <> EmptyStr) then
      iCharsStripSpaces := Length(StripSpaces(sTmp))
    else
      iCharsStripSpaces := 0;

    dWords := WordsCount(sTmp);
    dChars := iChars;
    dCharsStripSpaces := iCharsStripSpaces;

    with seEditor do
      if not (GetSelText <> '') then
        rdgCount.ItemIndex := 0
      else
        rdgCount.ItemIndex := 1;

    with strGrid do
    begin
      Cells[0, 0] := 'Words';
      Cells[0, 1] := 'Characters (+ spaces)';
      Cells[0, 2] := 'Characters (- spaces)';
      Cells[0, 3] := 'Spaces';

      Cells[1, 0] := FloatToStrF(dWords, ffNumber, 9, 0);
      Cells[1, 1] := FloatToStrF(dChars, ffNumber, 9, 0);
      Cells[1, 2] := FloatToStrF(dCharsStripSpaces, ffNumber, 9, 0);
      Cells[1, 3] := FloatToStrF((dChars - dCharsStripSpaces), ffNumber, 9, 0);
    end;
  end;

  try
    if (dlg.ShowModal <> mrOK) then
      Exit;
  finally
    FreeAndNil(dlg);
  end;
end;


procedure TfrmTinnMain.actRContTermStartCloseExecute(Sender: TObject);

  procedure CloseRterm;
  begin
     frmRterm.sciLog.Clear;

    //stbMain.Panels[8].Text := EmptyStr;

    with actRtermWarningError do
    begin
      Visible := False;
      Checked := False;
    end;

    frmRterm.cRterm.StopProcess;
    frmRterm.bRterm_Plus := False;
    bRRequireKnitr := False;
  end;

var
  sTmp: string;
  userOption: TModalResult;

begin
  if not Rterm_Running then
  begin
    // Will check the path of Rterm executable
    if (sPathRterm = '') then
    begin
      if (MessageDlg('The preferred Rterm was not defined.' + #13 +
        'Do you desire to set this now?', mtConfirmation, [mbYes, mbNo], 0)
        = mrYes) then
      begin

        bStartOptionsWithRPage := True;

        actShowAppOptionsExecute(Self);
      end
      else
        Exit;
    end;

    if not FileExists(sPathRterm) or (ExtractFileExt(sPathRterm) <> '.exe') then
    begin
      sTmp := sPathRterm;

      if (sTmp = EmptyStr) then
        sTmp := 'Empty';

      MessageDlg(sTmp + #13 + #13 + 'The file above is not executable!' + #13 +
        'Please, set Rterm path at: Options/Application/R/Path (R)/Rterm',
        mtError, [mbOk], 0);
      Exit;
    end;

    // Will open preferred Rterm
    if (RHistory = nil) then
      RHistory := TRHistory.Create;

    CheckRterm;
    frmRterm.sciLog.Clear;

    with frmRterm do
    begin
      sciIO.Lines.Clear;
      iSciWithFocus := 3;
      cRterm.RunProcess(sPathRterm + ' ' + sParRterm);
    end;

    bRRequireKnitr := True;
  end
  else
  begin

    CheckRterm;

    if bRtermCloseWithoutAsk then
      CloseRterm
    else
    begin
      userOption := MessageDlg('Save workspace image (Rhistory and Rdata)' + #13
        + 'in the current R work directory?', mtConfirmation,
        [mbYes, mbNo, mbCancel], 0);

      case userOption of
        mrYes:
          begin
            with frmRterm.sciIO do
            begin
              sTmp := 'save.image()';
              DoSend(sTmp);
            end;

            CloseRterm;
          end;

        mrNo:
          CloseRterm;

        mrCancel:
          begin
            bRtermOptionCancel := True;
            Exit;
          end;
      end;
    end;
  end;
end;

procedure TfrmTinnMain.SetInterfaceSize(frm: TForm; iSize: integer);
begin
  with JvDockServer do
  begin
    with LeftDockPanel do // Left
      if ContainsControl(frm) then
      begin
        Width := iSize;
        Exit;
      end;
    with TopDockPanel do // Top
      if ContainsControl(frm) then
      begin
        Height := iSize;
        Exit;
      end;
    with RightDockPanel do // Right
      if ContainsControl(frm) then
      begin
        Width := iSize;
        Exit;
      end;
    with BottomDockPanel do // Bottom
      if ContainsControl(frm) then
      begin
        Height := iSize;
        Exit;
      end;
  end;
end;

procedure TfrmTinnMain.DoUndoAutoHideRterm;

  // Source: http://stackoverflow.com/questions/14193967/how-can-you-tell-if-a-tjvdockserver-form-is-unpinned-or-pinned
  function IsUnpinned(jvClient: TJVDockClient):Boolean;
  begin
    result := false;
   if Assigned(jvClient) then
      if jvClient.DockState = JvDockState_Docking then
      begin
        // it's docked, so now try to determine if it's pinned (default state,
        // returns false) or unpinned (collapsed/hidden) and if unpinned, return true.
        if jvClient.DockStyle is TJvDockVSNetStyle then
        begin
          if Assigned(jvClient.ParentForm) and (jvClient.ParentForm.Parent.ClassName = 'TJvDockVSPopupPanel') then
          begin
            result := true;
          end;
        end;
      end;
  end;

begin
   if IsUnpinned(frmRTerm.JvDockClientRterm) then
   begin
     JvDockVSNetStyle.DoUnAutoHideDockForm(frmRterm);
     frmTinnmain.UpdateRterm_Appearance;
   end;
end;

procedure TfrmTinnMain.DoUndoAutoHideTools;
begin
  with JvDockVSNetStyle do
    if GetDockFormVisible(frmTools.JvDockClientTools) then
      DoUnAutoHideDockForm(frmTools);
end;

procedure TfrmTinnMain.actRtermMaximizeExecute(Sender: TObject);
begin
  actToolsMinimizeExecute(nil);
  if not actRtermVisible.Checked then
    actRtermVisibleExecute(nil);
  DoUndoAutoHideRterm;

  with JvDockServer do
    if LeftDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Width - 100) // Left
    else if TopDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Height - 100) // Top
    else if RightDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Width - 100) // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Height - 100); // Bottom

  SetFocus_Main;
end;

procedure TfrmTinnMain.actRtermDivideExecute(Sender: TObject);
begin
  if not actRtermVisible.Checked then
    actRtermVisibleExecute(nil);
  DoUndoAutoHideRterm;

  with JvDockServer do
    if LeftDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Width div 2 - 20) // Left
    else if TopDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Height div 2 - 20) // Top
    else if RightDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Width div 2 - 20) // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Height div 2 - 20); // Bottom

  SetFocus_Main;
end;

procedure TfrmTinnMain.actRtermMinimizeExecute(Sender: TObject);
begin
  if not actRtermVisible.Checked then
    actRtermVisibleExecute(nil);
  DoUndoAutoHideRterm;

  with JvDockServer do
    if LeftDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Width div 20) // Left
    else if TopDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Height div 20) // Top
    else if RightDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Width div 20) // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then
      SetInterfaceSize(frmRterm, frmTinnMain.Height div 20); // Bottom

  SetFocus_Main;
end;

procedure TfrmTinnMain.actToolsMaximizeExecute(Sender: TObject);
begin
  actRtermMinimizeExecute(nil);
  if not actToolsVisible.Checked then
    actToolsVisibleExecute(nil);
  DoUndoAutoHideTools;

  with JvDockServer do
    if LeftDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Width - 100) // Left
    else if TopDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Height - 100) // Top
    else if RightDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Width - 100) // Right
    else if BottomDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Height - 100); // Bottom
end;

procedure TfrmTinnMain.actToolsDivideExecute(Sender: TObject);
begin
  if not actToolsVisible.Checked then
    actToolsVisibleExecute(nil);
  DoUndoAutoHideTools;

  with JvDockServer do
    if LeftDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Width div 2 - 20) // Left
    else if TopDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Height div 2 - 20) // Top
    else if RightDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Width div 2 - 20) // Right
    else if BottomDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Height div 2 - 20); // Bottom
end;

procedure TfrmTinnMain.actToolsMinimizeExecute(Sender: TObject);
begin
  if not actToolsVisible.Checked then
    actToolsVisibleExecute(nil);
  DoUndoAutoHideTools;

  with JvDockServer do
    if LeftDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Width div 20) // Left
    else if TopDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Height div 20) // Top
    else if RightDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Width div 20) // Right
    else if BottomDockPanel.ContainsControl(frmTools) then
      SetInterfaceSize(frmTools, frmTinnMain.Height div 20); // Bottom
end;

procedure TfrmTinnMain.CheckIfFileFromDvi(sFile: string);
var
  iPos: integer;
  sLineNumber, sTmp: string;

begin
  iPos := pos(';', sFile);
  if (iPos > 0) then
  begin
    sLineNumber := copy(sFile, iPos + 1, Length(sFile));

    sFile := copy(sFile, 0, iPos - 1);

    // Clear complex path
    sTmp := InvertString(sFile);
    iPos := pos(':', sTmp);
    if (iPos <> 0) then
    begin
      sTmp := copy(sTmp, 0, iPos + 1);

      sFile := InvertString(sTmp);
    end;

    if FileExists(trim(sFile)) then
    begin
      OpenFileIntoTinn(sFile, StrToIntDef(sLineNumber, 0));
      if (pgFiles.PageCount > 0) then
        with TfrmEditor(MDIChildren[0]).sciEditor do
        begin
          SetFirstVisibleLine(StrToInt(sLineNumber));
          LineEnd;
          //ExecuteCommand(ecLineEnd, #0, nil);
          SelectToLineStart(TfrmEditor(MDIChildren[0]).sciEditor);
          //ExecuteCommand(ecSelLineStart, #0, nil);
        end;
    end
    else
      Exit
  end
  else if FileExists(trim(sFile)) then
    OpenFileIntoTinn(sFile);
end;

procedure TfrmTinnMain.OpenFileFromSearch;
var
  iPos, iEnd, iEdId: integer;
  pid: ^Integer;
  sFile, sTmp, sLineNumber: string;
  Editor: TFrmEditor;
  bFoundFile: Boolean;
begin
  with frmTools.tvSearch do
  begin
    bFoundFile := false;
    if (Selected = nil) or (Selected.Level < 2) then
      Exit;
    sTmp := Selected.Text;
    sFile := Selected.Parent.Text;
    iPos := pos('(', sTmp);

    if (iPos > 0) then
    begin
      iEnd := pos('):', sTmp);
      sLineNumber := copy(sTmp, iPos + 1, ((iEnd - iPos) - 1));
    end;

    if Selected.Parent.Parent.Text = 'Opened files' then
    begin
      pid := Selected.Data;
      iEdId := pid^;
      bFoundFile := GetEditorById(iEdId, Editor);
    end;

    if bFoundFile = false then
    begin
      if FileExists(trim(sFile)) then
      begin
        OpenFileIntoTinn(sFile, StrToIntDef(sLineNumber, 0));
        Editor := MDIChildren[FindTopWindow] as TfrmEditor;
        if trim(ansilowercase((Editor.EditorFile.sFile))) = trim(ansilowercase((sFile))) then
          bFoundFile := true;
      end;
    end;
  end;

  if not bFoundFile then
  begin
    MessageDlg(trim(sFile) + #13 + #13 + 'The file above was not found!',
    mtWarning, [mbOk], 0);
    Exit;
  end;

  with Editor.sciEditor do
  begin
    Editor.SetFocus;
    GotoLine(StrToInt(sLineNumber)-1);
    VerticalCentreCaret;
    SetFocus;
  end;
end;

procedure TfrmTinnMain.pmenResultsOpenLinkClick(Sender: TObject);
begin
  OpenFileFromSearch;
end;

procedure TfrmTinnMain.actSearchExpandOneExecute(Sender: TObject);
var
  i: integer;

  tnSelected: TTreeNode;

begin
  with frmTools.tvSearch do
  begin
    if (Items.Count = 0) then
      Exit;
    Items.BeginUpdate;

    if (Selected.Level > 1) then
      tnSelected := Selected.Parent
    else
      tnSelected := Selected;
    FullCollapse;

    for i := 0 to Items.Count - 1 do
      if (Items[i].Level = 0) then
        Items[i].Expand(False);

    TopItem := tnSelected;
    Selected := TopItem;
    Items.EndUpdate;
  end;
end;

procedure TfrmTinnMain.actSearchExpandAllExecute(Sender: TObject);
var
  tnSelected, tnOldSelected: TTreeNode;

begin
  with frmTools.tvSearch do
  begin
    if (Items.Count = 0) then
      Exit;
    tnOldSelected := Selected;

    if (Selected.Level > 1) then
      tnSelected := Selected.Parent
    else
      tnSelected := Selected;

    Items.BeginUpdate;
    FullExpand;
    TopItem := tnSelected;
    Selected := tnOldSelected;
    Items.EndUpdate;
  end;
end;

procedure TfrmTinnMain.actSearchCollapseOneExecute(Sender: TObject);
var
  i: integer;

  tnSelected, tnOldSelected: TTreeNode;

begin
  with frmTools.tvSearch do
  begin
    if (Items.Count = 0) then
      Exit;
    tnOldSelected := Selected;

    if (Selected.Level > 1) then
      tnSelected := Selected.Parent
    else
      tnSelected := Selected;
    Items.BeginUpdate;
    FullCollapse;

    for i := 0 to Items.Count - 1 do
      if (Items[i].Level = 0) then
        Items[i].Expand(False);

    TopItem := tnSelected;
    Selected := tnOldSelected;
    Items.EndUpdate;
  end;
end;

procedure TfrmTinnMain.actSearchCollapseAllExecute(Sender: TObject);
var
  tnSelected: TTreeNode;

begin
  with frmTools.tvSearch do
  begin
    if (Items.Count = 0) then
      Exit;
    if (Selected.Level > 1) then
      tnSelected := Selected.Parent
    else
      tnSelected := Selected;
    Items.BeginUpdate;
    FullCollapse;
    TopItem := tnSelected;
    Items.EndUpdate;
  end;
end;

procedure TfrmTinnMain.DoShowHide(iTmp1, iTmp2: integer; bShow: Boolean = True);
const
  // iSide: array [0 .. 3] of TJvDockPosition = (dpLeft, dpTop, dpRight, dpBottom);
  iSide: array [0 .. 3] of TJvDockPosition = (JvDockControlForm.dpLeft,
    JvDockControlForm.dpTop, JvDockControlForm.dpRight,
    JvDockControlForm.dpBottom);

begin
  if bShow then
    with JvDockServer do
    begin
      DockPanel[iSide[iTmp1]].Show;
      Splitter[iSide[iTmp1]].Show;
      case iTmp1 of
        0:
          DockPanel[iSide[iTmp1]].Width := iTmp2; // Left
        1:
          DockPanel[iSide[iTmp1]].Height := iTmp2; // Top
        2:
          DockPanel[iSide[iTmp1]].Width := iTmp2; // Right
        3:
          DockPanel[iSide[iTmp1]].Height := iTmp2; // Bottom
      end;
    end
  else
    with JvDockServer do
    begin
      Splitter[iSide[iTmp1]].Hide;
      DockPanel[iSide[iTmp1]].Hide;
    end;
end;

procedure TfrmTinnMain.RtermShow;
begin
  // Do not change the order below!
  frmRterm.Visible := True;

  with JvDockServer do
  begin
    if LeftDockPanel.ContainsControl(frmRterm) then
      DoShowHide(0, iRtermDockWidth) // Left
    else if TopDockPanel.ContainsControl(frmRterm) then
      DoShowHide(1, iRtermDockHeight) // Top
    else if RightDockPanel.ContainsControl(frmRterm) then
      DoShowHide(2, iRtermDockWidth) // Right
    else if BottomDockPanel.ContainsControl(frmRterm) then
      DoShowHide(3, iRtermDockHeight) // Bottom
  end;

  actRtermVisible.Checked := True;
end;

procedure TfrmTinnMain.RtermHide;
begin
  // The below, related to docking, is not smart, but I didn't find anything better yet!
  with JvDockServer do
  begin
    if LeftDockPanel.ContainsControl(frmRterm) then // Left
      if LeftDockPanel.ContainsControl(frmTools) then
        if not frmTools.Visible then
        begin
          iRtermDockWidth := LeftDockPanel.Width;
          DoShowHide(0, 0, False)
        end
        else { Do nothing }
        else
        begin
          iRtermDockWidth := LeftDockPanel.Width;
          DoShowHide(0, 0, False)
        end
      else if TopDockPanel.ContainsControl(frmRterm) then // Top
        if TopDockPanel.ContainsControl(frmTools) then
          if not frmTools.Visible then
          begin
            iRtermDockHeight := TopDockPanel.Height;
            DoShowHide(1, 0, False)
          end
          else { Do nothing }
          else
          begin
            iRtermDockHeight := TopDockPanel.Height;
            DoShowHide(1, 0, False)
          end
        else if RightDockPanel.ContainsControl(frmRterm) then // Right
          if RightDockPanel.ContainsControl(frmTools) then
            if not frmTools.Visible then
            begin
              iRtermDockWidth := RightDockPanel.Width;
              DoShowHide(2, 0, False)
            end
            else { Do nothing }
            else
            begin
              iRtermDockWidth := RightDockPanel.Width;
              DoShowHide(2, 0, False)
            end
          else if BottomDockPanel.ContainsControl(frmRterm) then // Bottom
            if BottomDockPanel.ContainsControl(frmTools) then
              if not frmTools.Visible then
              begin
                iRtermDockHeight := BottomDockPanel.Height;
                DoShowHide(3, 0, False)
              end
              else { Do nothing }
              else
              begin
                iRtermDockHeight := BottomDockPanel.Height;
                DoShowHide(3, 0, False);
              end;
  end;
  frmRterm.Visible := False;
  actRtermVisible.Checked := False;
end;

procedure TfrmTinnMain.actRtermVisibleExecute(Sender: TObject);
begin
  if not Assigned(frmRterm) then
    Exit;
  DoUndoAutoHideRterm;
  if frmRterm.Visible then
    RtermHide
  else
    RtermShow;
  //SetFocus_Main;
end;

procedure TfrmTinnMain.actToolsVisibleExecute(Sender: TObject);
begin
  if not Assigned(frmTools) then
    Exit;

  DoUndoAutoHideTools;

  // The below, related to docking, is not smart, but I didn't find nothing better yet!
  if frmTools.Visible then
  begin
    with JvDockServer do
    begin
      if LeftDockPanel.ContainsControl(frmTools) then // Left
        if LeftDockPanel.ContainsControl(frmRterm) then
          if not frmRterm.Visible then
          begin
            iToolsDockWidth := LeftDockPanel.Width;
            DoShowHide(0, 0, False)
          end
          else { Do nothing }
          else
          begin
            iToolsDockWidth := LeftDockPanel.Width;
            DoShowHide(0, 0, False)
          end
        else if TopDockPanel.ContainsControl(frmTools) then // Right
          if TopDockPanel.ContainsControl(frmRterm) then
            if not frmRterm.Visible then
            begin
              iToolsDockHeight := TopDockPanel.Height;
              DoShowHide(1, 0, False)
            end
            else { Do nothing }
            else
            begin
              iToolsDockHeight := TopDockPanel.Height;
              DoShowHide(1, 0, False)
            end
          else if RightDockPanel.ContainsControl(frmTools) then // Top
            if RightDockPanel.ContainsControl(frmRterm) then
              if not frmRterm.Visible then
              begin
                iToolsDockWidth := RightDockPanel.Width;
                DoShowHide(2, 0, False)
              end
              else { Do nothing }
              else
              begin
                iToolsDockWidth := RightDockPanel.Width;
                DoShowHide(2, 0, False)
              end
            else if BottomDockPanel.ContainsControl(frmTools) then // Bottom
              if BottomDockPanel.ContainsControl(frmRterm) then
                if not frmRterm.Visible then
                begin
                  iToolsDockHeight := BottomDockPanel.Height;
                  DoShowHide(3, 0, False)
                end
                else { Do nothing }
                else
                begin
                  iToolsDockHeight := BottomDockPanel.Height;
                  DoShowHide(3, 0, False);
                end;
    end;
    frmTools.Visible := False;
  end
  else
  begin
    frmTools.Visible := True;
    with JvDockServer do
    begin
      if LeftDockPanel.ContainsControl(frmTools) then
        DoShowHide(0, iToolsDockWidth) // Left
      else if TopDockPanel.ContainsControl(frmTools) then
        DoShowHide(1, iToolsDockHeight) // Top
      else if RightDockPanel.ContainsControl(frmTools) then
        DoShowHide(2, iToolsDockWidth) // Right
      else if BottomDockPanel.ContainsControl(frmTools) then
        DoShowHide(3, iToolsDockHeight) // Bottom
    end;
    // m.p.
    // with frmTools do

    // if (       pgTools.ActivePage = tbsRcard) then
    // lbRcard.SetFocus;
  end;

  actToolsVisible.Checked := frmTools.Visible;
  SetFocus_Main;

end;

procedure TfrmTinnMain.actRtermWarningErrorExecute(Sender: TObject);
begin
  with actRtermWarningError do
    Checked := not Checked;
  if actRtermVisible.Checked and actRtermWarningError.Checked and
    actRtermIOSplitRemove.Checked then
    frmRterm.pgRterm.ActivePage := frmRterm.tbsLog
  else
    frmRterm.pgRterm.ActivePage := frmRterm.tbsIO;
end;

procedure TfrmTinnMain.actRtipInsertExecute(Sender: TObject);
var
  i: integer;

begin
  if (pgFiles.PageCount = 0) then
    Exit;
  i := FindTopWindow;

  with (MDIChildren[i] as TfrmEditor) do
    DoTipInsert;

  PostMessage(TWinControl(MDIChildren[i] as TfrmEditor).Handle,
    WM_SETFOCUS, 0, 0);
end;

procedure TfrmTinnMain.actRtermIOSetFocusExecute(Sender: TObject);
begin
  if not frmRterm.Visible then
    Exit;
  frmRterm.pgRterm.ActivePage := frmRterm.tbsIO;
  frmRterm.sciIO.SetFocus;
  actRtermIOSetFocus.Checked := True;
end;

procedure TfrmTinnMain.actRtermIOSplitHorizontalExecute(Sender: TObject);
var
  sPriorLog: string;

begin
{  if Assigned(frmRterm.sciLog2) then
    sPriorLog := frmRterm.sciLog2.GetText
  else
    sPriorLog := frmRterm.sciLog.GetText;
}
  frmRterm.RtermSplit;

{  if Assigned(frmRterm.sciLog2) then

    with frmRterm.sciLog2 do
    begin
      Lines.BeginUpdate;
      SetWrapVisualFlags(SC_WRAPVISUALFLAG_START);
      SetWrapMode(iLogLineWrap);

      SetText(sPriorLog);

      //PostMessage(TWinControl(frmRterm.sciLog2).Handle, WM_SETFOCUS, 0, 0);
      // Will force ecEditorBottom below

      SetCursorToBottom(frmRterm.sciLog2);
      //ExecuteCommand(ecEditorBottom, #0, nil);
      Lines.EndUpdate;

    end;  }

    actRtermIOSplitHorizontal.Checked := true;//Assigned(frmRterm.sciLog2);
  bRtermSimple := True;
  bRtermHorizontal := True;
  // m.p. frmRterm.TBToolbarRterm.Left := 52;
end;

procedure TfrmTinnMain.actRtermIOSplitVerticalExecute(Sender: TObject);
begin
  frmRterm.RtermSplit(False);
  actRtermIOSplitVertical.Checked := true;
  bRtermSimple := True;
  bRtermHorizontal := False;
end;

procedure TfrmTinnMain.actRtermIOSplitRemoveExecute(Sender: TObject);
begin
  frmRTerm.RtermRemoveSplit;
  actRtermIOSplitRemove.Checked := true;
  bRtermSimple := False;
end;

procedure TfrmTinnMain.actRtermLogSetFocusExecute(Sender: TObject);
begin

  if not frmRterm.Visible then
    Exit;

  if not frmTinnMain.bRtermSimple then
    frmRterm.pgRterm.ActivePage := frmRterm.tbsLog;
  frmRterm.sciLog.SetFocus;


  actRtermLogSetFocus.Checked := True;
end;

procedure TfrmTinnMain.actRtermEditorSetFocusExecute(Sender: TObject);
var
  i: integer;

begin
  i := FindTopWindow;
  if ((Self.MDIChildren[i] as TfrmEditor) = nil) then
    Exit;

  PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
    WM_SETFOCUS, 0, 0);

  actRtermEditorSetFocus.Checked := True;
end;

procedure TfrmTinnMain.synIOClick(Sender: TObject);
begin
  actRtermIOSetFocus.Checked := True;
end;

procedure TfrmTinnMain.synIOEnter(Sender: TObject);
begin
  actRtermIOSetFocus.Checked := True;
end;



procedure TfrmTinnMain.actRtermSetIOSyntaxToTextExecute(Sender: TObject);
begin
  iIOSyntax := SCLEX_CONTAINER;
  actRtermSetIOSyntaxToText.Checked := True;
  ApplyLexer(iIOSyntax, frmRterm.sciIO);
end;

procedure TfrmTinnMain.actRtermSetLogSyntaxToTextExecute(Sender: TObject);
begin
  iLogSyntax := SCLEX_CONTAINER;
  actRtermSetLogSyntaxToText.Checked := True;
  ApplyLexer(iLogSyntax, frmRterm.sciLog);
end;

procedure TfrmTinnMain.actRtermSetIOSyntaxToRExecute(Sender: TObject);
begin
  iIOSyntax := SCLEX_R;
  actRtermSetIOSyntaxToR.Checked := True;
  ApplyLexer(iIOSyntax, frmRterm.sciIO);
end;

procedure TfrmTinnMain.actRtermSetLogSyntaxToRExecute(Sender: TObject);
begin
  iLogSyntax := SCLEX_R;
  actRtermSetLogSyntaxToR.Checked := True;
  ApplyLexer(iLogSyntax, frmRterm.sciLog);
end;





procedure TfrmTinnMain.actRtermIOClearExecute(Sender: TObject);
var
  i: integer;

begin
  //stbMain.Panels[8].Text := EmptyStr;
  with actRtermWarningError do
  begin
    Visible := False;
    Checked := False;
  end;
//sci //m.p.
{  with frmRterm.synIO do
  begin
    for i := 0 to 9 do
      ClearBookMark(i);
    Clear;
  end; }
  DoClearConsole;
end;

procedure TfrmTinnMain.actRtermIOHistoryExecute(Sender: TObject);
begin
  if not Rterm_Running then
    Exit;
  with frmRterm.sciIO do
  begin
    DocumentEnd;
    AutoCSetSeparator(#16);
    UserListShow(0,  RHistory.ASStringList);
  end;
end;

procedure TfrmTinnMain.actRtermLogClearExecute(Sender: TObject);
var
  i: integer;
  seLog: TDSCintilla;

begin
  //stbMain.Panels[8].Text := EmptyStr;
  with actRtermWarningError do
  begin
    Visible := False;
    Checked := False;
  end;

  seLog := frmRterm.sciLog;

{  //sci //m.p.
  with seLog do
  begin
    for i := 0 to 9 do
      ClearBookMark(i);
    Clear;
  end; }
end;

procedure TfrmTinnMain.actRtermIOandLogClearExecute(Sender: TObject);
begin
  actRtermIOClearExecute(nil);
  actRtermLogClearExecute(nil);
end;

procedure TfrmTinnMain.actRtermIOPrintExecute(Sender: TObject);
var seEditor: TDScintilla;
begin
  seEditor := frmRTerm.sciIO;

  if (seEditor.GetSelText <> '') then
    bselectedToPreview := True
    else
    bselectedToPreview := False;

  frmConfigurePrint := TfrmConfigurePrint.Create(Self);
  try
    frmConfigurePrint.ShowDialog(seEditor);
   finally
      FreeAndNil(frmConfigurePrint);
  end;
end;

procedure TfrmTinnMain.actRtermLogPrintExecute(Sender: TObject);
var
  seLog: TDScintilla;

begin
 seLog := frmRterm.sciLog;

  with seLog do
    if (seLog.GetSelText <> '') then
      bselectedToPreview := True
    else
      bselectedToPreview := False;

  frmConfigurePrint := TfrmConfigurePrint.Create(Self);

  with frmConfigurePrint do
  begin
    try
      //sci //m.p.
      showmessage('Printing not available the moment');
      //with seLog do
      //  ShowDialog(seLog);
    finally
      FreeAndNil(frmConfigurePrint);
      frmTinnMain.Repaint;
    end;
  end;
end;

procedure TfrmTinnMain.actRtermIOSaveExecute(Sender: TObject);
begin
  if FileExists(sRIOSaved) then
    frmRterm.sciIO.Lines.SaveToFile(sRIOSaved)
  else
    actRtermIOSaveAsExecute(nil);
end;

procedure TfrmTinnMain.actRtermLogSaveExecute(Sender: TObject);
begin
  if FileExists(sRLogSaved) then
    frmRterm.sciIO.Lines.SaveToFile(sRLogSaved)
  else
    actRtermLogSaveAsExecute(nil);
end;

procedure TfrmTinnMain.actRtermIOSaveAsExecute(Sender: TObject);
var
  sTmp: string;

begin
  sTmp := RemoveFileExtension(pgFiles.ActivePage.Caption);

  FileSaveGeneric(sTmp + '_io.txt', frmRterm.sciIO);
end;

procedure TfrmTinnMain.actRtermLogSaveAsExecute(Sender: TObject);
var
  sTmp: string;
  seLog: TDScintilla;

begin
  sTmp := RemoveFileExtension(pgFiles.ActivePage.Caption);
  seLog := frmRterm.sciLog;

  FileSaveGeneric(sTmp + '_log.txt', seLog);
end;

procedure TfrmTinnMain.FileSaveGeneric(sFile: string; sciEditor: TDScintilla);
var   FileTypeItem: TFileTypeItem;
begin
  sdMain.DefaultFolder := sWorkingDir;

  with sdMain do
  begin
    FileName := sFile;
    FileTypes.Clear;

    FileTypeItem := sdMain.FileTypes.Add;
    FileTypeItem.DisplayName :='Text';
    FileTypeItem.FileMask := '*.txt';
    DefaultExtension := '*.txt';
  end;

  if sdMain.Execute then
  begin
    sFile := sdMain.FileName;

    if FileExists(sFile) then
    begin
      if (MessageDlg(sFile + #13 + #13 + 'Do you want to overwrite this file?',
        mtConfirmation, [mbYes, mbCancel], 0) <> idYes) then
      begin

        sSaveAsFileExt := EmptyStr;
        ReLoadDialogFileExtension(frmTinnMain.sdMain.FileTypes);
        Exit;
      end;

      DeleteFile(sFile);
    end;

    sciEditor.Lines.SaveToFile(sFile);
    sWorkingDir := StripFileName(sFile);
  end;

  if (frmRterm.pgRterm.ActivePage = frmRterm.tbsIO) then
    sRIOSaved := sFile
  else
    sRLogSaved := sFile;
  sSaveAsFileExt := EmptyStr;
  ReLoadDialogFileExtension(frmTinnMain.sdMain.FileTypes);
end;

procedure TfrmTinnMain.actRSimpleDefaultExecute(Sender: TObject);
begin
  actRSimpleDefault.Checked := True;
  if (pgFiles.PageCount > 0) then
    (Self.MDIChildren[FindTopWindow] as TfrmEditor).FormActivate(nil);
end;

procedure TfrmTinnMain.actTemplateRDatasetExecute(Sender: TObject);
begin
  MakeTemplate(sPathTinnR + '\templates\R doc_dataset.Rd', SCLEX_R);
end;

procedure TfrmTinnMain.actTemplateRMarkdownExecute(Sender: TObject);
begin
  MakeTemplate(sPathTinnR + '\templates\R markdown.Rmd', SCLEX_R);
end;

procedure TfrmTinnMain.actRComplexDefaultExecute(Sender: TObject);
begin
  actRComplexDefault.Checked := True;
  if (pgFiles.PageCount > 0) then
    (Self.MDIChildren[FindTopWindow] as TfrmEditor).FormActivate(nil);
end;

procedure TfrmTinnMain.actRtermSaveWorkspaceExecute(Sender: TObject);
var
  sFile, sTmp: string;
  FileTypeItem: TFileTypeItem;
begin
  sdMain.DefaultFolder := sWorkingDir;

  sdMain.FileTypes.Clear;
  FileTypeItem := sdMain.FileTypes.Add;
  FileTypeItem.DisplayName :='R data';
  FileTypeItem.FileMask := '*.RData';


  if sdMain.Execute then
  begin
    sFile := sdMain.FileName;
    if FileExists(sFile) then
    begin
      if (MessageDlg(sFile + #13 + #13 + 'Do you want to overwrite this file?',
        mtConfirmation, [mbYes, mbCancel], 0) <> idYes) then
        Exit;

      DeleteFile(sFile);
    end;

    sTmp := 'save.image(''' + DosPathToUnixPath(sFile) + ''')';
    DoSend(sTmp);
  end;
  ReLoadDialogFileExtension(frmTinnMain.sdMain.FileTypes);
end;

procedure TfrmTinnMain.actRtermSaveHistoryExecute(Sender: TObject);
var
  sFile: string;
  FileTypeItem: TFileTypeItem;
begin
  sdMain.DefaultFolder := sWorkingDir;
  sdMain.FileTypes.Clear;
  FileTypeItem := sdMain.FileTypes.Add;
  FileTypeItem.DisplayName :='R history';
  FileTypeItem.FileMask := '*.Rhistory';


  if sdMain.Execute then
  begin
    sFile := sdMain.FileName;

    if FileExists(sFile) then
    begin
      if (MessageDlg(sFile + #13 + #13 + 'Do you want to overwrite this file?',
        mtConfirmation, [mbYes, mbCancel], 0) <> idYes) then
        Exit;

      DeleteFile(sFile);
    end;

    if RHistory.SaveToFile(sFile) then
      MessageDlg(sFile + #13 + #13 +
        'The R history was saved to the file above!', mtInformation, [mbOk], 0);
  end;
  ReLoadDialogFileExtension(frmTinnMain.sdMain.FileTypes);
end;

procedure TfrmTinnMain.actRtermLoadWorkspaceExecute(Sender: TObject);
var
  sFile, sTmp: string;

begin
      odMain.DefaultFolder := sWorkingDir;
 // odMain.InitialDir := sWorkingDir;
  odMain.FileName := '.RData';
 // odMain.Filter := slFilters.Text;

  if odMain.Execute then
  begin
    sFile := odMain.FileName;

    sTmp := 'load(''' + DosPathToUnixPath(sFile) + ''')';

    DoSend(sTmp);
  end;
end;

procedure TfrmTinnMain.actRtermLoadHistoryExecute(Sender: TObject);
var
  sFile: string;

begin
  odMain.DefaultFolder := sWorkingDir;
 // odMain.InitialDir := sWorkingDir;
  odMain.FileName := '.Rhistory';
//  odMain.Filter := slFilters.Text;

  if odMain.Execute then
  begin
    sFile := odMain.FileName;

    if RHistory.LoadFromFile(sFile) then
      MessageDlg(sFile + #13 + #13 +
        'The R history was loaded from the file above!', mtInformation,
        [mbOk], 0);
  end;
end;

procedure TfrmTinnMain.SetFocus_Main;
var
  i: integer;

begin
  case iSciWithFocus of
    1 .. 2:
      begin
        i := FindTopWindow;
        if Assigned(Self.MDIChildren[i] as TfrmEditor) then
          PostMessage(TWinControl(Self.MDIChildren[i] as TfrmEditor).Handle,
            WM_SETFOCUS, 0, 0);
      end
  else

      PostMessage(TWinControl(frmRTerm.sciIO).Handle, WM_SETFOCUS, 0,  0);

 //   if frmRterm.Visible then
 //     frmRterm.sciIO.SetFocus;
  end;

end;

{
function TfrmTinnMain.GetFocus: integer;
var
  sciLog: TDScintilla;

begin
 showmessage('GetFocus - update');

  Result := 0;
  if Assigned(frmRterm.sciLog2) then
    sciLog := frmRterm.sciLog2
  else
    sciLog := frmRterm.sciLog;
  // Editors
  if (pgFiles.PageCount <> 0) then
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    begin
      // sciEditor1
      if sActiveEditor = 'sciEditor' then
        if sciEditor.Focused then
          Result := 1;
      // sciEditor2
      if sActiveEditor = 'sciEditor2' then
        if sciEditor2.Focused then
          Result := 2;
    end;

  if frmRterm.sciIO.Focused then
    Result := 3
    // syLog and sciLog2
  else if sciLog.Focused then
    Result := 4
     // jvdlbWinExplorer

      // jvflbWinExplorer
  else if (frmTools.jvflbWinExplorer.Focused = True) then
    Result := 6
    // tvProject
  else if (frmTools.tvProject.Focused = True) then
    Result := 9
    // memIniLog
  else if frmTools.memIniLog.Focused then
    Result := 10
    // tvSearch
  else if (frmTools.tvSearch.Focused = True) then
    Result := 11
    // lbRcard
  else if frmTools.lbRcard.Focused then
    Result := 13
    // dbgRcard
  else if frmTools.dbgRcard.Focused then
    Result := 14
    // dbRcardMemo
//  else if frmTools.dbRcardMemo.Focused then
//    Result := 15
    // lbCountries
  else if frmTools.lbCountries.Focused then
    Result := 16
    // dbgRmirrors
  else if frmTools.dbgRmirrors.Focused then
    Result := 17
    // dbeRmirrorsURL
  else if frmTools.dbeRmirrorsURL.Focused then
    Result := 18
    // lbCompletion
    // else if frmTools.lbCompletion.Focused then
    // Result := 19
    // dbgCompletion
    /// /  else if frmTools.dbgCompletion.Focused then
    // Result := 20
    // dbCompletionMemo
    // else if frmTools.dbCompletionMemo.Focused then
    // Result := 21
    // dbgComments
  else if frmTools.dbgComments.Focused then
    Result := 22
    // lbShortcuts
  else if frmTools.lbShortcuts.Focused then
    Result := 23
    // dbgShortcuts
  else if frmTools.dbgShortcuts.Focused then
    Result := 24
    // dbShortcutsMemo
  else if frmTools.dbShortcutsMemo.Focused then
    Result := 25
    // lvRexplorer

  else if (frmTools.edCardSearch.Focused = True) then
    Result := 27
  else if (frmTools.edToolsRExplorerFilter.Focused = True) then
    Result := 28
  else if (frmTools.edWinExplorerFilter.Focused = True) then
    Result := 29;
end;
}






procedure TfrmTinnMain.actFoldAllExecute(Sender: TObject);
var seEditor: TDScintilla;
const SCI_FOLDALL = 2662; // Constant not present in the TDScintilla wrapper.
begin
  if not GetActiveEditorOrNil(seEditor) then
    exit;

    seEditor.SendEditor(SCI_FOLDALL);
end;


procedure TfrmTinnMain.actFoldingVisibleExecute(Sender: TObject);
var
  i, j: integer;
  iWidth : Integer;
begin

  actFoldingVisible.Checked := not actFoldingVisible.Checked;

  if actFoldingVisible.Checked then
    iWidth  := 20 else   iWidth  := 0;


  if (Self.MDIChildCount > 0) then
    for i := (Self.MDIChildCount - 1) downto 0 do
      with (Self.MDIChildren[i] as TfrmEditor) do
       begin

         sciEditor.SetMarginWidthN(MARGIN_CODE_FOLDING, iWidth);
        if Assigned(sciEditor2) then
          sciEditor.SetMarginWidthN(MARGIN_CODE_FOLDING, iWidth);
      end;
end;

procedure TfrmTinnMain.actReformatRExecute(Sender: TObject);
var edForm: TfrmEditor;
begin
  if GetTopEditorForm(edForm) then
    edForm.RReformat;
end;
  {
function TfrmTinnMain.CheckConnection: Boolean;
begin
  if IsConnected then
    Result := True
  else
  begin
//    with stbMain do
//    begin
//      Panels[7].Text := 'Warning';
//      Panels[8].Text := 'Please, check your internet connection!';
//    end;
    Application.ProcessMessages;

    Result := False;
  end;
end;
         }
procedure TfrmTinnMain.BackupCleanUp;
var
  SRec: TSearchRec;
  res, i: integer;
  sTmpFile: String;
begin
  res := FindFirst(sPathFileBackup + '*.*', faAnyFile, SRec);
  if res = 0 then
    try
      while res = 0 do
      begin
        if (SRec.Attr and faDirectory <> faDirectory) then
          DeleteFile(sPathFileBackup + SRec.Name);
        res := FindNext(SRec);
      end;
    finally
      FindClose(SRec)
    end;

  try
    if FileExists(frmTinnMain.sPathData + '\Editors.txt') then
      DeleteFile(sPathData + '\Editors.txt');
  finally
  end;


 for i := (Self.MDIChildCount - 1) downto 0 do
 with (Self.MDIChildren[i] as TfrmEditor) do
 begin
    EditorFile.iUnsavedChanges := EditorFile.iModified;
    EditorFile.sTempFile := '';
    bBackupUnsaved := (EditorFile.iModified = 1);
 end;
end;



procedure TfrmTinnMain.CheckFilesBackup;
var
  EditorFile: TEditorFile;
  i: integer;
begin
try
  with modDados.sqlDSEditors do
  begin
    Active := false;
    CommandText := 'SELECT * FROM Editors ORDER BY TabPosition';
    Active := true;
    First;

    while not eof do
    begin
      with EditorFile do
      begin
        sFile :=  FieldByName('File').AsString;
        sTempFile :=  FieldByName('TempFile').AsString;

        iNewFile :=  FieldByName('NewFile').AsInteger;
        iModified :=  FieldByName('Modified').AsInteger;
        iUnsavedChanges :=  FieldByName('UnsavedChanges').AsInteger;
        iTabPosition := pgFiles.PageCount+1;
        iId := FieldByName('EditorId').AsInteger;

        sMarks := FieldByName('Marks').AsString;
        iTopLine := FieldByName('TopLine').AsInteger;
        iCaretPosition := FieldByName('CaretPosition').AsInteger;
        sFolding := FieldByName('Folding').AsString;
        iLexerId := FieldByName('LexerId').AsInteger;
     end;
     LoadFile(EditorFile);

      Next;
    end;
  end;
except
  MessageDlg('Tinn-R encountered erros during the file recovery. Some files might not be recovered but might be found in the folder ''' +  sPathFileBackup+'''.', mtError, [mbOK], 0);
end;
end;

procedure TfrmTinnMain.StartupThreadShortcutsRun(Sender: TIdThreadComponent);
begin
with modDados do
begin
      try
        LoadShortcuts;
        SetShortcuts;
      except
        if MessageDlg('The shortcuts could not be loaded. It is likely that the problem can be solved by deleting the current shortcut settings.' + #13
                   + 'Do you want to reset these settings before Tinn-R closes?', mtError, [mbYes, mbNo], 0) = mrYes then
        begin

          DeleteFile(frmTinnMain.sPathShortcuts);
        end;
        Application.Terminate;
      end;
  bShortcutsLoaded := true;
end;
Sender.Free;
end;

procedure TfrmTinnMain.InitialBackup;
begin
  if bBackup or bReopenFiles then
    CheckFilesBackup
  else
  begin
    modDados.sqlEditors.ExecuteDirect('UPDATE DELETE FROM Editors');
    BackupCleanUp;
  end;
  tBackup.Enabled := bBackup;
end;

procedure TfrmTinnMain.RecentProjectOpen(sfilename: String);
var
  sTmp: string;

begin
  sTmp := trim(sfilename);

  sTmp := StringReplace(sTmp, '&&', '&', [rfReplaceAll]);

  if FileExists(sTmp) then
    OpenFileIntoTinn(sTmp)
  else
  begin
    // Take it off the fileMRU list
    if (MessageDlg(sTmp + #13 + #13 + 'File does not exist.' + #13 +
      'Would you like to remove it from MRU (Most Recent Used) list?',
      mtInformation, [mbYes, mbNo], 0) = mrYes) then
      UpdateProjectMRU(menProjRecent, sTmp);
  end;
end;

procedure TfrmTinnMain.InstantLookup(Sender: TObject);
var
  seEditor: TDScintilla;
  sWord: String;
  iCurPos, iStart: Integer;

begin
  if Sender.ClassName <> 'TDScintilla' then
    Exit;
  seEditor := Sender as TDScintilla;

  iCurPos := seEditor.GetCurrentPos;
  iStart := GetRWord(seEditor, iCurPos, sWord);

  if sWord = '' then
    Exit;

  if modDados.cdMainBase.Active then
    modDados.LookupWord(sWord, modDados.cdMainBase);

  if (modDados.cdRObjects.Active) and (assigned(frmTools.cgObjects)) then
    modDados.LookupWord(sWord, modDados.cdRObjects);


end;

procedure TfrmTinnMain.CheckNamesLookup(Sender: TObject);
var
  seEditor: TDScintilla;
  sWord: String;
  iCurPos: Integer;
begin
  if Sender.ClassName <> 'TDScintilla' then
    Exit;
  seEditor := Sender as TDScintilla;

  if not ValidRRunning then
    Exit;

  iCurPos := seEditor.GetCurrentPos -1;
  iActivePopupIndicatorStart := GetRComplexExpression(seEditor, iCurPos, sWord);

  if sWord = '' then
    Exit;

  LookupRObjectNames(sWord, seEditor, -2);
end;

procedure TfrmTinnMain.LookupRObjectNames(sRObject: string; Sender: TDScintilla; curpos: Integer);
var sToSend: String;
begin
    iActivePopupPosition := Sender.GetCurrentPos;
    sciActivePopupEditor := Sender;
    sActivePopupObject := sRObject;

    iObjectCallID := random(9999);
    sToSend := 'trObjInfo(''' + StringReplace(sRObject, #13#10, '', [rfReplaceAll]) + ''', path=.trPaths[10], CallID ='+inttostr(iObjectCallID)+')';
    sToSend := sToSend + #13#10;
    if (csRExplorer.Active) then
      csRExplorer.Socket.SendText(sToSend);
end;


procedure TfrmTinnMain.ShowNamesPopup;
var
  i, iFocus: integer;
  bFileExists: Boolean;
  sRFile, sTmp, sToSend, sGroup: string;

  procedure MakeNamesView_TmpFile(slRObjects: TStringList);

    procedure DefineObjectStructure(var sTmp, RName, RDim, RClass: string;
      var tslTmp: TStringList);
    begin
      StrSplit(' ', sTmp, tslTmp);

      RName := tslTmp[0];
      RDim := tslTmp[1];
      RClass := tslTmp[2];
    end;

  var
    i: integer;

    slTmp: TStringList;
    dcoord: TPoint;
    sTmp, sRObjName, sRObjDim, sRObjClass, sTitleName: string;
    liItem: TListItem;
  begin
    try
      frmNameBrowser.lvNames.Items.Clear;
      if slRObjects.Count > 0 then
      begin
        with frmNameBrowser do
        begin
             with sciActivePopupEditor do
             begin
               SetIndicatorCurrent(0);
               IndicSetStyle(0, INDIC_STRAIGHTBOX);
               IndicatorFillRange(iActivePopupIndicatorStart,getCurrentPos-1-iActivePopupIndicatorStart);
             end;
          lvNames.Items.BeginUpdate;
          lvNames.Items.Clear;

          slTmp := TStringList.Create;

          sTitleName :=  sActivePopupObject;
          if length(sTitleName)> 25 then
            sTitleName := copy(sTitleName, 1, 22)+'...';
          Caption := 'Names for ''' + sTitleName + '''';
          if not Assigned(liAllNames) then
          begin
            liAllNames := TListView.Create(Self);
            liAllNames.Parent := Self;
            liAllNames.Visible := False;
          end;
          liAllNames.Items.Clear;

          for i := 0 to (slRObjects.Count - 1) do
          begin
            sTmp := slRObjects.Strings[i];
            DefineObjectStructure(sTmp, sRObjName, sRObjDim, sRObjClass, slTmp);

            liItem := liAllNames.Items.Add;
            liItem.Caption := sRObjName;
            liItem.SubItems.Add(sRObjDim);
            liItem.SubItems.Add(sRObjClass);
          end;
          bNameFormActive := True;
          bNameFormLoading := True;
          SciInsertEd := sciActivePopupEditor;
          edNameSearch.Text := '';
          lvNames.Items.Clear;
          lvNames.Items := liAllNames.Items;
          if lvNames.Items.Count > 0 then
            lvNames.Items[0].Focused := True;


          // Check Position
          //
          //
          frmNameBrowser.iSelStart :=  SciInsertEd.GetCurrentPos;



          dcoord.X := SciInsertEd.PointXFromPosition(frmNameBrowser.iSelStart);
          dcoord.Y := SciInsertEd.PointYFromPosition(frmNameBrowser.iSelStart);
          Left := SciInsertEd.ClientToScreen(dcoord).X;
          Top := SciInsertEd.ClientToScreen(dcoord).Y;


          Show;
          FormStyle := fsNormal;
          FormStyle := fsStayOnTop;
          SetWindowPos(Handle, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE);
          ednameSearch.SetFocus;

          bNameFormLoading := False;
          lvNames.Items.EndUpdate;
          lvNames.Invalidate;
          lvNames.Update;
        end;
      end
      else
        frmNameBrowser.CloseNamePopup;
    except
      frmNameBrowser.CloseNamePopup;
    end;
  end;

  procedure ReadTmpFile(resRFile: string);
  var
    strlFromR: TStringList;
  begin
    try
      try
        strlFromR := TStringList.Create;
        strlFromR.LoadFromFile(resRFile);
        MakeNamesView_TmpFile(strlFromR);
      except
        on EFOpenError do
        begin
          FreeAndNil(strlFromR);
        end;
      end;
    finally
      FreeAndNil(strlFromR);
    end;
  end;

begin
  try
    sRFile := sPathTmp + '\nameslookup.r';

    if not FileExists(sRFile) then
    begin
      frmNameBrowser.CloseNamePopup;
      Exit;
    end;
      if sciActivePopupEditor.GetCurrentPos = frmTinnMain.iActivePopupPosition then
        ReadTmpFile(sRFile);
      DeleteFile(sRFile);
  finally
  end;
end;


procedure TfrmTinnMain.SetReadOnlyState;
begin
  if actReadOnly.Checked then
  begin
    actReadOnly.ImageIndex := 169;
  end
  else
  begin
    actReadOnly.ImageIndex := 292;
  end;
end;

function TfrmTinnMain.GetEditorWithFocus: TDScintilla;
begin
 {
  if not GetActiveEditorOrNil(Result) then
  begin
    if Assigned(frmRterm.sciLog2) then
      seLog := frmRterm.sciLog2
    else
      seLog := frmRterm.sciLog;
    if seLog.Focused then
      Result := seLog;
    if frmRterm.sciIO.Focused then
      Result := frmRterm.sciIO;
  end;
   }
  Result := nil;

  case iSciWithFocus of
    1: Result := (Self.MDIChildren[FindTopWindow] as TfrmEditor).sciEditor;
    2: Result := (Self.MDIChildren[FindTopWindow] as TfrmEditor).sciEditor2;
    3: Result := frmRterm.sciIO;
    4: Result := frmRterm.sciLog;
  end;
end;


function TfrmTinnMain.GetActiveEditorOrNil(var seEditor: TDScintilla): Boolean;
begin
  if Self.MDIChildCount >0 then
  begin
    with (Self.MDIChildren[FindTopWindow] as TfrmEditor) do
    begin
      if sActiveEditor = 'sciEditor' then
        seEditor := sciEditor
      else
        seEditor := sciEditor2;
    end;
    Result := true;
  end else Result := false;
end;

function TfrmTinnMain.GetKeyStrokeByCommand(var KeyCommand: TSciKeyCommand; iCommand: Integer): Integer;
var i: Integer;
begin
  Result := -1;
  if EditorKeyStrokes.Count = 0 then
    exit;

  for i := 0 to EditorKeyStrokes.Count-1 do
    if EditorKeyStrokes.Items[i].Command = iCommand then
    begin
      KeyCommand := EditorKeyStrokes.Items[i];
      Result := i;
      Exit;
    end;

end;

{
procedure TfrmTinnMain.SetHighlighterGeneric(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to length(acHighlighters)-1 do
    acHighlighters[i].Checked := false;
  if (Self.MDIChildCount > 0) then
    begin
      (Self.ActiveMDIChild AS TfrmEditor).SetHighlighter((Sender AS TAction).Tag);
      (Sender AS TAction).Checked := true;
      amMain.ActionBars.ActionBars[12].Items[3].Caption := (sender AS TAction).caption;
    end else amMain.ActionBars.ActionBars[12].Items[3].Caption := 'Highlighter';
end;


procedure TfrmTinnMain.SetHighlighterDefaultGeneric(Sender: TObject);
var
  i: integer;
begin
  for i := 0 to length(acHighlighters)-1 do
    acHighlightersDefault[i].Checked := false;

  iDefaultLexerId := (Sender AS TAction).Tag;
  (Sender AS TAction).Checked := true;
end;     }

function TfrmTinnMain.GetCurrentLexerId;
begin
  if (Self.MDIChildCount > 0) then
     Result := (Self.ActiveMDIChild AS TfrmEditor).GetEditorLexerId
  else Result := -1;
end;


function TfrmTinnMain.GetCurrentLexerName;
begin
  if (Self.MDIChildCount > 0) then
     Result := (Self.ActiveMDIChild AS TfrmEditor).GetEditorLexerName
  else Result := '';
end;

function TfrmTinnMain.GetLexerIdFromFileExtension(sFileExtension: String): Integer;
var iExtPosition, iTmp, iLexer: Integer;
     slTmp: TStringList;
begin
  iExtPosition := 999999999;
  slTmp := TStringList.Create;
  sFileExtension := ansilowercase(sFileExtension);

  if assigned(ModDados) then
  with ModDados.cdLexers2 do
  begin

    First;
    while not (EOF  or   (iExtPosition = 0)) do
    begin
      StrSplit(';', ansilowercase(ModDados.cdLexers2.FieldByName('Extensions').AsString), slTmp);
      iTmp := slTmp.IndexOf('*'+sFileExtension);

      if (iTmp>-1)  and (iTmp<iExtPosition) then
      begin
        iExtPosition := iTmp;
        Result := FieldByName('LexerId').AsInteger;
      end;

      Next;
    end;
  end;

  slTmp.Free;
  if iExtPosition = 999999999 then
    Result := iDefaultLexerId;
end;


function TfrmTinnMain.RExplorerIsRunning: Boolean;
begin
{  RExplorerIsRunning := false;

  if Rterm_Running then
  begin
    if ModDados.SQLConnection.Connected then
      if ModDados.cdRObjects.Active then
        RExplorerIsRunning := true;
    // more to add !!!
  end;
  if not RExplorerIsRunning then
  begin
    frmTools.cbbToolsREnvironment.Clear;

  end;   }
end;

procedure TFrmTinnMain.ReLoadDialogFileExtension(FileTypes : TFileTypeItems);
var FT : TFileTypeItem;
     i: Integer;
begin
  FileTypes.Clear;

  for i := 0 to slFilters.Count -1 do
  begin
    FT := FileTypes.Add;
    FT.DisplayName := slFiltersDisplay[i];
    FT.FileMask := slFilters[i];
  end;
end;

procedure TfrmTinnMain.ToggleAtLeastOneFileOpenOptions(bOption: Boolean);
begin
    actAlignEqualSign.Enabled := bOption;
    actAlignFirstLine.Enabled := bOption;
    actBlockMark.Enabled := bOption;
    actBlockUnmark.Enabled := bOption;
    actQuote.Enabled := bOption;
    actRemoveLineBreaks.Enabled := bOption;
    actComment.Enabled := bOption;
    actDateStamp.Enabled := bOption;
    actFileClose.Enabled := bOption;
    actFileSaveAs.Enabled := bOption;
    actFullPathUnix.Enabled := bOption;
    actFullPathWindows.Enabled := bOption;
    actGotoLine.Enabled := bOption;
    actInvertCase.Enabled := bOption;
    actLatexAlgebricFrac.Enabled := bOption;
    actLatexAlgebricSqrt.Enabled := bOption;
    actLatexAlgebricSqrtN.Enabled := bOption;
    actLatexDimensional.Enabled := bOption;
    actLatexFontBold.Enabled := bOption;
    actLatexFontEnphase.Enabled := bOption;
    actLatexFontFootnote.Enabled := bOption;
    actLatexFontHuge.Enabled := bOption;
    actLatexFontHuger.Enabled := bOption;
    actLatexFontItalic.Enabled := bOption;
    actLatexFontLarge.Enabled := bOption;
    actLatexFontLarger.Enabled := bOption;
    actLatexFontLargest.Enabled := bOption;
    actLatexFontNormal.Enabled := bOption;
    actLatexFontScript.Enabled := bOption;
    actLatexFontSlatend.Enabled := bOption;
    actLatexFontSmall.Enabled := bOption;
    actLatexFontSmallcaps.Enabled := bOption;
    actLatexFontTiny.Enabled := bOption;
    actLatexFontTypewriter.Enabled := bOption;
    actLatexFormatCenter.Enabled := bOption;
    actLatexFormatEnumeration.Enabled := bOption;
    actLatexFormatItemization.Enabled := bOption;
    actLatexFormatLeft.Enabled := bOption;
    actLatexFormatRight.Enabled := bOption;
    actLatexHeaderChapter.Enabled := bOption;
    actLatexHeaderParagraph.Enabled := bOption;
    actLatexHeaderPart.Enabled := bOption;
    actLatexHeaderSection.Enabled := bOption;
    actLatexHeaderSubParagraph.Enabled := bOption;
    actLatexHeaderSubSection.Enabled := bOption;
    actLatexHeaderSubSubSection.Enabled := bOption;

    actLowerCase.Enabled := bOption;
    actMacroPlay.Enabled := bOption;
    actMacroRecord.Enabled := bOption;
    actMatchBracket.Enabled := bOption;

    actPrint.Enabled := bOption;
    actReadOnly.Enabled := bOption;
    actReload.Enabled := bOption;
    actReplace.Enabled := bOption;
    actSortDate.Enabled := bOption;
    actSortNumber.Enabled := bOption;
    actSortString.Enabled := bOption;
    actSpell.Enabled := bOption;
    actSplitHorizontal.Enabled := bOption;
    actSplitRemove.Enabled := bOption;
    actSplitVertical.Enabled := bOption;
    actUncomment.Enabled := bOption;
    actUnmarkAll.Enabled := bOption;
    actUpperCase.Enabled := bOption;
    actChaLinEndMAC.Enabled := bOption;
    actChaLinEndUNIX.Enabled := bOption;
    actChaLinEndWIN.Enabled := bOption;
    actSetANSI.Enabled := bOption;
    actSetUTF16BE.Enabled := bOption;
    actSetUTF16LE.Enabled := bOption;
    actSetUTF8.Enabled := bOption;
    menToolsConversionPandoc.Enabled := bOption;
    menWebSearchSelGoogle.Enabled := bOption;
    actWebSelectedTextSiteSearch.Enabled := bOption;
    menWebSearchSelRSite.Enabled := bOption;
    edFilter.Enabled := bOption;
end;

procedure TfrmTinnMain.ShowNotification(sShortText: string; sLongText: string);
begin
  sNotifyLongText := sLongText;
  tNotifyTimer.Enabled := true;
  acShowNotification.Caption := sShortText;
  acShowNotification.Visible := true;
  acShowNotification.Enabled := true;
end;


Initialization

WM_FINDINSTANCE := RegisterWindowMessage('Editor: find previous instance');
if (WM_FINDINSTANCE = 0) then
  raise exception.Create('Initialization failed');

end.


{
    procedure synEditorDataCompletionCodeCompletion(Sender: TObject;
      var Value: string; Shift: TShiftState; Index: integer; EndToken: Char);
    procedure synEditorDataCompletionExecute(Kind: SynCompletionType;
      Sender: TObject; var CurrentInput: WideString; var X, Y: integer;
      var CanExecute: Boolean);
    procedure synRtipExecute(Kind: SynCompletionType; Sender: TObject;
      var CurrentInput: WideString; var X, Y: integer; var CanExecute: Boolean);
    procedure synNameBrowserExecute(Kind: SynCompletionType; Sender: TObject;
      var CurrentInput: string; var X, Y: integer; var CanExecute: Boolean);



procedure TfrmTinnMain.synEditorDataCompletionExecute(Kind: SynCompletionType;
  Sender: TObject; var CurrentInput: WideString; var X, Y: integer;
  var CanExecute: Boolean);
var
  sRObject, sRPackage, sCompletion: string;
  slTmp: TStringList;

begin
  sRObject := EmptyStr;
  sRPackage := EmptyStr;
  sCompletion := EmptyStr;

  GetCompletion(sRObject, sRPackage, sCompletion);

  if CanExecute then
  begin
    slTmp := TStringList.Create;
    StrSplit('|', sCompletion, slTmp);

    with TSynCompletionProposal(Sender) do
    begin
      ClearList;
      NbLinesInWindow := slTmp.Count;
      ItemList.AddStrings(slTmp);
    end;

    FreeAndNil(slTmp);

    if (sDataCompletion <> EmptyStr) then
    begin
      with stbMain do
      begin
        Panels[7].Text := 'R-' + sDataCompletion + ' ' + sRPackage;
        Panels[8].Text := sRObject;
      end;
    end;
  end
  else
    TSynCompletionProposal(Sender).ClearList;
end;

procedure SetDataCompletion(synDataCompletion: TSynCompletionProposal;
  Editor: TSynEdit; sShortCut: string);
begin
// Will be replaced by Scintilla data completion.
end;



procedure TfrmTinnMain.synRtipExecute(Kind: SynCompletionType; Sender: TObject;
  var CurrentInput: WideString; var X, Y: integer; var CanExecute: Boolean);

  function TipToShowAdequation(str: string): string;
  var
    i, iPosClosePar, iLengthLine: integer;

    sTmp, sOri, sDes, sTmp1: string;

  begin
    iPosClosePar := 0;
    sOri := str;
    sDes := '"';
    iLengthLine := Length(sOri);

    for i := 1 to iLengthLine do
    begin
      sTmp1 := sOri[i];
      if (sTmp1 = '(') then
      begin
        sTmp := sOri;

        Delete(sTmp, 1, i - 1); // Delete all char before this occurrence of '('

        if (i >= iPosClosePar) then
          iPosClosePar := ((i - 1) + GetPosMatchingForward(sTmp, '(', ')'));
      end;

      if (sTmp1 <> '\') then
      begin
        if (sTmp1 <> '"') then
          if (sTmp1 <> ',') then
            sDes := (sDes + sTmp1)
          else if (i >= iPosClosePar) then
            sDes := (sDes + ',", "')
          else
            sDes := (sDes + ',')
        else if (sTmp1 = '"') then
          sDes := (sDes + '''');
      end
      else if (sTmp1 = '\') then
        sDes := (sDes + EmptyStr);
    end;
    sDes := (sDes + '"');
    Result := sDes;
  end;

  function TipToWriteAdequation(str: string): string;
  var
    i, iLengthLine: integer;

    sOri, sDes, sTmp1: string;

  begin
    sOri := str;

    sOri := StringReplace(sOri, '|', ', ', [rfReplaceAll]);

    iLengthLine := Length(sOri);
    for i := 1 to iLengthLine do
    begin
      sTmp1 := sOri[i];

      if (sTmp1 <> '\') then
      begin
        if (sTmp1 <> '"') then
          if (sTmp1 <> ' ') then
            sDes := (sDes + sTmp1)
          else // tmp1 = ' ', i.e, space
            if (sOri[i - 1] = ',') then
              sDes := (sDes + sTmp1)
            else
              sDes := sDes
        else if (sTmp1 = '"') then
          sDes := (sDes + '''');
      end
      else if (sTmp1 = '\') then
        sDes := (sDes + EmptyStr);
    end;
    Result := sDes;
  end;

var
  bTipFound: Boolean;
  sRObject, sRPackage, sRTip, sTip: string;
  slTmp: TStringList;

const
  NMC_RServer =
    '"[..] NOT MATCHED: Check integrity of the parameter(s) for this function in the R Server!"';
  NMP_RServer =
    '"(..) NOT MATCHED: Check integrity of the parameter(s) for this function in the R Server!"';

begin
  sRObject := EmptyStr;
  sRPackage := EmptyStr;
  sRTip := EmptyStr;

  bTipFound := False;

  GetCallTip(sRObject, sRPackage, sRTip, bTipFound);

  if (not bTipFound) then
    Exit;

  TSynCompletionProposal(Sender).ItemList.Clear;
  if (sTipFromRServer <> EmptyStr) then
    GetRInfo(sRTip, sRPackage, sRObject);
  // Get info, [package] and <object>, from the returned

  sRTip := StringReplace(sRTip, sRPackage, EmptyStr, []);

  sRTip := StringReplace(sRTip, sRObject, EmptyStr, []);

  try
    slTmp := TStringList.Create;

    // Adapted from: http://www.andreanolanusse.com/pt/como-dividir-uma-string-em-um-array-utilizando-delphi/
    //  ExtractStrings respect spaces inside of the string: | ba ba ba | bebe be -> [1] ba ba ba
    //  [2] bebe be
    ExtractStrings(['|'], [], PChar(sRTip), slTmp);

    with TSynCompletionProposal(Sender) do
    begin
      ClearList;
      NbLinesInWindow := slTmp.Count;
      ItemList.AddStrings(slTmp);
    end;
  finally
    FreeAndNil(slTmp);
  end;

  sTipToWrite := TipToWriteAdequation(sRTip);
  // Will be available to be inserted (Ctrl + *)

  if (sTipFromRServer <> EmptyStr) then
  begin
    if (sRPackage = EmptyStr) then
      sRPackage := ' [.ClobalEnv]';

    sTip := 'R -> ' + sTipFromRServer + ' ' + sRPackage;

    stbMain.Panels[7].Text := sTip;
    stbMain.Panels[8].Text := sRObject;
  end;
end;

procedure TfrmTinnMain.synNameBrowserExecute(Kind: SynCompletionType;
  Sender: TObject; var CurrentInput: string; var X, Y: integer;
  var CanExecute: Boolean);
begin

  CanExecute := False;
end;


procedure TfrmTinnMain.synEditorDataCompletionCodeCompletion(Sender: TObject;
  var Value: string; Shift: TShiftState; Index: integer; EndToken: Char);
begin
  with TSynCompletionProposal(Sender).Editor do
    CaretX := CaretX;
end;

}



{
// SynEdit_UNICODE
procedure TfrmTinnMain.synPaintTransient(Sender: TObject; Canvas: TCanvas;
  TransientType: TTransientType);
var
  seEditor: TSynEdit;
  aOpenChar, aCloseChar: Array of WideChar;
  Attri: TSynHighlighterAttributes;

  procedure SetCanvasFont;
  begin
    seEditor.Canvas.Font.Assign(seEditor.Font);
    seEditor.Canvas.Font.Style := Attri.Style;

    if (TransientType = ttAfter) then
    begin // Occur just when FIND a symbol (going to right/up or left/down)
      if (Attri.Foreground = clRed) then
        with seEditor.Canvas.Font do
        begin
          Style := [fsBold];
          Color := ContrastColor(Attri.Foreground)
        end
      else
        with seEditor.Canvas.Font do
        begin
          Style := [fsBold];
          Color := clBrackets;
        end;


    //    with seEditor.Canvas.Font do begin  // Users request me more visual definition
     //   Style:= [fsBold];
      //  if Color:= ContrastColor(clActiveLine);
     //   end;
      //

      if bActiveLine then
        seEditor.Canvas.Brush.Color := clActiveLine
      else
        seEditor.Canvas.Brush.Color := Attri.Background;
    end
    else
    begin // Occur just when LEAVE from a symbol (going to right/up or left/down)
      seEditor.Canvas.Font.Color := Attri.Foreground;
      if bActiveLine then
        seEditor.Canvas.Brush.Color := clActiveLine
      else
        seEditor.Canvas.Brush.Color := Attri.Background;
    end;
  end;

  function CharToPixels(BC: TBufferCoord): TPoint;
  begin
    Result := seEditor.RowColumnToPixels(seEditor.BufferToDisplayPos(BC));
  end;

var
  bcP, bcMatchBracketPos: TBufferCoord;
  wcCharA, wcCharB: WideChar;
  i, iArrayLength: integer;
  pP: TPoint;
  sTmp: String;

const
  AllBrackets = ['--', '[', '(', '<', '--', ']', ')', '>'];

begin
  seEditor := TSynEdit(Sender);
  if TSynEdit(Sender).SelAvail then
    Exit;
  iArrayLength := 4;

  SetLength(aOpenChar, iArrayLength);

  SetLength(aCloseChar, iArrayLength);

  for i := 0 to (iArrayLength - 1) do
    case i of
      0:
        begin
          aOpenChar[i] := '(';
          aCloseChar[i] := ')';
        end;
      1:
        begin
          aOpenChar[i] := '--';
          aCloseChar[i] := '--';
        end;
      2:
        begin
          aOpenChar[i] := '[';
          aCloseChar[i] := ']';
        end;
      3:
        begin
          aOpenChar[i] := '<';
          aCloseChar[i] := '>';
        end;
    end;

  bcP := seEditor.CaretXY;

  if (seEditor.CaretXY.Line <= seEditor.Lines.Count) and
    ((seEditor.CaretXY.Char - 1) <= Length(seEditor.Lines[seEditor.CaretXY.Line
    - 1])) and (Length(seEditor.Lines[seEditor.CaretXY.Line - 1]) > 0) then
    wcCharA := seEditor.Lines[seEditor.CaretXY.Line - 1]
      [seEditor.CaretXY.Char - 1]
  else
    wcCharA := #0;

  if (seEditor.CaretXY.Line <= seEditor.Lines.Count) and
    ((seEditor.CaretXY.Char - 1) <= Length(seEditor.Lines[seEditor.CaretXY.Line
    - 1])) and (Length(seEditor.Lines[seEditor.CaretXY.Line - 1]) > 0) then
    wcCharB := seEditor.Lines[seEditor.CaretXY.Line - 1][seEditor.CaretXY.Char]
  else
    wcCharB := #0;
  // if not CharInSet(wcCharA,  AllBrackets) then
  if not CharInSet(wcCharA, AllBrackets) and not CharInSet(wcCharB, AllBrackets) then
    Exit;

  sTmp := wcCharB;
  if not CharInSet(wcCharB, AllBrackets) then
  begin
    bcP.Char := bcP.Char - 1;
    sTmp := wcCharA;
  end;

  seEditor.GetHighlighterAttriAtRowCol(bcP, sTmp, Attri);

  // m.p. Assigned(.) prevents from running into errors. However, the reason why that occurs is unclear
  // seEditor.Higlighter may not loads at app start as it is supposed to do.
  if Assigned(seEditor.Highlighter) then
    if (seEditor.Highlighter.SymbolAttribute = Attri) then
    begin
      for i := low(aOpenChar) to High(aOpenChar) do
      begin
        if (sTmp = aOpenChar[i]) or (sTmp = aCloseChar[i]) then
        begin
          pP := CharToPixels(bcP);

          if (pP.X < TMySynEdit(seEditor).Gutter.Width) then
            Exit;

          SetCanvasFont;
          seEditor.Canvas.TextOut(pP.X, pP.Y, sTmp);

          bcMatchBracketPos := seEditor.GetMatchingBracketEx(bcP);

          if (bcMatchBracketPos.Line = 0) or (bcMatchBracketPos.Char = 0) then
            Exit;

          //
          //  if (seEditor.CaretY = bcMatchBracketPos.Line) then begin
           // if bActiveLine then seEditor.Canvas.Brush.Color:= clActiveLine;
         //   end
          //  else seEditor.Canvas.Brush.Color:= Attri.Background;
         //

          if (bcP.Char > 0) and (bcP.Line > 0) then
          begin
            pP := CharToPixels(bcMatchBracketPos);

            if (pP.X > TMySynEdit(seEditor).Gutter.Width) then
            begin
              SetCanvasFont;

              if (sTmp = aOpenChar[i]) then
                with seEditor do
                  Canvas.TextOut(pP.X, pP.Y, aCloseChar[i])
              else
                with seEditor do
                  Canvas.TextOut(pP.X, pP.Y, aOpenChar[i]);
            end;
          end; // if (bcP.Char > 0)
        end; // if (sTmp = aOpenChar[i])
      end; // for i:= low(aOpenChar) to High(aOpenChar)
    end; // if (seEditor.Highlighter.SymbolAttribute = Attri)
end;        }


{
function TfrmTinnMain.ActivePanel: integer;
var
  X, i: integer;
  mpt: TPoint;

begin
  Result := -1;
  mpt := Mouse.CursorPos; // mouse position in screen coordinates
  mpt := stbMain.ScreenToClient(mpt); // mouse position in StatusBar coordinates

  X := 0;

  for i := 0 to (stbMain.Panels.Count - 1) do
  begin
    X := X + stbMain.Panels[i].Width;
    if (mpt.X < X) then
    begin
      Result := i;
      break;
    end;
  end;
end; }
{
procedure TfrmTinnMain.stbMainClick(Sender: TObject);

  function OpenedFile: Boolean;
  begin
    Result := True;
    if ((Self.MDIChildren[FindTopWindow] as TfrmEditor) = nil) then
      Result := False;
  end;

begin
  case ActivePanel of
    2:
      begin
        if OpenedFile then
          actGotoLineExecute(nil);
      end;

    3:
      begin
        if OpenedFile then
          actReadOnlyExecute(nil);
      end;

    4:
      begin

      end;

    6:
      begin
        bTinnRHotKeysActive := not bTinnRHotKeysActive;
        with frmHotkeys do
          SetHotkeys(bTinnRHotKeysActive);
      end;

    8:
      actRtermWarningErrorExecute(nil);
  end;
end;
  }
