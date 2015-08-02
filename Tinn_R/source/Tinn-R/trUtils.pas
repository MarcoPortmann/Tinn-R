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

unit trUtils;

interface

uses
  Windows, SysUtils, Dialogs, Classes, Clipbrd, Registry, Graphics, Controls, Datasnap.DBClient,
  StrUtils,          ufrmEditor, System.Character,    trCommon,
  ActiveX, ShlObj, ComObj, PerlRegEx, WinInet, StdCtrls, System.UITypes, DScintilla, DScintillaTypes;

  const
  MARGIN_LINE_NUMBERS = 0;
  MARGIN_CODE_FOLDING = 1;
  MARGIN_BOOKMARKS    = 2;
  MARGIN_R_STATUS     = 3;
type
  TCharSet = set of AnsiChar;
  TGuiType = (gtJGR, gtUnknown);

  TArg<T> = reference to procedure(const Arg: T);

function ClipboardTxtToFile(sFileTXT: string): boolean;
function ContrastColor(FontC: TColor): TColor;
function CountChar(Text, Sub: string): Integer;
function DataFolder: string;
function ExecAndWait(const sFileName, sParams: string;
  wWindowState: Word): boolean;
function ExecCmdLineAndWait(const CmdLine: string; wWindowState: Word): boolean;
function FileSaveFast(sFilePath, sContent: string): boolean;
function FileToString(sPath: string): string;
function GetAssociation(const DocFileName: string): string;
function GetPosMatchingBackward(Str: string; parIni, parFim: string): Integer;
function GetPosMatchingForward(Str: string; parIni, parFim: string): Integer;
function GetRegistryValue(KeyName: string): string;
function GetRObject(sTmp: string): string;
function GetRPackage(sTmp: string): string;
function GetSpecialFolder(const ASpecialFolderID: Integer): string;
function GetWindowHandle(const chCaption: PChar;
  const bPartial: boolean = False): HWND;
function InvertString(sStr: string): string;
function IsConnected: boolean;
function IsGuiRunning(var hRgui: HWND; var sCaption: string;
  var iRecognitionCaption, iRecognitionType: Integer): boolean;
function IsValidNumber_RVersion(s: string): boolean;
function OpenCmdLine(const CmdLine: string; wWindowState: Word): boolean;
function OpenUrl(const sURL: string): boolean;
function OpenUrlByIEShell(const sURL: string): boolean;
function PathBrowser: String;
function RegEx(sSubject, sRegEx: string; bReplace: boolean = False;
  sReplacement: string = ''): string;
function RegEx_Multiline(sSubject, sRegEx: string): string;
function RemoveFileExtension(sFile: string): string;
function RunFile(const sName: string = ''; const sPar1: string = '';
  const sPar2: string = ''): Integer;
function SavePriorClipboardText: boolean;
function SortDate(List: TStringList; Index1, Index2: Integer): Integer;
function SortInteger(List: TStringList; Index1, Index2: Integer): Integer;
function StringToCaseSelect(sSelector: string;
  aCaseList: array of string): Integer;
function StripFileName(sFileName: string): string;
function StripNonConforming(const sTmp: string;
  const ValidChars: TCharSet): string;
function StripPath(sFileName: string): string;
function StrippedOfNonAscii(const s: string): string;
// m.p.  procedure CaptureConsoleOutput(const ACommand, AParameters: String; CallBack: TArg<PAnsiChar>);
procedure DeleteDir(sDir: string);
procedure GetRInfo(sTmp: string; var sRPackage, sRObject: string);
procedure OpenFile(sFileName: string);
procedure OpenProgram(sProg, sParams: string);
procedure PSendMessage(msg: HINST);
procedure RestorePriorClipboardText;
procedure StrSplit(const cDelimiter: Char; sInput: string;
  const tsStrings: TStrings);

function GetEditorById(Id: integer; var editor: TFrmEditor): Boolean;
// Editor function
procedure InsertDatabaseEntry(sInsertField: String; Database: TClientDataSet;  AllArguments: Boolean = True);
procedure SetCursorInInsertion(sText: String; var iStart, iEnd: Integer; var bDeleteSelection: Boolean);

// sciEditor functions
//function GetRWordEndPosition(iPos: Integer; Editor: TDScintilla): Integer;
function  GetCaretX(Editor: TDScintilla): Integer;
function  GetCaretY(Editor: TDScintilla): Integer;
procedure SetCaretX(Position: Integer;  Editor: TDScintilla);
function  GetCurrentLine(Editor: TDScintilla): String;
procedure SetCursorToBottom( Editor: TDScintilla);
procedure SetCurrentLine(LineText: String; Editor: TDScintilla);
procedure SetCursorToLineEnd(Editor: TDScintilla);
function  GetWordFromPos(iPos: Integer; Editor: TDScintilla): String;


procedure ClearAllBookMarks(Editor: TDScintilla);
procedure SetLineTextVisibility(bVisible: Boolean; Editor: TDScintilla);
procedure SetSpecialChars(bVisible: Boolean; Editor: TDScintilla);
function  SelStartLine(Editor: TDScintilla): Integer;
function  SelEndLine(Editor: TDScintilla): Integer;
procedure SelectToLineStart(Editor: TDScintilla);
procedure SetWordInvertCase(Editor: TDScintilla);
procedure SetInvertCase(Editor: TDScintilla);
procedure AlignChar(sAlignChar: String; sciEditor: TDScintilla);
procedure InvertCaseScintilla(sciEditor: TDScintilla);
function InvertCaseText(sText: String): String;


// Find
procedure Find(seEditor: TDScintilla);
procedure ShowSearchReplaceDialog(seEditor: TDScintilla; bReplace: Boolean);
procedure DoSearchReplaceText(seEditor: TDScintilla; bReplace, bSearchAgain: Boolean;
  bMessage: Boolean = True; bReplaceAll: Boolean = False; iFirstFound: Integer = -1; iLoopCount: Integer = 0);
procedure FindAgain;
procedure Replace(seEditor: TDScintilla);

implementation

uses
  ShellAPI,
  SHDocVw,
  Forms,

  ufrmReplaceText,
  ufrmSearchText,
  ufrmMain;

const
  RGui: array [0 .. 2] of string = ('R Console (64-bit)', // R: 64 SDI mode
    'R Console (32-bit)', // R: 32 SDI mode
    'Console'); // R: JGR

var
  preRegEx: TPerlRegEx;

  sOldClipBoard: string;

  // adapted from http://www.delphipages.com/forum/showthread.php?t=120031
function GetWindowHandle(const chCaption: PChar;
  const bPartial: boolean = False): HWND;
var
  chTmp: PChar;
  i: Integer;
  hTmp: HWND;

  sTmp1, sTmp2: string;

begin
  Result := 0;
  chTmp := nil;

  try
    GetMem(chTmp, 255);
    hTmp := GetWindow(FindWindow(nil, nil), 0);
    while (hTmp <> 0) and (Result = 0) do
    begin
      i := GetWindowText(hTmp, chTmp, 255);
      if (i > 0) then
        sTmp1 := LowerCase(string(chTmp));
      sTmp2 := LowerCase(string(chCaption));
      if (SameStr(sTmp1, sTmp2)) then
        Result := hTmp
      else if bPartial and Assigned(AnsiStrPos(chTmp, chCaption)) and
        not Assigned(AnsiStrPos(chTmp, 'RGui')) then
        Result := hTmp;
      hTmp := GetWindow(hTmp, GW_HWNDNEXT);
    end;
  finally
    FreeMem(chTmp);
  end;
end;

function GetEditorById(Id: integer; var editor: TFrmEditor): Boolean;
var
  i: integer;
  bFound: Boolean;
begin
  editor := nil;

  Result := False;
  if Id >= 0 then
    for i := (frmTinnMain.MDIChildCount - 1) downto 0 do
    begin
      if (frmTinnMain.MDIChildren[i]).Tag = Id then
      begin
        editor := (frmTinnMain.MDIChildren[i] AS TFrmEditor);
        Result := True;
        break;
      end;
    end;
end;


function IsGuiRunning(var hRgui: HWND; var sCaption: string;
  var iRecognitionCaption, iRecognitionType: Integer): boolean;
var
  i: Integer;
  hTmp: HWND;

begin
  Result := False;
  hRgui := 0;
  hTmp := 0;
