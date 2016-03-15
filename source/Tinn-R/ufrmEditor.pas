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

unit ufrmEditor;

interface

uses

  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdActns, ActnList,  StdCtrls, ExtCtrls, ClipBrd,DdeMan,
  ShellCtrls, ComCtrls, Httpapp,ShellAPI,  trCommon,
  JvDriveCtrls, {JvExStdCtrls,}  System.Types, System.Character,
  DScintillaCustom, DScintilla, DScintillaTypes, Vcl.Grids, Vcl.DBGrids;





type
  TfrmEditor = class(TForm)
    sciEditor: TDScintilla;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SplitMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SplitMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure SplitMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SetTitles;
    procedure FormDeactivate(Sender: TObject);
    procedure sciEditorChange(Sender: TObject);
    procedure sciEditorClick(Sender: TObject);
    procedure sciEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure sciEditorDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure sciEditorEnter(Sender: TObject);
    procedure sciEditorExit(Sender: TObject);
    procedure sciEditorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sciEditorKeyPress(Sender: TObject; var Key: Char);
    procedure sciEditorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sciEditorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sciEditorSCNotificationEvent(ASender: TObject;
      const ASCN: TDSciSCNotification; var AHandled: Boolean);
    procedure sciEditorMarginClick(ASender: TObject; AModifiers, APosition,
      AMargin: Integer);
    procedure sciEditorCharAdded(ASender: TObject; ACh: Integer);
    procedure sciEditorModified(ASender: TObject; APosition,
      AModificationType: Integer; AText: string; ALength, ALinesAdded, ALine,
      AFoldLevelNow, AFoldLevelPrev: Integer);
   procedure UpdateMainFormLexer;
    procedure sciEditorZoom(ASender: TObject);
    procedure sciEditorDwellStart(ASender: TObject; APosition, X, Y: Integer);
    procedure sciEditorContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure sciEditorDblClick(Sender: TObject);
  private
    { Private declarations }
    bBOM_ToSave: Boolean;
    bHasFileBeenSaved: Boolean;
    bNeedsErase: Boolean;
    bSizing: Boolean;
    clientDDE: TDDEClientConv;
    iLine: Integer;
    iSizeStart: Integer;
    pLine: TPoint;
    seeEncoding_ToSave: TEncoding;
    spEditor: TSplitter;

    function MessageDlg(const Msg: string; DlgType: TMsgDlgType;
      Buttons: TMsgDlgButtons; HelpCtx: Integer): Integer;
    function ReadOnlyWarning(sFunctionName: String): Boolean;
    function SaveModifiedFileQuery: Boolean;
    procedure DoSaveFileState;
    procedure WMMDIActivate(var Msg: TWMMDIActivate); message WM_MDIACTIVATE;
    procedure WMSysCommand(var Msg: TWMSysCommand); message WM_SYSCOMMAND;
    procedure CloseStuff;
  public
    { Public declarations }
    bSendToREditing: Boolean;
    EditorFile: TEditorFile;

    sActiveEditor: string;
    //sActiveFile: string;
    sCompletion: string;
    sRtip: string;
    sciEditor2: TDScintilla;
    bBackupUnsaved: Boolean;
    bIsFree: Boolean;
    bEditorFormIsLoading: Boolean;
    // procedure MatchBracket;
    // procedure RtermSplit(bSplitHoriz: boolean = True);
    iLineOldCount : Integer;

    bEditorHorizontalSplit: Boolean;
    bEditorVerticalSplit: Boolean;


    procedure AlignWithFirstLine;
    procedure AlignEqualSign;
    procedure BlockMarkExecute;
    procedure BlockUnmarkExecute;
    procedure UnmarkAllExecute;
    procedure CheckSaveStatus;
    procedure Comment(sStartComment, sEndComment: string);
    procedure CopyFormattedHTML;
    procedure CopyFormattedRTF;
    procedure CopyFormattedTeX;
    procedure DateStamp;
    procedure DoCardInsert;
//    procedure DoCompletionInsert(bSearch: Boolean = False);
    procedure DoTipInsert;
    procedure EdInvertCase;
    procedure EdLowerCase;
    procedure EdUpperCase;
    procedure EditorRemoveSplit;
    procedure EditorSplit(bSplitHoriz: Boolean = True);
    procedure EnableSave;
    procedure FileClose;
    function  FileSave(Sender: TObject): Boolean;
    function  FileSaveAs(Sender: TObject): Boolean;
    procedure FoldExecute;
    procedure FullPathUnix;
    procedure FullPathWindows;
    procedure GetActiveEditorOnForm(var seEditor: TDScintilla);
    procedure GetCursorTo(sWay: string);
    function  GetEditorLexerId: Integer;
    function  GetEditorLexerName: String;
    function  GetMarkerString: string;
    function  GetToggleString: String;
    procedure GotoLine;
    procedure IndentBlock;
    procedure InvertSelection;
    procedure MarkSelectionColor(iMarkerNumber: Integer);
    procedure ProcessTidy;
    procedure QuoteWords;
    procedure RemoveLineBreaks;
    procedure RReformat;
    function  SaveBackup(sTempFile: String): Boolean;
    procedure SearchError(sTmp: string);
    procedure SetEditorLexerById(LexerId: Integer);
    procedure SetEditorLexerByName(LexerName: String);
    procedure Sort(iSort: integer);
    procedure ToogleSpecialChars(bChecked: Boolean);
    procedure Uncomment(sStartComment, sEndComment: string);
    procedure UnfoldAllExecute;
    procedure UnindentBlock;



    procedure WriteCursorAndWindowInfo(var EditorFile: TEditorFile);

  protected
    procedure Loaded; override;
  end;


var
  frmEditor: TfrmEditor;

implementation

uses
  DB,
  StrUtils,
  trUtils,
  ufrmGotoBox,
  ufrmMain,
  ufrmPrintPreview,
  uModDados,
  ufrmTools, ufrmNameBrowser, uLexerCommands, uRSendCommands, ufrmTidyAbort, RibbonMarkup;

{$R *.DFM}
{$R 'Ribbon\RibbonMarkup.res'}

procedure TfrmEditor.WMMDIActivate;
var
  iStyle: Longint;

begin
  if (Msg.ActiveWnd = Handle) and (biSystemMenu in BorderIcons) then
  begin
    iStyle := GetWindowLong(Handle, GWL_STYLE);
    if (iStyle and WS_MAXIMIZE <> 0) and (iStyle and WS_SYSMENU = 0) then
      SetWindowLong(Handle, GWL_STYLE, iStyle or WS_SYSMENU);
  end;
  inherited;
end;

procedure TfrmEditor.GetActiveEditorOnForm(var seEditor: TDScintilla);
begin
  if (sActiveEditor = 'sciEditor2') then
    seEditor := sciEditor2
  else
    seEditor := sciEditor;
end;

function TfrmEditor.GetMarkerString: String;
var  seEditor: TDScintilla;
     ii, i: Integer;
begin
  GetActiveEditorOnForm(seEditor);
  with seEditor do
  begin
    Result := '';
    ii := -1;
    ii := 0;
    repeat
      i :=   seEditor.MarkerNext(ii, 1023);
      if i <> -1 then
      begin
        ii := i+1;
        Result := Result + ' ' +  IntToStr(i) + ':' +
        IntToStr(seEditor.MarkerGet(i));
      end;
    until i = -1;
    Result := Trim(Result);
  end;
end;

function TfrmEditor.GetToggleString: String;
var  seEditor: TDScintilla;
     ii, i: Integer;
begin
  GetActiveEditorOnForm(seEditor);
  with seEditor do
  begin
    Result := '';
    ii := -1;
    ii := 0;
    repeat
      i :=   seEditor.ContractedFoldNext(ii);
      if i <> -1 then
      begin
        ii := i+1;
        Result := Result + ' ' +  IntToStr(i);
      end;
    until i = -1;
    Result := Trim(Result);
  end;
end;

procedure TfrmEditor.SetEditorLexerById(LexerId: Integer);
begin
  EditorFile.iLexerId := LexerId;
  ApplyLexer(LexerId, sciEditor);
  if assigned(sciEditor2) then
    ApplyLexer(LexerId, sciEditor);
end;

procedure TfrmEditor.SetEditorLexerByName(LexerName: String);
begin
//

end;



// Save file status in database Cache.xml
procedure TfrmEditor.DoSaveFileState;
var
  seEditor: TDScintilla;
begin
  if not FileExists(EditorFile.sFile) then
    Exit;

  GetActiveEditorOnForm(seEditor);
  WriteCursorAndWindowInfo(EditorFile);
  modDados.SaveFileState(EditorFile);
end;

procedure TfrmEditor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmEditor.CheckSaveStatus;
begin
  if EditorFile.iModified = 1 then
  begin
    frmTinnMain.actFileSave.Enabled := True;
    frmTinnMain.actFileSaveAs.Enabled := True;
    frmTinnMain.actFileSaveAll.Enabled := True;
    if not bBackupUnsaved then
    begin
      EditorFile.iUnsavedChanges := 1;
      bBackupUnsaved := True;
    end;

  end
  else
    frmTinnMain.actFileSave.Enabled := False;
end;

procedure TfrmEditor.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var action: TCloseAction;
begin
  if not bIsFree then
  begin

    if frmTinnMain.bRememberFileState then
      DoSaveFileState;

    if (EditorFile.iModified = 1) then
    begin
      if not sciEditor.GetReadOnly then
        CanClose := SaveModifiedFileQuery
      else CanClose :=  FileSave(Sender);
    end else CanClose := true;

    if CanClose then
    begin
      modDados.DeleteEditorEntry(EditorFile.iId, EditorFile.sTempFile);
      frmTinnMain.RemoveTab(EditorFile.iId);
      CloseStuff;
    end;


  end else CanClose := true;
end;

function TfrmEditor.SaveModifiedFileQuery: Boolean;
var
 iSaveResp: Integer;

