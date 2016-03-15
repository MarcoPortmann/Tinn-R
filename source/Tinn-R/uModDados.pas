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

unit uModDados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Web.HTTPApp,
  DBClient, DB, MidasLib, FMTBcd, SqlExpr, WideStrings, System.Actions, System.UITypes,
  Data.DbxSqlite, Datasnap.Provider, trCommon, ufrmEditor, ConsoleIO;
// Adding System.Actions solves "assuspended/asnormal undefined" issue





type
  TmodDados = class(TDataModule)
    cdComments: TClientDataSet;
    cdCommentsBegin: TStringField;
    cdCommentsEnd: TStringField;
    cdCommentsLanguage: TStringField;
    cdCommentsLine: TStringField;
    cdRmirrors: TClientDataSet;
    cdRmirrorsCity: TStringField;
    cdRmirrorsCode: TStringField;
    cdRmirrorsCountry: TStringField;
    cdRmirrorsHost: TStringField;
    cdRmirrorsName: TStringField;
    cdRmirrorsURL: TStringField;
    dsComments: TDataSource;
    dsRmirrors: TDataSource;
    dsEditors: TDataSource;
    SQLConnection: TSQLConnection;
    sqldsRObjects: TSQLDataSet;
    dspRObjects: TDataSetProvider;
    cdRObjects: TClientDataSet;
    dsRObjects: TDataSource;
    sqldsRTest: TSQLDataSet;
    dspRTest: TDataSetProvider;
    cdRTest: TClientDataSet;
    sqlLexerConnection: TSQLConnection;
    sqldsLexers: TSQLDataSet;
    dspLexers: TDataSetProvider;
    cdLexers: TClientDataSet;
    dsLexers: TDataSource;
    dspIdentifiers: TDataSetProvider;
    sqldsIdentifiers: TSQLDataSet;
    cdIdentifiers: TClientDataSet;
    dsIdentifiers: TDataSource;
    sqldsLexers2: TSQLDataSet;
    dspLexers2: TDataSetProvider;
    cdLexers2: TClientDataSet;
    dsLexers2: TDataSource;
    sqlIdentifiersCurrent: TSQLDataSet;
    dspIdentifiersCurrent: TDataSetProvider;
    cdIdentifiersCurrent: TClientDataSet;
    dsIdentifiersCurrent: TDataSource;
    sqldsRUser: TSQLDataSet;
    dspRUser: TDataSetProvider;
    cdRUser: TClientDataSet;
    sqlCache: TSQLConnection;
    sqldsCache: TSQLDataSet;
    sqlMainBase: TSQLConnection;
    sqldsMainBase: TSQLDataSet;
    dspMainBase: TDataSetProvider;
    sqldsMainBaseTools: TSQLDataSet;
    cdMainBase: TClientDataSet;
    dsMainBase: TDataSource;
    sqlBaseKeywords: TSQLDataSet;
    sqldsCategories: TSQLDataSet;
    sqldsCategoriesDetails: TSQLDataSet;
    sqldsMainCheck: TSQLDataSet;
    sqldsExplorerTip: TSQLDataSet;
    sqlEditors: TSQLConnection;
    sqlDSEditors: TSQLDataSet;
    sqlShortcuts: TSQLConnection;
    sqldsShortcuts: TSQLDataSet;
    dspShortcuts: TDataSetProvider;
    dsShortcuts: TDataSource;
    cdShortcuts: TClientDataSet;
    sqldsLibraryTip: TSQLDataSet;
    cConsole: TConsoleIO;

    procedure cdCommentsAfterPost(DataSet: TDataSet);
    procedure cdCommentsAfterScroll(DataSet: TDataSet);
    procedure cdCommentsBeforeEdit(DataSet: TDataSet);
    procedure cdCommentsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdRcardPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdRmirrorsAfterPost(DataSet: TDataSet);
    procedure cdRmirrorsAfterScroll(DataSet: TDataSet);
    procedure cdRmirrorsBeforeEdit(DataSet: TDataSet);
    procedure cdRmirrorsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdRtipPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure cdShortcutsAfterScroll(DataSet: TDataSet);
    procedure cdShortcutsPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure DataModuleDestroy(Sender: TObject);
    procedure InitiateRObjectDatabase;
    procedure ResetRObjectDatabase;
    procedure sqldsRObjectsAfterRefresh(DataSet: TDataSet);

    procedure LoadRHelpSystem;
    procedure LoadShortcuts;
    procedure LoadMirrors;
    procedure LoadCache;
    procedure LoadComments;
    procedure LoadEditors;
    procedure dsLexersDataChange(Sender: TObject; Field: TField);
    procedure dsIdentifiersDataChange(Sender: TObject; Field: TField);
    procedure cdIdentifiersBeforeRefresh(DataSet: TDataSet);
    procedure dsMainBaseDataChange(Sender: TObject; Field: TField);
    procedure cConsoleReceiveOutput(Sender: TObject; const Cmd: string);
    procedure cConsoleProcessStatusChange(Sender: TObject; IsRunning: Boolean);
    procedure cConsoleReceiveError(Sender: TObject; const Cmd: string);
    procedure cConsoleError(Sender: TObject; const Cmd: string);
  private
    bUpdateAgainLater: Boolean;
    sCurDescription: String;
    sCurDwellTextExplorer: String;
    sCurDwellTextLibrary: String;
    { Private declarations }

  public
    { Public declarations }

    slRcard_Groups: TStringList; // Stores groups of R card
    slRmirrors_Countries: TStringList; // Stores countries of R mirrors
    slShortcuts_Groups: TStringList; // Stores groups of Shortcuts

    function ActionlistToDataset: Boolean;
    procedure BackupFiles;
    procedure CreateShortcutsCategoriesList;
    procedure CheckPackages;
    function LoadFileState(var EditorFile: TEditorFile): Boolean;
    function Rmirrors_Update(sFile: string): Boolean;
    function SaveFileState(EditorFile: TEditorFile): Boolean;
    function  SaveEditorFile(EditorFile: TEditorFile): Boolean;
    procedure CompletionGroupsFilter(Sender: TObject);
    procedure LookupWord(sKey: String; cdDataBase: TClientDataSet);
    procedure RmirrorsCountriesFilter(Sender: TObject);
    procedure SetCurrentHighlighter(sLanguage: string);
    procedure ShortcutsGroupsFilter(Sender: TObject);
    procedure ShortcutsValidation(sOldShortcutsFile, sNewShortcutsFile: string);
    procedure DeleteEditorEntry(EditorId: integer; sBackupFile: String);
    procedure LoadLexerDB;
    function  GetLexerNameById(iLexerId: Integer): String;
    function  GetLexerIdByName(sLexerName: String): Integer;
    procedure CheckForNewPackages;
    function  GetFileTypeIndexOfLexer(iLexerId: Integer): Integer;
    function  FindLibraryTipText(sWord: String; HasArguments: Boolean = False): String;
    function  FindRObjectTipText(sWord: String): String;
   end;
   
var
  modDados: TmodDados;
implementation