try

  case iRecognitionCaption of
    // R: 64 bit SDI mode --> R Console (64-bit)
    0:
      begin
        hTmp := GetWindowHandle(PChar(RGui[0]), boolean(iRecognitionType));
        if (hTmp <> 0) then
          sCaption := RGui[0];
      end;

    // R: 32 bit SDI mode --> R Console (32-bit)
    1:
      begin
        hTmp := GetWindowHandle(PChar(RGui[1]), boolean(iRecognitionType));
        if (hTmp <> 0) then
          sCaption := RGui[1];
      end;

    // Both R: 64 bit SDI mode & 32 bit SDI mode --> R Console (64-bit) & R Console (32-bit)
    2:
      begin
        for i := 0 to 1 do
        begin
          hTmp := GetWindowHandle(PChar(RGui[i]), boolean(iRecognitionType));
          if (hTmp <> 0) then
          begin
            sCaption := RGui[i];
            Break;
          end;
        end;
      end;

    // JGR --> R Console
    3:
      begin
        hTmp := GetWindowHandle(PChar(RGui[2]), boolean(iRecognitionType));
        if (hTmp <> 0) then
          sCaption := RGui[2];
      end;

    // All
    4:
      begin
        for i := 0 to 2 do
        begin
          hTmp := GetWindowHandle(PChar(RGui[i]), boolean(iRecognitionType));
          if (hTmp <> 0) then
          begin
            sCaption := RGui[i];
            Break;
          end;
        end;
      end;
  end;

  if (hTmp <> 0) then
  begin
    hRgui := hTmp;
    Result := True;
  end;