begin
  Result := False;

  with frmTinnMain do
  begin
    pgFiles.ActivePageIndex := EditorFile.iTabPosition - 1;
    pgFilesChange(nil);
  end;

  iSaveResp := MessageDlg(EditorFile.sFile + #13 + #13 +
    'The file above was changed.' + #13 + 'Do you like to save the changes?',
    mtConfirmation, [mbYes, mbNo, mbCancel], 0);

  case iSaveResp of
    idYes:
      begin
        Result := FileSave(self);
        if not Result then
          frmTinnMain.bCloseCanceled := True;
      end;
    idNo:
      Result := True;
    idCancel:
      begin
        Result := False;
        frmTinnMain.bCloseCanceled := True;
      end;
  end;
end;

procedure TfrmEditor.sciEditorChange(Sender: TObject);
var
  iTopLine: Integer;
begin
  //frmtinnmain.memPackage.Lines.Add(caption+' '+sciEditor.Lines[0]);

  if not bBackupUnsaved and not bEditorFormIsLoading then
  begin
    bBackupUnsaved := True;
    EditorFile.iUnsavedChanges := 1;
  end;
  // m.p.  EnableSave;
{  if Assigned(sciEditor2) then
  begin
    if (sActiveEditor = 'sciEditor') then
    begin
      sciEditor2.Lines.BeginUpdate;
      iTopLine := sciEditor2.GetFirstVisibleLine;
      sciEditor2.SetText(sciEditor.GetText);
      sciEditor2.SetFirstVisibleLine(iTopLine);
      sciEditor2.Lines.EndUpdate;
    end
    else
    begin
      sciEditor.Lines.BeginUpdate;
      iTopLine := sciEditor.GetFirstVisibleLine;
      sciEditor.Lines.Text := sciEditor2.Lines.Text;
      sciEditor.SetFirstVisibleLine(iTopLine);
      sciEditor.Lines.EndUpdate;
    end;
  end;
 }
end;

procedure TfrmEditor.BlockMarkExecute;
var seEditor: TDScintilla;
begin
  GetActiveEditorOnForm(seEditor);

  if (SelStartLine(seEditor) <> SelEndLine(seEditor)) then
  with seEditor do
  begin
    MarkerDeleteAll(0);
    MarkerDeleteAll(1);
    MarkerAdd(SelStartLine(seEditor), 0);
    MarkerAdd(SelEndLine(seEditor), 1);
  end;

end;

procedure TfrmEditor.BlockUnmarkExecute;
var seEditor: TDScintilla;
begin
  GetActiveEditorOnForm(seEditor);

  seEditor.MarkerDeleteAll(0);
  seEditor.MarkerDeleteAll(1);
end;

procedure TfrmEditor.UnmarkAllExecute;
var seEditor: TDScintilla;
    i: Integer;
begin
  GetActiveEditorOnForm(seEditor);

  for i := 0 to 9 do
    seEditor.MarkerDeleteAll(i);
end;


procedure TfrmEditor.FoldExecute;
var seEditor: TDScintilla;
const SCI_FOLDALL = 2662; // Constant not present in the TDScintilla wrapper.
begin
  GetActiveEditorOnForm(seEditor);
   seEditor.SendEditor(SCI_FOLDALL);
end;

procedure TfrmEditor.UnfoldAllExecute;
var seEditor: TDScintilla;
    iFold: Integer;
begin
  GetActiveEditorOnForm(seEditor);


  iFold := -1;
  repeat
    iFold := seEditor.ContractedFoldNext(iFold);
    if iFold > -1 then
      seEditor.ToggleFold(iFold);
  until iFold = -1;
end;



procedure TfrmEditor.sciEditorCharAdded(ASender: TObject; ACh: Integer);
var ipos, ibm, ind, iline, iLastOpenBracket: Integer;
begin
 // Bracket highlighting
  with ASender AS TDScintilla do
  begin
    if CharInSet(chr(ACh), ['(','[','{','}',']',')']) then
    begin
      if chr(ACh) = ')'  then
      begin
        (ASender AS TDScintilla).CallTipCancel;
{        iLastOpenBracket := FindLastOpenBracket(ASender AS TDScintilla, getCurrentPos-1);
        if iLastOpenBracket > -1 then
         begin
          ShowBracketTip(ASender AS TDScintilla, iLastOpenBracket-1);
         end;   }
      end;

      ipos := GetCurrentPos-1;
       ibm := BraceMatch(ipos);
           Update;
    if BraceMatch(ipos)>-1 then
      BraceHighlight(BraceMatch(ipos), ipos)
        else BraceBadLight(ipos);
    end;

  // Auto indentation
  // Todo: Turn on and off

  if (ACh = 10) {or (ACh = 13)} then
   begin
     ipos := GetCurrentPos;
     iline := LineFromPosition(ipos-1);
     ind := GetLineIndentation(iline);
     SetLineIndentation(iline+1, ind);


     SetCurrentPos(GetLineIndentPosition(iline+1));
     SetAnchor(GetLineIndentPosition(iline+1));
   end;
  end;


  if not frmTinnMain.bDoInsert then
    begin
      if (ACh = integer('[')) OR  (ACh = integer('$')) then
        frmTinnMain.CheckNamesLookup(ASender);

      frmTinnMain.InstantLookup(ASender AS TDScintilla);

 {     if (ACh = integer('(')) then
        ShowBracketTip(ASender AS TDScintilla, (ASender AS TDScintilla).GetCurrentPos-1);
        }
    end;
end;

procedure TfrmEditor.sciEditorClick(Sender: TObject);
begin
  with frmTinnMain do
  begin
   //m.p.statusbar clear warnings!
   { with stbMain do
    begin
      Panels[7].Text := EmptyStr;
      Panels[8].Text := EmptyStr;
    end;    }

    actRtermEditorSetFocus.Checked := True;
  end;

  // URIOpener stuff ?!?!
end;

procedure TfrmEditor.sciEditorContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  frmTinnMain.Ribbon.ShowContextPopup(CmdMContextMenuEditor);
end;

procedure TfrmEditor.sciEditorDblClick(Sender: TObject);
begin
  frmTinnMain.Ribbon.ShowContextPopup(CmdMContextMiniEditor);
end;

procedure TfrmEditor.sciEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  frmTinnMain.FormDragDrop(Sender, Source, X, Y);
end;

procedure TfrmEditor.sciEditorDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  with frmTinnMain do
  begin
    Accept := False;

    if (Source is TTreeView) then
      Accept := True
    else if (Source is TShellListView) then
      Accept := True
    else if (Source is TListView) then
      Accept := True
    else if (Source is TJvFileListBox) then
      Accept := True;
  end;
end;

procedure TfrmEditor.sciEditorDwellStart(ASender: TObject; APosition, X,
  Y: Integer);
begin
  CheckDwell(ASender as TDScintilla);
end;

procedure TfrmEditor.sciEditorEnter(Sender: TObject);
begin
  if (Sender as TDScintilla).Name = 'sciEditor' then
    sActiveEditor := 'sciEditor'
  else sActiveEditor := 'sciEditor2';

  (Sender as TDScintilla).AssignCmdKey(0, SCI_LINEDUPLICATE);
  frmTinnMain.actRtermEditorSetFocus.Checked := True;
end;

procedure TfrmEditor.sciEditorExit(Sender: TObject);
begin
  if not frmTinnMain.bNameFormLoading then
    if not frmNameBrowser.Active then
      frmNameBrowser.CloseNamePopup;
end;

procedure TfrmEditor.sciEditorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  iPosX: Integer;
  seEditor: TDScintilla;
  Key2: Char;
begin
  seEditor := Sender as TDScintilla;

  Key2 := Chr(Key);

  with frmTinnMain do
    actRtermEditorSetFocus.Checked := True;

  case Key of
    1 .. 15, 18 .. 31, 33 .. 36, 38, 40 .. 44, 46 .. 67, 69 .. 105, 108,
      110 .. 300:
      begin
        with frmTinnMain do
        begin
          //stbMain.Panels[7].Text := EmptyStr;
          //stbMain.Panels[8].Text := EmptyStr;
          actRtermWarningError.Visible := False;
        end;
      end;
  end;

  if frmTinnMain.actReadOnly.Checked then
    Exit;

  if not frmTinnMain.bNameFormLoading then
    if frmTinnMain.bNameFormActive then
    begin
      if CharInSet(Key2, ['A' .. 'Z', 'a' .. 'z', '0' .. '9', '_', '-', '.'])
      then
        // Form2.edNameSearch.Text := copy(SynEdit.Text, iSelStart + 2, SynEdit.SelStart - iSelstart)+Key2
      else
        case Key of
          VK_RETURN:
            begin
              frmNameBrowser.TryInsert;
              Key := 0;
              Exit;
            end;

          VK_Down:
            begin
              with frmNameBrowser do
              begin
                if lvNames.ItemIndex < lvNames.Items.Count - 1 then
                  lvNames.ItemIndex := lvNames.ItemFocused.Index + 1;
                lvNames.Items[lvNames.ItemFocused.Index - 1].Selected := False;
                Key := 0;
                Exit;
              end;
            end;
          VK_UP:
            begin
              with frmNameBrowser do
              begin
                if lvNames.ItemIndex > 0 then
                  lvNames.ItemIndex := lvNames.ItemIndex - 1;
                lvNames.Items[lvNames.ItemFocused.Index + 1].Selected := False;
                Key := 0;
                Exit;
              end;
            end;
          VK_BACK:
            begin
              //sci //m.p.
              if seEditor.GetSelectionStart - 2 < frmNameBrowser.iSelStart then
                frmNameBrowser.CloseNamePopup;
            end;
          VK_Escape, VK_Space:
            begin
              frmNameBrowser.CloseNamePopup;
            end;
        end;
    end;


  //GetActiveEditorOnForm(seEditor);


  // SHIFT + Ins is the default 'paste' shortcut of synEdit (!!!!!)
  if (Shift = [ssShift]) and (Key = VK_INSERT) then
    EnableSave;

  if (Shift = [ssCtrl]) then
    case Key of
      VK_RETURN:
        begin // Send current line to R when editing
          bSendToREditing := True;
          with seEditor do
          begin
            frmTinnMain.actRSendLineExecute(nil);
            seEditor.LineEnd;
            seEditor.NewLine;
            //ExecuteCommand(ecLineEnd, #0, nil);
            //ExecuteCommand(ecLineBreak, #0, nil);
          end;
          bSendToREditing := False;
          EnableSave;
        end;

      VK_MULTIPLY:
        begin // Add or replace text by tip: R server or database
          with seEditor do
          begin
            iPosX := GetCaretX(seEditor);
            seEditor.ReplaceSel(frmTinnMain.sTipToWrite + ')');
            SetCaretX(iPosX, seEditor);
          end;
          frmTinnMain.sTipToWrite := EmptyStr;
          EnableSave;
        end;

      VK_ADD:
        begin // Add or replace text by attribution symbol: ->
          seEditor.ReplaceSel(' -> ');
          EnableSave;
        end;

      VK_SUBTRACT:
        begin // Add or replace text by attribution symbol: <-
          seEditor.ReplaceSel(' <- ');
          EnableSave;
        end;

      48:
        seEditor.ReplaceSel('()'); // )

      57:
        begin // (
          seEditor.ReplaceSel('()');
          SetCaretX(GetCaretX(seEditor) - 1, seEditor);
        end;
    end else
    begin
      // indent here???

    end;

  {
    case key of
    57 :  with seEditor do begin    // (
    SelText:= '()';
    CaretX := CaretX - 1;
    end;

    192 : with seEditor do begin    // (
    SelText:= '"';
    CaretX := CaretX - 1;
    end;
    end;
  }
