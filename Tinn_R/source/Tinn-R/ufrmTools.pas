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
  (http://cran.r-project.org). The project is coordened by Jos� Cl�udio Faria
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

unit ufrmTools;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, vcl.Controls, Forms,
  Dialogs, ComCtrls, StdActns, ActnList, Grids, DBGrids, DBCtrls, StdCtrls,
  JvExForms,
  JvCustomItemViewer, JvImagesViewer, ToolWin,  DScintilla,
  FileCtrl, JvDriveCtrls, JvExStdCtrls, JvListBox, JvCombobox, Buttons,
  ShellCtrls, ExtCtrls, JvDockTree, JvDockControlForm,
  JvComponentBase, JvgPage, Clipbrd, JvExControls,
  JvPoweredBy, JvExComCtrls, JvHotKey, JvStatusBar,  { vcl.controls,  }
  JvExButtons, JvBitBtn, Mask, System.Actions, RNavi, JvNavigationPane,
  JvPageList, JvExExtCtrls, JvToolBar, Vcl.ActnMan, Vcl.ActnCtrls, System.UITypes,
  JvMTComponents, JvThread, JvExDBGrids, JvDBGrid, Vcl.DBCGrids, Vcl.OleCtrls,
  SHDocVw, MSHTML, WinApi.ActiveX, JvRichEdit, JvDBRichEdit;
// Adding System.Actions solves "assuspended/asnormal undefined" issue

type
  TfrmTools = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    GroupBox12: TGroupBox;
    GroupBox13: TGroupBox;
    GroupBox14: TGroupBox;
    GroupBox15: TGroupBox;
    GroupBox16: TGroupBox;
    GroupBox17: TGroupBox;
    GroupBox18: TGroupBox;
    GroupBox19: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox20: TGroupBox;
    GroupBox21: TGroupBox;
    GroupBox22: TGroupBox;
    GroupBox23: TGroupBox;
    GroupBox24: TGroupBox;
    GroupBox25: TGroupBox;
    GroupBox26: TGroupBox;
    GroupBox27: TGroupBox;
    GroupBox28: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    GroupBox8: TGroupBox;
    GroupBox9: TGroupBox;
    JvDockClientTools: TJvDockClient;
    jvivAccents: TJvImagesViewer;
    jvivArrowBoth: TJvImagesViewer;
    jvivArrowBox: TJvImagesViewer;
    jvivArrowDown: TJvImagesViewer;
    jvivArrowLeft: TJvImagesViewer;
    jvivArrowRight: TJvImagesViewer;
    jvivArrowSloped: TJvImagesViewer;
    jvivArrowUp: TJvImagesViewer;
    jvivBar: TJvImagesViewer;
    jvivBracket: TJvImagesViewer;
    jvivDot: TJvImagesViewer;
    jvivGeometryAngle: TJvImagesViewer;
    jvivGeometryBox: TJvImagesViewer;
    jvivGeometryCircle: TJvImagesViewer;
    jvivGeometryDiamond: TJvImagesViewer;
    jvivGeometryLine: TJvImagesViewer;
    jvivGeometryMisc: TJvImagesViewer;
    jvivGeometryStar: TJvImagesViewer;
    jvivGeometryTriangle: TJvImagesViewer;
    jvivGeometryVar: TJvImagesViewer;
    jvivGreekLower: TJvImagesViewer;
    jvivGreekMisc: TJvImagesViewer;
    jvivGreekUpper: TJvImagesViewer;
    jvivGreekVar: TJvImagesViewer;
    jvivMathFunction: TJvImagesViewer;
    jvivMathLogical: TJvImagesViewer;
    jvivMathMisc: TJvImagesViewer;
    jvivMathSet: TJvImagesViewer;
    jvivMathVar: TJvImagesViewer;
    jvivMisc: TJvImagesViewer;
    jvivNegation: TJvImagesViewer;
    jvivOperator: TJvImagesViewer;
    jvivRelation: TJvImagesViewer;
    jvivSkyAstrology: TJvImagesViewer;
    jvivSkySolar: TJvImagesViewer;
    jvivSkyVar: TJvImagesViewer;
    jvivUserCustom: TJvImagesViewer;
    JvPoweredByJCL1: TJvPoweredByJCL;
    Panel3: TPanel;
    panExplorerHeader: TPanel;
    panRcard1: TPanel;
    panRcard4: TPanel;
    pgLatex: TJvgPageControl;
    ScrollBox1: TScrollBox;
    ScrollBox2: TScrollBox;
    ScrollBox3: TScrollBox;
    ScrollBox4: TScrollBox;
    ScrollBox5: TScrollBox;
    stbProject: TStatusBar;
    stbSearch: TStatusBar;
    tbsLatexAccent: TTabSheet;
    tbsLatexArrow: TTabSheet;
    tbsLatexBar: TTabSheet;
    tbsLatexBracket: TTabSheet;
    tbsLatexDot: TTabSheet;
    tbsLatexGeometry: TTabSheet;
    tbsLatexGreek: TTabSheet;
    tbsLatexMath: TTabSheet;
    tbsLatexMisc: TTabSheet;
    tbsLatexNegation: TTabSheet;
    tbsLatexOperator: TTabSheet;
    tbsLatexRelation: TTabSheet;
    tbsLatexSky: TTabSheet;
    tbsLatexUserCustom: TTabSheet;

    tvProject: TTreeView;
    tvSearch: TTreeView;
    npTools: TJvNavigationPane;
    ppFiles: TJvNavPanelPage;
    ppSearch: TJvNavPanelPage;
    ppSpell: TJvNavPanelPage;
    npStyle: TJvNavPaneStyleManager;
    ppMisc: TJvNavPanelPage;
    ppR: TJvNavPanelPage;
    panExplorer: TPanel;
    panRCard: TPanel;
    panProj: TPanel;
    JvNavPanelDivider2: TJvNavPanelDivider;
    JvNavPanelDivider1: TJvNavPanelDivider;
    panNavi: TPanel;
    RNavigator: TRNavigator;
    JvNavPanelDivider4: TJvNavPanelDivider;
    JvNavPanelDivider5: TJvNavPanelDivider;
    JvNavPanelDivider6: TJvNavPanelDivider;
    ppLatex: TJvNavPanelPage;
    ppDeveloper: TJvNavPanelPage;
    JvNavPanelDivider8: TJvNavPanelDivider;
    DBGrid1: TDBGrid;
    JvNavPanelDivider9: TJvNavPanelDivider;
    memIniLog: TMemo;
    ppTxt2tags: TJvNavPanelPage;
    atbLatex: TActionToolBar;
    Panel17: TPanel;
    JvNavPanelDivider10: TJvNavPanelDivider;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    JvNavPanelDivider11: TJvNavPanelDivider;
    JvNavPanelDivider12: TJvNavPanelDivider;
    Panel21: TPanel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Panel22: TPanel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    JvNavPanelDivider15: TJvNavPanelDivider;
    panComments: TPanel;
    GroupBox30: TGroupBox;
    cbComAutoDetect_Language: TCheckBox;
    cbComPriority_Line: TCheckBox;
    dbgComments: TDBGrid;
    lbRCard: TComboBox;
    JvNavPanelDivider14: TJvNavPanelDivider;
    panRMirrors: TPanel;
    Splitter1: TSplitter;
    Panel16: TPanel;
    panCountries: TPanel;
    lbCountries: TListBox;
    Panel18: TPanel;
    dbgRmirrors: TDBGrid;
    Panel19: TPanel;
    DBNavigator5: TDBNavigator;
    Panel20: TPanel;
    dbeRmirrorsURL: TDBEdit;
    dbeRmirrorsCode: TDBEdit;
    dbeRmirrorsHost: TDBEdit;
    stbRMirrors: TStatusBar;
    atbProject: TActionToolBar;
    edCardSearch: TButtonedEdit;
    Splitter2: TSplitter;
    edToolsRExplorerFilter: TButtonedEdit;
    bbtREnvironmentRefresh: TBitBtn;
    panEnvironment: TPanel;
    cbbToolsREnvironment: TComboBox;
    bbRefreshExplorerBoth: TBitBtn;
    Splitter4: TSplitter;
    cbbToolsRExplorer: TComboBoxEx;
    panWinExplorer: TPanel;
    panWinExpHeader: TPanel;
    panWinFav: TPanel;
    bbtExplorerAddFavorites: TBitBtn;
    bbtExplorerRemoveFavorites: TBitBtn;
    cbExplorerFavorites: TComboBox;
    jvflbWinExplorer: TJvFileListBox;
    stvWindows: TShellTreeView;
    Panel1: TPanel;
    Splitter6: TSplitter;
    fcbbToolsWinExplorer: TFilterComboBox;
    Splitter7: TSplitter;
    edWinExplorerFilter: TButtonedEdit;
    Bevel1: TBevel;
    cgMainBase: TDBCtrlGrid;
    DBText1: TDBText;
    wbDescription: TWebBrowser;
    cgObjects: TDBCtrlGrid;

    procedure bbtExplorerAddFavoritesClick(Sender: TObject);
    procedure bbtExplorerRemoveFavoritesClick(Sender: TObject);
    procedure bbtREnvironmentRefreshClick(Sender: TObject);
    procedure bbtRExplorerRefreshClick(Sender: TObject);
    procedure cbbToolsREnvironmentSelect(Sender: TObject);
    procedure cbbToolsRExplorerSelect(Sender: TObject);
    procedure cbExplorerFavoritesChange(Sender: TObject);
    procedure dbeRmirrorsURLClick(Sender: TObject);
    procedure dbeRmirrorsURLMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure dbgRcardDblClick(Sender: TObject);
    procedure dbgRCardKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgRtipDblClick(Sender: TObject);
    procedure dbgRtipKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edToolsRExplorerFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure jvflbWinExplorerDblClick(Sender: TObject);
    procedure jvflbWinExplorerEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure jvflbWinExplorerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure jvflbWinExplorerStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure jvhkShortcutsEnter(Sender: TObject);
    procedure jvhkShortcutsExit(Sender: TObject);
    procedure LabelClick(Sender: TObject);
    procedure LabelMouseEnter(Sender: TObject);
    procedure LabelMouseLeave(Sender: TObject);
    procedure LatexAccents(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure LatexHint(Sender: TObject; Index: Integer;
      var HintInfo:  Vcl.Controls.THintInfo; var Handled: Boolean);
    procedure LatexMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure LatexSymbol(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure lbCountriesClick(Sender: TObject);
    procedure lbRcardClick(Sender: TObject);
    procedure pgDatabaseChange(Sender: TObject);
    procedure pgMiscChange(Sender: TObject);
    procedure pgToolsChange(Sender: TObject);
    procedure slvExplorerAddFolder(Sender: TObject; AFolder: TShellFolder;
      var CanAdd: Boolean);
    procedure slvExplorerStartDrag(Sender: TObject;
      var DragObject: TDragObject);
    procedure stbRMirrorsClick(Sender: TObject);
    procedure stbRMirrorsDrawPanel(StatusBar: TStatusBar; Panel: TStatusPanel;
      const Rect: TRect);
    procedure stbRMirrorsMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure tbRecentClick(Sender: TObject);
    procedure tvProjectAddition(Sender: TObject; Node: TTreeNode);
    procedure tvProjectChange(Sender: TObject; Node: TTreeNode);
    procedure tvProjectDblClick(Sender: TObject);
    procedure tvProjectDeletion(Sender: TObject; Node: TTreeNode);
    procedure tvProjectDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvProjectDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvProjectEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvProjectKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tvProjectStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure tvSearchChange(Sender: TObject; Node: TTreeNode);
    procedure tvSearchDblClick(Sender: TObject);
    procedure tvSearchDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure tvSearchEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure tvSearchStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure RNavigatorClick(Sender: TObject);
    procedure RNavigatorDblClick(Sender: TObject);
//    procedure dbgRcardKeyPress(Sender: TObject; var Key: Char);
    procedure edToolsRExplorerFilterClick(Sender: TObject);
    procedure bbRefreshExplorerBothClick(Sender: TObject);
    procedure edCardSearchRightButtonClick(Sender: TObject);
    procedure edCardSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure stvWindowsChange(Sender: TObject; Node: TTreeNode);
    procedure fcbbToolsWinExplorerChange(Sender: TObject);
    procedure edWinExplorerFilterRightButtonClick(Sender: TObject);
    procedure edWinExplorerFilterKeyPress(Sender: TObject; var Key: Char);
    procedure edWinExplorerFilterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCardSearchKeyPress(Sender: TObject; var Key: Char);
    procedure edWinExplorerFilterExit(Sender: TObject);
    procedure edCardSearchExit(Sender: TObject);
    procedure edToolsRExplorerFilterExit(Sender: TObject);
    procedure edToolsRExplorerFilterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure npToolsResize(Sender: TObject);
    procedure FormMouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure cgObjectsPaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure npToolsSplitterMoved(Sender: TObject);
    procedure JvNavPanelDivider4Moved(Sender: TObject);
    procedure JvNavPanelDivider1Moved(Sender: TObject);
    procedure RenderHTMLPage(HTLMString: String);
    procedure cgMainBaseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cgMainBaseKeyPress(Sender: TObject; var Key: Char);
    procedure edCardSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cgMainBaseDblClick(Sender: TObject);
    procedure cgMainBasePaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure cgObjectsDblClick(Sender: TObject);
    procedure cgObjectsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cgObjectsKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cgObjectsStartDrag(Sender: TObject; var DragObject: TDragObject);
    procedure cgObjectsKeyPress(Sender: TObject; var Key: Char);
    procedure npToolsChange(Sender: TObject);

  private
    { Private declarations }
    procedure AdjustColumnWidths(DBGrid: TDBGrid);
    procedure ResizeMainBase;
    procedure ResizeObjects;

  public
    { Public declarations }
    sLibraryTextFilter: String;
    sLibraryGroupFilter: String;
    sLibraryPackageFilter: String;
    procedure DoProjectOpenNode;
    procedure ResetRExplorerFilter;
  end;

var
  frmTools: TfrmTools;

implementation

uses
  ufrmMain,
  trCodeSender,
  uLaTeX,
  ufrmEditor,
  ufrmRterm,
  uModDados,
  trUtils,
  Menus;

{$R *.dfm}

procedure TfrmTools.bbtExplorerAddFavoritesClick(Sender: TObject);
begin
  with cbExplorerFavorites do
  begin
    if SysUtils.directoryexists(stvWindows.path) and (Items.IndexOf(stvWindows.path) < 0)
    then
      Items.Add(stvWindows.path);
    ItemIndex := Items.IndexOf(stvWindows.path)
  end;
end;

procedure TfrmTools.bbtExplorerRemoveFavoritesClick(Sender: TObject);
begin
  with cbExplorerFavorites do
    if (Text <> '') then
      Items.Delete(ItemIndex);
end;

procedure TfrmTools.bbtREnvironmentRefreshClick(Sender: TObject);
begin
  frmTinnMain.actREnvironmentRefreshExecute(nil);
end;

procedure TfrmTools.bbtRExplorerRefreshClick(Sender: TObject);
begin
  frmTinnMain.actRExplorerRefreshExecute(nil);
end;

procedure TfrmTools.bbRefreshExplorerBothClick(Sender: TObject);
begin
  frmTinnMain.actREnvironmentRefresh.Execute;
  frmTinnMain.actRExplorerRefresh.Execute;
end;

procedure TfrmTools.edCardSearchExit(Sender: TObject);
begin
  lbRcardClick(self);
end;

procedure TfrmTools.edCardSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
    edCardSearch.OnRightButtonClick(self);
end;

procedure TfrmTools.edCardSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TfrmTools.edCardSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  lbRcardClick(self);
end;

procedure TfrmTools.edCardSearchRightButtonClick(Sender: TObject);
begin
  lbRcardClick(self);
end;

procedure TfrmTools.edToolsRExplorerFilterClick(Sender: TObject);
begin
  frmTools.ResetRExplorerFilter;
end;

procedure TfrmTools.edToolsRExplorerFilterExit(Sender: TObject);
begin
  ResetRExplorerFilter;
end;

procedure TfrmTools.cbbToolsREnvironmentSelect(Sender: TObject);
begin
  ResetRExplorerFilter;
end;

procedure TfrmTools.cbbToolsRExplorerSelect(Sender: TObject);
begin
  ResetRExplorerFilter;
end;

procedure TfrmTools.cbExplorerFavoritesChange(Sender: TObject);
var
  sTmp: string;

begin
  try
    sTmp := trim(cbExplorerFavorites.Text);
    if SysUtils.directoryexists(sTmp) then
      stvWindows.path := sTmp
    else if (MessageDlg(trim(cbExplorerFavorites.Text) + #13 + #13 +
      'The path above wasn''t found.' + #13 +
      'Would you like to remove it from the favorites?', mtConfirmation,
      [mbYes, mbNo], 0) = mrYes) then
      bbtExplorerRemoveFavoritesClick(nil);
    // TopIndex := Selected;
    // end;
  except
    On EInvalidPath do
      if (MessageDlg(trim(cbExplorerFavorites.Text) + #13 + #13 +
        'The path above wasn''t found.' + #13 +
        'Would you like to remove it from the favorites?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes) then
        bbtExplorerRemoveFavoritesClick(nil);
  end;
end;

procedure TfrmTools.cgObjectsDblClick(Sender: TObject);
var
  i: integer;
begin
with frmTinnMain do
begin
{  if (pgFiles.PageCount = 0) then
    Exit;
  i := FindTopWindow;
   }
  actRExplorerSendNameToEditorExecute(nil);
  {
  PostMessage(TWinControl(frmTinnMain.MDIChildren[i] as TfrmEditor).Handle,
    WM_SETFOCUS, 0, 0); }
end;
end;

procedure TfrmTools.cgObjectsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not assigned(ModDados) then
    exit;

  if Key = VK_Delete then
    frmTinnMain.actRExplorerRemoveExecute(nil);
end;

procedure TfrmTools.cgObjectsKeyPress(Sender: TObject; var Key: Char);
var
  sKey, sCompare: String;
  bMatched: Boolean;
  iCurrent: Integer;

begin
if modDados.cdRObjects.FieldByName('Name').IsNull then
  exit;
  with modDados.cdRObjects do
  begin
    DisableControls;

    sKey:= ansilowercase(String(Key));

    iCurrent := RecNo;
    bMatched := false;


    while not bMatched do
    begin
      if not eof then
        next
      else first;


      sCompare := ansilowercase(FieldByName('Name').AsString);

      if sCompare[1] = sKey then
        bMatched := true;

      if RecNo = iCurrent then
        bMatched := true;
    end;

    EnableControls;
  end;
end;

procedure TfrmTools.cgObjectsKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not assigned(ModDados) then
    exit;

  if (Shift = [ssCtrl]) and (Upcase(Char(Key)) = 'C') then
    if not  modDados.cdRObjects.FieldByName('Name').IsNull then
      Clipboard.AsText := modDados.cdRObjects.FieldByName('Name').AsString;
end;

procedure TfrmTools.cgObjectsPaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var sName, sDim, sGroup, sClass, sGroupClass: String;
    iGroupClassOffset, iDimOffset, iPanelWidth, iNameMax, iArgMax, iNameMin, iGroupClassMin, iFirstRowHeight, iIndex: Integer;
    r: TRect;
    bitmap : TBitmap;
 //   clBackground: TColor;

    function AlignedText(sText: String; iWidth: Integer): String;
    begin
      if DBCtrlGrid.Canvas.TextWidth('...') > iWidth then
      begin
        Result := '..';
          if DBCtrlGrid.Canvas.TextWidth('..') > iWidth then
          begin
             Result := '.';
             if DBCtrlGrid.Canvas.TextWidth('.') > iWidth then
               Result := '';
          end;
        Exit;
      end;
      Result := sText;
      while(DBCtrlGrid.Canvas.TextWidth(Result) > iWidth) do
      begin
        sText := copy(sText, 0, length(sText)-1);
        Result := sText+'...';
      end;
    end;
begin

 with DBCtrlGrid.DataSource.DataSet do
 begin
   sName       := FieldByName('Name').AsString;
   sDim    := FieldByName('Dim').AsString;
   if sDim <> '' then
     sDim := 'Dim: '+sDim;
   sGroup  := FieldByName('Group').AsString;
   sClass:= FieldByName('Class').AsString;
 end;


 // First line

 with DBCtrlGrid.Canvas do
 begin

   //clBackground := Brush.Color;
   if DBCtrlGrid.DataSource.DataSet.RecordCount >0 then
   if Index = DBCtrlGrid.PanelIndex then
   begin
     Brush.Color :=clMenuHighlight;
     r.Left := 0;
     r.Top  := 0;
     r.Width := Width;
     r.Height := Height;
     FillRect(r);
    end;

   iPanelWidth := DBCtrlGrid.PanelWidth;
   Font.Style := [fsBold];
   iNameMin := TextWidth('c...');
   iFirstRowHeight := TextHeight('Tgj');

   Font.Style := [];


   iDimOffset := TextWidth(sDim) + 10;
   if (iPanelWidth - TextWidth(sDim)-5)< iNameMin then
   begin
     iDimOffset:= 5;
   end else TextOut(iPanelWidth - iDimOffset + 5  ,3, sDim);
     iNameMax := iPanelWidth - iDimOffset - 5;

   Font.Style := [fsBold];
   TextOut(5 ,3, AlignedText(sName, iNameMax));
 end;

 // Second ine

 with DBCtrlGrid.Canvas do
 begin


  iGroupClassOffset := 5;

  if length(sGroup) > 0 then
    iIndex := 0 else iIndex := -1;

  if (sGroup = 'function') then
    iIndex := 2 else
  if (sGroup = 'data.frame') then
    iIndex := 3 else
  if (sGroup = 'array') then
    iIndex := 4 else
  if (sGroup = 'matrix') then
    iIndex := 5 else
  if (sGroup = 'table') then
    iIndex := 6 else
  if (sGroup = 'vector') then
    iIndex := 7 else
  if (sGroup = 'list') then
    iIndex := 8 else
  if (sGroup = 'other') then
    iIndex := 9;

  if (iIndex > -1) and (iPanelWidth > 5 + 16 + 1) then
  begin

    bitmap := TBitmap.Create;
    try

      frmTinnMain.imlRexplorer.GetBitmap(iIndex, bitmap);
      Bitmap.HandleType := bmDIB;
      Bitmap.Transparent := True;
      Draw(5, iFirstRowHeight+5, bitmap);

      iGroupClassOffset := 5 + 16 + 5;
    finally
      bitmap.Free;
    end;
  end;


   Font.Style := [];

   iGroupClassMin := TextWidth('c...');

   sGroupClass := sGroup;
   if sGroup <> sClass then
     if sClass <> '' then
       sGroupClass := sGroupClass + ', ' + sClass;

    TextOut(iGroupClassOffset ,iFirstRowHeight+5, AlignedText(sGroupClass, iPanelWidth-iGroupClassOffset-5));

 end;

end;

procedure TfrmTools.cgObjectsStartDrag(Sender: TObject;
  var DragObject: TDragObject);
  function GetItem: string;
  var
    sExtension, sItem, sTmp: string;

  begin
    Result := '';
    with modDados.cdRObjects do
    begin

      if   FieldByName('Name').IsNull then
        Exit;
      if (FieldByName('Group').AsString = 'function') then
        sExtension := '.r'
      else
        sExtension := '.txt';
    ;
    sItem := FieldByName('Name').AsString;
    sTmp := sItem + sExtension;
    end;
    frmTinnMain.sDragSource := frmTinnMain.sPathTmp + '\' + sTmp;

    Result := 'trExport(''' + sItem + '''' + ', ' + 'type=''ascii''' + ', ' +
      'file=paste(.trPaths[1], ' + '''' + sTmp + '''' + ', sep=''''))';
  end;

var
  i: Integer;

  sTmp, sToSend: string;

begin
  if not assigned(ModDados) then
    exit;

  sTmp := GetItem;

  if (sTmp = '') then
    Exit;

  // frmTinnMain.DoSend(sTmp);
  with frmTinnMain do
    // Rterm: priority 2.1
    if Rterm_Running then
    begin
      sToSend := sTmp + #13#10;

      if (csRExplorer.Active) then
        csRExplorer.Socket.SendText(sToSend)
      else
      begin
        CheckRterm;
        frmRterm.cRterm.SendInput(sToSend);
        SendToConsole(sTmp);
      end;

    end
    else // Rgui: priority 2.2
      if Rgui_Running then
      begin
        sToSend := sTmp;

        if (csRExplorer.Active) then
          csRExplorer.Socket.SendText(sToSend + #13#10)
        else
          fCodeSender.SendChar(sToSend, hRgui);

        SetFocus_Rgui(iDelay div 4);
      end;

  i := 0;
  repeat
    Sleep(frmTinnMain.iDelay div 4);
    if FileExists(frmTinnMain.sDragSource) then
      Break;
    inc(i);
  until (i = 10); // To avoid infinite loop
  frmTinnMain.SetFocus_Rgui(0);
end;

procedure TfrmTools.cgMainBaseDblClick(Sender: TObject);
begin
 frmTinnMain.actRcardInsertExecute(nil);
end;

procedure TfrmTools.cgMainBaseKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var
  sKey, sCompare: String;
  bMatched, bTabDown: Boolean;
  iCurrent: Integer;

begin
  case Key of
    VK_RETURN:
      frmTinnMain.actRcardInsertExecute(nil);
  end;
end;

procedure TfrmTools.cgMainBaseKeyPress(Sender: TObject; var Key: Char);
var
  sKey, sCompare: String;
  bMatched, bTabDown: Boolean;
  iCurrent: Integer;

begin

  with modDados.cdMainBase do
  begin
    DisableControls;

    sKey:= ansilowercase(String(Key));

    iCurrent := RecNo;
    bMatched := false;

    //bTabDown :=GetKeyState(VK_TAB) < 0;
    //
    bTabDown := false;
    //Control loses focus on tab down
    while not bMatched do
    begin

      if not bTabDown then
      begin
        if not eof then
          next
        else first;
      end else
      begin
        if not bof then
          previous
        else last;
      end;


      sCompare := ansilowercase(FieldByName('Name').AsString);

      if sCompare[1] = sKey then
        bMatched := true;

      if RecNo = iCurrent then
        bMatched := true;
    end;

    EnableControls;
  end;
end;

procedure TfrmTools.cgMainBasePaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var sName, sTrigger, sArguments, sEnvironment: String;
    iTriggerOffset, iPackageOffset, iPanelWidth, iNameMax, iArgMax, iNameMin, iArgMin, iFirstRowHeight: Integer;
    r: TRect;
    clTrigger: TColor;
    function AlignedText(sText: String; iWidth: Integer): String;
    begin
      if DBCtrlGrid.Canvas.TextWidth('...') > iWidth then
      begin
        Result := '..';
          if DBCtrlGrid.Canvas.TextWidth('..') > iWidth then
          begin
             Result := '.';
             if DBCtrlGrid.Canvas.TextWidth('.') > iWidth then
               Result := '';
          end;
        Exit;
      end;
      Result := sText;
      while(DBCtrlGrid.Canvas.TextWidth(Result) > iWidth) do
      begin
        sText := copy(sText, 0, length(sText)-1);
        Result := sText+'...';
      end;
    end;
begin

 with DBCtrlGrid.DataSource.DataSet do
 begin
   sName       := FieldByName('Name').AsString;
   sTrigger    := FieldByName('Trigger').AsString;
   sArguments  := FieldByName('Arguments').AsString;
   sEnvironment:= FieldByName('PrettyPackage').AsString;
 end;

 //sEnvironment
 //if ansipos('package:', sEnvironment) = 1 then
 //  sEnvironment := copy(sEnvironment, 9, 999999);

 // First line

 with DBCtrlGrid.Canvas do
 begin
 //    DBCtrlGrid.Canvas.FloodFill();
   clTrigger := clHotLight;

   if Index = DBCtrlGrid.PanelIndex then
   begin
     r.Left := 0;
     r.Top  := 0;
     r.Width := Width;
     r.Height := Height;
     Brush.Color :=clMenuHighlight;

     FillRect(r);
     clTrigger := ContrastColor(clMenuHighlight);
   end;

   iPanelWidth := DBCtrlGrid.PanelWidth;
   Font.Style := [fsBold];
   iNameMin := TextWidth('c...');
   iFirstRowHeight := TextHeight('Tgj');

   Font.Style := [];
   Font.Color := clGrayText;

   iPackageOffset := TextWidth(sEnvironment) + 10;
   if (iPanelWidth - TextWidth(sEnvironment)-5)< iNameMin then
   begin
     iPackageOffset:= 5;
   end else TextOut(iPanelWidth - iPackageOffset + 5  ,3, sEnvironment);
     iNameMax := iPanelWidth - iPackageOffset - 5;
     Font.Color := clWindowText;
   Font.Style := [fsBold];
   TextOut(5 ,3, AlignedText(sName, iNameMax));
 end;

 // Second and third line

 with DBCtrlGrid.Canvas do
 begin

   Font.Style := [];
   Font.Color := clTrigger;
   iArgMin := TextWidth('c...');


   iTriggerOffset := TextWidth(sTrigger) + 10;
   if (iPanelWidth - TextWidth(sTrigger)-5)< iArgMin then
   begin
     iTriggerOffset:= 5;
   end else TextOut(iPanelWidth - iTriggerOffset + 5  ,iFirstRowHeight+4, sTrigger);

   Font.Color := clWindowText;
   iArgMax := iPanelWidth - iTriggerOffset - 5-5;
   r := Bounds(10, iFirstRowHeight+4, iArgMax , TextHeight(sArguments)*2+2 );
   DrawText(Handle,PChar(sArguments),-1,r,DT_WORDBREAK or DT_END_ELLIPSIS or DT_EDITCONTROL);

 end;


end;

procedure TfrmTools.dbeRmirrorsURLClick(Sender: TObject);
begin
  with frmTinnMain do
    actRmirrorsOpenURLCurrentExecute(nil);
end;

procedure TfrmTools.dbeRmirrorsURLMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  dbeRmirrorsURL.Cursor := crHandPoint;
end;

procedure TfrmTools.dbgRcardDblClick(Sender: TObject);
begin
  with frmTinnMain do
    actRcardInsertExecute(nil);
end;

procedure TfrmTools.dbgRCardKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      frmTinnMain.actRcardInsertExecute(nil);
  end;

end;


{
procedure TfrmTools.dbgRcardKeyPress(Sender: TObject; var Key: Char);
var
  sCurrentFilter: String;
  bCurrentFilter: Boolean;
  iCurrent: Integer;
begin
  with modDados.cdRcard do
  begin
    DisableControls;

    sCurrentFilter := Filter;
    bCurrentFilter := Filtered;
    iCurrent := FieldByName('ID').AsInteger;
    if not bCurrentFilter then
      Filter := '';

    if (trim(Filter) = '') or (not bCurrentFilter) then
      Filter := 'Function LIKE ' + QuotedStr(String(Key) + '%')
    else
      Filter := Filter + ' AND Function LIKE ' + QuotedStr(String(Key) + '%');

    Filtered := true;

    if RecordCount > 0 then
    begin
      if Locate('ID', iCurrent, []) then
      begin
        if RecNo < RecordCount then
          Next
        else
          First;
      end
      else
        First;
      iCurrent := FieldByName('ID').AsInteger;
    end;
    Filter := sCurrentFilter;
    Filtered := bCurrentFilter;
    Locate('ID', iCurrent, []);

    EnableControls;
  end;
end;
}


procedure TfrmTools.dbgRtipDblClick(Sender: TObject);
begin
  with frmTinnMain do
    actRtipInsertExecute(nil);
end;

procedure TfrmTools.dbgRtipKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      with frmTinnMain do
        actRtipInsertExecute(nil);
  end;
end;

procedure TfrmTools.edToolsRExplorerFilterKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    frmTinnMain.actRExplorerRefreshExecute(nil);
    edToolsRExplorerFilter.SetFocus;
  end;
end;

procedure TfrmTools.edToolsRExplorerFilterKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    ResetRExplorerFilter;
end;

procedure TfrmTools.edWinExplorerFilterExit(Sender: TObject);
begin
  edWinExplorerFilter.OnRightButtonClick(self);
end;

procedure TfrmTools.edWinExplorerFilterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN:
      edWinExplorerFilter.OnRightButtonClick(self);
    VK_ESCAPE:
      edWinExplorerFilter.OnRightButtonClick(self);
  end;
end;

procedure TfrmTools.edWinExplorerFilterKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TfrmTools.edWinExplorerFilterRightButtonClick(Sender: TObject);
begin
  if ((trim(edWinExplorerFilter.Text) = '*.*') or
    (trim(edWinExplorerFilter.Text) = '')) then
  begin
    edWinExplorerFilter.Text := '';
    jvflbWinExplorer.Mask := trim(fcbbToolsWinExplorer.Mask);
  end
  else
  begin
    fcbbToolsWinExplorer.ItemIndex := 0;
    jvflbWinExplorer.Mask := trim(edWinExplorerFilter.Text);
  end;
end;


procedure TfrmTools.fcbbToolsWinExplorerChange(Sender: TObject);
begin
  with jvflbWinExplorer do
  begin
    Items.BeginUpdate;
    jvflbWinExplorer.Mask := trim(fcbbToolsWinExplorer.Mask);
    edWinExplorerFilter.Text := '';
    Items.EndUpdate;
  end;
end;

procedure TfrmTools.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 // frmTinnMain.actToolsVisibleExecute(nil);
end;

procedure TfrmTools.FormCreate(Sender: TObject);
begin
  JvDockClientTools.DockStyle := frmTinnMain.JvDockVSNetStyle;
  ManualDock(frmTinnMain.JvDockServer.LeftDockPanel, nil, AlClient);
  ShowDockForm(self);
end;

procedure TfrmTools.FormMouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  //MousePos := ScreenToClient(MousePos);
 // if PtInRect((Sender as TScrollBox), MousePos) then
  if cgMainBase.Focused then
  begin
    if WheelDelta>0 then
       cgmainbase.DataSource.DataSet.Prior else
           cgmainbase.DataSource.DataSet.Next;
     Handled := true;
  end;

  if cgObjects.Focused then
  begin
    if WheelDelta>0 then
       cgObjects.DataSource.DataSet.Prior else
           cgObjects.DataSource.DataSet.Next;
     Handled := true;
  end;
end;

procedure TfrmTools.FormResize(Sender: TObject);
begin
  AdjustColumnWidths(dbgRmirrors);
  // AdjustColumnWidths(dbgCompletion);
  AdjustColumnWidths(dbgComments);

  ResizeMainBase;
  ResizeObjects;
end;

procedure TfrmTools.FormShow(Sender: TObject);
begin
  AdjustColumnWidths(dbgRmirrors);
  // AdjustColumnWidths(dbgCompletion);
  AdjustColumnWidths(dbgComments);

  cgMainBase.rowcount := (cgMainBase.Height div 48);

  AlphaBlendValue := frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmTools.jvhkShortcutsEnter(Sender: TObject);
begin

  frmTinnMain.alMain.State := asSuspended;

end;

procedure TfrmTools.jvhkShortcutsExit(Sender: TObject);
begin
  frmTinnMain.alMain.State := asNormal;
end;

procedure TfrmTools.JvNavPanelDivider1Moved(Sender: TObject);
begin
  ResizeObjects;
  ResizeMainBase;
end;

procedure TfrmTools.JvNavPanelDivider4Moved(Sender: TObject);
begin
  ResizeMainBase;
end;



procedure TfrmTools.slvExplorerAddFolder(Sender: TObject; AFolder: TShellFolder;
  var CanAdd: Boolean);
var
  sFilterExt, sExt: string;

begin
  if fcbbToolsWinExplorer.Mask <> '*.*' then
  begin
    sFilterExt := lowerCase(fcbbToolsWinExplorer.Mask);
    sExt := lowerCase(ExtractFileExt(AFolder.PathName));
    // Only accept filter and folders
    if (Pos(sExt, sFilterExt) <> 0) or AFolder.IsFolder then
      CanAdd := true
    else
      CanAdd := False;
  end;
end;

procedure TfrmTools.jvflbWinExplorerDblClick(Sender: TObject);
var
  sTmp: string;
begin
  sTmp := jvflbWinExplorer.FileName;
  if FileExists(sTmp) then
    frmTinnMain.OpenFileIntoTinn(sTmp);
end;

procedure TfrmTools.jvflbWinExplorerEndDrag(Sender, Target: TObject;
  X, Y: Integer);
begin
  frmTinnMain.sDragSource := '';
end;

procedure TfrmTools.jvflbWinExplorerKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sTmp: string;
begin
  case Key of
    VK_RETURN:
      begin
        sTmp := jvflbWinExplorer.FileName;
        if FileExists(sTmp) then
          frmTinnMain.OpenFileIntoTinn(sTmp);
      end;
  end;
end;

procedure TfrmTools.jvflbWinExplorerStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  frmTinnMain.sDragSource := (Sender as TJvFileListBox).FileName;
end;

procedure TfrmTools.slvExplorerStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  frmTinnMain.sDragSource := (Sender as TShellListView).SelectedFolder.PathName;
end;

procedure TfrmTools.stbRMirrorsClick(Sender: TObject);
begin
  with frmTinnMain do
    actRmirrorsOpenURLDefaultExecute(nil);
end;

procedure TfrmTools.stbRMirrorsDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  with stbRMirrors.Canvas do
  begin
    case Panel.Index of
      0:
        begin
          // Brush.Color:= cTmp;
          Font.Color := clGreen;
          // Font.Style := [fsBold];
        end;
      1:
        begin
          // Brush.Color:= clYellow;
          Font.Color := clGreen;
          Font.Style := [fsBold];
        end;
    end;

    TextOut(Rect.left + 2, Rect.top + 1, Panel.Text);
  end;
end;

procedure TfrmTools.stbRMirrorsMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  stbRMirrors.Cursor := crHandPoint;
end;

procedure TfrmTools.stvWindowsChange(Sender: TObject; Node: TTreeNode);
begin
  if SysUtils.directoryexists(stvWindows.path) then
    jvflbWinExplorer.Directory := stvWindows.path
  else
    jvflbWinExplorer.Directory := '';
end;

procedure TfrmTools.tbRecentClick(Sender: TObject);
begin
  frmTinnMain.actProjectOpenExecute(nil);
end;

procedure TfrmTools.tvProjectAddition(Sender: TObject; Node: TTreeNode);
begin
  with stbProject do
  begin
    Panels[1].Text := IntToStr(tvProject.Items.Count);
    Refresh;
  end;
end;

procedure TfrmTools.tvProjectChange(Sender: TObject; Node: TTreeNode);
begin
  with stbProject do
  begin
    Panels[1].Text := IntToStr(tvProject.Items.Count);
    Panels[3].Text := IntToStr(tvProject.Selected.AbsoluteIndex + 1);
    Panels[5].Text := Node.Text;
    Refresh;
  end;
  frmTinnMain.iProjecSelected := tvProject.Selected.Level;
end;

procedure TfrmTools.DoProjectOpenNode;
var
  i: Integer;
  sTmp: string;

begin
  with tvProject do
    if (Selected = nil) then
      Exit;

  with tvProject do
    case Selected.Level of
      0:
        frmTinnMain.OpenAllFiles;
      1:
        frmTinnMain.OpenAllFilesOfGroup;
      2:
        begin
          sTmp := string(tvProject.Selected.Data);
          for i := 1 to (Items.Count - 1) do
            if Items[i].Level = 2 then
              if (Items[i].Selected) then
                Items[i].ImageIndex := 3
              else if (Items[i].ImageIndex = 3) then
                Items[i].ImageIndex := 2;
          if FileExists(trim(sTmp)) then
            frmTinnMain.OpenFileIntoTinn(trim(sTmp))
          else
            MessageDlg(trim(sTmp) + #13 + #13 + 'File not found!', mtWarning,
              [mbOK], 0);
        end;
    end;
end;

procedure TfrmTools.ResetRExplorerFilter;
var
  sEnvFilter, sGroup, sGroupFilter, sTextFilter: string;
begin
  if cbbToolsREnvironment.ItemIndex > -1 then
    sEnvFilter := ' envir = ' + QuotedStr(cbbToolsREnvironment.Items[cbbToolsREnvironment.ItemIndex]) else
       sEnvFilter := ' 1 = 0';

  if cbbToolsRExplorer.ItemIndex = 0 then
    sGroupFilter := ''
  else
  begin
    case frmTools.cbbToolsRExplorer.ItemIndex of
      1: sGroup := 'data';
      2: sGroup := 'function';
      3: sGroup := 'data.frame';
      4: sGroup := 'array';
      5: sGroup := 'matrix';
      6: sGroup := 'table';
      7: sGroup := 'vector';
      8: sGroup := 'list';
      9: sGroup := 'other';
    end;
    sGroupFilter := ' AND [Group] = ' + QuotedStr(sGroup);
  end;


  if trim(edToolsRExplorerFilter.Text) <> '' then
        sTextFilter := sTextFilter + ' AND Name Like' + QuotedStr('%' + trim(edToolsRExplorerFilter.Text) + '%')
    else if trim(edToolsRExplorerFilter.Text) <> '' then
      sTextFilter := '';

  if not assigned(ModDados) then
    exit;

  with ModDados do
  begin

    try
      try
        sqldsRObjects.CommandText := 'SELECT Name, Dim, [Group], class, envir FROM objects WHERE ' + sEnvFilter + sGroupFilter + sTextFilter;
        cdRObjects.Active := true;
        cdRObjects.Refresh;
        cgObjects.Refresh;

      except
        //showmessage('stupid 1');
        frmTinnMain.tDataConflict.Enabled := true;
      end;
    finally
      //showmessage('stupid');
    end;
  end;
  //if frmTinnMain.bRExplorerActive then
    frmTinnMain.actRExplorerRefreshExecute(nil);
end;

procedure TfrmTools.ResizeMainBase;
var iTotalHeight: Integer;
begin

  iTotalHeight := 48;
  iTotalHeight :=  (cgMainBase.Canvas.Font.Size) *7-2;


  cgMainBase.rowcount := (cgMainBase.Height div iTotalHeight);
end;

procedure TfrmTools.ResizeObjects;
var iTotalHeight: Integer;
begin

  iTotalHeight := 36;
  iTotalHeight := (cgMainBase.Canvas.Font.Size) *5;

  cgObjects.rowcount := (cgObjects.Height div iTotalHeight);
end;


procedure TfrmTools.tvProjectDblClick(Sender: TObject);
begin
  DoProjectOpenNode;
end;

procedure TfrmTools.tvProjectDeletion(Sender: TObject; Node: TTreeNode);
begin
  with stbProject do
  begin
    Panels[1].Text := IntToStr(tvProject.Items.Count);
    Refresh;
  end;
end;

// Adapted from http://delphi.about.com/cs/adptips2001/a/bltip0901_3.htm
procedure TfrmTools.tvProjectDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  attachMode: TNodeAttachMode;
  hT: THitTests;
  tnItem: TTreeNode;

begin
  attachMode := naInsert;

  try
    with tvProject do
      if (Selected = nil) or (Selected.Level <> 2) then
        Exit;
    hT := tvProject.GetHitTestInfoAt(X, Y);
    tnItem := tvProject.GetNodeAt(X, Y);
    if (hT - [htOnItem, htOnIcon, htNowhere, htOnIndent] <> hT) then
    begin
      if (htOnItem in hT) or (htOnIcon in hT) then
        attachMode := naAddChild
      else if (htNowhere in hT) then
        attachMode := naAdd
      else if (htOnIndent in hT) then
        attachMode := naInsert;
      if (tnItem <> nil) then
      begin
        if (tnItem.Level = 1) then
        begin
          tvProject.Selected.MoveTo(tnItem, attachMode);
          tnItem.AlphaSort(true);
          frmTinnMain.bProjectChanged := true;
        end;
      end;
    end;

  except
    MessageDlg('Last task not done with success!' + #13 + #13 +
      'Please, repeat it.', mtError, [mbOK], 0);
  end;
end;

procedure TfrmTools.tvProjectDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Sender is TTreeView then
    Accept := true;
end;

procedure TfrmTools.tvProjectEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  frmTinnMain.sDragSource := '';
end;

procedure TfrmTools.tvProjectKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Sender is TTreeView) then
    // Remove selected group or file from Delete key
    with tvProject do
      if (Key = VK_Delete) then
      begin
        if (Selected.Level = 1) or (Selected.Level = 2) then
        begin
          Selected.Delete;
          frmTinnMain.bProjectChanged := true;
        end;
      end;

  case Key of
    VK_RETURN:
      DoProjectOpenNode;
  end;
end;

procedure TfrmTools.tvProjectStartDrag(Sender: TObject;
  var DragObject: TDragObject);
begin
  frmTinnMain.iDragLevel := -1;
  with tvProject do
    case Selected.Level of
      0:
        frmTinnMain.iDragLevel := 0;
      1:
        frmTinnMain.iDragLevel := 1;
      2:
        frmTinnMain.sDragSource :=
          trim(string((Sender as TTreeView).Selected.Data));
    end;
end;

procedure TfrmTools.tvSearchChange(Sender: TObject; Node: TTreeNode);
begin
  with stbSearch do
  begin
    Panels[1].Text := IntToStr(tvSearch.Items.Count);
    Panels[3].Text := IntToStr(tvSearch.Selected.AbsoluteIndex + 1);
    Panels[5].Text := Node.Text;
    Refresh;
  end;
end;

procedure TfrmTools.tvSearchDblClick(Sender: TObject);
begin
  frmTinnMain.OpenFileFromSearch;
end;

procedure TfrmTools.tvSearchDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  if Sender is TTreeView then
    Accept := true;
end;

procedure TfrmTools.tvSearchEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  frmTinnMain.sDragSource := '';
end;

procedure TfrmTools.tvSearchStartDrag(Sender: TObject;
  var DragObject: TDragObject);
var
  iPos, iEnd: Integer;
  sTmp: string;

begin
  frmTinnMain.iDragLevel := -1;
  with tvSearch do
  begin
    case Selected.Level of
      0:
        frmTinnMain.iDragLevel := 0;
      1:
        frmTinnMain.iDragLevel := 1;
      2:
        frmTinnMain.iDragLevel := 2;
    end;
    if (Selected = nil) or (Selected.Level < 2) then
      Exit;
    sTmp := Selected.Text;
    frmTinnMain.sDragSource := Selected.Parent.Text;
    iPos := Pos('(', sTmp);
    if (iPos > 0) then
    begin
      iEnd := Pos('):', sTmp);
      frmTinnMain.sDragSourceLine := Copy(sTmp, iPos + 1, (iEnd - iPos) - 1);
    end;
  end;

end;

procedure TfrmTools.LatexSymbol(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  i: Integer;
  sTmp: string;
  sciEditor: TDScintilla;
  procedure FormatSymbol;
  var
    iPos: Integer;

  begin
    sTmp := ChangeFileExt(sTmp, '');
    iPos := Pos('_', sTmp);
    sTmp := Copy(sTmp, iPos + 1, length(sTmp));
    sTmp := '\' + sTmp;
  end;



begin

  if (not frmTinnMain.GetActiveEditorOrNil(sciEditor)) OR (not(Sender is TJvImagesViewer)) then
    Exit;
  with Sender as TJvImagesViewer do
  begin
    i := SelectedIndex;
    if (i < 0) then
      Exit;
    sTmp := ExtractFileName(Items[i].FileName);
    FormatSymbol;
    InsertLatexSymbol(sciEditor, sTmp, 0);
  end;
end;

procedure TfrmTools.lbRcardClick(Sender: TObject);
var
  sFilter, sOldFilter: String;
begin

  sFilter := trim(edCardSearch.Text);
  if sFilter <> '' then
    sLibraryTextFilter := ' Name Like ' +QuotedStr('%' + trim(edCardSearch.Text) + '%') else
    sLibraryTextFilter := '';


//  frmTinnMain.iRcardFilter := lbRCard.ItemIndex;

  with modDados.cdMainBase do
  begin
    sOldFilter := Filter;

    if (length(sLibraryTextFilter) > 0) and (length(sLibraryGroupFilter)>0) then
      sFilter := sLibraryTextFilter + ' AND ' + sLibraryGroupFilter
    else
      sFilter := sLibraryTextFilter + sLibraryGroupFilter;

    if (length(sFilter) > 0) and (length(sLibraryPackageFilter)>0) then
      sFilter := sFilter + ' AND ' + sLibraryPackageFilter
    else
      sFilter := sFilter + sLibraryPackageFilter;

   if sOldFilter <> sFilter then
   begin
     DisableControls;
     Filter := sFilter;
     Filtered := length(Filter)>0;

     First;
     EnableControls;
   end;
  end
end;

procedure TfrmTools.npToolsChange(Sender: TObject);
begin
  ResizeMainBase;
  ResizeObjects;
end;

procedure TfrmTools.npToolsResize(Sender: TObject);
begin
  ResizeMainBase;
end;

procedure TfrmTools.npToolsSplitterMoved(Sender: TObject);
begin
  ResizeMainBase;
end;

procedure TfrmTools.lbCountriesClick(Sender: TObject);
begin
  with lbCountries do
    if (ItemIndex < 0) or (ItemIndex > Count - 1) then
      ItemIndex := 0;

  frmTinnMain.iCountriesFilter := lbCountries.ItemIndex;
  with modDados.cdRmirrors do
  begin
    DisableControls;

    Filter := 'Country = ' +
      QuotedStr(lbCountries.Items.Strings[frmTinnMain.iCountriesFilter]);

    Filtered := true;

    // Try to locate the R mirror default
    Locate('URL', frmTinnMain.sRmirror, []);

    EnableControls;
  end;
end;

procedure TfrmTools.pgDatabaseChange(Sender: TObject);
begin
  { m.p. with pgDatabase do
    {m.p.
    if      (ActivePage = tbsRcard)      then lbRcard.SetFocus
    else if (ActivePage = tbsCompletion) then lbCompletion.SetFocus
    else if (ActivePage = tbsRMirrors)   then lbCountries.SetFocus;
  }

  // AdjustColumnWidths(dbgCompletion);
  AdjustColumnWidths(dbgRmirrors);
  AdjustColumnWidths(dbgComments);
end;

procedure TfrmTools.pgMiscChange(Sender: TObject);
begin
  // m.p. set focus!!!!
  { with pgMisc do
    if      (ActivePage = tbsWinExplorer)  then jvdlbWinExplorer.SetFocus
    else if (ActivePage = tbsWorkExplorer) then jvdlbWorkExplorer.SetFocus
    else if (ActivePage = tbsProject)      then tvProject.SetFocus; }
end;

procedure TfrmTools.pgToolsChange(Sender: TObject);
begin
  // AdjustColumnWidths(dbgCompletion);
  AdjustColumnWidths(dbgRmirrors);
  AdjustColumnWidths(dbgComments);
end;

procedure TfrmTools.RNavigatorClick(Sender: TObject);
begin
  RNavigator.GoToSelected;
end;

procedure TfrmTools.RNavigatorDblClick(Sender: TObject);
begin
  frmTinnMain.actRSendNavigatorExecute(self);
end;

procedure TfrmTools.LabelClick(Sender: TObject);
begin
  frmTinnMain.LabelClick(Sender);
end;

procedure TfrmTools.LabelMouseEnter(Sender: TObject);
begin
  with (Sender as TLabel).Font do
  begin
    Color := clBlue;
    Style := [fsUnderline];
  end;
end;

procedure TfrmTools.LabelMouseLeave(Sender: TObject);
begin
  with (Sender as TLabel).Font do
  begin
    Color := clMenuText;
    Style := [];
  end;
end;

procedure TfrmTools.LatexAccents(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  frmTinnMain.LatexAccents(Sender, Button, Shift, X, Y);
end;

procedure TfrmTools.LatexHint(Sender: TObject; Index: Integer;
  var HintInfo: Vcl.Controls.THintInfo; var Handled: Boolean);
var
  sTmp: string;

  procedure FormatSymbol;
  var
    iPos: Integer;

  begin
    sTmp := ChangeFileExt(sTmp, '');
    iPos := Pos('_', sTmp);
    sTmp := Copy(sTmp, iPos + 1, length(sTmp));
  end;

begin
  with Sender as TJvImagesViewer do
  begin
    sTmp := ExtractFileName(Items[Index].FileName);
    FormatSymbol;
    Hint := sTmp;
  end;
end;

procedure TfrmTools.LatexMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if not(Sender is TJvImagesViewer) then
    Exit;
  with Sender as TJvImagesViewer do
    Hint := '';
end;

(*
  // Adapted from From http://edn.embarcadero.com/article/27548
  procedure TfrmTools.AdjustColumnWidths(DBGrid: TDBGrid);
  var
  iTotalColumnWidth,
  iColumnCount,
  iGridClientWidth,
  iFiller,
  i               : Integer;
  begin
  iColumnCount:= DBGrid.Columns.Count;
  if (iColumnCount = 0) then Exit;

  // compute total width used by grid columns and vertical lines if any
  iTotalColumnWidth:= 0;
  for i:= 0 to iColumnCount-1 do
  iTotalColumnWidth:= iTotalColumnWidth + DBGrid.Columns[i].Width;
  if dgColLines in DBGrid.Options then
  // include vertical lines in total (one per column)
  iTotalColumnWidth:= iTotalColumnWidth + iColumnCount;

  // compute grid client width by excluding vertical scroll bar, grid indicator,
  // and grid border
  iGridClientWidth:= DBGrid.Width - GetSystemMetrics(SM_CXVSCROLL);
  if dgIndicator in DBGrid.Options then begin
  iGridClientWidth:= iGridClientWidth - IndicatorWidth;
  if dgColLines in DBGrid.Options then Dec(iGridClientWidth);
  end;
  if (DBGrid.BorderStyle = bsSingle) then begin
  if DBGrid.Ctl3D then // border is sunken (vertical border is 2 pixels wide)
  iGridClientWidth:= iGridClientWidth - 4
  else // border is one-dimensional (vertical border is one pixel wide)
  iGridClientWidth:= iGridClientWidth - 2;
  end;

  // adjust column widths
  if (iTotalColumnWidth < iGridClientWidth) then begin
  iFiller:= (iGridClientWidth - iTotalColumnWidth) div iColumnCount;
  for i:= 0 to iColumnCount-2 do
  DBGrid.Columns[i].Width:= DBGrid.Columns[i].Width + iFiller;
  end
  else if (iTotalColumnWidth > iGridClientWidth) then begin
  iFiller:= (iTotalColumnWidth - iGridClientWidth) div iColumnCount;
  if ((iTotalColumnWidth - iGridClientWidth) mod iColumnCount <> 0) then Inc(iFiller);
  for i:= 0 to iColumnCount-2 do
  DBGrid.Columns[i].Width:= DBGrid.Columns[i].Width - iFiller;
  end;
  end;
*)

// Not too elegant than above, but works better!
procedure TfrmTools.AdjustColumnWidths(DBGrid: TDBGrid);
begin
  if (DBGrid.Name = 'dbgCompletion') or (DBGrid.Name = 'dbgShortcuts') or
    (DBGrid.Name = 'dbgRmirrors') then
  begin
    DBGrid.Columns[1].Width := 100;
    DBGrid.Columns[0].Width := DBGrid.Width - (DBGrid.Columns[1].Width + 28)
  end
  else
  begin
    DBGrid.Columns[1].Width := 50;
    DBGrid.Columns[2].Width := 40;
    DBGrid.Columns[3].Width := 40;
    DBGrid.Columns[0].Width := DBGrid.Width -
      (DBGrid.Columns[1].Width + DBGrid.Columns[2].Width + DBGrid.Columns[3]
      .Width + 28)
  end;
end;


procedure TfrmTools.RenderHTMLPage(HTLMString: String);
var
v: Variant;
HTMLDocument: IHTMLDocument2;
begin
if wbDescription.LocationURL = '' then
  wbDescription.Navigate('about:blank');
HTMLDocument := wbDescription.Document as IHTMLDocument2;
v := VarArrayCreate([0, 0], varVariant);
v[0] := HTLMString; // Here's your HTML string
HTMLDocument.Write(PSafeArray(TVarData(v).VArray)) ;
HTMLDocument.Close;
end;



end.