except
  showmessage('''IsGuiRunning'' failed. If you see this message, we are probably on the right track to solve an extremely annoying bug in Tinn-R.');

end;
end;

function FileToString(sPath: string): string;
var
  tfTmp: TextFile;

  sContent, sRead: string;

begin
  AssignFile(tfTmp, sPath);
  Reset(tfTmp);
  while not EOF(tfTmp) do
  begin
    ReadLn(tfTmp, sRead);
    sContent := sContent + sRead + #13#10;
  end;
  CloseFile(tfTmp);
  Result := sContent;
end;

function ContrastColor(FontC: TColor): TColor;
var
  iR, iG, iB: Integer;

begin
  iR := GetRValue(abs(FontC)) * 2;
  iG := GetGValue(abs(FontC)) * 5;
  iB := GetBValue(abs(FontC));
  if (iR + iG + iB < 1024) then
    Result := clWhite
  else
    Result := clBlack;
end;

function RemoveFileExtension(sFile: string): string;
var
  sTemp, sInvName: string;

  iPos: Integer;

begin
  sTemp := ExtractFilePath(sFile);
  sFile := ExtractFileName(sFile);
  sInvName := InvertString(sFile);
  iPos := pos('.', sInvName);
  if (iPos > 0) then
    sFile := copy(sFile, 1, length(sFile) - iPos);
  sFile := sTemp + sFile;
  Result := sFile;
end;

function InvertString(sStr: string): string;
var
  cTemp: Char;

  i, T: Integer;

begin
  T := length(sStr);
  for i := 1 to (T div 2) do
  begin
    cTemp := sStr[i];
    sStr[i] := sStr[T - i + 1];
    sStr[T - i + 1] := cTemp;
  end;
  Result := sStr;
end;

function RunFile(const sName: string = ''; const sPar1: string = '';
  const sPar2: string = ''): Integer;
begin
  Result := ShellExecute(0, nil, PChar(sName), PChar(sPar1), PChar(sPar2),
    SW_SHOWNORMAL);
end;

function OpenUrl(const sURL: string): boolean;
const
  csPrefix = 'http://';
var
  sURLLocal: string;

begin
  if (pos(csPrefix, LowerCase(sURL)) < 1) then
    sURLLocal := csPrefix + sURL
  else
    sURLLocal := sURL;
  Result := RunFile(sURLLocal) > 32;
{$IFDEF MSWINDOWS}
  // if fail to open sURL by default browser, then try to use IE
  if not Result then
    Result := OpenUrlByIEShell(sURLLocal);
{$ENDIF}
end;

function OpenUrlByIEShell(const sURL: string): boolean;
var
  iE: IWebBrowser2;
  vI: OleVariant;

begin
  Result := False;
  try
    iE := CoShellBrowserWindow.Create;
    if (iE = nil) then
      Exit;
    iE.Visible := True;
    iE.Navigate(sURL, vI, vI, vI, vI);
    Result := True;
  except
    ; // TODO
  end;
end;

// from: http://delphi.about.com/cs/adptips2002/a/bltip0202_5.htm
{
  Usage:

  case StringToCaseSelect('Delphi',
  ['About','Borland','Delphi']) of
  0:ShowMessage('You''ve picked About') ;
  1:ShowMessage('You''ve picked Borland') ;
  2:ShowMessage('You''ve picked Delphi') ;
  end;
}
function StringToCaseSelect(sSelector: string;
  aCaseList: array of string): Integer;
var
  iCnt: Integer;

begin
  Result := -1;
  for iCnt := 0 to (length(aCaseList) - 1) do
  begin
    if (CompareText(sSelector, aCaseList[iCnt]) = 0) then
    begin
      Result := iCnt;
      Break;
    end;
  end;
end;

// From Zarko Gajic: http://delphi.about.com/cs/adptips2002/a/bltip1102_5.htm
// PS: a very nice procedure to split string!!!
procedure StrSplit(const cDelimiter: Char; sInput: string;
  const tsStrings: TStrings);
begin
  Assert(Assigned(tsStrings));
  tsStrings.Clear;
  tsStrings.Delimiter := cDelimiter;
  tsStrings.DelimitedText := sInput;
end;

function SavePriorClipboardText: boolean;
begin
  // ShowMessage(Clipboard.AsText);  To debug
  Result := False;
  while not OpenClipboard(Application.Handle) do
    Sleep(50);
  if OpenClipboard(Application.Handle) then
  begin
    Result := True;
    with Clipboard do
      if HasFormat(CF_TEXT) then
      begin
        sOldClipBoard := AsText;
        Clear;
      end;
  end
  else
    MessageDlg('Clipboard is not available!' + #13 + #13 + 'Please, try newly!',
      mtWarning, [MBOK], 0)
end;

procedure RestorePriorClipboardText;
begin
  while not OpenClipboard(Application.Handle) do
    Sleep(50);
  if OpenClipboard(Application.Handle) then
    with Clipboard do
      AsText := sOldClipBoard;
end;

procedure PSendMessage(msg: HINST);
begin
  case msg of
    0:
      MessageDlg('The operating system is out of memory or resources!', mtError,
        [MBOK], 0);

    ERROR_FILE_NOT_FOUND:
      MessageDlg('The specified file was not found!', mtError, [MBOK], 0);

    ERROR_PATH_NOT_FOUND:
      MessageDlg('The specified path was not found!', mtError, [MBOK], 0);

    ERROR_BAD_FORMAT:
      MessageDlg
        ('The .EXE file is invalid (non-Win32 .EXE or error in .EXE image!',
        mtError, [MBOK], 0);

    SE_ERR_ACCESSDENIED:
      MessageDlg('The operating system denied access to the specified file!',
        mtError, [MBOK], 0);

    SE_ERR_ASSOCINCOMPLETE:
      MessageDlg('The filename association is incomplete or invalid!', mtError,
        [MBOK], 0);

    SE_ERR_DDEBUSY:
      MessageDlg
        ('The DDE transaction could not be completed because other DDE transactions were being processed!',
        mtError, [MBOK], 0);

    SE_ERR_DDEFAIL:
      MessageDlg('The DDE transaction failed!', mtError, [MBOK], 0);

    SE_ERR_DDETIMEOUT:
      MessageDlg
        ('The DDE transaction could not be completed because the request timed out!',
        mtError, [MBOK], 0);

    SE_ERR_DLLNOTFOUND:
      MessageDlg('The specified dynamic-link library was not found!', mtError,
        [MBOK], 0);

    SE_ERR_NOASSOC:
      MessageDlg
        ('There is no application associated with the given filename extension!',
        mtError, [MBOK], 0);

    SE_ERR_OOM:
      MessageDlg('There was not enough memory to complete the operation!',
        mtError, [MBOK], 0);

    SE_ERR_SHARE:
      MessageDlg('A sharing violation occurred!', mtError, [MBOK], 0);
  end;
end;

{ Open a file or starts a programm (without parameters) }
procedure OpenFile(sFileName: string);
var
  aTemp: array [0 .. 800] of Char;

begin
  StrPCopy(aTemp, sFileName);
  ShellExecute(Application.Handle, 'open', aTemp, nil, nil, SW_NORMAL);
end;

{ Starts a programm with commandline parameters }
procedure OpenProgram(sProg, sParams: string);
var
  aTemp1, aTemp2: array [0 .. 800] of Char;

begin
  StrPCopy(aTemp1, sProg);
  StrPCopy(aTemp2, sParams);
  ShellExecute(Application.Handle, 'open', aTemp1, aTemp2, nil, SW_NORMAL);
end;

{ Starts a program and wait until its terminated: WindowState is of the SW_xxx constants }
function ExecAndWait(const sFileName, sParams: string;
  wWindowState: Word): boolean;
var
  sUInfo: TStartupInfo;
  pInfo: TProcessInformation;

  sCmdLine: string;

begin
  { Enclose filename in quotes to take care of long filenames with spaces. }
  sCmdLine := '"' + sFileName + '"' + sParams;
  FillChar(sUInfo, SizeOf(sUInfo), #0);
  with sUInfo do
  begin
    cb := SizeOf(sUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := wWindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, False,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    PChar(ExtractFilePath(sFileName)), sUInfo, pInfo);
  if Result then
  begin
    WaitForSingleObject(pInfo.hProcess, INFINITE); // Wait for it to finish
    CloseHandle(pInfo.hProcess);
    CloseHandle(pInfo.hThread);
  end;
end;

{ Execute a complete shell command line and waits until terminated. }
function ExecCmdLineAndWait(const CmdLine: string; wWindowState: Word): boolean;
var
  sUInfo: TStartupInfo;
  pInfo: TProcessInformation;

begin
  { Enclose filename in quotes to take care of long filenames with spaces. }
  FillChar(sUInfo, SizeOf(sUInfo), #0);
  with sUInfo do
  begin
    cb := SizeOf(sUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := wWindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, False,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    nil { PChar(ExtractFilePath(sFileName)) } , sUInfo, pInfo);
  if Result then
  begin
    WaitForSingleObject(pInfo.hProcess, INFINITE); // Wait for it to finish
    CloseHandle(pInfo.hProcess);
    CloseHandle(pInfo.hThread);
  end;
end;

{ Execute a complete shell command line without waiting. }
function OpenCmdLine(const CmdLine: string; wWindowState: Word): boolean;
var
  sUInfo: TStartupInfo;
  pInfo: TProcessInformation;

begin
  { Enclose filename in quotes to take care of long filenames with spaces. }
  FillChar(sUInfo, SizeOf(sUInfo), #0);
  with sUInfo do
  begin
    cb := SizeOf(sUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := wWindowState;
  end;
  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, False,
    CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
    nil { PChar(ExtractFilePath(sFileName)) } , sUInfo, pInfo);
end;

function PathBrowser: String;
// Return path of default browser
// Require Registry declared in Uses
var
  sBrowser: String;

  i: Integer;

  reg: TRegistry;

begin
  try
    reg := TRegistry.Create;
    with reg do
    begin
      try
        RootKey := HKEY_CLASSES_ROOT;
        if not OpenKey('http\shell\open\command', False) then
          sBrowser := ''
        else
          sBrowser := ReadString('');
        CloseKey;
      finally
        Free;
        reg := nil;
      end;
      i := pos('.exe', LowerCase(sBrowser));
      if (i > 0) then
        sBrowser := copy(sBrowser, 1, (i + 3));
      i := pos('"', sBrowser);
      while i > 0 do
      begin
        Delete(sBrowser, 1, i);
        i := pos('"', sBrowser);
      end;
    end;
    Result := sBrowser;
  finally
    FreeAndNil(reg)
  end;
end;

function SortDate(List: TStringList; Index1, Index2: Integer): Integer;
var
  d1, d2: TDateTime;

begin
  d1 := StrToDate(List[Index1]);
  d2 := StrToDate(List[Index2]);
  if (d1 < d2) then
    Result := -1
  else if (d1 > d2) then
    Result := 1
  else
    Result := 0;
end;

function SortInteger(List: TStringList; Index1, Index2: Integer): Integer;
var
  b1, b2: boolean;

  i1, i2: Integer;

  function IsInt(AString: string; var AInteger: Integer): boolean;
  var
    iCode: Integer;

  begin
    Val(AString, AInteger, iCode);
    Result := (iCode = 0);
  end;

begin
  b1 := IsInt(List[Index1], i1);
  b2 := IsInt(List[Index2], i2);
  Result := ord(b1 or b2);
  if (Result <> 0) then
  begin
    if (i1 < i2) then
      Result := -1
    else if (i1 > i2) then
      Result := 1
    else
      Result := 0;
  end
  else
    Result := lstrcmp(PChar(List[Index1]), PChar(List[Index2]));
end;

// From Zarko Gajic (http://delphi.about.com/cs/adptips2001/a/bltip0301_4.htm)
function ClipboardTxtToFile(sFileTXT: string): boolean;
var
  c1, c2: PChar;
  dwLen: DWord;
  hData: THandle;
  tf: TextFile;

begin
  Result := False;
  with Clipboard do
  begin
    try
      Open;
      if (HasFormat(CF_TEXT)) then
      begin
        hData := GetClipboardData(CF_TEXT);
        c1 := GlobalLock(hData);
        dwLen := GlobalSize(hData);
        c2 := StrAlloc(1 + dwLen);
        StrLCopy(c2, c1, dwLen);
        GlobalUnlock(hData);

        AssignFile(tf, sFileTXT);
        ReWrite(tf);
        Write(tf, c2);
        CloseFile(tf);

        StrDispose(c2);
        Result := True;
      end;
    finally
      Close;
    end;
  end;
end;

function FileSaveFast(sFilePath, sContent: string): boolean;
var
  tf: TextFile;

begin
  AssignFile(tf, sFilePath);
  ReWrite(tf);
  WriteLn(tf, sContent);
  CloseFile(tf);
  Result := True;
end;

function StrippedOfNonAscii(const s: string): string;
var
  i, Count: Integer;

begin
  SetLength(Result, length(s));
  Count := 0;
  for i := 1 to length(s) do
  begin
    if ((s[i] >= #32) and (s[i] <= #127)) or CharInSet(s[i], [#10, #13]) then
    begin
      inc(Count);
      Result[Count] := s[i];
    end;
  end;
  SetLength(Result, Count);
end;

function StripNonConforming(const sTmp: string;
  const ValidChars: TCharSet): string;
var
  iDest, iSource: Integer;

begin
  SetLength(Result, length(sTmp));
  iDest := 0;
  for iSource := 1 to length(sTmp) do
    if CharInSet(sTmp[iSource], ValidChars) then
    begin
      inc(iDest);
      Result[iDest] := sTmp[iSource]
    end;
  SetLength(Result, iDest)
end;

{
  // Do not get the latest version!
  function GetRegistryValue(KeyName: string): string;

  // From http://stackoverflow.com/questions/2863931/problems-reading-registry-from-delphi-7-on-windows-7-64-bit
  function Is64BitOS: Boolean;
  type
  TIsWow64Process = function(Handle: THandle; var IsWow64: BOOL): BOOL; stdcall;
  var
  hKernel32     : Integer;
  IsWow64Process: TIsWow64Process;
  IsWow64       : BOOL;

  begin
  // we can check if the operating system is 64-bit by checking whether
  // we are running under Wow64 (we are 32-bit code). We must check if this
  // function is implemented before we call it, because some older versions
  // of kernel32.dll (eg. Windows 2000) don't know about it.
  // see http://msdn.microsoft.com/en-us/library/ms684139%28VS.85%29.aspx
  Result:= False;
  hKernel32:= LoadLibrary('kernel32.dll');
  if (hKernel32 = 0) then RaiseLastOSError;
  @IsWow64Process:= GetProcAddress(hkernel32, 'IsWow64Process');
  if Assigned(IsWow64Process) then begin
  IsWow64:= False;
  if (IsWow64Process(GetCurrentProcess, IsWow64)) then begin
  Result:= IsWow64;
  end
  else RaiseLastOSError;
  end;
  FreeLibrary(hKernel32);
  end;

  var
  i,
  iTmp,
  iMajor,
  iControl: integer;
  Reg      : TRegistry;
  sVal     : TStringList;

  begin
  Result:= '';
  Reg   := nil;
  sVal  := nil;
  try
  if Is64BitOS then Reg:= TRegistry.Create(KEY_READ or KEY_WOW64_64KEY)
  else Reg:= TRegistry.Create(KEY_READ);
  sVal:=TStringList.Create;
  Reg.RootKey:= HKEY_LOCAL_MACHINE;
  Reg.OpenKeyReadOnly(KeyName);
  Reg.GetKeyNames(sVal);
  Reg.CloseKey;
  if (sVal.Count <> 0 ) then begin
  sVal.CustomSort(SortInteger);
  iControl:= 0;
  iMajor  := 0;
  for i:= 0 to sVal.Count - 1 do begin
  iTmp:= StrToInt(StripNonConforming(sVal.Strings[i], ['0'..'9']));
  if (iTmp > iControl) then begin
  iControl:= iTmp;
  iMajor  := i;
  end;
  end;
  KeyName:= KeyName + '\' + sVal.Strings[iMajor];
  Reg.OpenKeyReadOnly(KeyName);
  Result:= Reg.ReadString('InstallPath');
  Reg.CloseKey;
  end;
  finally
  Reg.Free;
  sVal.Free;
  end;
  end;
}

function GetRegistryValue(KeyName: string): string;

// Based in http://stackoverflow.com/questions/2863931/problems-reading-registry-from-delphi-7-on-windows-7-64-bit
  function Is64BitOS: boolean;
  type
    TIsWow64Process = function(Handle: THandle; var IsWow64: BOOL)
      : BOOL; stdcall;

  var
    hKernel32: Integer;
    IsWow64Process: TIsWow64Process;
    IsWow64: BOOL;

  begin
    // we can check if the operating system is 64-bit by checking whether
    // we are running under Wow64 (we are 32-bit code). We must check if this
    // function is implemented before we call it, because some older versions
    // of kernel32.dll (eg. Windows 2000) don't know about it.
    // see http://msdn.microsoft.com/en-us/library/ms684139%28VS.85%29.aspx
    Result := False;

    hKernel32 := LoadLibrary('kernel32.dll');

    if (hKernel32 = 0) then
      RaiseLastOSError;

    @IsWow64Process := GetProcAddress(hKernel32, 'IsWow64Process');

    if Assigned(IsWow64Process) then
    begin
      IsWow64 := False;

      if (IsWow64Process(GetCurrentProcess, IsWow64)) then
      begin
        Result := IsWow64;
      end
      else
        RaiseLastOSError;
    end;

    FreeLibrary(hKernel32);
  end;

var
  i, iMajor: Integer;

  reg: TRegistry;
  sVal: TStringList;

  sMajor, sTmp: string;

begin
  Result := '';
  reg := nil;
  sVal := nil;

  try
    if Is64BitOS then
      reg := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY)
    else
      reg := TRegistry.Create(KEY_READ);

    sVal := TStringList.Create;

    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKeyReadOnly(KeyName);
    reg.GetKeyNames(sVal);
    reg.CloseKey;

    if (sVal.Count <> 0) then
    begin
      sMajor := '0.0.0';
      iMajor := 0;

      for i := 0 to (sVal.Count - 1) do
      begin
        sTmp := StripNonConforming(sVal.Strings[i], ['.', '0' .. '9']);
        if (AnsiCompareStr(sTmp, sMajor) > 0) then
        begin
          sMajor := sTmp;
          iMajor := i;
        end;
      end;

      KeyName := KeyName + '\' + sVal.Strings[iMajor];

      reg.OpenKeyReadOnly(KeyName);

      Result := reg.ReadString('InstallPath');

      reg.CloseKey;
    end;
  finally
    reg.Free;
    sVal.Free;
  end;
end;

{
  procedure GetSubKeys(RootKey: HKEY; const Key: string; var SubKeys: TStringList);
  var
  Registry: TRegistry;

  begin
  Registry := TRegistry.Create;
  try
  Registry.RootKey := RootKey;
  Registry.OpenKeyReadOnly(Key);
  try
  Registry.GetKeyNames(SubKeys);
  except
  ; //TODO
  end;
  finally
  Registry.Free;
  end;
  end;
}

function GetAssociation(const DocFileName: string): string;
var
  FileClass: string;
  reg: TRegistry;

begin
  Result := '';
  reg := TRegistry.Create(KEY_EXECUTE);
  reg.RootKey := HKEY_CLASSES_ROOT;
  FileClass := '';
  if reg.OpenKeyReadOnly(ExtractFileExt(DocFileName)) then
  begin
    FileClass := reg.ReadString('');
    reg.CloseKey;
  end;
  if FileClass <> '' then
  begin
    if reg.OpenKeyReadOnly(FileClass + '\Shell\Open\Command') then
    begin
      Result := reg.ReadString('');
      reg.CloseKey;
    end;
  end;
  reg.Free;
end;

// Adapted from SynEdit by JCFaria
function GetPosMatchingForward(Str: string; parIni, parFim: string): Integer;
var
  iPos, iLen, iCount: Integer;

  iTmp: Char;

begin
  Result := 0;
  repeat

    iCount := 1;
    iPos := 0;
    // search first occurrence of the matching 'parIni', i.e 'parFim', until end of line
    iLen := length(Str);
    while iPos < iLen do
    begin
      inc(iPos);
      iTmp := Str[iPos]; // pega o primeiro caracter
      if (iTmp = parIni) or (iTmp = parFim) then
      begin
        if (iTmp = parIni) then
          inc(iCount)
        else if (iTmp = parFim) then
        begin
          dec(iCount);
          if (iCount = 1) then
          begin
            // matching bracket found, set pos
            Result := iPos;
            Exit;
          end
        end;
      end;
    end;
  until iPos = iLen;
end;

// Adapted from SynEdit by JCFaria
function GetPosMatchingBackward(Str: string; parIni, parFim: string): Integer;
var
  iPos, iLen, iCount: Integer;

  iTmp: Char;

begin
  Result := 0;
  repeat
    iCount := 1;
    iPos := length(Str) + 1;
    // search first occurrence of the matching 'parIni', i.e 'parFim', until end of line
    iLen := 1;
    while iPos > iLen do
    begin
      dec(iPos);
      iTmp := Str[iPos];
      if (iTmp = parIni) or (iTmp = parFim) then
      begin
        if (iTmp = parFim) then
          inc(iCount)
        else if (iTmp = parIni) then
        begin
          dec(iCount);
          if (iCount = 1) then
          begin
            // matching bracket found, set pos
            Result := iPos;
            Exit;
          end
        end;
      end;
    end;
  until iPos = iLen;
end;

// From Marco Cantu
function CountChar(Text, Sub: string): Integer;
var
  iPos: Integer;

begin
  Result := 0;
  iPos := PosEx(Sub, Text, 1); // default
  while iPos > 0 do
  begin
    inc(Result);
    iPos := PosEx(Sub, Text, iPos + length(Sub));
  end;
end;

function GetRPackage(sTmp: string): string;
var
  iIni, iFim: Integer;

begin
  iIni := pos('[', sTmp);
  iFim := pos(']', sTmp);
  Result := copy(sTmp, iIni, iFim - iIni + 1);
end;

function GetRObject(sTmp: string): string;
var
  iIni, iFim: Integer;

begin
  iIni := pos('<', sTmp);
  iFim := pos('>', sTmp);
  Result := copy(sTmp, iIni, iFim - iIni + 1);
end;

procedure GetRInfo(sTmp: string; var sRPackage, sRObject: string);
var
  iIni, iFim: Integer;

begin
  iIni := GetPosMatchingBackward(sTmp, '[', ']');
  iFim := pos('>', sTmp);
  if (iIni > 0) then
  begin
    sTmp := copy(sTmp, iIni, iFim + 1);
    sRPackage := GetRPackage(sTmp);
    sRObject := GetRObject(sTmp);
  end;
end;

function StripPath(sFileName: string): string;
var
  iSlashPos: Integer;
  sTmp: string;

begin
  sTmp := sFileName;
  repeat
    iSlashPos := pos('\', sTmp);
    sTmp := copy(sTmp, iSlashPos + 1, length(sTmp));
  until (iSlashPos = 0);
  Result := sTmp;
end;

function StripFileName(sFileName: string): string;
var
  iSlashPos, iNamePos: Integer;

  sTmp: string;

begin
  sTmp := sFileName;
  repeat
    iSlashPos := pos('\', sTmp);
    sTmp := copy(sTmp, iSlashPos + 1, length(sTmp));
  until (iSlashPos = 0);
  iNamePos := pos(sTmp, sFileName);
  sTmp := copy(sFileName, 1, iNamePos - 1);
  Result := sTmp;
end;

procedure DeleteDir(sDir: string);
var
  T: TSHFileOpStruct;

begin
  FillChar(T, SizeOf(T), #0);

  with T do
  begin
    Wnd := 0;
    wFunc := FO_DELETE;
    pFrom := PChar(sDir + #0#0);

    fFlags := FOF_SILENT or FOF_NOCONFIRMATION;
  end;

  Application.ProcessMessages;
  if (SHFileOperation(T) <> 0) then
    RemoveDir(sDir);
end;

// Function to ask Windows for a special folder and convert the "Windows string" into Delphi string
// From: http://forum.codecall.net/topic/60120-using-special-folders-to-comply-with-uac-enabled-windows-with-delphi-code/
function GetSpecialFolder(const ASpecialFolderID: Integer): string;
var
  vSFolder: pItemIDList;

  vSpecialPath: array [0 .. MAX_PATH] of Char;

begin
  SHGetSpecialFolderLocation(0, ASpecialFolderID, vSFolder);

  SHGetPathFromIDList(vSFolder, vSpecialPath);

  Result := StrPas(vSpecialPath);
end;

function RegEx(sSubject, sRegEx: string; bReplace: boolean = False;
  sReplacement: string = ''): string;
begin
  try
    preRegEx := TPerlRegEx.Create;
    try
      with preRegEx do
      begin
        Subject := sSubject;
        RegEx := sRegEx;
        // Replacement
        if bReplace then
        begin
          Replacement := sReplacement;
          if ReplaceAll then
            Result := Subject
            // else Result:= 'No matches';
          else
            Result := '';
        end
        // Matches
        else
        begin
          Match;
          if FoundMatch then
            Result := MatchedText
            // else Result:= 'No matches';
          else
            Result := '';
        end;
      end;
    except
      // TODO: Syntax error in the regular expression
    end;
  finally
    FreeAndNil(preRegEx);
  end;
end;

// Old from Tinn-R 2.4.1.7
function DataFolder: string;
var
  malloc: IMalloc;
  pidl: pItemIDList;

begin
  SHGetSpecialFolderLocation(0, CSIDL_APPDATA, pidl);
  SetLength(Result, MAX_PATH);
  SHGetPathFromIDList(pidl, PChar(Result));
  SetLength(Result, StrLen(PChar(Result)));

  OLECheck(SHGetMalloc(malloc));
  if Assigned(pidl) then
    malloc.Free(pidl);
end;

function RegEx_Multiline(sSubject, sRegEx: string): string;
var
  i: Integer;

  sTmp: string;

begin
  try
    preRegEx := TPerlRegEx.Create;
    preRegEx.Options := [preMultiLine];
    try
      with preRegEx do
      begin
        Subject := sSubject;
        RegEx := sRegEx;
        if Match then
          repeat
            for i := 0 to GroupCount do
            begin
              sTmp := Groups[i];
              Result := Result + sTmp + #13#10;
            end;
          until not MatchAgain
        else
          Result := '';
      end;
    except
      // TODO: Syntax error in the regular expression
    end;
  finally
    FreeAndNil(preRegEx);
  end;
end;

// From: http://stackoverflow.com/questions/325872/detect-an-internet-connection-activation-with-delphi?rq=1
// It is simple but make the job for the purposes of Tinn-R projet!
function IsConnected: boolean;
const
  INTERNET_CONNECTION_MODEM = 1;
  // local system uses a modem to connect to the Internet.
  INTERNET_CONNECTION_LAN = 2;
  // local system uses a local area network to connect to the Internet.
  INTERNET_CONNECTION_PROXY = 4;
  // local system uses a proxy server to connect to the Internet.
  INTERNET_CONNECTION_MODEM_BUSY = 8;
  // local system's modem is busy with a non-Internet connection.

var
  dwConnectionTypes: DWord;

begin
  dwConnectionTypes := INTERNET_CONNECTION_MODEM + INTERNET_CONNECTION_LAN +
    INTERNET_CONNECTION_PROXY;

  Result := InternetGetConnectedState(@dwConnectionTypes, 0);
end;

function IsValidNumber_RVersion(s: string): boolean;
var
  i: Integer;

begin
  i := 1;

  while (i <= length(s)) and CharInSet(s[i], ['0' .. '9', '.']) do
    inc(i);

  Result := i > length(s);
end;


function GetCaretX(Editor: TDScintilla): Integer;
var txt: String;
begin
  Result := Editor.GetCurLine(txt);
end;

function GetCaretY(Editor: TDScintilla): Integer;
begin
  Result := Editor.LineFromPosition(Editor.GetCurrentPos);
end;


procedure SetCaretX(Position: Integer;  Editor: TDScintilla);
var CurLine, CurLineEnd, NewPos, LLength: Integer;
begin
    CurLine := Editor.LineFromPosition(Editor.GetCurrentPos);
    LLength := Editor.Lines[CurLine].Length;
    CurLineEnd := Editor.GetLineEndPosition(CurLine);

    NewPos  := CurLineEnd - LLength  + Position;
    if NewPos > CurLineEnd then
      NewPos :=  CurLineEnd;

    Editor.GotoPos(NewPos);
end;

function GetCurrentLine( Editor: TDScintilla): String;
begin
    Result := Editor.Lines[ Editor.LineFromPosition(Editor.GetCurrentPos)];
end;

procedure SetCursorToBottom( Editor: TDScintilla);
begin
    Editor.SetCurrentPos(Editor.GetLength);
    Editor.SetSelectionStart(Editor.GetCurrentPos);
    Editor.ScrollToEnd;
end;

procedure SetCursorToLineEnd( Editor: TDScintilla);
begin
    Editor.GotoPos(Editor.GetLineEndPosition(Editor.LineFromPosition(Editor.GetCurrentPos)));
end;


procedure SetCurrentLine(LineText: String; Editor: TDScintilla);
begin
    Editor.Lines[ Editor.LineFromPosition(Editor.GetCurrentPos)] := LineText;
end;

procedure ClearAllBookMarks(Editor: TDScintilla);
var i: Integer;
begin
  for i := 0 to 9 do
    Editor.MarkerDeleteAll(i);
end;
{
function GetRWordEndPosition(iPos: Integer; Editor: TDScintilla): Integer;

  function IsValidRChar(ip: Integer): Boolean;
  var ach: Char;
      str: String;
  begin
    Result := false;
    str := Editor.GetTextRange(ip, ip+1);
    if length(str)>0 then
    begin
      ach := copy(str,1,1)[1];
     // showmessage(ach);
      if IsLetterOrDigit(ach) OR  CharInSet(ach, ['.', '_'])  then
        Result := true;
    end;
  end;

begin
 Result := iPos;
 while IsValidRChar(Result) do
   inc(Result);
end;
}

function GetWordFromPos(iPos: Integer; Editor: TDScintilla): String;
begin
 Result := Editor.GetTextRange(Editor.WordStartPosition(iPos, true), Editor.WordEndPosition(iPos, true))
end;

procedure SetLineTextVisibility(bVisible: Boolean; Editor: TDScintilla);
begin
//  frmTinnMain.Label6.caption := inttostr(random(99999))+' '+Editor.Parent.Name+' - '+Editor.Name;
  if bVisible then
    Editor.SetMarginWidthN(MARGIN_LINE_NUMBERS, Editor.TextWidth(Editor.MarginGetStyle(Editor.GetLineCount), inttostr(Editor.GetLineCount) )+8)
  else  Editor.SetMarginWidthN(MARGIN_LINE_NUMBERS, 0);
end;

function SelStartLine(Editor: TDScintilla): Integer;
begin
  Result:= Editor.LineFromPosition(Editor.GetSelectionStart);
end;

function SelEndLine(Editor: TDScintilla): Integer;
begin
  Result:= Editor.LineFromPosition(Editor.GetSelectionEnd);
end;

procedure SetSpecialChars(bVisible: Boolean; Editor: TDScintilla);
begin
  with Editor do
  begin
  if bVisible then
  begin
    SetViewEOL(true);
    SetViewWS(1);
  end else
  begin
    SetViewEOL(false);
    SetViewWS(0);
  end;
  end;
end;

procedure SelectToLineStart(Editor: TDScintilla);
var iPos: Integer;
begin
  iPos := Editor.GetCurrentPos;
  Editor.GotoLine(Editor.LineFromPosition(iPos));
  Editor.SetSelectionEnd(iPos);
end;
 {
procedure SetWordUpperCase(Editor: TDScintilla);
var iPos: Integer;
begin
  Editor.Lines.BeginUpdate;
  iPos := Editor.GetSelectionStart;
  Editor.SetSelectionStart(Editor.WordStartPosition(iPos, true));
  Editor.SetSelectionEnd(Editor.WordEndPosition(iPos, true));
  Editor.UpperCase;
  Editor.SetSelectionStart(iPos);
  Editor.SetSelectionEnd(iPos);
  Editor.Lines.EndUpdate;
end;

procedure SetWordLowerCase(Editor: TDScintilla);
var iPos: Integer;
begin
  Editor.Lines.BeginUpdate;
  iPos := Editor.GetSelectionStart;
  Editor.SetSelectionStart(Editor.WordStartPosition(iPos, true));
  Editor.SetSelectionEnd(Editor.WordEndPosition(iPos, true));
  Editor.LowerCase;
  Editor.SetSelectionStart(iPos);
  Editor.SetSelectionEnd(iPos);
  Editor.Lines.EndUpdate;
end;
  }


procedure SetInvertCase(Editor: TDScintilla);
var iPos, i: Integer;
    stmp, snew: String;
begin
   showmessage('sci magic invert case function');
   exit;
  Editor.Lines.BeginUpdate;
  iPos := Editor.GetSelectionStart;
  Editor.SetSelectionStart(Editor.WordStartPosition(iPos, true));
  Editor.SetSelectionEnd(Editor.WordEndPosition(iPos, true));
  stmp := Editor.GetSelText;

  if stmp <>'' then
  begin
    snew := '';
    for i := 1 to Length(stmp) do
    begin
      if (stmp[i] = Uppercase(stmp[i])) then
        snew := snew + Lowercase(stmp[i])
      else
       snew := snew + Uppercase(stmp[i]);
    end;
    Editor.ReplaceSel(snew);
  end;


  Editor.SetSelectionStart(iPos);
  Editor.SetSelectionEnd(iPos);
  Editor.Lines.EndUpdate;
end;

procedure SetWordInvertCase(Editor: TDScintilla);
var iPos, i: Integer;
    stmp, snew: String;
begin
  Editor.Lines.BeginUpdate;
  iPos := Editor.GetSelectionStart;
  Editor.SetSelectionStart(Editor.WordStartPosition(iPos, true));
  Editor.SetSelectionEnd(Editor.WordEndPosition(iPos, true));
  stmp := Editor.GetSelText;

  if stmp <>'' then
  begin
    snew := '';
    for i := 1 to Length(stmp) do
    begin
      if (stmp[i] = Uppercase(stmp[i])) then
        snew := snew + Lowercase(stmp[i])
      else
       snew := snew + Uppercase(stmp[i]);
    end;
    Editor.ReplaceSel(snew);
  end;


  Editor.SetSelectionStart(iPos);
  Editor.SetSelectionEnd(iPos);
  Editor.Lines.EndUpdate;
end;

procedure AlignChar(sAlignChar: String; sciEditor: TDScintilla);
var
    i, j,  iLine1, iLine2, iMaxRight, iResult: Integer;
    CharPos: Array of Integer;
    CharPosLeft: Array of Integer;
    sFill: String;

  function FillSpace(iSpaces: Integer): String;
    var i: Integer;
  begin
    Result := '';
    for i := 1 to iSpaces do
      Result := Result + ' ';
  end;
begin

  with sciEditor do
  begin
    sAlignChar := '=';
    iMaxRight:= 0;

    // Loops through all selections and all lines within selections. For each
    // line on which sAlignCharacter is found it saves its position in a
    // dynamic array.
    // iMaxRight saves the position of the most right sAlignCharacter.


    for i := GetSelections-1 downto 0 do
    begin
      iLine1 := LineFromPosition(GetSelectionNStart(i));
      iLine2 := LineFromPosition(GetSelectionNEnd(i));

      for j := iLine1 to iLine2 do
      begin
        SetTargetStart(GetLineSelStartPosition(j));
        SetTargetEnd(GetLineSelEndPosition(j));
        iResult := SearchInTarget(sAlignChar);

        if iResult > -1 then
        begin
          Setlength(CharPos, length(CharPos)+1);
          Setlength(CharPosLeft, length(CharPosLeft)+1);
          CharPos[length(CharPos)-1] := iResult;
          CharPosLeft[length(CharPosLeft)-1] := iResult - PositionFromLine(j);
          if CharPosLeft[length(CharPosLeft)-1] > iMaxRight then
            iMaxRight := CharPosLeft[length(CharPosLeft)-1] ;
        end;
      end;
    end;



    if length(CharPos) > 0   then
    begin
      if GetSelectionNStart(GetSelections-1) <= GetSelectionNStart(0)  then
      for i := length(CharPos)-1 downto 0 do
      begin
        sFill := FillSpace(iMaxRight-CharPosLeft[i]);
        if length(sFill) > 0 then
          InsertText(CharPos[i], sFill);
      end
      else
      for i := 0 to length(CharPos)-1 do
      begin
        sFill := FillSpace(iMaxRight-CharPosLeft[i]);
        if length(sFill) > 0 then
          InsertText(CharPos[i], sFill);
      end;
    end;
  end;
end;


procedure Find(seEditor: TDScintilla);
begin
  // Show find box
  ShowSearchReplaceDialog(seEditor, False);
end;


procedure ShowSearchReplaceDialog(seEditor: TDScintilla; bReplace: Boolean);
var
  dlg: TfrmSearchDialog;

begin
  if bReplace then
    dlg := TfrmReplaceDialog.Create(seEditor.parent)
  else
    dlg := TfrmSearchDialog.Create(seEditor.parent);

  with dlg do
    try
      // Assign search options
      SearchBackwards := frmTinnMain.bSearchBackwards;
      SearchCaseSensitive := frmTinnMain.bSearchCaseSensitive;
      SearchFromCursor := frmTinnMain.bSearchFromCursor;
      SearchRegularExpression := frmTinnMain.bSearchRegExp;
      SearchText := frmTinnMain.sSearchText; // start with last search text
      SearchTextHistory := frmTinnMain.sSearchTextHistory;
      SearchWholeWords := frmTinnMain.bSearchWholeWords;

      with seEditor do
      begin

        SearchInSelectionOnly := (GetSelText <> '');

        if (GetSelText <> '') then
        begin
          rgSearchOrigin.Enabled := False;
          SearchFromCursor := False;
          if (LineFromPosition(seEditor.GetSelectionStart) = LineFromPosition(seEditor.GetSelectionEnd)) then
            SearchText := GetSelText
          else
            SearchText := ''
        end
        else
        begin
          rgSearchOrigin.Enabled := True;

          SearchText := GetWordFromPos(seEditor.GetCurrentPos, seEditor);
        end;
      end;

      if bReplace then
        with dlg as TfrmReplaceDialog do
        begin
          ReplaceText := frmTinnMain.sReplaceText;
          ReplaceTextHistory := frmTinnMain.sReplaceTextHistory;
        end;

      if (ShowModal = mrOK) then
      begin
        frmTinnMain.bSearchSelectionOnly := SearchInSelectionOnly;
        frmTinnMain.bSearchBackwards := SearchBackwards;
        frmTinnMain.bSearchCaseSensitive := SearchCaseSensitive;
        frmTinnMain.bSearchFromCursor := SearchFromCursor;
        frmTinnMain.bSearchRegExp := SearchRegularExpression;
        frmTinnMain.bSearchWholeWords := SearchWholeWords;
        frmTinnMain.sSearchTextHistory := SearchTextHistory;
        frmTinnMain.sSearchText := SearchText;

        if bReplace then
          with dlg as TfrmReplaceDialog do
          begin
            frmTinnMain.sReplaceText := ReplaceText;
            frmTinnMain.sReplaceTextHistory := ReplaceTextHistory;
          end;

        if (frmTinnMain.sSearchText <> EmptyStr) then
          DoSearchReplaceText(seEditor, bReplace, False);

        if frmTinnMain.sciLastSearchEditor <> nil then
         frmTinnMain.sciLastSearchEditor.SetFocus;

      end;

    finally
      FreeAndNil(dlg);
    end;
end;


procedure DoSearchReplaceText(seEditor: TDScintilla; bReplace, bSearchAgain: Boolean;
  bMessage: Boolean = True; bReplaceAll: Boolean = False; iFirstFound: Integer = -1; iLoopCount: Integer = 0);
var
  //synSearchOptions: TSynSearchOptions;

  iResult: Integer;
  sflags, ipos, selend, fnd,  ishift, i: Integer;
  seltext: String;
  ReplaceAction: Integer;
  bFound: Boolean;
  is1, is2: array of Integer;



  procedure GetAllSelections;
    var i: Integer;

  begin
    Setlength(is1, seEditor.GetSelections);
    Setlength(is2, seEditor.GetSelections);

    if Length(is1)>0 then
      for i := 0 to Length(is1)-1 do
      begin
        is1[i] := seEditor.GetSelectionNStart(i);
        is2[i] := seEditor.GetSelectionNEnd(i);

      end;

  end;
  procedure AdaptSelection(shift, start: Integer; dirup: Boolean);
  var j: Integer;
  begin
    if dirup then
      for j := start+1 to length(is1)-1 do
      begin
        is1[j] := is1[j]+shift;
        is2[j] := is2[j]+shift;
      end;

    if not dirup then
      for j := start-1 downto 0 do
      begin
        is1[j] := is1[j]+shift;
        is2[j] := is2[j]+shift;

      end;
  end;



begin

 if iLoopCount > 2  then
 begin
   MessageDlg('Replace is probably caught in a loop!', mtWarning, [mbOK], 0);
   exit;
 end;


  {
  if bReplace then
    synSearchOptions := [ssoPrompt, ssoReplace, ssoReplaceAll]
  else
    synSearchOptions := [];

  if frmTinnMain.bSearchBackwards then
    Include(synSearchOptions, ssoBackwards);
  if frmTinnMain.bSearchCaseSensitive then
    Include(synSearchOptions, ssoMatchCase);
  if not bSearchAgain then
    if not frmTinnMain.bSearchFromCursor then
      Include(synSearchOptions, ssoEntireScope);
  if bSearchSelectionOnly then
    Include(synSearchOptions, ssoSelectedOnly);
  if frmTinnMain.bSearchWholeWords then
    Include(synSearchOptions, ssoWholeWord);
  }


  sflags := 0;
  if frmTinnMain.bSearchWholeWords then
    sflags := sflags + SCFIND_WHOLEWORD;
  if frmTinnMain.bSearchCaseSensitive then
    sflags := sflags + SCFIND_MATCHCASE;
  //if cbwordstart.checked then
  //sflags := sflags + SCFIND_WORDSTART;
  if frmTinnMain.bSearchRegExp then
    sflags := sflags + SCFIND_REGEXP;

  ipos := seEditor.GetSelectionStart;
  selend := seEditor.GetSelectionEnd;
  seltext:= seEditor.GetSelText;


  with seEditor, frmTinnMain do
  begin
    if not bSearchSelectionOnly then
    begin
      if not frmTinnMain.bSearchBackwards then
      begin
        ipos := seEditor.GetCurrentPos;

        if bSearchAgain then
        begin
          seEditor.SetCurrentPos(seEditor.GetCurrentPos+1);
          seEditor.SearchAnchor;
        end
        else
        begin
          if frmTinnMain.bSearchFromCursor then
          begin
          seEditor.SearchAnchor;
          end else
          begin
            seEditor.SetCurrentPos(0);
            seEditor.SearchAnchor;
          end;
        end;

        iResult := seEditor.SearchNext(sflags, sSearchText);

        if (iResult = -1) and (seEditor.GetAnchor <> 0) then
        begin
          seEditor.SetCurrentPos(0);
          seEditor.SearchAnchor;
          inc(iLoopCount);
          iResult := seEditor.SearchNext(sflags, sSearchText);
        end;

        if (iResult > -1) and (iResult <> iFirstFound) then
        begin
          seEditor.ScrollCaret;
          seEditor.EnsureVisible(seEditor.LineFromPosition(seEditor.GetCurrentPos));
          if bReplace then
          begin

            if not bReplaceAll then
              begin
                ReplaceAction := MessageDlg('Replace '+quotedstr(GetSelText)+'?', mtConfirmation, [mbYes, mbYesToAll, mbNo, mbCancel],0);
                if ReplaceAction = mrYesToAll then
                  bReplaceAll := True;
              end else ReplaceAction := mrYesToAll;
            if iFirstFound = -1 then
              iFirstFound := iResult;
            //showmessage(inttostr(iFirstFound));
            case ReplaceAction of
              mrAbort: exit;
              mrNo: begin

                        DoSearchReplaceText(seEditor, bReplace, true, bMessage, bReplaceAll, iFirstFound, iLoopCount);
                      end;
              mrYes, mrYesToAll: begin
                                         if iResult < iFirstFound  then
                                           iFirstFound := iFirstFound + Length(sReplaceText) - Length(GetSelText);
                                         ReplaceSel(sReplaceText);
                                         DoSearchReplaceText(seEditor, bReplace, true, bMessage, bReplaceAll, iFirstFound, iLoopCount);
                                       end;

            end;
          end;

        end else
        begin
         seEditor.SetCurrentPos(iPos);
         seEditor.SetAnchor(iPos);
        end;

        if ((iResult = -1) and (iFirstFound = -1)) and bMessage then
        begin
          MessageBeep(MB_ICONASTERISK);
          MessageDlg('Text not found!', mtInformation, [mbOK], 0);
        end;

      end else
      begin



        ipos := seEditor.GetCurrentPos;

        if bSearchAgain then
        begin
          seEditor.SetCurrentPos(seEditor.GetCurrentPos-1);
          seEditor.SearchAnchor;
          if seEditor.GetCurrentPos = 0 then
            seEditor.DocumentEnd;
            seEditor.SearchAnchor;
        end
        else
        begin
          if frmTinnMain.bSearchFromCursor then
          begin
          seEditor.SearchAnchor;
          end else
          begin
            seEditor.SetCurrentPos(seEditor.GetLength);
            seEditor.SearchAnchor;
          end;

        end;

        iResult := seEditor.SearchPrev(sflags, sSearchText);

        if (iResult = -1) and (seEditor.GetAnchor < Length(seEditor.GetText) - 1) then
        begin

          seEditor.DocumentEnd;
            seEditor.SearchAnchor;
          inc(iLoopCount);
          iResult := seEditor.SearchPrev(sflags, sSearchText);
        end;

        if (iResult > -1) and (iResult <> iFirstFound) then
        begin
          seEditor.ScrollCaret;
          seEditor.EnsureVisible(seEditor.LineFromPosition(seEditor.GetCurrentPos));

          if bReplace then
          begin

            if not bReplaceAll then
              begin
                ReplaceAction := MessageDlg('Replace '+quotedstr(GetSelText)+'?', mtConfirmation, [mbYes, mbYesToAll, mbNo, mbCancel],0);
                if ReplaceAction = mrYesToAll then
                  bReplaceAll := True;
              end else ReplaceAction := mrYesToAll;
            if iFirstFound = -1 then
              iFirstFound := iResult;
            case ReplaceAction of
              mrCancel: exit;
              mrNo: begin

                        DoSearchReplaceText(seEditor, bReplace, true, bMessage, bReplaceAll, iFirstFound, iLoopCount);
                      end;
              mrYes, mrYesToAll: begin
                                         if iResult < iFirstFound  then
                                           iFirstFound := iFirstFound + Length(sReplaceText) - Length(GetSelText);
                                         ReplaceSel(sReplaceText);
                                         DoSearchReplaceText(seEditor, bReplace, true, bMessage, bReplaceAll, iFirstFound, iLoopCount);
                                       end;

            end;
          end;

        end else
        begin
         seEditor.SetCurrentPos(iPos);
         seEditor.SetAnchor(iPos);
        end;

        if ((iResult = -1) and (iFirstFound = -1)) and bMessage then
        begin
          MessageBeep(MB_ICONASTERISK);
          MessageDlg('Text not found!', mtInformation, [mbOK], 0);
        end;

      end;
    // Search in selection
    end else
    begin
      GetAllSelections;

      if length(is1) = 0 then
        exit;

      if is1[0] <= is1[length(is1)-1] then
      begin

        for i := 0 to length(is1)-1 do
        begin
          iResult := -2;
          while (bReplace and (iResult <> -1)) or (not bReplace and (iResult = -2)) do
          begin
            seEditor.SetTargetStart(is1[i]);
            seEditor.SetTargetEnd(is2[i]);
            seEditor.SetSearchFlags(sflags);

            iResult := seEditor.SearchInTarget(sSearchText);
            if (iResult > -1) then
            begin
              bFound := true;
              if not bReplace then
                begin
                  seEditor.SetSel(seEditor.GetTargetStart, seEditor.GetTargetEnd);
                  seEditor.ScrollCaret;
                  break;
                end else
                begin

                  if not bReplaceAll then
                  begin
                    seEditor.SetSel(seEditor.GetTargetStart, seEditor.GetTargetEnd);
                    seEditor.ScrollCaret;

                    ReplaceAction := MessageDlg('Replace '+quotedstr(GetTextRange(seEditor.GetTargetStart, seEditor.GetTargetEnd))+'?', mtConfirmation, [mbYes, mbYesToAll, mbNo, mbCancel],0);
                    if ReplaceAction = mrYesToAll then
                      bReplaceAll := True;
                  end else ReplaceAction := mrYesToAll;
                  if iFirstFound = -1 then
                    iFirstFound := iResult;

                  case ReplaceAction of
                    mrCancel: exit;
                    mrNo: begin
                            is1[i] := seEditor.GetTargetEnd;
                          end;
                    mrYes, mrYesToAll:
                          begin
                            ishift := length(sReplaceText) - (seEditor.GetTargetEnd - seEditor.GetTargetStart);
                            seEditor.ReplaceTarget(sReplaceText);
                            is1[i] := seEditor.GetTargetEnd;
                            is2[i] := is2[i] + ishift;
                            AdaptSelection(ishift, i, true);
                          end;
                  end;


                end;
            end;
          end;

        end;
      end else
      begin
        for i := length(is1)-1 downto 0 do
        begin
          iResult := -2;
          while (bReplace and (iResult <> -1)) or (not bReplace and (iResult = -2)) do
          begin
            seEditor.SetTargetStart(is1[i]);
            seEditor.SetTargetEnd(is2[i]);
            seEditor.SetSearchFlags(sflags);

            iResult := seEditor.SearchInTarget(sSearchText);
            if (iResult > -1) then
            begin
              bFound := true;
              if not bReplace then
                begin
                  seEditor.SetSel(seEditor.GetTargetStart, seEditor.GetTargetEnd);
                  seEditor.ScrollCaret;
                  break;
                end else
                begin

                  if not bReplaceAll then
                  begin
                    seEditor.SetSel(seEditor.GetTargetStart, seEditor.GetTargetEnd);
                    seEditor.ScrollCaret;

                    ReplaceAction := MessageDlg('Replace '+quotedstr(GetTextRange(seEditor.GetTargetStart, seEditor.GetTargetEnd))+'?', mtConfirmation, [mbYes, mbYesToAll, mbNo, mbAbort],0);
                    if ReplaceAction = mrYesToAll then
                      bReplaceAll := True;
                  end else ReplaceAction := mrYesToAll;
                  if iFirstFound = -1 then
                    iFirstFound := iResult;

                  case ReplaceAction of
                    mrAbort: exit;
                    mrNo: begin
                            is1[i] := seEditor.GetTargetEnd;
                          end;
                    mrYes, mrYesToAll:
                          begin
                            ishift := length(sReplaceText) - (seEditor.GetTargetEnd - seEditor.GetTargetStart);
                            seEditor.ReplaceTarget(sReplaceText);
                            is1[i] := seEditor.GetTargetEnd;
                            is2[i] := is2[i] + ishift;
                            AdaptSelection(ishift, i, false);
                          end;
                  end;


                end;
            end;
          end;

        end;
      end;
      if (not bFound) and bMessage then
      begin
        MessageBeep(MB_ICONASTERISK);
        MessageDlg('Text not found!', mtInformation, [mbOK], 0);
      end;

    end;
  end;
end;

procedure Replace(seEditor: TDScintilla);
begin

   if seEditor.Parent.ClassName = 'TfrmEditor' then
   with seEditor.Parent AS TfrmEditor do
   begin
      if not sciEditor.GetReadOnly then
      begin
        ShowSearchReplaceDialog(seEditor, True);

        if (sActiveEditor = 'sciEditor2') then
          sciEditor.Lines := sciEditor2.Lines
        else if Assigned(sciEditor2) then
          sciEditor2.Lines := sciEditor.Lines;

        frmTinnMain.actFileSave.Enabled := True;
        SetTitles;
      end
      else
        MessageDlg(EditorFile.sFile + #13 + #13 + 'The file is set as read only.' + #13 +
          'Search/Replace will not work!', mtWarning, [mbOK], 0);
   end else  ShowSearchReplaceDialog(seEditor, True);
end;



procedure FindAgain;
var seEditor: TDScintilla;
begin
  seEditor := frmTinnMain.GetEditorWithFocus;

  if seEditor = nil then
    exit;

  frmTinnMain.bSearchSelectionOnly := False;

  if (frmTinnMain.sSearchText = EmptyStr) then
    ShowSearchReplaceDialog(seEditor, False)
  else
    DoSearchReplaceText(seEditor, False, True);
end;

procedure SetCursorInInsertion(sText: String; var iStart, iEnd: Integer; var bDeleteSelection: Boolean);
var iEnd2: Integer;
begin
  bDeleteSelection := false;
  // 1. check for |
  iStart := ansipos('|', sText);
  if iStart >0 then
  begin
    iEnd := iStart + ansipos('|', copy(sText, iStart+1, length(sText)-iStart));
    iStart := iStart -1;
    bDeleteSelection := true;
 //   exit;
  end else
    begin
    // 2. select the first word after (
    iStart := ansipos('(', sText);
    if iStart >0 then
    begin

      iEnd := ansipos(',', copy(sText, iStart+1, length(sText)-iStart));
      iEnd2 := ansipos(')', copy(sText, iStart+1, length(sText)-iStart));

      if iEnd2 = 0 then
        iEnd2 := iEnd;
      if iEnd = 0 then
        iEnd := iEnd2;
      if (iEnd2 < iEnd) then
        iEnd := iEnd2;
      if iEnd > 0 then
        iEnd := iStart+iEnd-1 else iEnd := iStart;
      bDeleteSelection := false;
      //exit;
    end else
    begin
      // 3. set cursor at the end
      iStart := length(sText);
      iEnd := iStart;
      bDeleteSelection := false;
    end;
  end;


end;




procedure InsertDatabaseEntry(sInsertField: String; Database: TClientDataSet; AllArguments: Boolean = True);
var
  seEditor: TDScintilla;

  sFunction, sTmp: string;

  slTmp: TStringList;
  bReplaceText, bDel: Boolean;
  iPos, iPriPos, i, iStart, iEnd, iLastOpenBracket: Integer;

begin
  seEditor := frmTinnMain.GetEditorWithFocus;

  if not assigned(Database) then
    Exit;

  if (seEditor = nil) OR (not Database.Active) then
    Exit;
  if Database.FieldByName(sInsertField).IsNull then
    exit;

  sFunction := Database.FieldValues[sInsertField];


  iPos := pos('(', sFunction);

  if not AllArguments then
    if iPos > 0 then
    begin
      sFunction := copy(sFunction, 1, iPos);
      ipos := 0;

    end;

  sTmp := copy(sFunction, iPos + 1, length(sFunction) - (iPos + 1));

  with seEditor do
  begin
    iPos := GetCurrentPos;
    iPriPos := GetCaretX(seEditor);
    for i := length(sFunction) downto 1 do
      if ansilowercase((system.copy(sFunction, 1, i)))
        = ansilowercase((system.copy(GetCurrentLine(seEditor), iPriPos - i + 1, i))) then
      begin
        bReplaceText := True;
        break;
      end;

    if bReplaceText then
    begin
      SetSelectionStart(GetSelectionStart - i);
      SetSelectionEnd(GetSelectionStart + i);
      ReplaceSel('');
      iPriPos := iPriPos - i;
    end;
    ReplaceSel(sFunction);

    SetCursorInInsertion(sFunction , iStart, iEnd, bDel);
    SetSelectionStart(iPos-i+iStart);
    SetSelectionEnd(iPos-i+iEnd);
    if bDel then
      ReplaceSel('');

    if Parent.ClassName = 'TfrmEditor' then
     (Parent as TfrmEditor).EnableSave;
    SetFocus;

    iLastOpenBracket := FindLastOpenBracket(seEditor, getCurrentPos-1);
    if iLastOpenBracket > -1 then
      begin
          ShowBracketTip(seEditor, iLastOpenBracket-1);
    end;
  end;
end;


procedure InvertCaseScintilla(sciEditor: TDScintilla);
var i: Integer;
begin
with sciEditor do
begin
  for i := GetSelections-1 downto 0 do
  begin
   SetTargetStart(GetSelectionNStart(i));
   SetTargetEnd(GetSelectionNEnd(i));
   ReplaceTarget(InvertCaseText(GetTextRange(GetSelectionNStart(i), GetSelectionNEnd(i))));
  end;
end;
end;



function InvertCaseText(sText: String): String;
 var i : Integer;
begin
  //source: http://www.delphipages.com/forum/showthread.php?t=71302
  Result := '';
  for i := 1 to Length(sText) do
  begin
    if (sText[i] = Uppercase(sText[i])) then
    begin
      Result := Result + LowerCase(sText[i]);
    end
    else
      Result := Result + UpperCase(sText[i]);
  end;
end;


end.

// From: http://delphi.wikia.com/wiki/Capture_Console_Output_Realtime_To_Memo
{ m.p.

  procedure CaptureConsoleOutput(const ACommand, AParameters: String; CallBack: TArg<PAnsiChar>);
  const
  CReadBuffer = 2400;
  var
  saSecurity: TSecurityAttributes;
  hRead: THandle;
  hWrite: THandle;
  suiStartup: TStartupInfo;
  piProcess: TProcessInformation;
  pBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dBuffer: array [0 .. CReadBuffer] of AnsiChar;
  dRead: DWORD;
  dRunning: DWORD;
  dAvailable: DWORD;
  begin
  showmessage('\\m.p. help ------ this function seems to be unused !!!');
  saSecurity.nLength := SizeOf(TSecurityAttributes);
  saSecurity.bInheritHandle := true;
  saSecurity.lpSecurityDescriptor := nil;
  if CreatePipe(hRead, hWrite, @saSecurity, 0) then
  try
  FillChar(suiStartup, SizeOf(TStartupInfo), #0);
  suiStartup.cb := SizeOf(TStartupInfo);
  suiStartup.hStdInput := hRead;
  suiStartup.hStdOutput := hWrite;
  suiStartup.hStdError := hWrite;
  suiStartup.dwFlags := STARTF_USESTDHANDLES or STARTF_USESHOWWINDOW;
  suiStartup.wShowWindow := SW_HIDE;
  if CreateProcess(nil, PChar(ACommand + ' ' + AParameters), @saSecurity, @saSecurity, true, NORMAL_PRIORITY_CLASS, nil, nil, suiStartup,
  piProcess) then
  try
  repeat
  dRunning := WaitForSingleObject(piProcess.hProcess, 100);
  PeekNamedPipe(hRead, nil, 0, nil, @dAvailable, nil);
  if (dAvailable > 0) then
  repeat
  dRead := 0;
  ReadFile(hRead, pBuffer[0], CReadBuffer, dRead, nil);
  pBuffer[dRead] := #0;
  OemToCharA(pBuffer, dBuffer);
  CallBack(dBuffer);
  until (dRead < CReadBuffer);
  Application.ProcessMessages;
  until (dRunning <> WAIT_TIMEOUT);
  finally
  CloseHandle(piProcess.hProcess);
  CloseHandle(piProcess.hThread);
  end;
  finally
  CloseHandle(hRead);
  CloseHandle(hWrite);
  end;
  end; }