uses
  ufrmMain,
  ufrmRcard,
  ufrmTools,
  ufrmShortcuts,
  Variants,
  Menus,
  ActnList,
  ufrmHotKeys,
  ufrmComments,
  ufrmColors,
  trUtils,
  ufrmRmirrors, uLexerCommands;

{$R *.DFM}

procedure TmodDados.SetCurrentHighlighter(sLanguage: string);
var
  bFound: Boolean;
begin
  with modDados.cdComments do
  begin
    DisableControls;

    Locate('Language', sLanguage, []);

    EnableControls;
  end;
end;


function TmodDados.SaveFileState(EditorFile: TEditorFile): Boolean;
  var stmp: String;
begin
  try
   with sqlCache, EditorFile do
   begin


     ExecuteDirect('DELETE FROM FileCache WHERE File like '+AnsiQuotedStr(ansilowercase(sFile),'"'));

     stmp := 'INSERT INTO FileCache (File, Marks, Topline, CaretPosition, Folding, LexerId) Values(';
     stmp := stmp + AnsiQuotedStr(ansilowercase(sFile),'"')+ ', '+  AnsiQuotedStr(sMarks,'"') + ', ' + inttostr(iTopLine)+ ', '  +
             inttostr(iCaretPosition)+ ', ' + AnsiQuotedStr(sFolding,'"')+ ', '     +
             inttostr(iLexerId)+' )'; // WHERE File like '+quotedstr(ansilowercase(sFile));


     ExecuteDirect(stmp);
   end;
   Finally
   end;
end;


function TmodDados.LoadFileState(var EditorFile: TEditorFile): Boolean;
begin

  try
   with sqldsCache do
   begin
     Close;
     CommandText := 'SELECT * FROM FileCache WHERE File like '+AnsiQuotedStr(ansilowercase(EditorFile.sFile), '"');
     Open;
     First;

     if NOT Eof then
     with EditorFile do
     begin
      sMarks := FieldByName('Marks').AsString;
      iTopLine := FieldByName('TopLine').AsInteger;
      iCaretPosition := FieldByName('CaretPosition').AsInteger;
      sFolding := FieldByName('Folding').AsString;
      iLexerId := FieldByName('LexerId').AsInteger;
      Result := true;
      iUnsavedChanges := 0;
      iModified := 0;
      iNewFile := 0;
      iTabPosition := -1;
     end;
   end;
  Except //On E: EDatabaseError Do showmessage(e.Message);
  end;
end;


function TmodDados.SaveEditorFile(EditorFile: TEditorFile): Boolean;
  var stmp: String;
begin
  try
   with sqlEditors, EditorFile do
   begin

       ExecuteDirect('DELETE FROM Editors WHERE EditorId = '+inttostr(iId));


       stmp := 'INSERT INTO Editors (File, NewFile, Modified, UnsavedChanges, TempFile, TabPosition, EditorId, Marks, Topline, CaretPosition, Folding, LexerId) Values(';
       stmp := stmp + AnsiQuotedStr(ansilowercase(sFile),'"')+ ', ' + inttostr(iNewFile)+ ', '  + inttostr(iModified)+ ', ' + inttostr(iUnsavedChanges)+ ', ';
       stmp := stmp + AnsiQuotedStr(sTempFile,'"') + ', ' + inttostr(iTabPosition)+ ', '  + inttostr(iId)+ ', ';
       stmp := stmp + AnsiQuotedStr(sMarks,'"') + ', ' + inttostr(iTopLine)+ ', '  +
               inttostr(iCaretPosition)+ ', '  + AnsiQuotedStr(sFolding,'"')+ ', '     +
               inttostr(iLexerId)+' )'; // WHERE File like '+quotedstr(ansilowercase(sFile));

     ExecuteDirect(stmp);
   end;
   Finally
   end;
end;



procedure TmodDados.ShortcutsValidation(sOldShortcutsFile,
  sNewShortcutsFile: string);
var
  cdOld, cdNew: TClientDataSet;

  sGroupOld, sCaptionOld, sHintOld: string;

begin
  try
    cdOld := TClientDataSet.Create(Self);
    cdNew := TClientDataSet.Create(Self);

    with cdOld do
    begin
      Active := False;
      FileName := sOldShortcutsFile;
      Active := True;
      IndexDefs.Clear;
      with IndexDefs.AddIndexDef do
      begin
        Name := 'ShortcutsDefaultIndex';
        Fields := 'Index';
        Options := [ixPrimary, ixUnique];
      end;
      IndexName := 'ShortcutsDefaultIndex';
    end;

    with cdNew do
    begin
      DisableControls;
      Active := False;
      FileName := sNewShortcutsFile;
      Active := True;
      IndexDefs.Clear;
      with IndexDefs.AddIndexDef do
      begin
        Name := 'ShortcutsDefaultIndex';
        Fields := 'Index';
        Options := [ixPrimary, ixUnique];
      end;
      IndexName := 'ShortcutsDefaultIndex';
    end;

    cdOld.First;
    while not cdOld.Eof do
    begin
      sGroupOld := cdOld.FieldByName('Group').Value;
      sCaptionOld := cdOld.FieldByName('Caption').Value;
      sHintOld := cdOld.FieldByName('Hint').Value;
      if cdNew.Locate('Group;Caption;Hint',
        VarArrayOf([sGroupOld, sCaptionOld, sHintOld]), []) then
      begin
        if (cdNew.FieldByName('Shortcut').Value <> cdOld.FieldByName('Shortcut')
          .Value) then
        begin
          cdNew.Edit;
          cdNew.FieldByName('Shortcut').Value :=
            cdOld.FieldByName('Shortcut').Value;
          cdNew.Post;
        end;
      end;
      cdOld.Next;
    end;
    with cdNew do
    begin
      MergeChangeLog;
      SaveToFile();
    end;
  finally
    FreeAndNil(cdOld);
    FreeAndNil(cdNew);
  end;
end;

procedure TmodDados.sqldsRObjectsAfterRefresh(DataSet: TDataSet);
begin
   cdRObjects.Active := true;
   cdRObjects.Refresh;
end;



procedure TmodDados.CompletionGroupsFilter(Sender: TObject);

begin

end;

procedure TmodDados.RmirrorsCountriesFilter(Sender: TObject);
var
  i: integer;

  strTemp: string;

begin
  slRmirrors_Countries := TStringList.Create;
  // slRmirrors_Countries.CaseSensitive:= True;

  with cdRmirrors do
  begin
    DisableControls;
    First;
    for i := 1 to RecordCount do
    begin
      strTemp := cdRmirrorsCountry.Value;
      with slRmirrors_Countries do
        if (IndexOf(strTemp) = -1) then
          Add(strTemp);
      Next;
    end;
    EnableControls;
  end;
end;


procedure TmodDados.CreateShortcutsCategoriesList;
var
  i: integer;
  strTemp: string;

begin
  slShortcuts_Groups := TStringList.Create;
  slShortcuts_Groups.CaseSensitive := True;

  with sqldsShortcuts do
  begin
    First;
    slShortcuts_Groups.Clear;
    while not eof do
    begin
      strTemp := trim(FieldByName('Category').asString);
      if strTemp <>'' then
      with slShortcuts_Groups do
        if (IndexOf(strTemp) = -1) then
          Add(strTemp);
      Next;
    end;
  end;