end;

procedure TfrmEditor.sciEditorKeyPress(Sender: TObject; var Key: Char);
var seEditor: TDScintilla;
begin
  seEditor := Sender as TDScintilla;

  if frmTinnMain.bNameFormActive then
  begin
    if CharInSet(Key, ['�', '+', '"', '*', '�', '%', '&', '/', '(', ')', '=',
      '?', '`', '^', '''', '~', '�', '�', '|', '�', '�', '�', '#', '@', '�',
      '{', '}', '�', ',', ';', '<', '>', '\']) then
    begin
      frmNameBrowser.CloseNamePopup;
      Exit;
    end;
    //sci //m.p.
    with seEditor do
    begin
      if (ord(Key) >= 32) and (ord(Key) <= 126) then
        frmNameBrowser.edNameSearch.Text :=
          System.copy(GetText, frmNameBrowser.iSelStart + 1,
          GetSelectionStart - frmNameBrowser.iSelStart) + Key
      else
        frmNameBrowser.edNameSearch.Text :=
          System.copy(GetText, frmNameBrowser.iSelStart + 1,
          GetSelectionStart - frmNameBrowser.iSelStart);
    end;
  end;
end;

procedure TfrmEditor.sciEditorKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var iLastOpenBracket: Integer;
  seEditor: TDScintilla;
begin
  seEditor := (Sender as TDScintilla);
  if (seEditor = sciEditor) then
    frmTinnMain.iSciWithFocus := 1
  else
    frmTinnMain.iSciWithFocus := 2;

  with seEditor do
  begin
    iLastOpenBracket := FindLastOpenBracket(seEditor, getCurrentPos-1);
    if iLastOpenBracket > -1 then
      ShowBracketTip(seEditor, iLastOpenBracket-1)
      else
      if CallTipActive then
        CallTipCancel;
  end;
end;

procedure TfrmEditor.sciEditorMarginClick(ASender: TObject; AModifiers,
  APosition, AMargin: Integer);
var Line: Integer;
begin
  Line := (ASender AS TDScintilla).LineFromPosition(APosition);

  if AMargin = MARGIN_CODE_FOLDING then
    (ASender AS TDScintilla).ToggleFold(Line);
end;

procedure TfrmEditor.sciEditorModified(ASender: TObject; APosition,
  AModificationType: Integer; AText: string; ALength, ALinesAdded, ALine,
  AFoldLevelNow, AFoldLevelPrev: Integer);
begin
if not bEditorFormIsLoading then
  frmTools.RNavigator.EditorModified(AModificationType, ALinesAdded);
end;

procedure TfrmEditor.sciEditorMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Sender = sciEditor) then
    frmTinnMain.iSciWithFocus := 1
  else
    frmTinnMain.iSciWithFocus := 2;

  if not frmTinnMain.bNameFormLoading then
    if not frmNameBrowser.Active then
      frmNameBrowser.CloseNamePopup;
end;

procedure TfrmEditor.sciEditorSCNotificationEvent(ASender: TObject;
  const ASCN: TDSciSCNotification; var AHandled: Boolean);
var ipos, iBrace: Integer;
    seEditor: TDScintilla;
begin
  seEditor := ASender AS TDScintilla;
  if bEditorFormIsLoading then
    exit;
  // Ignore notifications which are unrelated to content and cursor position changes
  if ASCN.NotifyHeader.code = SCN_UPDATEUI then
  begin

    frmTinnMain.UpdateCursorPos(seEditor);

    frmTools.RNavigator.UpdateSectionPosition;


    iLine := GetCaretX(seEditor);

    with ASender AS TDScintilla do
    begin
      ipos := GetCurrentPos;
      if CharInSet(chr(GetCharAt(ipos)), ['(','[','{','}',']',')']) then
      begin
        ibrace := BraceMatch(ipos);
        if ibrace > 0 then
          BraceHighlight(ibrace, ipos)
        else BraceBadLight(ipos);
      end else BraceHighlight(-1, -1);

    end;

  //  if ASCN.modificationType = 0 then
  //    exit;

  //  if SCN_MODIFIED = ASCN.NotifyHeader.code  then
      if (seEditor).GetModify then
        if EditorFile.iModified = 0 then
          EnableSave;

  end;
end;

procedure TfrmEditor.sciEditorZoom(ASender: TObject);
begin
  SetLineTextVisibility(frmTinnMain.actLineNumbersVisible.Checked, sciEditor);
  if Assigned(sciEditor2) then
    SetLineTextVisibility(frmTinnMain.actLineNumbersVisible.Checked, sciEditor2);
end;

function GetEncoding_ToSave: TEncoding;
var
  se: TEncoding;

begin

// function GetEncoding_ToSave(sf: TSaveFormat): TEncoding;

{  case sf of
    sfUTF8:
      se := seUTF8;
    sfUTF16LSB:
      se := seUTF16LE;
    sfUTF16MSB:
      se := seUTF16BE;
  else
    se := seANSI;
  end;

  Result := se;}
end;

function TfrmEditor.FileSave(Sender: TObject): Boolean;
var
  wFileAtt: Word;
  sTempFile: String;
begin
  try
    if EditorFile.iNewFile = 1 then
    begin
      Result := FileSaveAs(Sender);
      frmTinnMain.sWorkingDir := StripFileName(frmTinnMain.sdMain.fileName);
    end
    else
    begin
      if not sciEditor.GetReadOnly then
      begin
        wFileAtt := FileGetAttr(EditorFile.sFile);
        wFileAtt := wFileAtt and not SysUtils.faReadOnly;
        FileSetAttr(EditorFile.sFile, wFileAtt);
        { m.p. IMPORTANT
          seeEncoding_ToSave:= GetEncoding_ToSave(TSynEditStringList(sciEditor.Lines).SaveFormat);
          if (seeEncoding_ToSave <> seANSI) then bBOM_ToSave:= True  // Always add BOM to <> ANSI!!!
          else bBOM_ToSave:= False;
        }
        //m.p. encoding !!!
        sciEditor.Lines.SaveToFile(EditorFile.sFile);
        sciEditor.SetSavePoint;
     //   SaveToFile(sciEditor.Lines, sActiveFile, seeEncoding_ToSave,
     //     bBOM_ToSave); // If False always save as ANSI!

        EditorFile.iModified := 0;

        bBackupUnsaved := False;

        try
          if FileExists(sTempFile) then
            DeleteFile(sTempFile);
        finally
        end;

        with EditorFile do
        begin
          iNewFile := 0;
          iModified := 0;
          iUnsavedChanges := 0;
          sTempFile := '';
        end;

        if frmTinnMain.bBackup then
          ModDados.BackupFiles;

        SetTitles;
        frmTinnMain.actFileSave.Enabled := False;

        frmTinnMain.sWorkingDir := ExtractFilePath(EditorFile.sFile);

        if (frmTinnMain.bUndoAfterSave = False) then
          begin
           sciEditor.SetUndoCollection(false);
           sciEditor.SetUndoCollection(true);
          end;
        bHasFileBeenSaved := True;

        with frmTinnMain do
        begin
          SetFileSize_StatusBar(EditorFile.sFile);
      //    GetFile_Info(sActiveFile, sciEditor.Lines);
        end;

        Result := true;
      end
      else
      begin // if ReadOnly
        MessageDlg(EditorFile.sFile + #13 + #13 +
          'This file was changed and posteriorly set as read only!' + #13 +
          'Please, save this file with a different name, or,' + #13 +
          'change its to not read only.', mtWarning, [mbOK], 0);
      end;
    end;
  except
    on e: exception do
      MessageDlg('Error: ' + e.message, mtError, [mbOK], 0);
  end;
end;

function TfrmEditor.FileSaveAs(Sender: TObject): Boolean;
var
  sFileNew, STempFile: string;
  wFileAtt: Word;
  iLexerExt: Integer;
begin
  frmTinnMain.sdMain.DefaultFolder := frmTinnMain.sWorkingDir;
  sFileNew := EditorFile.sFile;
  if frmTinnMain.bRemoveExtension then
    sFileNew := RemoveFileExtension(sFileNew);


  iLexerExt := frmTinnMain.GetLexerIdFromFileExtension(ExtractFileExt(sFileNew));
  if trim(ExtractFileExt(sFileNew)) = '' then
    iLexerExt := EditorFile.iLexerId;



  frmTinnMain.sdMain.fileName := sFileNew;

//  frmTinnMain.sdMain.FileTypeIndex  := frmTinnMain.iFilterToSaveAs;

  frmTinnMain.sdMain.FileTypeIndex  := modDados.GetFileTypeIndexOfLexer(iLexerExt);

  if frmTinnMain.sdMain.Execute then
  begin
    sFileNew := frmTinnMain.sdMain.fileName;
    if not(frmTinnMain.sSaveAsFileExt = '.*') then
      if (pos(lowerCase(ExtractFileExt(sFileNew)),
        lowerCase(frmTinnMain.sFileExtensions)) = 0) then
        sFileNew := frmTinnMain.sdMain.fileName + frmTinnMain.sSaveAsFileExt;

    if FileExists(sFileNew) then
    begin
      if (MessageDlg(sFileNew + #13 + #13 + 'Do you want to overwrite this file?',
        mtConfirmation, [mbYes, mbCancel], 0) <> idYes) then
//        Exit;
        DeleteFile(sFileNew);
    end;

    wFileAtt := FileGetAttr(sFileNew);
    wFileAtt := wFileAtt and not SysUtils.faReadOnly;
    FileSetAttr(sFileNew, wFileAtt);
    { m.p. IMPORTANT
      seeEncoding_ToSave:= GetEncoding_ToSave(TSynEditStringList(sciEditor.Lines).SaveFormat);

      if (seeEncoding_ToSave <> seANSI) then bBOM_ToSave:= True  // Always add BOM to <> ANSI!!!
      else bBOM_ToSave:= False;
    }

    //SaveToFile(sciEditor.Lines, sFile, seeEncoding_ToSave, bBOM_ToSave);
    // If False always save as ANSI!

    sciEditor.Lines.SaveToFile(sFileNew);
    sciEditor.SetSavePoint;


    with EditorFile do
    begin
      sFile := sFileNew;
      iNewFile := 0;
      iModified := 0;
      iUnsavedChanges := 0;
      sTempFile := '';
    end;

    if frmTinnMain.bBackup then
      ModDados.BackupFiles;


    try
      if FileExists(sTempFile) then
        DeleteFile(sTempFile);
    finally
    end;


    EditorFile.iModified := 0;

    bBackupUnsaved := False;

    frmTinnMain.sWorkingDir := StripFileName(sFileNew);
    //scihigh //m.p.SetHighlighterFromFileExt(ExtractFileExt(sActiveFile));
    frmTinnMain.actFileSave.Enabled := False;
    SetTitles;

    if (frmTinnMain.bUndoAfterSave = False) then
    begin
      sciEditor.SetUndoCollection(false);
      sciEditor.SetUndoCollection(true);
    end;
    bHasFileBeenSaved := True;

    with frmTinnMain do
    begin
      SetFileSize_StatusBar(EditorFile.sFile);

   //   GetFile_Info(sActiveFile, sciEditor.Lines);

      UpdateMRU('RecentFilesMenu', EditorFile.sFile);

    end;
  end else Result := false;
  frmTinnMain.sSaveAsFileExt := EmptyStr;
end;



procedure TfrmEditor.FormCreate(Sender: TObject);
begin
  with frmTinnMain do
  begin
    if actOpenMaximized.Checked then
      self.WindowState := wsMaximized
    else
      self.WindowState := wsNormal;

  end;

  bEditorFormIsLoading := true;
  Caption := '';
  sActiveEditor := 'sciEditor';

  // m.p. IMPORTANT sciEditor.Lines.SaveFormat:= frmTinnMain.sefDefault;
  if frmTinnMain.pgFiles.PageCount = 1 then
  with frmTinnMain do
  begin
     ToggleAtLeastOneFileOpenOptions(true);
     with tUpdateOptions do // Activate the timer that controls the R options.
      if not Enabled then
        Enabled := True;
  end;
{
    // I don't think that this should be set here.
    if (sciEditor.GetReadOnly = False) then
      actFileSave.Enabled := True;

}
end;

procedure TfrmEditor.FormDeactivate(Sender: TObject);
begin
  if not frmTinnMain.bNameFormLoading then
    if not frmNameBrowser.Active then
      frmNameBrowser.CloseNamePopup;
end;

procedure TfrmEditor.FormShow(Sender: TObject);
begin
  AlphaBlendValue := frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmEditor.FormActivate(Sender: TObject);
begin
  if bEditorHorizontalSplit then
    frmTinnMain.actSplitHorizontal.Checked := true;
  if bEditorVerticalSplit then
  frmTinnMain.actSplitVertical.Checked := true;
  if (not bEditorVerticalSplit) and (not bEditorHorizontalSplit) then
  frmTinnMain.actSplitRemove.Checked := true;


  if not bEditorFormIsLoading then
  begin
    frmTinnMain.pgFiles.ActivePageIndex := EditorFile.iTabPosition - 1;

    frmTinnMain.UpdateCursorPos(sciEditor);
    UpdateMainFormLexer;

    frmTinnMain.actReadOnly.Checked := sciEditor.GetReadOnly;
    frmTinnMain.SetReadOnlyState;

    CheckSaveStatus;

    frmTinnMain.SetFileSize_StatusBar(EditorFile.sFile);

    if Assigned(frmTools) then
      if Assigned(frmTools.RNavigator) then
        if Assigned(self) then
          frmTools.RNavigator.sciEditor := self.sciEditor;
  end;
end;

procedure TfrmEditor.DoCardInsert;
var
  seEditor: TDScintilla;

  sOldSearchText, sFunction, sTmp: string;

  slTmp: TStringList;
  bReplaceText: Boolean;
  iPos, iPriPos, i: Integer;

begin
  GetActiveEditorOnForm(seEditor);
  if seEditor = nil then
    exit;

  sFunction := modDados.cdMainBase.FieldValues['InsertText'];


  iPos := pos('(', sFunction);

  sTmp := copy(sFunction, iPos + 1, length(sFunction) - (iPos + 1));

  //Clipboard.AsText := sFunction;

  with seEditor do
  begin
    iPriPos := GetCaretX(seEditor);
    for i := length(sFunction) downto 1 do
      if ansilowercase(system.copy(sFunction, 1, i))
        = ansilowercase(system.copy(GetCurrentLine(seEditor), iPriPos - i, i)) then
      begin
        bReplaceText := True;
        break;
      end;

    if bReplaceText then
    begin
      seEditor.SetSelectionStart(seEditor.GetSelectionStart - i);
      seEditor.SetSelectionEnd(seEditor.GetSelectionStart + i);
      seEditor.ReplaceSel('');
      iPriPos := iPriPos - i;
    end;
    seEditor.ReplaceSel(sFunction);
    //Paste;
  end;

  if (iPos > 0) then
  begin
    slTmp := TStringList.Create;
    StrSplit(',', sTmp, slTmp);
  end;

  //sOldSearchText := frmTinnMain.sSearchText;
  if Assigned(slTmp) and (slTmp.Count >= 1) then
  begin
    frmTinnMain.sSearchText := slTmp[0];
    SetCaretX(iPriPos + iPos, seEditor);
  end
  else
  begin
    SetCaretX(iPriPos + iPos, seEditor);
    FreeAndNil(slTmp);
    EnableSave;
    //RestorePriorClipboardText;
    Exit;
  end;


  FreeAndNil(slTmp);
  EnableSave;
  //RestorePriorClipboardText;


end;

procedure TfrmEditor.DoTipInsert;
var
  seEditor: TDScintilla;

  sOldSearchText, sFunction, sTip: string;

  slTmp: TStringList;
  iPos: Integer;

begin
  // Define the active editor
  GetActiveEditorOnForm(seEditor);


  if not SavePriorClipboardText then
    Exit;

  Clipboard.AsText := sFunction + '(' + sTip + ')';

  with seEditor do
  begin
    iPos := GetCaretX(seEditor);
    Paste;
    SetCaretX(iPos + length(sFunction), seEditor);
  end;

  slTmp := TStringList.Create;
  StrSplit(',', sTip, slTmp);

  sOldSearchText := frmTinnMain.sSearchText;
  frmTinnMain.sSearchText := slTmp[0];

  DoSearchReplaceText(seEditor, False, True, False);

  frmTinnMain.sSearchText := sOldSearchText;

  FreeAndNil(slTmp);
  EnableSave;

  RestorePriorClipboardText;
end;
{
procedure TfrmEditor.DoCompletionInsert(bSearch: Boolean = False);
var
  seEditor: TDScintilla;
  sCompletion: string;
  iPos, iWordStart, iStart, iEnd: Integer;
  bDel: Boolean;
begin
  GetActiveEditorOnForm(seEditor);
  if seEditor = nil then
    exit;

  with modDados.sqldsMainCheck do
  begin
    Close;
    CommandText := 'SELECT InsertText FROM objects, UserDefined WHERE objects.Name Like UserDefined.Name AND objects.Envir Like UserDefined.Envir AND Trigger Like ' + AnsiQuotedStr(GetWordFromPos(seEditor.GetCurrentPos, seEditor), '"') ;
    Open;
    First;
    if  Eof then
      exit;
  end;



  with seEditor do
  begin
    iPos := seEditor.GetCurrentPos;
    iWordStart := WordStartPosition(iPos, true);
    SetTargetStart(iWordStart);
    SetTargetEnd(WordEndPosition(iPos, true));
    sCompletion := modDados.sqldsMainCheck.FieldByName('InsertText').AsString;
    ReplaceTarget(sCompletion);

    SetCursorInInsertion(sCompletion , iStart, iEnd, bDel);
    SetSelectionStart(iWordStart+iStart);
    SetSelectionEnd(iWordStart+iEnd);
    if bDel then
      ReplaceSel('');
  end;

  EnableSave;
end;
}

procedure TfrmEditor.GotoLine;
var
  gotoBox: TfrmGotoBox;
  pLineNumber: Integer;
  seEditor: TDScintilla;

begin
  try
    gotoBox := TfrmGotoBox.Create(Application);

    if gotoBox.ShowModal = mrOK then
    begin

      pLineNumber := gotoBox.spLine.AsInteger;

      // Define the active editor
      GetActiveEditorOnForm(seEditor);

      seEditor.GotoLine(pLineNumber);
      //seEditor.ExecuteCommand(17, 'A', @pLineNumber);
    end;
  finally
    FreeAndNil(gotoBox);
  end;
end;

procedure TfrmEditor.SearchError(sTmp: string);
var
 { synSearchOptions: TSynSearchOptions;  }
  seEditor: TDScintilla;

begin
 { synSearchOptions := [];

  Include(synSearchOptions, ssoMatchCase);

  Include(synSearchOptions, ssoEntireScope);

  Include(synSearchOptions, ssoWholeWord);
                                            }
  GetActiveEditorOnForm(seEditor);

  with seEditor do
  begin
    Lines.BeginUpdate;
    showmessage('sci SearchError not ready');
    {
    SearchEngine := SynEditSearch;

    SearchReplace(sTmp, sReplaceText, synSearchOptions);

    Lines.EndUpdate;
    ExecuteCommand(ecGotFocus, #0, nil);  }
  end;
end;





procedure TfrmEditor.EnableSave;
begin
  if bEditorFormIsLoading then
    exit;

  EditorFile.iModified := 1;

  frmTinnMain.actFileSave.Enabled := True;
  frmTinnMain.actFileSaveAs.Enabled := True;
  frmTinnMain.actFileSaveAll.Enabled := True;

  if not bBackupUnsaved then
  begin
    bBackupUnsaved := True;
    EditorFile.iUnsavedChanges := 1;
  end;
  SetTitles;
end;

procedure TfrmEditor.DateStamp;
var sciEditor: TDScintilla;
begin
  if ReadOnlyWarning('Date/Time stamp') then
    exit;

  GetActiveEditorOnForm(sciEditor);
  sciEditor.ReplaceSel(DateTimeToStr(Now));
  EnableSave;
end;

procedure TfrmEditor.IndentBlock;
var sciEditor: TDScintilla;
begin
  if ReadOnlyWarning('Block indent') then
    exit;

  GetActiveEditorOnForm(sciEditor);
  sciEditor.Tab;
  EnableSave;
end;

procedure TfrmEditor.AlignWithFirstLine;
var seEditor: TDScintilla;
     i, j, iLine, iLine1, iLine2, iFirstPos, iIndent: Integer;
begin
  if ReadOnlyWarning('Align with first line') then
    exit;

  GetActiveEditorOnForm(seEditor);

  with seEditor do
  begin
    Lines.BeginUpdate;

    if GetSelectionNStart(GetSelections-1) > GetSelectionNStart(0)  then
      iFirstPos := GetSelectionNStart(0)
    else  iFirstPos := GetSelectionNStart(GetSelections-1);

    iLine := LineFromPosition(iFirstPos);
    iIndent:= GetLineIndentation(iLine);

    if GetSelectionNStart(GetSelections-1) > GetSelectionNStart(0)  then
      for i := GetSelections-1 downto 0 do
      begin
        iLine1 := LineFromPosition(GetSelectionNStart(i));
        iLine2 := LineFromPosition(GetSelectionNEnd(i));

        for j := iLine2 downto iLine1 do
          SetLineIndentation(j, iIndent);
      end
    else
      for i := 0 to GetSelections-1 do
      begin
        iLine1 := LineFromPosition(GetSelectionNStart(i));
        iLine2 := LineFromPosition(GetSelectionNEnd(i));

        for j := iLine2 downto iLine1 do
          SetLineIndentation(j, iIndent);
      end;
    Lines.EndUpdate;
  end;
  EnableSave;
end;

procedure TfrmEditor.AlignEqualSign;
var seEditor: TDScintilla;
    iPos: Integer;
begin
  if ReadOnlyWarning('Align equal sign') then
    exit;

  GetActiveEditorOnForm(seEditor);

  with sciEditor do
  begin
    Lines.BeginUpdate;
    AlignChar('=', seEditor);
    Lines.EndUpdate;
  end;
  EnableSave;
end;


procedure TfrmEditor.EdUpperCase;
var seEditor: TDScintilla;
    iPos: Integer;
begin
  if ReadOnlyWarning('Upper case') then
    exit;

  GetActiveEditorOnForm(seEditor);

  with seEditor do
  begin
    Lines.BeginUpdate;


    if GetSelectionStart = GetSelectionEnd then
    begin
      iPos := GetSelectionStart;
      SetSelectionStart(WordStartPosition(iPos, true));
      SetSelectionEnd(WordEndPosition(iPos, true));
      UpperCase;
      SetSelectionStart(iPos);
      SetSelectionEnd(iPos);
    end else UpperCase;


    Lines.EndUpdate;
  end;

  EnableSave;
end;

procedure TfrmEditor.EdLowerCase;
var seEditor: TDScintilla;
    iPos: Integer;
begin
  if ReadOnlyWarning('Lower case') then
    exit;

  GetActiveEditorOnForm(seEditor);

  with seEditor do
  begin
    Lines.BeginUpdate;

    if GetSelectionStart = GetSelectionEnd then
    begin
      iPos := GetSelectionStart;
      SetSelectionStart(WordStartPosition(iPos, true));
      SetSelectionEnd(WordEndPosition(iPos, true));
      LowerCase;
      SetSelectionStart(iPos);
      SetSelectionEnd(iPos);
    end else LowerCase;

    Lines.EndUpdate;
  end;

  EnableSave;
end;




procedure TfrmEditor.EdInvertCase;
var seEditor: TDScintilla;
    iPos: Integer;
begin
  if ReadOnlyWarning('Invert case') then
    exit;

  GetActiveEditorOnForm(seEditor);

  with seEditor do
  begin
    Lines.BeginUpdate;

    if GetSelectionStart = GetSelectionEnd then
    begin
      iPos := GetSelectionStart;
      SetSelectionStart(WordStartPosition(iPos, true));
      SetSelectionEnd(WordEndPosition(iPos, true));
      InvertCaseScintilla(sciEditor);
      SetSelectionStart(iPos);
      SetSelectionEnd(iPos);
    end else InvertCaseScintilla(seEditor);

    Lines.EndUpdate;
  end;
  EnableSave;
end;

procedure TfrmEditor.EditorSplit(bSplitHoriz: Boolean = True);
begin

  if Assigned(spEditor) then
    FreeAndNil(spEditor);

  if Assigned(sciEditor2) then
    FreeAndNil(sciEditor2);

  sciEditor.Align := alClient;

  if bSplitHoriz then
  begin
    sciEditor.Align := alBottom;
    sciEditor.Height := (sciEditor.Height div 2);

    bEditorHorizontalSplit := true;
    bEditorVerticalSplit := false;
    frmTinnMain.actSplitHorizontal.Checked := true;
  end
  else
  begin
    sciEditor.Align := alRight;
    sciEditor.Width := (sciEditor.Width div 2);
    bEditorHorizontalSplit := false;
    bEditorVerticalSplit := true;
    frmTinnMain.actSplitVertical.Checked := true;
  end;

  spEditor := TSplitter.Create(self);

  with spEditor do
  begin
    if bSplitHoriz then
    begin
      Height := 3;
      Color := clActiveCaption;
      Beveled := True;
      Align := alBottom;
      Cursor := crVSplit;
    end
    else
    begin
      Width := 3;
      Color := clActiveCaption;
      Beveled := True;
      Align := alRight;
      Cursor := crHSplit;
    end;
    OnMouseDown := SplitMouseDown;
    OnMouseUp := SplitMouseUp;
    OnMouseMove := SplitMouseMove;

    Parent := self;
  end;

  sciEditor2 := TDScintilla.Create(self);

  with sciEditor2 do
  begin
    Align := alClient;
    BorderStyle := bsNone;
    Parent := self;
    sciEditor2.SetDocPointer(sciEditor.GetDocPointer);
    SetScintillaProperties(sciEditor2);
    PopupMenu := frmTinnMain.pabEditor;

    OnEnter := sciEditor.OnEnter;
    OnExit  := sciEditor.OnEnter;
    OnZoom := sciEditor.OnZoom;
    OnDwellStart := sciEditor.OnDwellStart;

    OnChange := sciEditor.OnChange;;
    OnCharAdded := sciEditor.OnCharAdded;
    OnClick :=  sciEditor.OnClick;
    OnDragDrop := sciEditor.OnDragDrop;
    OnDragOver := sciEditor.OnDragOver;

    OnKeyDown := sciEditor.OnKeyDown;
    OnKeyPress :=  sciEditor.OnKeyPress;
    OnKeyUp := sciEditor.OnKeyUp;
    OnMarginClick := sciEditor.OnMarginClick;
    OnModified :=  sciEditor.OnModified;
    OnMouseUp :=  sciEditor.OnMouseUp;
    OnSCNotificationEvent :=  sciEditor.OnSCNotificationEvent;
    SetReadOnly(sciEditor.GetReadOnly);

    Visible := true;
  end;

  sActiveEditor := 'sciEditor';

end;

procedure TfrmEditor.EditorRemoveSplit;
begin
  if Assigned(spEditor) then
    FreeAndNil(spEditor);

  if Assigned(sciEditor2) then
    FreeAndNil(sciEditor2);
  sciEditor.Align := alClient;
  sActiveEditor := 'sciEditor';

  bEditorHorizontalSplit := false;
  bEditorVerticalSplit := false;

  frmTinnMain.actSplitRemove.Checked := true;
end;

procedure TfrmEditor.SplitMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  pPos: TPoint;

begin
  bSizing := True;
  pPos := spEditor.ClientToScreen(Point(X, Y));
  iSizeStart := pPos.Y;
  pLine := pPos;
end;

procedure TfrmEditor.SplitMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  dc: hDC;

  iNewHeight: Integer;

begin
  if bNeedsErase then
  begin
    dc := GetDC(0);

    PatBlt(dc, pLine.X, pLine.Y, ClientWidth, 1, DstInvert);

    ReleaseDC(0, dc);

    bNeedsErase := False;
  end;
  iNewHeight := sciEditor.Height + iSizeStart - pLine.Y;

  sciEditor.Height := iNewHeight;
  bSizing := False;
end;

procedure TfrmEditor.SplitMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  dc: hDC;

  pPos1, pPos2: TPoint;

begin
  if bSizing then
  begin
    pPos1 := spEditor.ClientToScreen(Point(spEditor.Left, Y));
    pPos2 := ClientOrigin;

    if (pPos1.Y <= pPos2.Y + 3) then
      Exit;

    if (pPos1.Y >= pPos2.Y + ClientHeight - 3) then
      Exit;

    if bNeedsErase then
    begin
      dc := GetDC(0);
      PatBlt(dc, pPos1.X, pLine.Y, ClientWidth, 1, DstInvert);

      ReleaseDC(0, dc);

      bNeedsErase := False;
    end;
    dc := GetDC(0);

    PatBlt(dc, pPos1.X, pPos1.Y, ClientWidth, 1, DstInvert);

    ReleaseDC(0, dc);

    bNeedsErase := True;
    pLine := pPos1;
  end;
end;



{
procedure TfrmEditor.ToogleLineNumbers(bOption: Boolean);
begin
  if Assigned(sciEditor2) then
  begin
    SetLineTextVisibility(bOption, sciEditor);
    SetLineTextVisibility(bOption, sciEditor2);
  end
  else
    SetLineTextVisibility(bOption, sciEditor);
end; }

procedure TfrmEditor.ToogleSpecialChars(bChecked: Boolean);
begin
  if Assigned(sciEditor2) then
  begin
    SetSpecialChars(bChecked, sciEditor);
    SetSpecialChars(bChecked, sciEditor2);
  end
  else
  begin
    if bChecked then
      SetSpecialChars(bChecked, sciEditor);
  end;
end;




procedure TfrmEditor.InvertSelection;
var sciEditor: TDScintilla;
begin
  if ReadOnlyWarning('Selection/Invert case') then
    exit;

  GetActiveEditorOnForm(sciEditor);
  SetInvertCase(sciEditor);
end;
{


procedure TfrmEditor.sciEditorEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  EnableSave;
end;
}

procedure TfrmEditor.WMSysCommand(var Msg: TWMSysCommand);
begin
  case Msg.CmdType of
    SC_NextWindow:
      begin
        if (frmTinnMain.pgFiles.ActivePageIndex = frmTinnMain.pgFiles.
          PageCount - 1) then
          frmTinnMain.pgFiles.ActivePageIndex := 0
        else
          frmTinnMain.pgFiles.ActivePageIndex :=
            frmTinnMain.pgFiles.ActivePageIndex + 1;
        frmTinnMain.pgFilesChange(self);
      end;

    SC_PREVWINDOW:
      begin
        if (frmTinnMain.pgFiles.ActivePageIndex = 0) then
          frmTinnMain.pgFiles.ActivePageIndex :=
            frmTinnMain.pgFiles.PageCount - 1
        else
          frmTinnMain.pgFiles.ActivePageIndex :=
            frmTinnMain.pgFiles.ActivePageIndex - 1;
        frmTinnMain.pgFilesChange(self);
      end
  else
    inherited;
  end;
end;



procedure TfrmEditor.Loaded;
begin
  inherited;
  Width := frmTinnMain.Width;
  Height := frmTinnMain.Height;
end;

procedure TfrmEditor.CloseStuff;
var
  i: Integer;
  sNodeSelected: string;
begin
  // Important:
  // I always thought, the order of events is OnCanClose - OnClose.
  // However, FormClose seems not to be executed after FormCanClose.
  // Therefore it should be checked, whether parts of the code below
  // should be moved.
  // frmTinnMain.RemoveTab(self.Tag); // not remove from here!!!
  with frmTinnMain do
  begin
    // synURIOpener.Editor := nil; // don't remove this line!
    if (pgFiles.PageCount = 0) then
    begin
      ClearStatusBar;
      ToggleAtLeastOneFileOpenOptions(false);
      frmTinnMain.SetReadOnlyState;
      // m.p.      tbiPandoc.Enabled := False;
      MinimizeTinnAfterLastFile;
      with tUpdateOptions do
        if (Enabled) then
          Enabled := False;
      SetToolbarProcessing('fileAllClosed.disableAll');
      // will disable all Deplate, Txt2tags and MikTeX options
      pgFiles.Visible := (pgFiles.PageCount <> 0);
      //pgFiles.Refresh;
    end;
    for i := 1 to (frmTools.tvProject.Items.Count - 1) do
    begin
      sNodeSelected := string(frmTools.tvProject.Items[i].Text);
      if (sNodeSelected = EditorFile.sFile) then
      begin
        frmTools.tvProject.Items[i].Selected := False;
        frmTools.tvProject.Items[i].ImageIndex := 2;
      end;
    end;
  end;
  // with frmTinnMain
  if Assigned(clientDDE) then
  begin
    clientDDE.CloseLink;
    FreeAndNil(clientDDE);
  end;
  frmTools.RNavigator.sciEditor := nil;
  bIsFree := True;
end;

procedure TfrmEditor.GetCursorTo(sWay: string);
var
  bWordWrapOption: Boolean;

  iPos: Integer;

  seEditor: TDScintilla;
//  smOption: TSynSelectionMode;

begin
  if (sActiveEditor = 'sciEditor') then
    seEditor := sciEditor
  else
    seEditor := sciEditor2;

  with seEditor do
  begin
    Lines.BeginUpdate;
     showmessage('sci GetCursorTo');
     //sci //m.p.
    {
    smOption := SelectionMode;
    bWordWrapOption := WordWrap;

    if (SelectionMode <> smNormal) then
      SelectionMode := smNormal;

    if (WordWrap <> False) then
      WordWrap := False;
    iPos := CaretX;

    // CursorToBeginningLine
    if (sWay = 'BeginningLine') then
    begin
      if not SelAvail then
        ExecuteCommand(ecSelLineStart, #0, nil);
    end
    // CursorToEndLine
    else if not SelAvail then
      ExecuteCommand(ecSelLineEnd, #0, nil);

    SelectionMode := smOption;
    WordWrap := bWordWrapOption;
    CaretX := iPos;
     }
    Lines.EndUpdate;
  end;
end;

procedure TfrmEditor.RemoveLineBreaks;
var
  seEditor: TDScintilla;
 i: Integer;

function RemoveInTarget(stxt: String): String;
var i, ipos: Integer;
begin

  while ansipos(#13#10, stxt) > 0 do
  begin
    ipos := ansipos(#13#10, stxt);
    Delete(stxt, ipos, 2);
    if not ((stxt[ipos-1] = ' ') OR (stxt[ipos] = ' ')) then
      Insert(' ', stxt, ipos);
  end;

  while ansipos(#10, stxt) > 0 do
  begin
    ipos := ansipos(#10, stxt);
    Delete(stxt, ipos, 1);
    if not ((stxt[ipos-1] = ' ') OR (stxt[ipos] = ' ')) then
      Insert(' ', stxt, ipos);
  end;

  while ansipos(#13, stxt) > 0 do
  begin
    ipos := ansipos(#13, stxt);
    Delete(stxt, ipos, 1);
    if not ((stxt[ipos-1] = ' ') OR (stxt[ipos] = ' ')) then
      Insert(' ', stxt, ipos);
  end;
  Result := stxt;
end;

begin

  if ReadOnlyWarning('Removing line breaks') then
    exit;

  GetActiveEditorOnForm(seEditor);

  if Length(Trim(seEditor.GetSelText)) = 0 then
    Exit;

  with seEditor do
  begin
    for i := seEditor.GetSelections-1 downto 0 do
    begin
      SetTargetStart(GetSelectionNStart(i));
      SetTargetEnd(GetSelectionNEnd(i));
      ReplaceTarget(RemoveInTarget(GetTextRange(GetSelectionNStart(i), GetSelectionNEnd(i))));
    end;
  end;
end;




procedure TfrmEditor.QuoteWords;
var
 seEditor: TDScintilla;
 i: Integer;

function GetFirstLetterOrGoToEnd(str: String; start: Integer): Integer;
var i: Integer;
begin
  Result := length(str)+1;
  for i:=start to length(str) do
    if IsLetter(str[i]) then
      begin
        Result := i;
        break;
      end;
end;

function QuoteText(stxt: String): String;
var ilen, ipos, idel: Integer;
begin
  Result := stxt;
  ilen := length(stxt);
  ipos := 0;
  while ipos < ilen do
  begin
    ipos := GetFirstLetterOrGoToEnd(stxt, ipos);
    if ipos < ilen then
    begin
      idel := FindDelimiter(', '+#10+#13, stxt, ipos)-1;
      if idel < 0 then
        idel :=ilen;

      stxt := copy(stxt, 0, ipos-1) + quotedStr(copy(stxt, ipos, idel-ipos+1)) + copy(stxt, idel+1, ilen);
      ipos := idel + 2;
      ilen := length(stxt);
    end;
  end;
  Result := stxt;
end;

begin
  if ReadOnlyWarning('Quote') then
    exit;

  GetActiveEditorOnForm(seEditor);

  with seEditor do
  begin
    for i := GetSelections-1 downto 0 do
    begin
      SetTargetStart(GetSelectionNStart(i));
      SetTargetEnd(GetSelectionNEnd(i));
      ReplaceTarget(QuoteText(GetTextRange(GetSelectionNStart(i), GetSelectionNEnd(i))));
    end;
  end;
end;


procedure TfrmEditor.Comment(sStartComment, sEndComment: string);
var
  seEditor: TDScintilla;
  is1, is2: array of Integer;
     i: Integer;


  procedure GetAllSelections;
    var i: Integer;
  begin
    with seEditor do
    begin
      Setlength(is1, GetSelections);
      Setlength(is2, GetSelections);

      if Length(is1)>0 then
        for i := 0 to Length(is1)-1 do
        begin
          is1[i] := GetSelectionNStart(i);
          is2[i] := GetSelectionNEnd(i);
        end;
    end;
  end;

  procedure CommentBlock(iStart, iEnd: Integer);
  var sblock: String;
      slist: TStringList;
      j: Integer;
  begin
    with seEditor do
    begin
      if iStart = iEnd then
        iEnd :=  iStart + Length(Lines[LineFromPosition(iStart)]);
      //showmessage(inttostr(iStart) + '--' + inttostr(iEnd));
      SetTargetStart(iStart);
      SetTargetEnd(iEnd);

      if sEndComment <> '' then
      begin
        ReplaceTarget(sStartComment + GetTextRange(iStart, iEnd)+sEndComment);
      end else
      begin
      slist := TStringList.Create;
      slist.Text := GetTextRange(iStart, iEnd);
      for j := 0 to slist.Count-1 do
        slist[j] := sStartComment + slist[j] ;
      if slist.Count >0 then
        ReplaceTarget(system.copy(slist.Text, 0, length(slist.Text)-length(slist.LineBreak)))
      else
        ReplaceTarget(sStartComment);
      slist.Free;
      end;
    end;
  end;
begin

  if ReadOnlyWarning('Comment') then
    exit;
  GetActiveEditorOnForm(seEditor);

  if (sStartComment = '') then
  begin
    MessageDlg('The comment/uncomment symbol(s) is not defined for' + #13 +
      'this language (or complex selection).' + #13 + #13 +
      'Please, check the database: Comments!', mtWarning, [mbOK], 0);

    Exit;
  end;


  with seEditor do
  begin
    Lines.BeginUpdate;

    GetAllSelections;
    if length(is1) = 0 then
    begin
      Setlength(is1, 1);
      Setlength(is2, 1);
      is1[0] := GetCurrentPos;
      is2[0] := GetCurrentPos;
    end;

    if is1[0] >= is1[length(is1)-1] then
      for i := 0 to length(is1)-1 do
       CommentBlock(is1[i], is2[i])
    else
      for i := length(is1)-1 downto 0 do
       CommentBlock(is1[i], is2[i]);
    Lines.EndUpdate;
  end;
end;

procedure TfrmEditor.Uncomment(sStartComment, sEndComment: string);
var  is1, is2: array of Integer;
     i: Integer;
     seEditor: TDScintilla;

  procedure GetAllSelections;
    var i: Integer;
  begin
    with seEditor do
    begin
      Setlength(is1, GetSelections);
      Setlength(is2, GetSelections);

      if Length(is1)>0 then
        for i := 0 to Length(is1)-1 do
        begin
          is1[i] := GetSelectionNStart(i);
          is2[i] := GetSelectionNEnd(i);
        end;
    end;
  end;

  procedure UnCommentBlock(iStart, iEnd: Integer);
  var sblock: String;
      slist: TStringList;
      j: Integer;
  begin
    with seEditor do
    begin
      if iStart = iEnd then
        iEnd :=  iStart + Length(Lines[LineFromPosition(iStart)]);
      SetTargetStart(iStart);
      SetTargetEnd(iEnd);

      if iStart <> iEnd then
      begin
        sblock := StringReplace(GetTextRange(iStart, iEnd), sStartComment, '', [rfReplaceAll]);
        if sEndComment <> '' then
        sblock := StringReplace(sblock, sEndComment, '', [rfReplaceAll]);
        ReplaceTarget(sblock);
      end;
    end;
  end;



begin

  if ReadOnlyWarning('Uncomment') then
    exit;
  GetActiveEditorOnForm(seEditor);

  if (sStartComment = '') then
  begin
    MessageDlg('The comment/uncomment symbol(s) is not defined for' + #13 +
      'this language (or complex selection).' + #13 + #13 +
      'Please, check the database: Comments!', mtWarning, [mbOK], 0);
    Exit;
  end;



  with seEditor do
  begin
  Lines.BeginUpdate;

  GetAllSelections;
  if length(is1) = 0 then
  begin
    Setlength(is1, 1);
    Setlength(is2, 1);
    is1[0] := GetCurrentPos;
    is2[0] := GetCurrentPos;
  end;

  if is1[0] >= is1[length(is1)-1] then
    for i := 0 to length(is1)-1 do
     UnCommentBlock(is1[i], is2[i])
  else
    for i := length(is1)-1 downto 0 do
     UnCommentBlock(is1[i], is2[i]);
  Lines.EndUpdate;
  end;
end;






procedure TfrmEditor.CopyFormattedRTF;
//var
//  bcStart, bcStop: TBufferCoord;

begin
//sci //m.p.
{
  try
    Clipboard.Open;
    with Clipboard do
      if HasFormat(CF_TEXT) then
        Clear;

    with frmTinnMain.SynExporterRTF do
    begin
      ExportAsText := False;
      if Assigned(sciEditor2) then
      begin
        if (sActiveEditor = 'sciEditor') then
        begin
          Highlighter := sciEditor.Highlighter;
          bcStart := sciEditor.BlockBegin;
          bcStop := sciEditor.BlockEnd;

          ExportRange(sciEditor.Lines, bcStart, bcStop);

          CopyToClipboard;
        end
        else
        begin
          Highlighter := sciEditor2.Highlighter;
          bcStart := sciEditor2.BlockBegin;
          bcStop := sciEditor2.BlockEnd;

          ExportRange(sciEditor2.Lines, bcStart, bcStop);

          CopyToClipboard;
        end
      end
      else
      begin
        Highlighter := sciEditor.Highlighter;
        bcStart := sciEditor.BlockBegin;
        bcStop := sciEditor.BlockEnd;

        ExportRange(sciEditor.Lines, bcStart, bcStop);

        CopyToClipboard;
      end;
    end;
  finally
    Clipboard.Close;
  end;}
end;

procedure TfrmEditor.CopyFormattedHTML;
//var
//  bcStart, bcStop: TBufferCoord;

begin
//sci //m.p.
{
  try
    Clipboard.Open;
    with Clipboard do
      if HasFormat(CF_TEXT) then
        Clear;

    with frmTinnMain.SynExporterHTML do
    begin
      ExportAsText := False;
      if Assigned(sciEditor2) then
      begin
        if (sActiveEditor = 'sciEditor') then
        begin
          Highlighter := sciEditor.Highlighter;
          bcStart := sciEditor.BlockBegin;
          bcStop := sciEditor.BlockEnd;

          ExportRange(sciEditor.Lines, bcStart, bcStop);

          CopyToClipboard;
        end
        else
        begin
          Highlighter := sciEditor2.Highlighter;
          bcStart := sciEditor2.BlockBegin;
          bcStop := sciEditor2.BlockEnd;

          ExportRange(sciEditor2.Lines, bcStart, bcStop);

          CopyToClipboard;
        end
      end
      else
      begin
        Highlighter := sciEditor.Highlighter;
        bcStart := sciEditor.BlockBegin;
        bcStop := sciEditor.BlockEnd;

        ExportRange(sciEditor.Lines, bcStart, bcStop);

        CopyToClipboard;
      end;
    end;
  finally
    Clipboard.Close;
  end;}
end;

procedure TfrmEditor.CopyFormattedTeX;
//var
//  bcStart, bcStop: TBufferCoord;

begin
//sci //m.p.
{
  try
    Clipboard.Open;
    with Clipboard do
      if HasFormat(CF_TEXT) then
        Clear;

    with frmTinnMain.SynExporterTeX do
    begin
      ExportAsText := False;

      if Assigned(sciEditor2) then
      begin
        if (sActiveEditor = 'sciEditor') then
        begin
          Highlighter := sciEditor.Highlighter;
          bcStart := sciEditor.BlockBegin;
          bcStop := sciEditor.BlockEnd;

          ExportRange(sciEditor.Lines, bcStart, bcStop);

          CopyToClipboard;
        end
        else
        begin
          Highlighter := sciEditor2.Highlighter;
          bcStart := sciEditor2.BlockBegin;
          bcStop := sciEditor2.BlockEnd;

          ExportRange(sciEditor2.Lines, bcStart, bcStop);

          CopyToClipboard;
        end
      end
      else
      begin
        Highlighter := sciEditor.Highlighter;
        bcStart := sciEditor.BlockBegin;
        bcStop := sciEditor.BlockEnd;

        ExportRange(sciEditor.Lines, bcStart, bcStop);

        CopyToClipboard;
      end;
    end;
  finally
    Clipboard.Close;
  end; }
end;

function TfrmEditor.MessageDlg(const Msg: string; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; HelpCtx: Integer): Integer;
begin
  with CreateMessageDialog(Msg, DlgType, Buttons) do
    try
      Position := poOwnerFormCenter;
      Result := ShowModal;
    finally
      Free;
    end
end;

procedure TfrmEditor.FullPathUnix;
var
  sUnixPath: string;

begin
  sUnixPath := DosPathToUnixPath(EditorFile.sFile);

  with Clipboard do
    if HasFormat(CF_TEXT) then
      Clear;

  Clipboard.AsText := sUnixPath;
end;

procedure TfrmEditor.FullPathWindows;
begin
  with Clipboard do
    if HasFormat(CF_TEXT) then
      Clear;

  Clipboard.AsText := EditorFile.sFile;
end;

procedure TfrmEditor.FileClose;
begin
  Close;
end;


procedure TfrmEditor.SetTitles;
var
  sFileName, sStat: String;
  OpenTab: TTabSheet;
begin
  sFileName := Trim(EditorFile.sFile);
  sStat := '';
  if (EditorFile.iModified = 1) then
    sStat := '*';

  Caption := Format('%s%s', [sFileName, sStat]);

  with frmTinnMain do
  begin
    if (pgFiles.PageCount > 0) then
    begin

      OpenTab := GetTabById(EditorFile.iId);
      OpenTab.Hint := sFileName;

      if (not actReadOnly.Checked) then
        OpenTab.Caption := StripPath(sFileName) + sStat
      else
        OpenTab.Caption := '<' + StripPath(sFileName) + sStat + '>';
    end;
  end;
end;




function TfrmEditor.SaveBackup(sTempFile: String): Boolean;
begin
  Result := False;
  try
    sciEditor.Lines.SaveToFile(sTempFile);
    //SaveToFile(sciEditor.Lines, sTempFile, seeEncoding_ToSave, bBOM_ToSave);
    Result := True;
  finally
  end;
end;

procedure TfrmEditor.UnindentBlock;
var seEditor: TDScintilla;
begin
  if ReadOnlyWarning('Block indent') then
    exit;

  GetActiveEditorOnForm(seEditor);
  sciEditor.BackTab;
  EnableSave;
end;


function TfrmEditor.GetEditorLexerId;
begin
  Result := EditorFile.iLexerId;
end;

function TfrmEditor.GetEditorLexerName;
begin
  Result := modDados.GetLexerNameById(GetEditorLexerId);
end;

procedure TfrmEditor.UpdateMainFormLexer;
var iIndex: Integer;
begin


  iIndex := frmTinnMain.slFiltersDisplay.IndexOf(GetEditorLexerName);

  // Has to be updated later. In case no lexer is found it just sets the lexer to 'Text'.
  // However, the lexer itself is not changed.

  if iIndex < 0 then
    iIndex := frmTinnMain.slFiltersDisplay.IndexOf('Text');


  if iIndex > -1  then
    frmTinnMain.cbHighlighter.ItemIndex := iIndex;


end;

function TfrmEditor.ReadOnlyWarning(sFunctionName: String): Boolean;
begin
  if sciEditor.GetReadOnly then
  begin
    Result := true;
    MessageDlg(EditorFile.sFile + #13 + #13 + 'The file is set as read only.' + #13 +
      ''''+sFunctionName+''' will not work!', mtWarning, [mbOK], 0);
  end else Result := false;
end;



procedure TfrmEditor.WriteCursorAndWindowInfo(var EditorFile: TEditorFile);
var seEditor: TDScintilla;
begin
  GetActiveEditorOnForm(seEditor);

  with EditorFile do
  begin
    iCaretPosition := seEditor.GetCurrentPos;
    iTopLine := seEditor.GetFirstVisibleLine;
  end;
end;

procedure TfrmEditor.RReformat;
var seEditor: TDScintilla;
  bSaveSuccess: Boolean;
  sToSend, sFilePath: string;
begin
  if ReadOnlyWarning('Reformat') then
    exit;

  GetActiveEditorOnForm(seEditor);

  if seEditor.GetSelections > 1 then
  begin
    MessageDlg('Reformatting does not work in column selection mode.' , mtInformation, [mbOk], 0);
    Exit;
  end else
    begin
      sFilePath := frmTinnMain.sPathTmp + '\reformat-input.r';
      if not (seEditor.GetSelText <> '') then
        bSaveSuccess := FileSaveFast(sFilePath, seEditor.GetText)
        else bSaveSuccess := FileSaveFast(sFilePath, seEditor.GetSelText);

      if bSaveSuccess then
      with frmTinnMain do
      begin
        if Rterm_Running then
          if (csRGeneral.Active) then
          begin
            bTidying := true;
            frmTidyAbort := TfrmTidyAbort.Create(Application);
            sToSend := 'TinnR$TinnRTidy(.trPaths[8], .trPaths[9])' + #13#10;
            csRGeneral.Socket.SendText(sToSend);
            frmTidyAbort.ShowModal;
          end;
      end;

    end;
end;

procedure TfrmEditor.ProcessTidy;
var
  i, iTopLine: integer;

  bcPos: Integer;
  seEditor: TDScintilla;

  sPrior, sFormatted, sFilePath: string;

begin
   sFilePath := frmTinnMain.sPathTmp + '\reformat-output.r';

   GetActiveEditorOnForm(seEditor);

  if not FileExists(sFilePath) then
    Exit;

  with seEditor do
  begin
    if GetSelText = '' then
      setText(FileToString(sFilePath)) else
      ReplaceSel(FileToString(sFilePath));
    DeleteFile(sFilePath);
  end;

end;




procedure TfrmEditor.MarkSelectionColor(iMarkerNumber: Integer);
var seEditor: TDScintilla;
    i, j, iMaNum: Integer;
begin

  GetActiveEditorOnForm(seEditor);

  with seEditor do
  begin
    MarkerSetBack(SC_Mark_Background, frmTinnMain.iColorMark1);
    MarkerSetBack(SC_MARK_DOTDOTDOT,  frmTinnMain.iColorMark2);

    if iMarkerNumber = 1 then
      iMaNum := SC_Mark_Background;

    if iMarkerNumber = 2 then
      iMaNum := SC_MARK_DOTDOTDOT;

    if iMarkerNumber > 0 then
      for i := GetSelections-1 downto 0 do
        for j := LineFromPosition(GetSelectionNStart(i))  to LineFromPosition(GetSelectionNEnd(i)) do
          MarkerAdd(j, iMaNum);

    if iMarkerNumber = 0 then
      for i := GetSelections-1 downto 0 do
        for j := LineFromPosition(GetSelectionNStart(i))  to LineFromPosition(GetSelectionNEnd(i)) do
        begin
         MarkerDelete(j, SC_Mark_Background);
         MarkerDelete(j, SC_MARK_DOTDOTDOT);
        end;

  end;

end;



procedure TfrmEditor.Sort(iSort: integer);

  procedure UpdateSort;
  var
    tmpTopLine: integer;
    seEditor: TDScintilla;

  begin
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
  // Define the active editor
  GetActiveEditorOnForm(seEditor);
  showmessage('This feature is not yet ready.');
  Exit;
  with seEditor do
  begin

    if GetSelText ='' then
      Exit;

    try
      slTmp := TStringList.Create;
      meTmp := TMemo.Create(nil);
      meTmp.Text := GetSelText;




      if SortMemo then
      begin
        meTmp.SelectAll;
        meTmp.CopyToClipboard;
      end;

        if bSorted then
      UpdateSort;
  finally
    RestorePriorClipboardText;
    FreeAndNil(slTmp);
    FreeAndNil(meTmp);
  end;


  end;


end;





end.

{
procedure TfrmEditor.synEditorGutterClick(Sender: TObject; Button: TMouseButton;
  X, Y, Line: Integer; Mark: TSynEditMark);
var
  seEditor: TSynEdit;

begin
  if (sActiveEditor = 'synEditor') then
    seEditor := synEditor
  else
    seEditor := synEditor2;
  with seEditor do
    if (BlockBegin.Line = BlockEnd.Line) then
    begin
      CaretX := 0;
      ExecuteCommand(ecSelLineEnd, 'A', @seEditor.Lines) // One single click
    end
    else
      ExecuteCommand(ecSelLineStart, 'A', @seEditor.Lines)
      // A selection with more than one line
end;

procedure TfrmEditor.SetHighlighterFromFileExt(sExt: string);
var
  i, iDelimiter, iLenFilter: Integer;

  slFilters: TStringList;

  sLine, sDefaultFilter, SValidFilters: string;

  slSynName: TStringList;

begin
  frmTinnMain.SetToolbarProcessing(sExt);
  slSynName := TStringList.Create;
  slFilters := TStringList.Create;
  slSynName.Text := dmSyn.SynAll.GetFriendlyLanguageName; // The default

  if (sExt <> EmptyStr) then
  begin // Will to try to find the file type
    sExt := '*' + lowerCase(sExt);
    for i := 0 to (dmSyn.iHigCount - 1) do
    begin
      sDefaultFilter := (dmSyn.Components[i] as TSynCustomHighlighter)
        .DefaultFilter;
      iLenFilter := length(sDefaultFilter);

      iDelimiter := pos('|', sDefaultFilter);

      SValidFilters := copy(sDefaultFilter, (iDelimiter + 1),
        (iLenFilter - iDelimiter));
      StrSplit(';', SValidFilters, slFilters);

      if (slFilters.IndexOf(sExt) > -1) then
      begin
        if (sExt = '*.txt') then
          slSynName.Text := 'Text'
        else if (sExt = '*.r') or (sExt = '*.rhistory') or (sExt = '*.q') or
          (sExt = '*.s') or (sExt = '*.ssc') then
          if frmTinnMain.actRSimpleDefault.Checked then
            slSynName.Text := 'R'
          else
            slSynName.Text := 'R complex'
        else
        begin
          slSynName.Text := (dmSyn.Components[i] as TSynCustomHighlighter)
            .GetFriendlyLanguageName;

          if (Trim(slSynName.Text) = 'General_Multi-Highlighter') then
            slSynName.Text := (dmSyn.Components[i] as TSynMultiSyn)
              .DefaultLanguageName;
          break;
        end;
      end;
    end;
  end
  else
  begin // Will to check the first few lines to see what is in the file
    sLine := self.synEditor.Lines.Strings[0];
    sLine := sLine + self.synEditor.Lines.Strings[1];
    sLine := sLine + self.synEditor.Lines.Strings[2];
    if (ExecRegExpr('<html>', sLine)) then
      slSynName.Text := dmSyn.SynHTMLcomplex.DefaultLanguageName
    else if (ExecRegExpr('<html', sLine)) then
      slSynName.Text := dmSyn.SynHTMLcomplex.DefaultLanguageName
    else if (ExecRegExpr('<HTML', sLine)) then
      slSynName.Text := dmSyn.SynHTMLcomplex.DefaultLanguageName
    else if (ExecRegExpr('<?php', sLine)) then
      slSynName.Text := dmSyn.SynPHP.GetFriendlyLanguageName
    else if frmTinnMain.actRSimpleDefault.Checked then
      slSynName.Text := dmSyn.SynR.GetFriendlyLanguageName
    else if frmTinnMain.actRComplexDefault.Checked then
      slSynName.Text := dmSyn.SynRComplex.DefaultLanguageName
    else if frmTinnMain.actTextDefault.Checked then
      slSynName.Text := dmSyn.SynText.GetFriendlyLanguageName;
  end;

  // ShowMessage(slSynName.Text);  //To debug
  SetHighlighterStatus(slSynName);

  FreeAndNil(slSynName);
  FreeAndNil(slFilters);
end;


procedure TfrmEditor.sciEditorDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  with frmTinnMain do
  begin
    Accept := False;

    if (Source is TTreeView) then
      Accept := True
    else if (Source is TShellListView) then
      Accept := True
    else if (Source is TListView) then
      Accept := True
    else if (Source is TJvFileListBox) then
      Accept := True;
  end;
end;

procedure TfrmEditor.sciEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  with frmTinnMain do
    FormDragDrop(Sender, Source, X, Y);
end;

procedure TfrmEditor.UnindentBlock;
begin
  if not(sciEditor.ReadOnly) then
  begin
    if (sActiveEditor = 'sciEditor2') then
      sciEditor2.ExecuteCommand(ecBlockUnindent, 'A', @sciEditor.Lines)
    else
      sciEditor.ExecuteCommand(ecBlockUnindent, 'A', @sciEditor.Lines);;

    EnableSave;
  end
  else
    MessageDlg(sActiveFile + #13 + #13 + 'The file is set as read only.' + #13 +
      '''Block/Unindent'' will not work!', mtWarning, [mbOK], 0);

end;



    procedure synEditorChange(Sender: TObject);
    procedure synEditorClick(Sender: TObject);
    procedure synEditorDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure synEditorDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure synEditorEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure synEditorEnter(Sender: TObject);
    procedure synEditorGutterClick(Sender: TObject; Button: TMouseButton;
      X, Y, Line: Integer; Mark: TSynEditMark);
    procedure synEditorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure synEditorKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure synEditorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure synEditorReplaceText(Sender: TObject;
      const ASearch, AReplace: WideString; Line, Column: Integer;
      var Action: TSynReplaceAction);
    procedure synEditorStatusChange(Sender: TObject;
      Changes: TSynStatusChanges);





}