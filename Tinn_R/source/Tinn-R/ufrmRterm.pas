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

unit ufrmRterm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, JvDockTree, JvDockControlForm,
  JvComponentBase,  ExtCtrls, ConsoleIO,
  DScintillaCustom, DScintillaTypes, DScintilla, Vcl.StdCtrls;

type
  TfrmRterm = class(TForm)
    cRTerm: TConsoleIO;
    JvDockClientRterm: TJvDockClient;
    pgRterm: TPageControl;
    tbsIO: TTabSheet;
    tbsLog: TTabSheet;
    Splitter1: TSplitter;
    sciIO: TDScintilla;
    sciLog: TDScintilla;

    procedure CheckLastLineHiglighterRest;
    procedure cRTermError(Sender: TObject; const Cmd: string);
    procedure cRTermProcessStatusChange(Sender: TObject; IsRunning: Boolean);
    procedure cRTermReceiveError(Sender: TObject; const Cmd: string);
    procedure cRTermReceiveOutput(Sender: TObject; const Cmd: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure pgRtermResize(Sender: TObject);
    procedure sciIOEnter(Sender: TObject);
    procedure sciIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sciIOKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sciIOMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sciLogKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sciLogKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sciLogMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sciLogEnter(Sender: TObject);
    procedure sciIOUserListSelection(ASender: TObject; AListType: Integer;
      AText: string);
    procedure FormEndDock(Sender, Target: TObject; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
    bDockedStatus, bPinnedStatus: Boolean;
    bRterm_Sent: Boolean;
    bTab: Boolean;
    slError: TStringList;
    sTab: string;
    sTabPrefix: string;


    procedure splRIOMoved(Sender: TObject);

  public
    { Public declarations }

    bRterm_Plus: Boolean;
    bRterm_Running: Boolean;
    bRUnderDebug_Function: Boolean;
    bRUnderDebug_Package: Boolean;

    iSciLog2Height: Integer;
    iSciLog2Width: Integer;
    splRIO: TSplitter;
    sRDebugPrefix: string;


    procedure RtermSplit(bSplitHorizontal: Boolean = True);
    procedure RtermRemoveSplit;
    procedure RepaintAfterDockingStatusChange;
  end;

var
  frmRterm: TfrmRterm;

implementation

uses
  ufrmMain,
  ufrmEditor,
  ufrmTools,
  trUtils, uRSendCommands, uLexerCommands, umodDados;

{$R *.dfm}


procedure TfrmRterm.CheckLastLineHiglighterRest;
begin
with sciIO do
begin
  if trim(Lines[Lines.Count-1]) = '>' then
  begin
    Lines.BeginUpdate;
    StartStyling(PositionFromLine(Lines.Count-1), 0);
    SetStyling(1, SCE_R_OPERATOR);
    Lines.EndUpdate;
  end;
 end;
end;


procedure TfrmRterm.cRTermReceiveOutput(Sender: TObject; const Cmd: string);
  procedure FindErrorInTheEditor(sTmp: string);
  var
    i: Integer;

  begin
    with frmTinnMain do
      if (pgFiles.PageCount > 0) then
      begin
        i := FindTopWindow;
        with (MDIChildren[i] as TfrmEditor) do
          SearchError(sTmp)
      end;
  end;

// Will get the object among '' or "": 'object' or "object" --> object
  procedure FindError(sTmp: string);
  var
    iPos: Integer;

  begin
    iPos := Pos('''', sTmp);

    if (iPos <> 0) then
    begin
      Delete(sTmp, 1, iPos);
      iPos := Pos('''', sTmp);
      Delete(sTmp, iPos, length(sTmp));
      FindErrorInTheEditor(sTmp);
      Exit;
    end;

    iPos := Pos('"', sTmp);
    if (iPos <> 0) then
    begin
      Delete(sTmp, 1, iPos);
      iPos := Pos('"', sTmp);
      Delete(sTmp, iPos, length(sTmp));
      FindErrorInTheEditor(sTmp);
    end;
  end;

  procedure GetError;
  var
    i, iCount, iPos: Integer;
    sTmp: string;

  begin
    iCount := slError.Count;
    case iCount of
      1:
        begin
          sTmp := slError.Strings[0];
          FindError(sTmp);
        end;
      2:
        begin
          sTmp := slError.Strings[1];
          FindError(sTmp);
        end
    else
      begin
        for i := (iCount - 1) downto 0 do
        begin
          if (Trim(slError.Strings[i]) = '^') then
          begin
            sTmp := slError.Strings[i - 1];
            // The prior strings (line) has the error!
            iPos := Pos(':', sTmp);
            if (iPos <> 0) then
            begin
              Delete(sTmp, 1, iPos);
              sTmp := Trim(sTmp);
              FindErrorInTheEditor(sTmp);
              Break;
            end;
          end
          else
          begin
            sTmp := slError.Strings[i];
            // The current strings (line) has the error!
            FindError(sTmp);
          end;
        end;
      end;
    end;
  end;

  procedure CheckIfUnderDebug_Function;
  var
    iPosDbg1, iPosDbg2: Integer;

  begin
    // It is necessary due the use of package debug: Browser[number]>
    iPosDbg1 := Pos('Browse[', Cmd);
    iPosDbg2 := Pos(']>', Cmd);
    if (iPosDbg1 <> 0) and (iPosDbg2 <> 0) then
    begin
      bRUnderDebug_Function := True;
      sRDebugPrefix := Trim(Copy(Cmd, iPosDbg1, iPosDbg2 - iPosDbg1 + 2));
    end
    else
      bRUnderDebug_Function := False;
  end;

  procedure CheckIfUnderDebug_Package;
  var
    iPosDbg1, iPosDbg2: Integer;

  begin
    // It is necessary due the use of package debug: D(number)>
    iPosDbg1 := Pos('D(', Cmd);
    iPosDbg2 := Pos(')>', Cmd);
    if (iPosDbg1 <> 0) and (iPosDbg2 <> 0) then
    begin
      bRUnderDebug_Package := True;
      sRDebugPrefix := Trim(Copy(Cmd, iPosDbg1, iPosDbg2 - iPosDbg1 + 2));
    end
    else
    begin
      bRUnderDebug_Package := False;
      if not bRUnderDebug_Function then
        sRDebugPrefix := '';
    end;
  end;

  procedure ResetHighlighterInTextBlock(iTextLength: Integer);
  var iStart, iEnd, i, iStartLine: Integer;
      bUpdatedBefore, bUpdate: Boolean;
  begin
  with sciIO do
  begin

    iEnd := GetTextLength;

    iStart := iEnd - iTextLength;
    iStartLine := LineFromPosition(iStart);
    Update;
    for i := iStartLine to GetLineCount -1 do
    begin


     if System.copy(Lines[i], 0, 2) = '> ' then
     begin
       if GetStyleAt(PositionFromLine(i)) = SCE_R_STRING then
       begin
         InsertText(GetLineEndPosition(i-1), '....[UNBOUNDED STRING]"');
         Update;

       end;

       if GetStyleAt(PositionFromLine(i)) = SCE_R_STRING2 then
       begin
         InsertText(GetLineEndPosition(i-1), '....[UNBOUNDED STRING]''');
         Update;
       end;
     end;
    end;
  end;
  end;



  // m.p.
  //     The old version created a new StringList and replaced #13#10 by #13#10.
  //     It should be more efficient but still produce the same output if
  //     Lines.Add(Cmd) is used instead.

  procedure AddROutput;
  //var
  //  slTmp: TStringList;
  begin
    try
      //slTmp := TStringList.Create;
      //slTmp.Text := Cmd;
      //slTmp.Text := StringReplace(Cmd, #13#10, #13#10, [rfReplaceAll]);

      with sciIO do
        if bRUnderDebug_Function or bRUnderDebug_Package then
        begin
          Lines.Add('');
          //Lines.AddStrings(slTmp);
          SetStyling(0, SCE_R_DEFAULT);
          Lines.Add(Cmd);
          ResetHighlighterInTextBlock(length(Cmd));
        end
        else
        begin
          //Lines.AddStrings(slTmp);
          SetStyling(0, SCE_R_DEFAULT);
          Lines.Add(Cmd);
          ResetHighlighterInTextBlock(length(Cmd));
        end;
    finally
      //FreeAndNil(slTmp);
    end;
  end;

var
  i: Integer;
  slTmp: TStringList;

begin

  if (Cmd = '') and bTab then
    Exit;

  if Assigned(slError) then
  begin
    GetError;
    FreeAndNil(slError);
  end;

  pgRterm.ActivePage := tbsIO;
  CheckIfUnderDebug_Function;
  CheckIfUnderDebug_Package;

  with sciIO do
  begin
    Lines.BeginUpdate;
    if (Cmd = '+ ') then
      bRterm_Plus := True; // To control sending line by line

    if bRterm_Sent then
    begin
      if (Cmd = '> ') then
        Lines.Add(Cmd)
      else
        AddROutput;

      bRterm_Sent := False;

      if bTab then
      begin
        try
          slTmp := TStringList.Create;

          StrSplit(' ', Cmd, slTmp);

          if (slTmp.Count = 2) then
          begin
            if (sTabPrefix <> '') then
              sTab := sTabPrefix + slTmp[1]
            else
              sTab := slTmp[1];
          end;
        finally
          FreeAndNil(slTmp);
        end;
      end;
    end
    else
    begin

      if (Cmd = '> ') and (GetCurrentLine(sciIO) <> '') then
        Lines.Add('');

      if (Cmd = '> ') and (sTab <> '') and bTab then
      begin
        Lines.Add(Cmd + sTab);

        sTab := '';

        bTab := False;
      end
      else
        AddROutput;
        ResetHighlighterInTextBlock(length(Cmd));
    end;

    {ExecuteCommand(ecEditorBottom, #0, nil);

    if not WordWrap then
      for i := 0 to 1 do
        ExecuteCommand(ecScrollLeft, #0, nil);
    }

    SetCursorToBottom(sciIO);
    // This procedure is not required and doesn't work at the moment as
    // ResetHighlighterInTextBlock(length(Cmd))
    // does the work. However, it would be the more elegant way.
    //CheckLastLineHiglighterRest;
    Lines.EndUpdate;
  end;
 {
  with frmTinnMain do
    if (pgFiles.PageCount > 0) then
      SetFocus_Main
    else
      sciIO.SetFocus;
                 }
  frmTinnMain.bRObjectsUpdate := true;
end;


procedure TfrmRterm.cRTermError(Sender: TObject; const Cmd: string);
begin
  with sciIO do
  begin
    Lines.BeginUpdate;
    Lines.Add(Cmd);
    if not frmTinnMain.bRguiReturnFocus then
      SetFocus;
    Lines.EndUpdate;
  end;

  //frmTinnMain.stbMain.Panels[8].Text := 'Log: received warning or error!';
  frmTinnMain.actRtermWarningError.Caption := 'Log: received warning or error!';
  with frmTinnMain.actRtermWarningError do
  begin
    Visible := True;
    Checked := False;
  end;

  //frmTinnMain.SetFocus_Main;
end;

procedure TfrmRterm.cRTermProcessStatusChange(Sender: TObject;
  IsRunning: Boolean);
begin
  if IsRunning then
  begin
    bRterm_Running := True;
    modDados.ResetRObjectDatabase;
    LoadTinnRCommunicationScripts;
  end
  else
    bRterm_Running := False;
end;

procedure TfrmRterm.cRTermReceiveError(Sender: TObject; const Cmd: string);

  function CheckIfError: Boolean;
  var
    i: Integer;

  const
    aError: array [0 .. 4] of string = ('erro', // pt
      'erreur', // fr
      'error', // en/es
      'errore', // it
      'fehler'); // de

  begin
    Result := False;
    for i := 0 to 4 do
      if (Pos(aError[i], lowercase(Cmd)) > 0) then
      begin
        Result := True;

        Break;
      end;
  end;

var
  sciLogA: TDScintilla;

begin

  if ansipos('TinnRMSG:', cmd)>0 then
  begin
    if ansipos(':ConnectSockets', cmd) >0 then
     ConnectRSocketServer;
    if ansipos(':MissingPackage', cmd) >0 then
      InstallTinnRPackages(copy(cmd, ansipos('|', cmd)+1,  ansipos('<', cmd) - ansipos('|', cmd)-1 ));
    if ansipos(':PackagesInstalled', cmd) >0 then
      LoadTinnRCommunicationScripts;
    exit;
  end;


  if CheckIfError then
  begin
    with frmTinnMain do
    begin
      //stbMain.Panels[8].Text := 'Error!';

      actRtermWarningError.ImageIndex := 254;

      if bRtermBeepOnError then
        Beep;

      if bRtermFindError then
        if not bRterm_Sent and not Assigned(slError) then
          slError := TStringList.Create;
    end;
  end
  else
  begin
    with frmTinnMain do
    begin
      //stbMain.Panels[8].Text := 'Warning!';

      actRtermWarningError.ImageIndex := 252;
    end;
  end;


  sciLogA := sciLog;

  with sciLogA do
  begin
    Lines.BeginUpdate;

    if bRterm_Sent then
      bRterm_Sent := False;

    Lines.Add(Cmd);

    PostMessage(TWinControl(sciLogA).Handle, WM_SETFOCUS, 0, 0);
    // Will force ecEditorBottom below

    //ExecuteCommand(ecEditorBottom, #0, nil);
    SetCursorToBottom(sciLogA);

    Lines.EndUpdate;
  end;

  if frmTinnMain.bRtermFindError and Assigned(slError) then
    slError.Add(Cmd);

  with frmTinnMain.actRtermWarningError do
  begin
    Visible := True;

    Checked := False;
  end;

  //frmTinnMain.SetFocus_Main;
end;

procedure TfrmRterm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  frmTinnMain.actRtermVisibleExecute(nil);
end;

procedure TfrmRterm.FormCreate(Sender: TObject);
begin
  JvDockClientRterm.DockStyle := frmTinnMain.JvDockVSNetStyle;
  ManualDock(frmTinnMain.JvDockServer.RightDockPanel, nil, AlClient);
  ShowDockForm(Self);
end;

procedure TfrmRterm.FormEndDock(Sender, Target: TObject; X, Y: Integer);
begin
  SetScintillaProperties(frmRterm.sciIO);
  SetScintillaProperties(frmRterm.sciLog);
end;

procedure TfrmRterm.FormPaint(Sender: TObject);
var bNewDockedStatus, bNewPinnedStatus: Boolean;
begin
  bNewDockedStatus := false;
  bNewPinnedStatus := true;
  if assigned(JvDockClientRterm) then
    bNewDockedStatus := (jvDockClientRTerm.DockState = JvDockState_Docking);

  if bNewDockedStatus then
      bNewPinnedStatus := (Self.Parent.ClassName <> 'TJvDockVSPopupPanel');

  if (bnewDockedStatus <> bDockedStatus) OR (bNewPinnedStatus <> bPinnedStatus) then
  begin
    bDockedStatus := bnewDockedStatus;
    bPinnedStatus := bNewPinnedStatus;
    RepaintAfterDockingStatusChange;
  end;

{
   frmTinnMain.Label2.caption := inttostr(random(9999));

  if bNewDockedStatus then
   frmTinnMain.Label2.caption := frmTinnMain.Label2.caption + ' docked' else
    frmTinnMain.Label2.caption := ' undocked';

  if bNewPinnedStatus then
   frmTinnMain.Label2.caption := frmTinnMain.Label2.caption + ' pinned' else
    frmTinnMain.Label2.caption := ' unpinned';
  }
end;

procedure TfrmRterm.FormResize(Sender: TObject);
var bNewDockedStatus, bNewPinnedStatus: Boolean;



begin

end;

procedure TfrmRterm.FormShow(Sender: TObject);
begin
  AlphaBlendValue := frmTinnMain.iAlphaBlendValue;
end;

procedure TfrmRterm.pgRtermResize(Sender: TObject);
var
  sPseudo, sToSend: string;
  iWidth, iCharLength, iLength: Integer;

begin
  if (not bRterm_Running) then
    Exit;

//  if frmTinnMain.actRtermIOLineWrap.Checked then
//  begin
    sPseudo := 'lm.D90 <- lm(weight ~ group - 1) # omitting intercept';
    iCharLength := length(sPseudo);

    iLength := sciIO.TextWidth(SCE_R_DEFAULT, sPseudo);

    iWidth := round((sciIO.Width - sciIO.GetMarginLeft- sciIO.GetMarginRight - GetSystemMetrics(SM_CXVSCROLL))/iLength*iCharLength);
  if (iWidth <= 9) then
    iWidth := 10;

//  end else iWidth := 999;
  sToSend := 'options(''width''=' + IntToStr(iWidth ) + ')' + #13#10;

  with frmTinnMain do
    if csRGeneral.Active then
      csRGeneral.Socket.SendText(sToSend);
end;



procedure TfrmRterm.sciLogEnter(Sender: TObject);
begin
  frmTinnMain.actRtermLogSetFocus.Checked := True;
end;

procedure TfrmRterm.sciLogKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    1 .. 15, 18 .. 31, 33 .. 36, 38, 40 .. 44, 46 .. 67, 69 .. 105, 108,
      110 .. 300:
      begin
      {  with frmTinnMain.stbMain do
        begin
          Panels[7].Text := '';
          Panels[8].Text := '';
        end; }
        with frmTinnMain.actRtermWarningError do
        begin
          Visible := False;
          Checked := False;
        end;
      end;
  end;

  if (Shift = [ssCtrl]) then
    case Key of
      VK_TAB:
        begin
          if not frmTinnMain.actRtermVisible.Checked then
            Exit;
            pgRterm.ActivePageIndex := 0;
          sciIO.SetFocus;
        end;
    end;

  if not bRterm_Running then
    Exit;
end;

procedure TfrmRterm.sciLogKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  frmTinnMain.iSciWithFocus := 4;
end;

procedure TfrmRterm.sciLogMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  frmTinnMain.iSciWithFocus := 4;
end;

procedure TfrmRterm.splRIOMoved(Sender: TObject);
begin
  if frmTinnMain.actRtermIOSplitHorizontal.Checked then
    iSciLog2Height := SciLog.Height;
  if frmTinnMain.actRtermIOSplitVertical.Checked then
    iSciLog2Width := SciLog.Width;
end;

procedure TfrmRterm.RtermRemoveSplit;
begin
  sciLog.Parent := tbsLog;
  sciLog.Align  := alClient;
  sciIO.Align := alClient;
  tbsLog.TabVisible := True;
  FreeAndNil(splRIO);
  SetScintillaProperties(sciIO);
  SetScintillaProperties(frmRterm.sciLog);
end;


procedure TfrmRterm.RtermSplit(bSplitHorizontal: Boolean = True);
begin
  if Assigned(splRIO) then
    FreeAndNil(splRIO);

  //SciLog2 := TDScintilla.Create(Self);
  with SciLog do
  begin
  if bSplitHorizontal then
    begin
      Align := alBottom;
      if (iSciLog2Height > tbsIO.Height) then
        SciLog.Height := 4 * (tbsIO.Height div 5)
      else
        SciLog.Height := iSciLog2Height
    end
    else
    begin
      Align := alRight;
      if (iSciLog2Width > tbsIO.Width) then
        SciLog.Width := 2 * (tbsIO.Width div 3)
      else
        SciLog.Width := iSciLog2Width
    end;
    Parent := tbsIO;

  end;
  SetScintillaProperties(sciIO);
  SetScintillaProperties(sciLog);
  tbsLog.TabVisible := False;


  splRIO := TSplitter.Create(nil);
  with splRIO do
  begin
    Parent := tbsIO;
    onMoved := splRIOMoved;
    Color := clActiveCaption;
    Beveled := True;
    if bSplitHorizontal then
    begin
      Align := alBottom;
      Height := 3;
      Cursor := crVSplit;
    end
    else
    begin
      Align := alRight;
      Width := 3;
      Cursor := crHSplit;
    end;
  end;
end;

procedure TfrmRterm.sciIOEnter(Sender: TObject);
begin
  //SetLexer(frmRterm.sciIO, 'R');
  //ApplyLexer(86, frmRterm.sciIO);
  with frmTinnMain do
    actRtermIOSetFocus.Checked := True;
end;

procedure TfrmRterm.sciIOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  function ConsoleGetCursorTo(sWay: string): string;
  var
    iPos, iPosStart: Integer;
    smOption: Integer;

  begin
    Result := '';
    if not frmTinnMain.ValidRRunning then
      Exit;
    with sciIO do
    begin
      Lines.BeginUpdate;
      smOption := GetSelectionMode;


      if (GetSelectionMode <> 0) then
        SetSelectionMode(1);

      iPosStart := GetCurrentPos;
      iPos := GetCaretX(sciIO);

      // CursorToBeginningLine
      if (sWay = 'BeginningLine') then
      begin
        if not (GetSelText = '') then
          home;
          //GotoLine(iPos);
      end
      // CursorToEndLine
      else if not (GetSelText = '') then
       LineEnd;
       //GotoPos(GetLineEndPosition(iPos));

      if (GetSelText = '') then
        Result := GetSelText
      else
      begin
        Result := '';
        SetSelectionMode(smOption);
        //CaretX := iPos;
        GotoPos(iPosStart);
        Lines.EndUpdate;
        Exit;
      end;

      SetSelectionMode (smOption);
      //CaretX := iPos;
      GotoPos(iPosStart);
      Lines.EndUpdate;
    end;
  end;

  function IsInteger(sTmp: string): Boolean;
  begin
    try
      Result := True;
      StrToInt(Trim(sTmp));
    except
      On EConvertError do
        Result := False;
    end;
  end;

const
  cOk = ['>', '+'];

var
  iPos, iPosX, iPosStart, iMinPos: Integer;
  sTmp, sToSend, sPrior, sAfter, sEfective: string;

begin
  with frmTinnMain do
    actRtermIOSetFocus.Checked := True;
  case Key of
    1 .. 15, 18 .. 31, 33 .. 36, 38, 40 .. 44, 46 .. 67, 69 .. 105, 108,
      110 .. 300:
      begin
     {   with frmTinnMain.stbMain do
        begin
          Panels[7].Text := '';
          Panels[8].Text := '';
        end;       }
        with frmTinnMain.actRtermWarningError do
        begin
          Visible := False;
          Checked := False;
        end;
      end;
  end;

  if (Shift = [ssCtrl]) then
    case Key of
      VK_TAB:
        begin
          if not frmTinnMain.actRtermVisible.Checked then
            Exit;
          if frmTinnMain.bRtermSimple then
            sciLog.SetFocus
          else
          begin
            pgRterm.ActivePageIndex := 1;

            sciLog.SetFocus;
          end;
        end;
    end;

  if (Shift <> [ssCtrl]) and (Key = VK_TAB) then
  begin
    //with sciIO do
    begin
      if not frmTinnMain.Rterm_Running then
        Exit;
      sciIO.Lines.BeginUpdate;
      sciIO.GetCurLine(sTmp);
      sTmp := Trim(sTmp);


      sTabPrefix := '';
      iPos := Pos('(', sTmp);
      if (iPos <> 0) then
      begin
        sTabPrefix := Trim(Copy(sTmp, 0, iPos));
        if sTmp[iPos + 1] = ' ' then
          sTabPrefix := sTabPrefix + ' ';
        Delete(sTabPrefix, 1, 2);
        sTmp := Trim(Copy(sTmp, (iPos + 1), (length(sTmp) - iPos + 1)));
      end;

      iPos := Pos('<-', sTmp);
      if (iPos <> 0) then
      begin
        sTabPrefix := Trim(Copy(sTmp, 0, iPos + 1));
        if sTmp[iPos + 2] = ' ' then
          sTabPrefix := sTabPrefix + ' ';
        Delete(sTabPrefix, 1, 2);
        sTmp := Trim(Copy(sTmp, (iPos + 2), (length(sTmp) - iPos + 1)));
      end;

      iPos := Pos('<<-', sTmp);
      if (iPos <> 0) then
      begin
        sTabPrefix := Trim(Copy(sTmp, 0, iPos + 2));
        if sTmp[iPos + 3] = ' ' then
          sTabPrefix := sTabPrefix + ' ';
        Delete(sTabPrefix, 1, 2);
        sTmp := Trim(Copy(sTmp, (iPos + 3), (length(sTmp) - iPos + 2)));
      end;

      iPos := Pos('=', sTmp);
      if (iPos <> 0) then
      begin
        sTabPrefix := Trim(Copy(sTmp, 0, iPos));
        if sTmp[iPos + 1] = ' ' then
          sTabPrefix := sTabPrefix + ' ';
        Delete(sTabPrefix, 1, 2);
        sTmp := Trim(Copy(sTmp, (iPos + 1), (length(sTmp) - iPos + 1)));
      end;

      if (sTmp = '>') or (sTmp = '') then
      begin
        Key := VK_PAUSE;
        sciIO.Lines.EndUpdate;
        Exit;
      end;

      if CharInSet(sTmp[1], cOk) then
        Delete(sTmp, 1, 1);

      // Get the typed to add to the prompt after the Result returned by R

      sciIO.GetCurLine(sTab);
      sTab := Trim(sTab);

      if CharInSet(sTab[1], cOk) then
        Delete(sTab, 1, 1);
      sTab := Trim(sTab);
      // Send intruction to R
      sTmp := Trim(sTmp);
      sToSend := 'apropos(''^' + sTmp + '''' + ', ignore.case=FALSE)';
      bTab := True;
      bRterm_Sent := True;
      bRterm_Plus := False;
      DoSend(sToSend, False);
      //sciExecuteCommand(ecEditorBottom, #0, nil);
      sciIO.DocumentEnd;
      //sciIO.SetCurrentPos(sciIO.GetLength);
      sciIO.Lines.EndUpdate;
      Exit;
    end;
  end;

  if not bRterm_Running and not frmTinnMain.bIPRemoteConnected then
    Exit;

  if (Shift = [ssCtrl]) then
  begin
    if not frmTinnMain.Rterm_Running then
      Exit;
    case Key of
      89:
        // CTRL+Y
        if (GetCaretY(sciIO) = sciIO.GetLineCount - 1) then
            Key := VK_PAUSE;

      VK_RETURN:
        with sciIO do
        begin // Send prior lines
          Lines.BeginUpdate;
          GetCurLine(sTmp);
          sTmp := Trim(sTmp);

          sciIO.DocumentEnd;
          //sci ExecuteCommand(ecEditorBottom, #0, nil);
          //SetCurrentPos(sciIO.GetLength);
          sciIO.Lines[GetCaretY(sciIO)] := sTmp;
       //sci   LineText := sTmp;
          //sci ExecuteCommand(ecEditorBottom, #0, nil);
          //SetCurrentPos(sciIO.GetLength);
           sciIO.DocumentEnd;
          if (sTmp = '') then
            sTmp := '> ';
          if CharInSet(sTmp[1], cOk) then
            Delete(sTmp, 1, 1);
          if (sTmp <> '') then
            frmTinnMain.RHistory.Add(Trim(sTmp));
          sToSend := sTmp;
          bRterm_Sent := True;
          bRterm_Plus := False;
          DoSend(sToSend, False);
          sciIO.Lines.EndUpdate;
          Exit;
        end;

      VK_MULTIPLY:
        begin // Add or replace text by tip: R server or database

          with sciIO do
          begin
            iPosStart := GetCurrentPos;
            iPosX := GetCaretX(sciIO);
            ReplaceSel(frmTinnMain.sTipToWrite + ')');
            SetCurrentPos(iPosStart);
            //CaretX := iPosX;
          end;
          frmTinnMain.sTipToWrite := '';
        end;

      VK_ADD:      sciIO.ReplaceSel(' -> '); // Add or replace text by attribution symbol: ->
      VK_SUBTRACT: sciIO.ReplaceSel(' <- '); // Add or replace text by attribution symbol: <-
      48:          sciIO.ReplaceSel('()'); // Add or replace text by attribution symbol: ()
      57:
        with sciIO do
        begin // Add or replace text by attribution symbol: (Caret)
          ReplaceSel('()');
          SetCurrentPos(GetCurrentPos-1);
        end;
    end;
  end;

  // All below will make restrictions and special features to the keystrokes on the last line (prompt)
  with sciIO do
  begin
    if not (GetSelText = '') then
    begin
      if (GetCaretY(sciIO) = GetLineCount - 1) and (Key = VK_DOWN) then
      begin
        Key := VK_PAUSE;
        sciIO.LineEnd;
        //sciIO.SetCurrentPos(sciIO.GetLength);
        //sci CaretY := Lines.Count;
        //sci ExecuteCommand(ecLineEnd, #0, nil);
      end
      else if (GetCaretY(sciIO) <> sciIO.GetLineCount - 1) then
        Exit;
    end;
  end;
  {
    with synIO do
    if not SelAvail then
    if (LineText <> '') then
    if (LineText[1] in cOk) and
    (CaretX <= 3) then CaretX:= 3;
  }
  if (Key = VK_RETURN) then
  begin // Send latest line to R when editing related to Rterm
    if not frmTinnMain.Rterm_Running then
      Exit;

    if sciIO.AutoCActive then
      begin
        sciIO.AutoCComplete;
        Key := VK_PAUSE;

      end else
      begin
      with sciIO do
      begin
        Key := VK_PAUSE; // Avoid a blank line below the instruction

        Lines.BeginUpdate;

        //sci ExecuteCommand(ecLineEnd, #0, nil);
        //GotoPos(GetLineEndPosition(GetCurrentPos));
        LineEnd;

        GetCurLine(sTmp);
        sTmp := Trim(sTmp);

        if (sTmp = '') then
          sTmp := '> ';

        if CharInSet(sTmp[1], cOk) then
          Delete(sTmp, 1, 1);
        if (sTmp <> '') and (sTmp <> '> ') then
        begin

          // It is necessary due the use of function debug: Browse[number]>
          if bRUnderDebug_Function then
          begin
            iPos := Pos(']>', sTmp);

            sEfective := Trim(System.Copy(sTmp, (iPos + 2), (length(sTmp) - iPos + 2)));

            if (sEfective = '') then
              sTmp := ''
            else
              sTmp := sEfective;
          end

          // It is necessary due the use of package debug: D(number)>
          else if bRUnderDebug_Package then
          begin
            iPos := Pos(')>', sTmp);

            sEfective := Trim(System.Copy(sTmp, (iPos + 2), (length(sTmp) - iPos + 2)));

            if (sEfective = '') then
              sTmp := ''
            else
              sTmp := sEfective;
          end

          // It is necessary due the use of package sem (John Fox)
          else if (sTmp[length(sTmp)] = ':') then
            if IsInteger(System.Copy(sTmp, 0, Pos(':', sTmp) - 1)) then
              sTmp := '';
        end;
        if (sTmp <> '') then
          frmTinnMain.RHistory.Add(Trim(sTmp));

        sToSend := Trim(sTmp);

        bRterm_Sent := True;

        bRterm_Plus := False;
        DoSend(sToSend, False);
        Lines.EndUpdate;
      end;
      end;

  end;

  // The below will avoid the user to type any not desired keys in the prompt: '>' or '+' signal
  if (Shift <> [ssCtrl]) and (Key <> VK_RETURN) then
    case Key of
      VK_BACK:
        begin
          with sciIO do
          begin
            if (GetSelText = '') then
            begin
                 if (sRDebugPrefix <> '') then
                   iMinPos :=  length(sRDebugPrefix) + 2
                 else
                   iMinPos := 3;
                 if GetCaretX(sciIO) < iMinPos then
                   Key := ord(#0);

            {
              sPrior := Trim(ConsoleGetCursorTo('BeginningLine'));

              if (sPrior = '>') or (sPrior = '+') or (sPrior = sRDebugPrefix)
              then
                Key := VK_PAUSE;    }



            end
            else
            begin
              if (GetCaretY(sciIO) = GetLineCount -1) and (SelStartLine(sciIO) <> SelEndLine(sciIO))
              then
                with cRTerm do
                begin
                  if (GetSelText = Text) then
                    sciIO.Clear;

                  if IsRunning then
                    SendInput('' + #13#10);
                end;
            end;
          end;
        end;

      // Necessary to cotrol "Ctrl + A" or selection in the last line (prompt)
      VK_DELETE:
        begin
          with sciIO do
          begin
            if (GetSelText = '') then
            begin

                 if (sRDebugPrefix <> '') then
                   iMinPos :=  length(sRDebugPrefix) + 2
                 else
                   iMinPos := 3;
                 if GetCaretX(sciIO) < iMinPos-1 then
                   Key := VK_PAUSE;

              {sPrior := Trim(ConsoleGetCursorTo('BeginningLine'));

              sAfter := Trim(ConsoleGetCursorTo('EndLine'));

              if (sPrior = '>') or (sPrior = '+') or (sPrior = sRDebugPrefix)
              then
                if (sAfter = '') then
                begin
                  Key := VK_PAUSE;
                  LineEnd;
                  //GotoPos(GetLineEndPosition(GetCurrentPos));
                  //sci ExecuteCommand(ecLineEnd, #0, nil);
                end;
                }
            end
            else
            begin
              if (GetCaretY(sciIO) = GetLineCount -1) and (SelStartLine(sciIO) <> SelEndLine(sciIO))
              then
                with cRTerm do
                begin

                  ///if (GetSelText = Text) then
                    sciIO.Clear;

                  if IsRunning then
                    SendInput('' + #13#10);
                end;
            end;
          end;
        end;

      VK_LEFT: begin
                 if (sRDebugPrefix <> '') then
                   iMinPos :=  length(sRDebugPrefix) + 2
                 else
                   iMinPos := 3;
                 if GetCaretX(sciIO) < iMinPos then
                   Key := VK_PAUSE;
               end;

      {
      VK_LEFT:
        with sciIO do
        begin
          if GetSelText = '' then
          begin
            sPrior := Trim(ConsoleGetCursorTo('BeginningLine'));

            if (sPrior = '>') or (sPrior = '+') or (sPrior = sRDebugPrefix) then
              Key := VK_PAUSE;
          end;
        end;
             }
      VK_HOME:

        begin
          if (sRDebugPrefix <> '') then
            SetCaretX(length(sRDebugPrefix) + 2, sciIO)
          else
            SetCaretX(3, sciIO);
          Key := VK_PAUSE;
        end;
    end;

end;

procedure TfrmRterm.sciIOKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  frmTinnMain.iSciWithFocus := 3;
end;

procedure TfrmRterm.sciIOMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  frmTinnMain.iSciWithFocus := 3;
end;

procedure TfrmRterm.sciIOUserListSelection(ASender: TObject; AListType: Integer;
  AText: string);
begin
 if trim(AText) <>'' then
   sciIO.InsertText(sciIO.GetCurrentPos, AText);
end;

procedure TfrmRterm.RepaintAfterDockingStatusChange;
begin
  SetScintillaProperties(frmRterm.sciIO);
  SetScintillaProperties(frmRterm.sciLog);
end;

end.




{
procedure TfrmRterm.synIOEnter(Sender: TObject);
begin
  with frmTinnMain do
    actRtermIOSetFocus.Checked := True;
end;

procedure TfrmRterm.synIOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

  function ConsoleGetCursorTo(sWay: string): string;
  var
    iPos: Integer;
    smOption: TSynSelectionMode;

  begin
    Result := '';
    if not frmTinnMain.ValidRRunning then
      Exit;
    with synIO do
    begin
      BeginUpdate;
      smOption := SelectionMode;

      if (SelectionMode <> smNormal) then
        SelectionMode := smNormal;

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

      if SelAvail then
        Result := SelText
      else
      begin
        Result := '';
        SelectionMode := smOption;
        CaretX := iPos;
        EndUpdate;
        Exit;
      end;

      SelectionMode := smOption;
      CaretX := iPos;
      EndUpdate;
    end;
  end;

  function IsInteger(sTmp: string): Boolean;
  begin
    try
      Result := True;
      StrToInt(Trim(sTmp));
    except
      On EConvertError do
        Result := False;
    end;
  end;

const
  cOk = ['>', '+'];

var
  iPos, iPosX: Integer;
  sTmp, sToSend, sPrior, sAfter, sEfective: string;

begin
{  with frmTinnMain do
    actRtermIOSetFocus.Checked := True;

  case Key of
    1 .. 15, 18 .. 31, 33 .. 36, 38, 40 .. 44, 46 .. 67, 69 .. 105, 108,
      110 .. 300:
      begin
        with frmTinnMain.stbMain do
        begin
          Panels[7].Text := '';
          Panels[8].Text := '';
        end;
        with frmTinnMain.actRtermWarningError do
        begin
          Visible := False;
          Checked := False;
        end;
      end;
  end;

  if (Shift = [ssCtrl]) then
    case Key of
      VK_TAB:
        begin
          if not frmTinnMain.actRtermVisible.Checked then
            Exit;
          if Assigned(sciLog2) then
            sciLog2.SetFocus
          else
          begin
            pgRterm.ActivePageIndex := 1;
            synLog.SetFocus;
          end;
        end;
    end;

  if (Shift <> [ssCtrl]) and (Key = VK_TAB) then
  begin
    with synIO do
    begin
      if not frmTinnMain.Rterm_Running then
        Exit;
      BeginUpdate;
      sTmp := Trim(LineText);

      sTabPrefix := '';
      iPos := Pos('(', sTmp);
      if (iPos <> 0) then
      begin
        sTabPrefix := Trim(Copy(sTmp, 0, iPos));
        if sTmp[iPos + 1] = ' ' then
          sTabPrefix := sTabPrefix + ' ';
        Delete(sTabPrefix, 1, 2);
        sTmp := Trim(Copy(sTmp, (iPos + 1), (length(sTmp) - iPos + 1)));
      end;

      iPos := Pos('<-', sTmp);
      if (iPos <> 0) then
      begin
        sTabPrefix := Trim(Copy(sTmp, 0, iPos + 1));
        if sTmp[iPos + 2] = ' ' then
          sTabPrefix := sTabPrefix + ' ';
        Delete(sTabPrefix, 1, 2);
        sTmp := Trim(Copy(sTmp, (iPos + 2), (length(sTmp) - iPos + 1)));
      end;

      iPos := Pos('<<-', sTmp);
      if (iPos <> 0) then
      begin
        sTabPrefix := Trim(Copy(sTmp, 0, iPos + 2));
        if sTmp[iPos + 3] = ' ' then
          sTabPrefix := sTabPrefix + ' ';
        Delete(sTabPrefix, 1, 2);
        sTmp := Trim(Copy(sTmp, (iPos + 3), (length(sTmp) - iPos + 2)));
      end;

      iPos := Pos('=', sTmp);
      if (iPos <> 0) then
      begin
        sTabPrefix := Trim(Copy(sTmp, 0, iPos));
        if sTmp[iPos + 1] = ' ' then
          sTabPrefix := sTabPrefix + ' ';
        Delete(sTabPrefix, 1, 2);
        sTmp := Trim(Copy(sTmp, (iPos + 1), (length(sTmp) - iPos + 1)));
      end;

      if (sTmp = '>') or (sTmp = '') then
      begin
        Key := VK_PAUSE;
        EndUpdate;
        Exit;
      end;

      if CharInSet(sTmp[1], cOk) then
        Delete(sTmp, 1, 1);

      // Get the typed to add to the prompt after the Result returned by R
      sTab := Trim(LineText);
      if CharInSet(sTab[1], cOk) then
        Delete(sTab, 1, 1);
      sTab := Trim(sTab);

      // Send intruction to R
      sTmp := Trim(sTmp);
      sToSend := 'apropos(''^' + sTmp + '''' + ', ignore.case=FALSE)';
      bTab := True;
      bRterm_Sent := True;
      bRterm_Plus := False;

      DoSend(sToSend, False);

      ExecuteCommand(ecEditorBottom, #0, nil);
      EndUpdate;
      Exit;
    end;
  end;

  if not bRterm_Running and not frmTinnMain.bIPRemoteConnected then
    Exit;

  if (Shift = [ssCtrl]) then
  begin
    if not frmTinnMain.Rterm_Running then
      Exit;
    case Key of
      89:
        with synIO do // CTRL+Y
          if (CaretY = Lines.Count) then
            Key := VK_PAUSE;

      VK_RETURN:
        with synIO do
        begin // Send prior lines
          BeginUpdate;
          sTmp := Trim(LineText);
          ExecuteCommand(ecEditorBottom, #0, nil);
          LineText := sTmp;
          ExecuteCommand(ecEditorBottom, #0, nil);
          if (sTmp = '') then
            sTmp := '> ';
          if CharInSet(sTmp[1], cOk) then
            Delete(sTmp, 1, 1);
          if (sTmp <> '') then
            frmTinnMain.RHistory.Add(Trim(sTmp));
          sToSend := sTmp;
          bRterm_Sent := True;
          bRterm_Plus := False;
          DoSend(sToSend, False);
          EndUpdate;
          Exit;
        end;

      VK_MULTIPLY:
        begin // Add or replace text by tip: R server or database
          with synIO do
          begin
            iPosX := CaretX;
            SelText := frmTinnMain.sTipToWrite + ')';
            CaretX := iPosX;
          end;
          frmTinnMain.sTipToWrite := '';
        end;

      VK_ADD:
        with synIO do // Add or replace text by attribution symbol: ->
          SelText := ' -> ';

      VK_SUBTRACT:
        with synIO do // Add or replace text by attribution symbol: <-
          SelText := ' <- ';

      48:
        with synIO do // Add or replace text by attribution symbol: ()
          SelText := '()';

      57:
        with synIO do
        begin // Add or replace text by attribution symbol: (Caret)
          SelText := '()';
          CaretX := CaretX - 1;
        end;
    end;
  end;

  // All below will make restrictions and special features to the keystrokes on the last line (prompt)
  with synIO do
  begin
    if not SelAvail then
    begin
      if (CaretY = Lines.Count - 1) and (Key = VK_DOWN) then
      begin
        Key := VK_PAUSE;

        CaretY := Lines.Count;

        ExecuteCommand(ecLineEnd, #0, nil);
      end
      else if (CaretY <> Lines.Count) then
        Exit;
    end;
  end;  }
  {
    with synIO do
    if not SelAvail then
    if (LineText <> '') then
    if (LineText[1] in cOk) and
    (CaretX <= 3) then CaretX:= 3;
  }   {
  if (Key = VK_RETURN) then
  begin // Send latest line to R when editing related to Rterm
    if not frmTinnMain.Rterm_Running then
      Exit;

    with synIO do
    begin
      Key := VK_PAUSE; // Avoid a blank line below the instruction

      BeginUpdate;

      ExecuteCommand(ecLineEnd, #0, nil);

      sTmp := Trim(LineText);

      if (sTmp = '') then
        sTmp := '> ';

      if CharInSet(sTmp[1], cOk) then
        Delete(sTmp, 1, 1);
      if (sTmp <> '') and (sTmp <> '> ') then
      begin

        // It is necessary due the use of function debug: Browse[number]>
        if bRUnderDebug_Function then
        begin
          iPos := Pos(']>', sTmp);

          sEfective := Trim(Copy(sTmp, (iPos + 2), (length(sTmp) - iPos + 2)));

          if (sEfective = '') then
            sTmp := ''
          else
            sTmp := sEfective;
        end

        // It is necessary due the use of package debug: D(number)>
        else if bRUnderDebug_Package then
        begin
          iPos := Pos(')>', sTmp);

          sEfective := Trim(Copy(sTmp, (iPos + 2), (length(sTmp) - iPos + 2)));

          if (sEfective = '') then
            sTmp := ''
          else
            sTmp := sEfective;
        end

        // It is necessary due the use of package sem (John Fox)
        else if (sTmp[length(sTmp)] = ':') then
          if IsInteger(Copy(sTmp, 0, Pos(':', sTmp) - 1)) then
            sTmp := '';
      end;
      if (sTmp <> '') then
        frmTinnMain.RHistory.Add(Trim(sTmp));

      sToSend := Trim(sTmp);

      bRterm_Sent := True;

      bRterm_Plus := False;

      DoSend(sToSend, False);

      EndUpdate;
    end;
  end;

  // The below will avoid the user to type any not desired keys in the prompt: '>' or '+' signal
  if (Shift <> [ssCtrl]) and (Key <> VK_RETURN) then
    case Key of
      VK_BACK:
        begin
          with synIO do
          begin
            if not SelAvail then
            begin
              sPrior := Trim(ConsoleGetCursorTo('BeginningLine'));

              if (sPrior = '>') or (sPrior = '+') or (sPrior = sRDebugPrefix)
              then
                Key := VK_PAUSE;
            end
            else
            begin
              if (CaretY = Lines.Count) and (BlockBegin.Line <> BlockEnd.Line)
              then
                with cRTerm do
                begin
                  if (SelText = Text) then
                    synIO.Clear;

                  if IsRunning then
                    SendInput('' + #13#10);
                end;
            end;
          end;
        end;

      // Necessary to cotrol "Ctrl + A" or selection in the last line (prompt)
      VK_DELETE:
        begin
          with synIO do
          begin
            if not SelAvail then
            begin

              sPrior := Trim(ConsoleGetCursorTo('BeginningLine'));

              sAfter := Trim(ConsoleGetCursorTo('EndLine'));

              if (sPrior = '>') or (sPrior = '+') or (sPrior = sRDebugPrefix)
              then
                if (sAfter = '') then
                begin
                  Key := VK_PAUSE;

                  ExecuteCommand(ecLineEnd, #0, nil);
                end;
            end
            else
            begin
              if (CaretY = Lines.Count) and (BlockBegin.Line <> BlockEnd.Line)
              then
                with cRTerm do
                begin
                  if (SelText = Text) then
                    synIO.Clear;

                  if IsRunning then
                    SendInput('' + #13#10);
                end;
            end;
          end;
        end;

      VK_LEFT:
        with synIO do
        begin
          if not SelAvail then
          begin
            sPrior := Trim(ConsoleGetCursorTo('BeginningLine'));

            if (sPrior = '>') or (sPrior = '+') or (sPrior = sRDebugPrefix) then
              Key := VK_PAUSE;
          end;
        end;

      VK_HOME:
        with synIO do
        begin
          if (sRDebugPrefix <> '') then
            CaretX := length(sRDebugPrefix) + 2
          else
            CaretX := 3;

          Key := VK_PAUSE;
        end;
    end;  }  {
end;
 }


{
procedure TfrmRterm.synIOKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  frmTinnMain.iSynWithFocus := 3;
end;

procedure TfrmRterm.synIOMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  frmTinnMain.iSynWithFocus := 3;
end;

procedure TfrmRterm.synLogEnter(Sender: TObject);
begin
  with frmTinnMain do
    actRtermLogSetFocus.Checked := True;
end;

procedure TfrmRterm.synLogKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    1 .. 15, 18 .. 31, 33 .. 36, 38, 40 .. 44, 46 .. 67, 69 .. 105, 108,
      110 .. 300:
      begin
        with frmTinnMain.stbMain do
        begin
          Panels[7].Text := '';
          Panels[8].Text := '';
        end;
        with frmTinnMain.actRtermWarningError do
        begin
          Visible := False;
          Checked := False;
        end;
      end;
  end;

  if (Shift = [ssCtrl]) then
    case Key of
      VK_TAB:
        begin
          if not frmTinnMain.actRtermVisible.Checked then
            Exit;
          if not Assigned(sciLog2) then
            pgRterm.ActivePageIndex := 0;
          synIO.SetFocus;
        end;
    end;

  if not bRterm_Running then
    Exit;
end;

procedure TfrmRterm.synLogKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  frmTinnMain.iSynWithFocus := 4;
end;

procedure TfrmRterm.synLogMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  frmTinnMain.iSynWithFocus := 4;
end;
}



 {

procedure TfrmRterm.cRTermReceiveOutput(Sender: TObject; const Cmd: string);

  procedure FindErrorInTheEditor(sTmp: string);
  var
    i: Integer;

  begin
    with frmTinnMain do
      if (pgFiles.PageCount > 0) then
      begin
        i := FindTopWindow;
        with (MDIChildren[i] as TfrmEditor) do
          SearchError(sTmp)
      end;
  end;

// Will get the object among '' or "": 'object' or "object" --> object
  procedure FindError(sTmp: string);
  var
    iPos: Integer;

  begin
    iPos := Pos('''', sTmp);

    if (iPos <> 0) then
    begin
      Delete(sTmp, 1, iPos);
      iPos := Pos('''', sTmp);
      Delete(sTmp, iPos, length(sTmp));
      FindErrorInTheEditor(sTmp);
      Exit;
    end;

    iPos := Pos('"', sTmp);
    if (iPos <> 0) then
    begin
      Delete(sTmp, 1, iPos);
      iPos := Pos('"', sTmp);
      Delete(sTmp, iPos, length(sTmp));
      FindErrorInTheEditor(sTmp);
    end;
  end;

// I hope the Core Team do not change the pathern of the error messages... :-)
  procedure GetError;
  var
    i, iCount, iPos: Integer;
    sTmp: string;

  begin
    // ShowMessage(slError.Text);
    iCount := slError.Count;
    case iCount of
      1:
        begin
          sTmp := slError.Strings[0];
          FindError(sTmp);
        end;
      2:
        begin
          sTmp := slError.Strings[1];
          FindError(sTmp);
        end
    else
      begin
        for i := (iCount - 1) downto 0 do
        begin
          if (Trim(slError.Strings[i]) = '^') then
          begin
            sTmp := slError.Strings[i - 1];
            // The prior strings (line) has the error!
            iPos := Pos(':', sTmp);
            if (iPos <> 0) then
            begin
              Delete(sTmp, 1, iPos);
              sTmp := Trim(sTmp);
              FindErrorInTheEditor(sTmp);
              Break;
            end;
          end
          else
          begin
            sTmp := slError.Strings[i];
            // The current strings (line) has the error!
            FindError(sTmp);
          end;
        end;
      end;
    end;
  end;

  procedure CheckIfUnderDebug_Function;
  var
    iPosDbg1, iPosDbg2: Integer;

  begin
    // It is necessary due the use of package debug: Browser[number]>
    iPosDbg1 := Pos('Browse[', Cmd);
    iPosDbg2 := Pos(']>', Cmd);
    if (iPosDbg1 <> 0) and (iPosDbg2 <> 0) then
    begin
      bRUnderDebug_Function := True;
      sRDebugPrefix := Trim(Copy(Cmd, iPosDbg1, iPosDbg2 - iPosDbg1 + 2));
    end
    else
      bRUnderDebug_Function := False;
  end;

  procedure CheckIfUnderDebug_Package;
  var
    iPosDbg1, iPosDbg2: Integer;

  begin
    // It is necessary due the use of package debug: D(number)>
    iPosDbg1 := Pos('D(', Cmd);
    iPosDbg2 := Pos(')>', Cmd);
    if (iPosDbg1 <> 0) and (iPosDbg2 <> 0) then
    begin
      bRUnderDebug_Package := True;
      sRDebugPrefix := Trim(Copy(Cmd, iPosDbg1, iPosDbg2 - iPosDbg1 + 2));
    end
    else
    begin
      bRUnderDebug_Package := False;
      if not bRUnderDebug_Function then
        sRDebugPrefix := '';
    end;
  end;

// It is very nice!
  procedure AddROutput;
  var
    slTmp: TStringList;

  begin
    try
      slTmp := TStringList.Create;

      slTmp.Text := StringReplace(Cmd, #13#10, #13#10, [rfReplaceAll]);

      with synIO do
        if bRUnderDebug_Function or bRUnderDebug_Package then
        begin
          Lines.Add('');
          Lines.AddStrings(slTmp);
        end
        else
          Lines.AddStrings(slTmp);
    finally
      FreeAndNil(slTmp);
    end;
  end;

var
  i: Integer;
  slTmp: TStringList;

begin
  cRTermReceiveOutputSCI(Sender, Cmd); exit;

  if (Cmd = '') and bTab then
    Exit;

  if Assigned(slError) then
  begin
    GetError;
    FreeAndNil(slError);
  end;

  pgRterm.ActivePage := tbsIO;
  CheckIfUnderDebug_Function;
  CheckIfUnderDebug_Package;

  with synIO do
  begin
    BeginUpdate;
    if (Cmd = '+ ') then
      bRterm_Plus := True; // To control sending line by line

    if bRterm_Sent then
    begin
      if (Cmd = '> ') then
        Lines.Add(Cmd)
      else
        AddROutput;

      bRterm_Sent := False;

      if bTab then
      begin
        try
          slTmp := TStringList.Create;

          StrSplit(' ', Cmd, slTmp);

          if (slTmp.Count = 2) then
          begin
            if (sTabPrefix <> '') then
              sTab := sTabPrefix + slTmp[1]
            else
              sTab := slTmp[1];
          end;
        finally
          FreeAndNil(slTmp);
        end;
      end;
    end
    else
    begin
      if (Cmd = '> ') and (LineText <> '') then
        Lines.Add('');

      if (Cmd = '> ') and (sTab <> '') and bTab then
      begin
        Lines.Add(Cmd + sTab);

        sTab := '';

        bTab := False;
      end
      else
        AddROutput;
    end;

    ExecuteCommand(ecEditorBottom, #0, nil);

    if not WordWrap then
      for i := 0 to 1 do
        ExecuteCommand(ecScrollLeft, #0, nil);
    EndUpdate;
  end;

  with frmTinnMain do
    if (pgFiles.PageCount > 0) then
      SetFocus_Main
    else
      synIO.SetFocus;

end;
}
  {
    procedure synIOEnter(Sender: TObject);
    procedure synIOKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synIOKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synIOMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure synLogEnter(Sender: TObject);
    procedure synLogKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synLogKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure synLogMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
}