end;



procedure TmodDados.ShortcutsGroupsFilter(Sender: TObject);
var
  i: integer;
  strTemp: string;

begin
{  slShortcuts_Groups := TStringList.Create;
  slShortcuts_Groups.CaseSensitive := True;

  with cdShortcuts do
  begin
    DisableControls;
    First;
    for i := 1 to RecordCount do
    begin
      strTemp := cdShortcutsGroup.Value;
      with slShortcuts_Groups do
        if (IndexOf(strTemp) = -1) then
          Add(strTemp);
      Next;
    end;
    EnableControls;
  end; }
end;

procedure TmodDados.InitiateRObjectDatabase;
var sCommand: String;
begin
  frmTinnMain.bRExplorerActive := true;
  SQLConnection.LibraryName := IncludeTrailingBackslash(frmTinnMain.sPathTinnRExe)+'sqlite3.dll';

  if fileexists(IncludeTrailingBackslash(frmTinnMain.sPathTmp)+'RExplorer.txt') then
    deletefile(IncludeTrailingBackslash(frmTinnMain.sPathTmp)+'RExplorer.txt');

  with SQLConnection do
  begin
    Params.Values['Database']:=IncludeTrailingBackslash(frmTinnMain.sPathTmp)+'RExplorer.txt';
    Params.Values['FailIfMissing'] := 'False';
    Connected := True;

    ExecuteDirect('CREATE TABLE Objects (ObjID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, Name VARCHAR(100) NOT NULL, Dim VARCHAR(100) NOT NULL, [Group] VARCHAR(100) NOT NULL, Class VARCHAR(100) NOT NULL, Envir VARCHAR(100) NOT NULL)');
    ExecuteDirect('INSERT INTO Objects (Name, Dim, [Group], Class, Envir) VALUES ("empty","empty","empty","empty","empty")');
  end;

  sqldsRObjects.Active := true;
  sqldsRObjects.Refresh;
  SQLConnection.Close;
  cdRObjects.Refresh;

  if assigned(frmTools) then
    frmTools.ResetRExplorerFilter;
end;


procedure TmodDados.ResetRObjectDatabase;
var sCommand: String;
begin
  with SQLConnection do
  begin

    Close;
    if fileexists(IncludeTrailingBackslash(frmTinnMain.sPathTmp)+'RExplorer.txt') then
      {if not} DeleteFile(IncludeTrailingBackslash(frmTinnMain.sPathTmp)+'RExplorer.txt');// then
      //MessageDlg('Tinn-R was unable to delete data from a previous session because ''RExplorer.txt'' is used by another application', mtWarning, [mbOK], 0);

    Params.Values['Database']:=IncludeTrailingBackslash(frmTinnMain.sPathTmp)+'RExplorer.txt';
    Params.Values['FailIfMissing'] := 'False';
    Connected := True;
    try

      ExecuteDirect('CREATE TABLE Objects (ObjID INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, Name VARCHAR(100) NOT NULL, Dim VARCHAR(100) NOT NULL, [Group] VARCHAR(100) NOT NULL, Class VARCHAR(100) NOT NULL, Envir VARCHAR(100) NOT NULL)');
      ExecuteDirect('INSERT INTO Objects (Name, Dim, [Group], Class, Envir) VALUES ("empty","empty","empty","empty","empty")');
    except
      try
        ExecuteDirect('DELETE FROM Objects');
      finally
      end;
  end;

  end;

  sqldsRObjects.Active := true;
  sqldsRObjects.Refresh;
  SQLConnection.Close;
  cdRObjects.Refresh;

  if assigned(frmTools) then
    frmTools.ResetRExplorerFilter;

end;


procedure TmodDados.DataModuleDestroy(Sender: TObject);
begin
  cdRmirrors.Close;
  cdShortcuts.Close;

  sqlCache.Close;
  cdComments.Close;
  cConsole.StopProcess;
end;

procedure TmodDados.cdRcardPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[0].Value + '  |  ' + DataSet.Fields.Fields[1]
    .Value + #13 + #13 + 'Key violation.' + #13 +
    'Latest insertion (or change) will be lost!', mtError, [MBOK], 0);

  DataSet.Cancel;
  Action := daAbort;
end;

procedure TmodDados.cdRmirrorsAfterPost(DataSet: TDataSet);
begin
  if Assigned(frmRmirrors) then
    with frmRmirrors do
    begin
      stbRmirrors.Panels[0].Text := 'Browse mode';
      frmRmirrors.bbtRmirrorsClose.Enabled := True;
    end;
end;

procedure TmodDados.cdRmirrorsAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmRmirrors) then
    with frmRmirrors.stbRmirrors do
      if Visible then
        Panels[0].Text := 'Browse mode';
end;

procedure TmodDados.cdRmirrorsBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmRmirrors) then
    with frmRmirrors.stbRmirrors do
      Panels[0].Text := 'Edit mode';
end;

procedure TmodDados.cdRmirrorsPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[3].Value + #13 + #13 + 'Key violation.' + #13
    + 'Latest insertion (or change) will be lost!', mtError, [MBOK], 0);

  DataSet.Cancel;
  Action := daAbort;
end;

procedure TmodDados.cdRtipPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[0].Value + '  |  ' + DataSet.Fields.Fields[1]
    .Value + #13 + #13 + 'Key violation.' + #13 +
    'Latest insertion (or change) will be lost!', mtError, [MBOK], 0);

  DataSet.Cancel;
  Action := daAbort;
end;

procedure TmodDados.cdShortcutsPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[4].Value + #13 + #13 + 'Key violation.' + #13
    + 'Latest insertion (or change) will be lost!', mtError, [MBOK], 0);

  DataSet.Cancel;
  Action := daAbort;
end;

procedure TmodDados.cdIdentifiersBeforeRefresh(DataSet: TDataSet);
begin
  if DataSet = nil then
    Exit;

  if TClientDataSet(DataSet).Active = False then
    Exit;
  if TClientDataSet(DataSet).ChangeCount > 0 then
  begin
    sqlLexerconnection.CloseDataSets;
    Dataset.Open;
    Dataset.Active := true;
   // TClientDataSet(DataSet).Edit;
    {showmessage(inttostr(}TClientDataSet(DataSet).ApplyUpdates(-1){))};
   //  TClientDataSet(DataSet).Post;
  end;
end;

procedure TmodDados.cdShortcutsAfterScroll(DataSet: TDataSet);
begin

  if Assigned(frmShortcuts) then
    with frmShortcuts, Dataset do
    begin
//      if bLocating then
//        Exit;


      if not Dataset.Eof then
      begin
        gbEdit.enabled := true;
        gbEdit.Caption := 'Edit shortcut of '''+ FieldByName('Caption').AsString+'''';
        jvhkShortcut.HotKey := TextToShortcut(FieldByName('Shortcut').Value);
        lWarning.Caption := '';
        bUpdate.Enabled := true;
      end else
      begin
        jvhkShortcut.HotKey := TextToShortcut('');
        gbEdit.enabled := false;
        gbEdit.Caption := 'Edit shortcut';
        lWarning.Caption := '';
        bUpdate.Enabled := true;
      end;

    end;
 { if Assigned(frmHotkeys) then
    with frmHotkeys do
      if bLocating then

        Exit;
  if (cdShortcuts.State <> dsBrowse) then
    Exit;
               }
end;

procedure TmodDados.cConsoleError(Sender: TObject; const Cmd: string);
begin
//
end;

procedure TmodDados.cConsoleProcessStatusChange(Sender: TObject;
  IsRunning: Boolean);
var
  sSend, fname: String;
begin
  if not IsRunning then
    Exit;

  fname := IncludeTrailingPathDelimiter(frmTinnMain.sUtilsOrigin)+'TinnRCommunication-Lib.r';
  sSend := 'source("'+DosPathToUnixPath(fname)+'", echo=F, max.deparse.length=150)';
  if not FileExists(fname) then
  begin
    showmessage('File '''+fname+''' not found.');
    exit;
  end;

  sSend := 'LibraryPath <- file.path(Sys.getenv(''APPDATA''), ''Tinn-R'', ''data'', ''RHelpSystem.txt'' , fsep=''\\''); source("'+DosPathToUnixPath(fname)+'", echo=F, max.deparse.length=150)';
  cConsole.SendInput(sSend+#13#10);
end;

procedure TmodDados.cConsoleReceiveError(Sender: TObject; const Cmd: string);
begin
  frmTinnMain.memPackage.Lines.Add('------------ Error ------------');
 frmTinnMain.memPackage.Lines.Add(Cmd);
  frmTinnMain.memPackage.Lines.Add('------------ ----- ------------');

{  if ansipos('TinnRMSG:', cmd)>0 then
  begin
    if ansipos(':ConnectSockets', cmd) >0 then
     ConnectRSocketServer;
    if ansipos(':MissingPackage', cmd) >0 then
      InstallTinnRPackages(copy(cmd, ansipos('|', cmd)+1,  ansipos('<', cmd) - ansipos('|', cmd)-1 ));
    if ansipos(':PackagesInstalled', cmd) >0 then
      LoadTinnRCommunicationScripts;
    exit;
  end;
}
end;

procedure TmodDados.cConsoleReceiveOutput(Sender: TObject; const Cmd: string);
var smsg: String;
begin
  if ansipos('!!TinnRMSG:Adding package:', Cmd)>0 then
  begin
    smsg := copy(Cmd, ansipos('!!TinnRMSG:Adding package:', Cmd)+26);
    smsg := copy(smsg, 1, ansipos('<', smsg)-1);

    frmTinnMain.ShowNotification('Package '''+smsg+''' is being imported.',  'Package '''+smsg+''' is being imported into the library. This might takes a while.');
  end;

  if ansipos('!!TinnRMSG:Library updated<', Cmd)>0 then
  begin
    frmTinnMain.AfterLibraryUpdate;
    if bUpdateAgainLater then
      CheckPackages;
  end;
  frmTinnMain.memPackage.Lines.Add(Cmd);
end;

procedure TmodDados.cdCommentsAfterPost(DataSet: TDataSet);
begin
  if Assigned(frmComments) then
    with frmComments do
    begin
      stbComments.Panels[0].Text := 'Browse mode';
      frmComments.bbtCommentsClose.Enabled := True;
    end;
end;

procedure TmodDados.cdCommentsAfterScroll(DataSet: TDataSet);
begin
  if Assigned(frmComments) then
    with frmComments.stbComments do
      if Visible then
        Panels[0].Text := 'Browse mode';
end;

procedure TmodDados.cdCommentsBeforeEdit(DataSet: TDataSet);
begin
  if Assigned(frmComments) then
    with frmComments.stbComments do
      Panels[0].Text := 'Edit mode';
end;

procedure TmodDados.cdCommentsPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  MessageDlg(DataSet.Fields.Fields[1].Value + #13 + #13 + 'Key violation.' + #13
    + 'Latest insertion (or change) will be lost!', mtError, [MBOK], 0);

  DataSet.Cancel;
  Action := daAbort;
end;

function TmodDados.ActionlistToDataset: Boolean;

  procedure ClientDatasetStructure(cdTmp: TClientDataSet);
  begin
    with cdTmp do
    begin
      with FieldDefs.AddFieldDef do
      begin
        DataType := ftInteger;
        Name := 'Index';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 50;
        Name := 'Group';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 50;
        Name := 'Caption';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 80;
        Name := 'Hint';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 50;
        Name := 'Shortcut';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftInteger;
        Name := 'Image';
      end;

      with IndexDefs.AddIndexDef do
      begin
        Name := 'ShortcutsDefaultIndex';
        Fields := 'Index';
        Options := [ixPrimary, ixUnique];
      end;

      FileName := frmTinnMain.sPathData + '\Shortcuts.xml';
      CreateDataSet;
    end;
  end;

var
  i, iImage: integer;

  sShortcut, sGroup, sCaption, sHint: string;

  aTmp: TAction;
  cdTmp: TClientDataSet;

  procedure Update_Dataset(i: integer; sGroup, sCaption, sHint,
    sShortcut: string; iImage: integer);
  begin
    with cdTmp do
    begin
      Append;
      Fields[0].AsInteger := i;
      Fields[1].AsString := sGroup;
      Fields[2].AsString := sCaption;
      Fields[3].AsString := sHint;
      Fields[4].AsString := sShortcut;
      Fields[5].AsInteger := iImage;
      Post;
    end;
  end;

begin
  frmTinnMain.alMain.State := asSuspended;

  try
    try
      cdTmp := TClientDataSet.Create(Self);
      ClientDatasetStructure(cdTmp);

      for i := 0 to frmTinnMain.alMain.ActionCount - 1 do
      begin
        aTmp := TAction(frmTinnMain.alMain.Actions[i]);
        sGroup := aTmp.Category;
        with aTmp do
        begin
          sCaption := Caption;
          sHint := Hint;
          sShortcut := ShortCutToText(Shortcut);
          iImage := ImageIndex;
          if (sShortcut = '') then
            sShortcut := 'None';
        end;
        Update_Dataset(i, sGroup, sCaption, sHint, sShortcut, iImage);
      end;
      frmTinnMain.alMain.State := asNormal;

      with cdTmp do
      begin
        MergeChangeLog;
        SaveToFile();
      end;
    except
      // TODO
    end;
  finally
    Result := True;
    FreeAndNil(cdTmp);
  end;
end;

function TmodDados.Rmirrors_Update(sFile: string): Boolean;

  procedure ClientDatasetStructure(cdTmp: TClientDataSet);
  begin
    with cdTmp do
    begin
      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 30;
        Name := 'Name';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 20;
        Name := 'Country';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 20;
        Name := 'City';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 60;
        Name := 'URL';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 80;
        Name := 'Host';
      end;

      with FieldDefs.AddFieldDef do
      begin
        DataType := ftString;
        Size := 2;
        Name := 'Code';
      end;

      with IndexDefs.AddIndexDef do
      begin
        Name := 'RtipDefaultIndex';
        Fields := 'Country;Name;URL';
        Options := [ixPrimary, ixUnique];
      end;

      FileName := frmTinnMain.sPathData + '\Rmirrors.xml';

      CreateDataSet;
    end;
  end;

var
  i: integer;

  cdTmp: TClientDataSet;
  slTmp1: TStringList;
  slTmp2: TStringList;

begin
  try
    try
      cdTmp := TClientDataSet.Create(Self);
      ClientDatasetStructure(cdTmp);

      slTmp1 := TStringList.Create;
      slTmp2 := TStringList.Create;
      slTmp1.LoadFromFile(sFile);

      StrSplit('|', slTmp1.Text, slTmp2);

      cdRmirrors.Active := False;

      i := 0;
      repeat
        { // To debug only
          ShowMessage(slTmp2.Strings[i]   + #13 +
          slTmp2.Strings[i+1] + #13 +
          slTmp2.Strings[i+2] + #13 +
          slTmp2.Strings[i+3] + #13 +
          slTmp2.Strings[i+4] + #13 +
          slTmp2.Strings[i+5]
          );
        }
        with cdTmp do
        begin
          Append;
          Fields[0].AsString := slTmp2.Strings[i];
          Fields[1].AsString := slTmp2.Strings[i + 1];
          Fields[2].AsString := slTmp2.Strings[i + 2];
          Fields[3].AsString := slTmp2.Strings[i + 3];
          Fields[4].AsString := slTmp2.Strings[i + 4];
          Fields[5].AsString := slTmp2.Strings[i + 5];
          Post;
        end;

        i := i + 6;
      until (i = 6 * slTmp1.Count);
      // slTmp1.Count = Total of mirrors (lines of the file sFile = Rmirrors.txt)

      with cdTmp do
      begin
        MergeChangeLog;
        SaveToFile();
      end;

      Result := True;
    except
      Result := False;
    end;
  finally
    cdRmirrors.Active := True;
    FreeAndNil(cdTmp);
    FreeAndNil(slTmp1);
    FreeAndNil(slTmp2);
  end;
end;
{
procedure TmodDados.SetFieldByEditorId(EditorId: integer; FieldName: String;
  Value: Variant);
begin
  with modDados.cdEditors do
  begin
    if Locate('EditorId', EditorId, [loCaseInsensitive]) then
    begin
      Edit;
      FieldValues[FieldName] := Value;
      Post;
    end;
  end;
end;

function TmodDados.GetFieldByEditorId(EditorId: integer;
  FieldName: String): Variant;
begin
  with modDados.cdEditors do
  begin
    if Locate('EditorId', EditorId, [loCaseInsensitive]) then
      Result := modDados.cdEditors.FieldByName(FieldName).asVariant;
  end;
end;
 }


        {
procedure TmodDados.ReRecordTabOrder;
var
  i: integer;
begin
  with modDados.cdEditors do
  begin
    if frmTinnMain.pgFiles.PageCount > 0 then
      for i := 0 to frmTinnMain.pgFiles.PageCount - 1 do
      begin
        if Locate('EditorId', frmTinnMain.pgFiles.Pages[i].Tag, []) then
        begin
          Edit;
          FieldValues['TabPosition'] := i + 1;
          Post;
        end;
      end;
  end;
end;   }


procedure TmodDados.DeleteEditorEntry(EditorId: integer; sBackupFile: String);
var
  sTmpFile: String;
  EditorFile: TEditorFile;
begin
  sqlEditors.ExecuteDirect('DELETE FROM Editors WHERE EditorId = '+inttostr(EditorId));
  if FileExists(sBackupFile) then
    DeleteFile(sBackupFile);
end;

procedure TmodDados.dsIdentifiersDataChange(Sender: TObject; Field: TField);
begin
  if not assigned(frmColors) then
    Exit;
  frmColors.SelectIdentifier;
end;

procedure TmodDados.dsLexersDataChange(Sender: TObject; Field: TField);
begin

  if not assigned(frmColors) then
    Exit;
  if cdLexers.Fields = nil then
    Exit;
  cdIdentifiers.Refresh;
  cdIdentifiers.Filter := 'LexerId =' + cdLexers.FieldByName('LexerId').AsString;
  cdIdentifiers.Filtered := true;
  frmColors.AdjustColumnWidths(frmColors.dbgIdentifiers);
  ApplyLexer(ModDados.cdLexers.FieldByName('LexerId').AsInteger, frmColors.sciPreview);
end;

procedure TmodDados.dsMainBaseDataChange(Sender: TObject; Field: TField);
var sTmpDescription: String;
begin
  if Assigned(frmTools) then
  begin
    sTmpDescription := cdMainBase.FieldByName('DescriptionFormatted').AsString;
    if sTmpDescription <> sCurDescription  then
    begin
      sCurDescription := sTmpDescription;
      frmTools.RenderHTMLPage(sCurDescription);
    end;
  end;
    {
 if Assigned(frmTools) then
    frmTools.RenderHTMLPage(inttostr(random(999)));}
end;

procedure TmodDados.LoadEditors;
var
    stmp: String;
    sTables: TStringList;
    bEditorFileExists: Boolean;
begin
  bEditorFileExists := FileExists(frmTinnMain.sPathData + '\Editors.txt');

  try
    with sqlEditors do
    begin

      Params.Values['Database']:=IncludeTrailingBackslash(frmTinnMain.sPathData)+'Editor.txt';
      Params.Values['FailIfMissing'] := 'False';
      Connected := True;

      sTables := TStringList.Create;
      GetTableNames(sTables);


      if stables.IndexOf('Editors') < 0 then
      begin

        stmp :=
        'CREATE TABLE Editors (File VARCHAR, NewFile INTEGER, Modified INTEGER, UnsavedChanges INTEGER, TempFile VARCHAR, TabPosition INTEGER, ';
        stmp := stmp + 'EditorId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE,  Marks VARCHAR, TopLine INTEGER, CaretPosition INTEGER, Folding VARCHAR, LexerId INTEGER  )';
        ExecuteDirect(stmp);

      end;
      sTables.Free;
    end;
  except

   if bEditorFileExists then
     MessageDlg('Tinn-R encountered a damaged auto recovery database and cannot recover your files. You can try to manually recover files stored in ''' + frmTinnMain.sPathFileBackup + '''.', mtError, [mbOK], 0);
  end;
end;

procedure TmodDados.LoadComments;
begin
  // Comments
  with cdComments do
  begin
    Active := False;
    FileName := frmTinnMain.sPathData + '\Comments.xml';
    Active := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name := 'CommentsDefaultIndex';
      Fields := 'Language';
      Options := [ixPrimary, ixUnique];
    end;
    IndexName := 'CommentsDefaultIndex';
  end;
end;

procedure TmodDados.LoadCache;
var sTables: TStringList;
begin
  with sqlCache do
  begin

    Params.Values['Database']:=IncludeTrailingBackslash(frmTinnMain.sPathData)+'Cache.txt';
    Params.Values['FailIfMissing'] := 'False';
    Connected := True;

    sTables := TStringList.Create;
    GetTableNames(sTables);


    if stables.IndexOf('FileCache') < 0 then
      ExecuteDirect('CREATE TABLE FileCache (File VARCHAR, Marks VARCHAR, TopLine INTEGER, CaretPosition INTEGER, Folding VARCHAR, LexerId INTEGER  )');

    sTables.Free;
  end;
end;

procedure TmodDados.LoadMirrors;
begin
  // R Mirrors
  with cdRmirrors do
  begin
    Active := False;
    FileName := frmTinnMain.sPathData + '\Rmirrors.xml';
    Active := True;
    IndexDefs.Clear;
    with IndexDefs.AddIndexDef do
    begin
      Name := 'RmirrorsDefaultIndex';
      Fields := 'Country;Name;URL';
      Options := [ixPrimary, ixUnique];
    end;
    IndexName := 'RmirrorsDefaultIndex';
  end;

  with frmTinnMain do
  begin
    if not bDatabaseRestored then
      cdRmirrors.SavePoint := iRmirrorsBeforeChanges
    else
      iRmirrorsBeforeChanges := cdRmirrors.SavePoint;
  end;
  RmirrorsCountriesFilter(Self);
end;

procedure TmodDados.LoadShortcuts;
var sCommand: String;
    sTables: TStringList;
    i: Integer;
    sShortcut, sGroup, sCaption, sImage, sHint, sActionIndex: string;
begin
  with sqlShortcuts do
  begin

    Params.Values['Database']:= frmTinnMain.sPathShortcuts;
    Params.Values['FailIfMissing'] := 'False';
    Connected := True;

    sTables := TStringList.Create;
    GetTableNames(sTables);

    if stables.IndexOf('Shortcuts') < 0 then
    begin
      ExecuteDirect('CREATE TABLE Shortcuts (Category VARCHAR, Caption VARCHAR, Hint VARCHAR, Shortcut VARCHAR, Image INTEGER, ActionIndex INTEGER,  Version  VARCHAR DEFAULT "", PRIMARY KEY (Category, Caption))');
      frmTinnMain.bUpdate_Shortcuts := true;
    end;
  end;

  with sqldsShortcuts do
  begin
    Active := true;
    Refresh;
    First;
    if eof OR frmTinnMain.bUpdate_Shortcuts then
    begin
      frmTinnMain.alMain.State := asSuspended;

      for i := 0 to frmTinnMain.alMain.ActionCount - 1 do
      begin

        with frmTinnMain.alMain.Actions[i] do
        begin
          sCaption := Caption;
          sGroup := Category;
          sActionIndex := inttostr(i);
          sShortcut := ShortCutToText(Shortcut);
          if (sShortcut = '') then
            sShortcut := 'None';
          sImage := inttostr(ImageIndex);
          sHint := Hint;
        end;
        sqlShortcuts.ExecuteDirect('UPDATE Shortcuts SET ActionIndex = '+sActionIndex+', Version = '+AnsiQuotedStr(frmTinnMain.sCurrentVersion_Shortcuts, '"')
        + 'WHERE Category = '+AnsiQuotedStr(sGroup, '"')+' AND Caption = '+ AnsiQuotedStr(sCaption, '"'));

        sqlShortcuts.ExecuteDirect('INSERT OR IGNORE INTO Shortcuts (Category, Caption, Hint, Shortcut, Image, ActionIndex, Version) VALUES('+AnsiQuotedStr(sGroup, '"')+', '
          +AnsiQuotedStr(sCaption, '"')+', '
          +AnsiQuotedStr(sHint, '"')+', '
          +AnsiQuotedStr(sShortCut, '"')+', '
          +sImage+', '
          +sActionIndex+', '
          +AnsiQuotedStr(frmTinnMain.sCurrentVersion_Shortcuts, '"')+ ')' );


      end;
      sqlShortcuts.ExecuteDirect('DELETE FROM Shortcuts WHERE NOT Version Like '+AnsiQuotedStr(frmTinnMain.sCurrentVersion_Shortcuts, '"')   );

      frmTinnMain.alMain.State := asNormal;

      Active := false;
      sqlShortcuts.Close;
      sqlShortcuts.Open;
      Active := true;
      Refresh;
    end;
  end;
  cdShortcuts.Open;
  CreateShortcutsCategoriesList;
end;

procedure TmodDados.LoadRHelpSystem;
var sCommand: String;
    sTables: TStringList;
    sCreateIdentifiers: String;
    i: Integer;
begin
  with sqlMainBase do
  begin

    Params.Values['Database']:=IncludeTrailingBackslash(frmTinnMain.sPathData)+'RHelpSystem.txt';
    Params.Values['FailIfMissing'] := 'False';
    Connected := True;


    sTables := TStringList.Create;
    GetTableNames(sTables);

    if stables.IndexOf('Environments') < 0 then
      ExecuteDirect('CREATE TABLE Environments (Environment VARCHAR, Version VARCHAR DEFAULT "", CheckUpdate INTGER DEFAULT 1)');


    if stables.IndexOf('Objects') < 0 then
    begin
      sCommand := 'CREATE TABLE Objects ';
      sCommand := sCommand + '(DisplayName VARCHAR NOT NULL, Name VARCHAR NOT NULL, InsertText VARCHAR NOT NULL, Description VARCHAR NOT NULL, ';
      sCommand := sCommand + 'DescriptionFormatted VARCHAR NOT NULL, Title VARCHAR NOT NULL, Dim VARCHAR(100) NOT NULL, [Group] VARCHAR NOT NULL, ';
      sCommand := sCommand + 'Class VARCHAR NOT NULL, Arguments VARCHAR, HasArguments INTEGER, Envir VARCHAR NOT NULL, PrettyPackage NOT NULL)';
      ExecuteDirect(sCommand);
    end;


    if stables.IndexOf('Packages') < 0 then
    begin
      sCommand := 'CREATE TABLE Packages ';
      sCommand := sCommand + '(Package VARCHAR, LibPath VARCHAR, Version VARCHAR, Priority VARCHAR, ';
      sCommand := sCommand + 'Depends VARCHAR, Imports VARCHAR, LinkingTo VARCHAR, Suggests VARCHAR,';
      sCommand := sCommand + 'Enhances VARCHAR, License VARCHAR, License_is_FOSS VARCHAR, License_restricts_use VARCHAR,';
      sCommand := sCommand + 'OS_type VARCHAR, MD5sum VARCHAR, NeedsCompilation VARCHAR, Built VARCHAR, TinnVersion VARCHAR)';
      ExecuteDirect(sCommand);
      //  showmessage(sCommand) ;
    end;

    if stables.IndexOf('Objects2') < 0 then
    begin
      sCommand := 'CREATE TABLE Objects2 ';
      sCommand := sCommand + '(DisplayName VARCHAR NOT NULL, Name VARCHAR NOT NULL, InsertText VARCHAR NOT NULL, Description VARCHAR NOT NULL, ';
      sCommand := sCommand + 'DescriptionFormatted VARCHAR NOT NULL, Title VARCHAR NOT NULL, Dim VARCHAR(100) NOT NULL, [Group] VARCHAR NOT NULL, ';
      sCommand := sCommand + 'Class VARCHAR NOT NULL, Arguments VARCHAR, HasArguments INTEGER, Envir VARCHAR NOT NULL, PrettyPackage NOT NULL)';
      ExecuteDirect(sCommand);
    end;


    if stables.IndexOf('UserDefined') < 0 then
    begin

      ExecuteDirect('CREATE TABLE UserDefined (Name VARCHAR NOT NULL, Envir VARCHAR NOT NULL, Completion VARCHAR NOT NULL, Trigger VARCHAR NOT NULL)');
      ExecuteDirect('INSERT INTO  UserDefined (Name, Envir, Completion, Trigger) VALUES ("as.data.frame",  "package:base", "as.data.frame(|)", "asdf")');
      ExecuteDirect('INSERT INTO  UserDefined (Name, Envir, Completion, Trigger) VALUES ("merge",  "package:base","merge(x, y, by = "")", "mrg")');
     end;

    if stables.IndexOf('Categories') < 0 then
    begin
                     //     , CategoryDescription VARCHAR NOT NULL
      ExecuteDirect('CREATE TABLE Categories (Category VARCHAR NOT NULL)');
      ExecuteDirect('INSERT INTO  Categories (Category) VALUES ("Basic and help")');
      ExecuteDirect('INSERT INTO  Categories (Category) VALUES ("Data creation")');
      ExecuteDirect('INSERT INTO  Categories (Category) VALUES ("Export data")');
     end;

    if stables.IndexOf('CategoriesObjects') < 0 then
    begin
                     //     , CategoryDescription VARCHAR NOT NULL
      ExecuteDirect('CREATE TABLE CategoriesObjects (Category VARCHAR NOT NULL, Name VARCHAR NOT NULL, Envir NOT NULL)');

 //     ExecuteDirect('INSERT INTO  UserDefined (Name, Envir, Completion, Trigger) VALUES ("merge",  "package:base","merge(x, y, by = "")", "mrg")');
     end;

    sqldsMainBaseTools.Active := true;
    sqldsMainBaseTools.Refresh;


   // Close;
    cdMainBase.Active := true;
    cdMainBase.Refresh;
    Connected := false;


    sqldsCategories.Active := true;
    sqldsCategories.Refresh;

    sTables.Free;
  end;

  CheckPackages;
end;


procedure TmodDados.LoadLexerDB;
var sCommand: String;
    sTables: TStringList;
    sCreateIdentifiers: String;
    i: Integer;
begin
  with sqlLexerConnection do
  begin

    Params.Values['Database']:=IncludeTrailingBackslash(frmTinnMain.sPathData)+'Lexer.txt';
    Params.Values['FailIfMissing'] := 'False';
    Connected := True;


    sTables := TStringList.Create;
    GetTableNames(sTables);

    if stables.IndexOf('Lexers') < 0 then
    begin
      ExecuteDirect('CREATE TABLE Lexers (LexerId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL UNIQUE, LexerName VARCHAR(100) NOT NULL, Extensions VARCHAR(500) DEFAULT "")');
      ExecuteDirect('INSERT INTO Lexers (LexerName, LexerId, Extensions) VALUES ("Text", 0, "*.txt")');
      ExecuteDirect('INSERT INTO Lexers (LexerName, LexerId, Extensions) VALUES ("R", 86, "*.r; *.rd")');
      ExecuteDirect('INSERT INTO Lexers (LexerName, LexerId, Extensions) VALUES ("SQL", 7, "*.txt")');

    end;

  //  for i := 1 to 150 do
   //    ExecuteDirect('INSERT INTO Lexers (LexerName, LexerId) VALUES ("Test the limits '+inttostr(i)+'", '+inttostr(1000+i)+')');

    if stables.IndexOf('Identifiers') < 0 then
    begin
      sCreateIdentifiers := 'CREATE TABLE Identifiers (LexerId INTEGER, IdentifierId INTEGER, ';
      sCreateIdentifiers := sCreateIdentifiers + ' IdentifierName VARCHAR(100) NOT NULL, ';
      sCreateIdentifiers := sCreateIdentifiers + ' IdentifierType INTEGER DEFAULT -1, FGColor INTEGER DEFAULT '+inttostr(clWindowText)+', BGColor INTEGER DEFAULT'+inttostr(clWindow)+', ';
      sCreateIdentifiers := sCreateIdentifiers + ' FontSize INTEGER DEFAULT 10, Bold BOOLEAN DEFAULT 0, Italic BOOLEAN DEFAULT 0, Underline BOOLEAN DEFAULT 0, FontName VARCHAR(100) DEFAULT  "Courier New")';
      ExecuteDirect(sCreateIdentifiers);


      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 0, "Default",        1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 1, "Comments",        1, 0,'+inttostr(clGray)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 2, "Key-words",      1, 1,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 3, "Keywords base packages", 1, 1,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 4, "Keywords user environment",    1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 5, "Numbers",        1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 6, "Strings",        1, 0,'+inttostr(clNavy)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 7, "Strings 2",      1, 0,'+inttostr(clGreen)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 8, "Operators",       1, 0,'+inttostr(clRed)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 9, "Identifiers",     1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 10, "Infix",         1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 11, "Infixeol",      1, 0,'+inttostr(clWindowText)+')');

      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 34, "Matched bracket",         1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 35, "Unmatched bracket",      1, 0,'+inttostr(clWindowText)+')');

      {
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 12, "t12",     1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 13, "t13",         1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 14, "t14",      1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 15, "t15",     1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 16, "t16",         1, 0,'+inttostr(clWindowText)+')');
      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (86, 17, "t17",      1, 0,'+inttostr(clWindowText)+')');
}


      ExecuteDirect('INSERT INTO  Identifiers (LexerId, IdentifierId, IdentifierName, IdentifierType, Bold, FGColor) VALUES (7, 0, "Identifiers",        1, 1,'+inttostr(clWindowText)+')');

    end;

    sTables.Free;


    sqldsLexers.Active := true;
    sqldsLexers.Refresh;

    cdLexers.Active := true;
    cdLexers2.Active := true;

    sqldsIdentifiers.Active := true;
    sqldsIdentifiers.Refresh;
    cdIdentifiers.Active := true;

    sqlIdentifiersCurrent.Active := true;
    sqlIdentifiersCurrent.Refresh;
    cdIdentifiersCurrent.Active := true;

   end;
end;

function TmodDados.GetLexerNameById(iLexerId: Integer): String;
begin
 if cdLexers2.Locate('LexerId', iLexerId, []) then
   Result := cdLexers2.FieldByName('LexerName').AsString
 else Result := '';
end;

function TmodDados.GetLexerIdByName(sLexerName: String): Integer;
begin
 if cdLexers2.Locate('LexerName', sLexerName, [loCaseInsensitive]) then
   Result := cdLexers2.FieldByName('LexerId').AsInteger
 else Result := -1;
end;

procedure TmodDados.CheckForNewPackages;
var i: Integer;
    bNeedsUpdate: Boolean;
begin
  if not assigned(frmTools) then
    exit;
  if not assigned(frmTools.cbbToolsREnvironment) then
    exit;

  sqlMainBase.Connected:= true;

  for i := 0 to frmTools.cbbToolsREnvironment.Items.Count-1 do
  if frmTools.cbbToolsREnvironment.Items[i] <> '.GlobalEnv' then
  with sqldsMainBase do
  begin
    Close;
    CommandText := 'SELECT * FROM Environments WHERE Environment like '+AnsiQuotedStr(frmTools.cbbToolsREnvironment.Items[i], '"');
    Open;
    First;
    if EOF then
    begin
      sqlMainBase.ExecuteDirect('Insert INTO Environments (Environment) Values('+  AnsiQuotedStr(frmTools.cbbToolsREnvironment.Items[i], '"')+')');
      bNeedsUpdate := true;
    end else if sqldsMainBase.FieldByName('CheckUpdate').AsInteger = 1 then
      bNeedsUpdate := true;


  end;
  sqlMainBase.Close;
  sqlMainBase.CloseDataSets;
  sqlMainBase.Connected := false;

  if bNeedsUpdate then
    modDados.CheckPackages;
  //  frmTinnMain.SendLibraryUpdate;

end;



function TmodDados.GetFileTypeIndexOfLexer(iLexerId: Integer): Integer;
begin
  Result := 1;

  ModDados.cdLexers2.First;

  while not ModDados.cdLexers2.Eof do
  begin
    if ModDados.cdLexers2.FieldByName('LexerId').AsInteger = iLexerId then
    begin
      Result := Result + 1;
      Exit;
    end else Result := Result + 1;



    ModDados.cdLexers2.Next;
  end;
end;

procedure TmodDados.LookupWord(sKey: String; cdDataBase: TClientDataSet);
      var
    sCompare: String;
    bMatched: Boolean;
    iCurrent, iTestRecNo: Integer;
  begin
    with cdDataBase do
    begin
      sKey := ansilowercase(sKey);
      DisableControls;

      iCurrent := RecNo;
      bMatched := false;

      while not bMatched do
      begin
        iTestRecNo := recno;

        sCompare := ansilowercase(FieldByName('Name').AsString);

        if ansipos(sKey, sCompare) = 1 then
          bMatched := true;

        if not bMatched then
        begin
         Next;
         // eof method was unreliable
         if recno = iTestRecNo then
          First;
        end;

        if RecNo = iCurrent then
        begin
          bMatched := true;
        end;

      end;
      EnableControls;
    end;
end;

function TmodDados.FindRObjectTipText(sWord: String): String;
begin
  try
  with sqldsExplorerTip do
  begin
    if sCurDwellTextExplorer <> sWord then
    begin
      sCurDwellTextExplorer := sWord;
      Active := false;
      CommandText := 'SELECT Name, Dim, Class FROM objects WHERE name = ' + AnsiQuotedStr(sWord,'"');
      Active := true;
    end;

    if Active then
    begin
      First;
      if not FieldByName('Dim').IsNull  then

        Result := sWord +': '+FieldByName('Class').AsString+#10+'Dims: '+FieldByName('Dim').AsString;

    end;
  end;
  finally

  end;
end;




function TmodDados.FindLibraryTipText(sWord: String; HasArguments: Boolean = False): String;
begin
  try
  with sqldsLibraryTip do
  begin
    if sCurDwellTextLibrary <> sWord then
    begin
      sCurDwellTextLibrary := sWord;
      Active := false;
      CommandText := 'SELECT Name, InsertText, HasArguments, Title FROM objects WHERE name = ' + AnsiQuotedStr(sWord,'"');
      Active := true;
    end;

    if Active then
    begin
      First;
      if not FieldByName('InsertText').IsNull  then
      begin
        Result := trim(FieldByName('Title').AsString);
        if Result <> '' then
          Result := Result + #13#10 + FieldByName('InsertText').AsString;
        if HasArguments then
          if FieldByName('HasArguments').AsInteger = 0 then
            Result := trim(FieldByName('Title').AsString);
      end;
    end;
  end;
  finally

  end;
end;





procedure TmodDados.BackupFiles;
var
  i: integer;
  bSaved: Boolean;
  edForm: TfrmEditor;
  function CreateUniqueTempName(sfilename: String): String;
  var
    i: integer;
  begin
    i := 1;
    while (FileExists(frmTinnMain.sPathFileBackup + 'autosave-' + IntToStr(i) + '-' +
      sfilename)) do
      inc(i);
    Result := frmTinnMain.sPathFileBackup + 'autosave-' + IntToStr(i) + '-' + sfilename;
  end;

begin
    for i := 0 to frmTinnMain.pgFiles.PageCount-1 do
    begin
      if GetEditorById(frmTinnMain.pgFiles.Pages[i].Tag, edForm) then
      with edForm, edForm.EditorFile do
      begin
        if iUnsavedChanges = 1 then
        begin
          if sTempFile = '' then
              sTempFile := CreateUniqueTempName(StripPath(sFile));
          bSaved := SaveBackup(sTempFile);
          if bSaved then
          begin
            iUnsavedChanges := 0;
            bBackupUnsaved := False;
            sMarks := GetMarkerString;
            sFolding := GetToggleString;
            WriteCursorAndWindowInfo(EditorFile);
          end;
        end;
        moddados.SaveEditorFile(EditorFile);
      end;
    end;

    if frmTinnMain.pgFiles.PageCount = 0 then
      if FileExists(frmTinnMain.sPathData + '\Editors.txt') then
         DeleteFile(frmTinnMain.sPathData + '\Editors.txt');
end;

procedure TmodDados.CheckPackages;
var
  sSend, fname: String;
begin
  if not cConsole.IsRunning then
    if FileExists(sPathRterm) AND (ExtractFileExt(sPathRterm) = '.exe') then
      cConsole.RunProcess(sPathRterm + ' ' + sParRterm);

  if not cConsole.IsRunning then
    Exit;

  if not cConsole.bRterm_Ready then
  begin
    bUpdateAgainLater := true;
    Exit;
  end;

  bUpdateAgainLater := false;

  fname := IncludeTrailingPathDelimiter(frmTinnMain.sUtilsOrigin)+'TinnRCommunication-Lib.r';
  sSend := 'source("'+DosPathToUnixPath(fname)+'", echo=F, max.deparse.length=150)';
  if not FileExists(fname) then
  begin
    showmessage('File '''+fname+''' not found.');
    exit;
  end;

  sSend := 'LibraryPath <- file.path(Sys.getenv(''APPDATA''), ''Tinn-R'', ''data'', ''RHelpSystem.txt'' , fsep=''\\''); source("'+DosPathToUnixPath(fname)+'", echo=F, max.deparse.length=150)';
  cConsole.SendInput(sSend+#13#10);

end;


end.
