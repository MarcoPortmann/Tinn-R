unit folderView;

// -----------------------------------------------------------------------------
// Application:     TextDiff                                                   .
// Module:          FolderView                                                 .
// Version:         4.1                                                        .
// Date:            16-JAN-2004                                                .
// Target:          Win32, Delphi 7                                            .
// Author:          Angus Johnson - angusj-AT-myrealbox-DOT-com                .
// Copyright;       © 2003-2004 Angus Johnson                                  .
// -----------------------------------------------------------------------------

(*
  Changed/adapted by José Cláudio Faria: 05/05/2005
  for use in Tinn-R project
*)

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ExtCtrls, ufrmDiffMain, ShellApi, ShlObj, DirWatch;

type
  TFolderDiff = (fdNone, fdAdded, fdDeleted, fdModified);

  PFolderRec = ^TFolderRec;

  TFolderRec = record
    Name: string;
    IsDirectory: boolean;
    Size: cardinal;
    Modified: TDatetime;
    Difference: TFolderDiff;
  end;

  TfrmFoldersFrame = class(TFrame)
    pnlMain: TPanel;
    Splitter1: TSplitter;
    pnlLeft: TPanel;
    pnlCaptionLeft: TPanel;
    sgFolder1: TStringGrid;
    pnlRight: TPanel;
    pnlCaptionRight: TPanel;
    sgFolder2: TStringGrid;
    procedure sgFolder1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgFolder1TopLeftChanged(Sender: TObject);
    procedure sgFolder1Click(Sender: TObject);
    procedure FrameResize(Sender: TObject);
    procedure sgFolder1DblClick(Sender: TObject);
  private
    fDiffResultStr: string;
    fFoldersCompared: boolean;
    fFolderBmp: TBitmap;
    fBulletBmp: TBitmap;
    fFolder1StringList: TStringList;
    fFolder2StringList: TStringList;
    fDirectoryWatch1: TDirectoryWatch;
    fDirectoryWatch2: TDirectoryWatch;
    procedure LoadFolderList(const Path: string; IsFolder1: boolean);
    procedure DisplayFolderList(IsFolder1: boolean);
    procedure ClearFolderSL(folderSL: TStringList);
    procedure DiffFolders;

    procedure OpenClick(Sender: TObject);
    procedure CompareClick(Sender: TObject);
    procedure DirectoryWatchOnChange(Sender: TObject);
  public
    procedure Setup;
    procedure Cleanup;
    procedure SetMenuEventsToFolderView;
    procedure DoOpenFolder(const Foldername: string; IsFolder1: boolean);
  end;

implementation

uses FileView;

{$R *.dfm}
{$R folder.res}
// ------------------------------------------------------------------------------
// Miscellaneous functions ...
// ------------------------------------------------------------------------------

function MakeLighter(Color: TColor): TColor;
var
  r, g, b: byte;
begin
  Color := ColorToRGB(Color);
  b := (Color and $FF0000) shr 16;
  g := (Color and $FF00) shr 8;
  r := (Color and $FF);
  b := 255 - ((255 - b) * 1 div 2);
  g := 255 - ((255 - g) * 1 div 2);
  r := 255 - ((255 - r) * 1 div 2);
  Result := (b shl 16) or (g shl 8) or r;
end;
// ------------------------------------------------------------------------------

function max(int1, int2: Integer): Integer;
begin
  if int1 > int2 then
    Result := int1
  else
    Result := int2;
end;
// ------------------------------------------------------------------------------

function FileTime2DateTime(FileTime: TFileTime): TDatetime;
var
  LocalFileTime: TFileTime;
  SystemTime: TSystemTime;
begin
  FileTimeToLocalFileTime(FileTime, LocalFileTime);
  FileTimeToSystemTime(LocalFileTime, SystemTime);
  Result := SystemTimeToDateTime(SystemTime);
end;
// ------------------------------------------------------------------------------

// BrowseProc() is used by GetFolder() to set the initial folder and display
// the path for the currently selected folder.
function BrowseProc(hwnd: hwnd; uMsg: Integer; lParam, lpData: lParam)
  : Integer; stdcall;
var
  sfi: TSHFileInfo;
begin
  case uMsg of
    BFFM_INITIALIZED:
      begin
        SendMessage(hwnd, BFFM_SETSTATUSTEXT, 0, lpData);
        SendMessage(hwnd, BFFM_SETSELECTION, 1, lpData);
      end;
    BFFM_SELCHANGED:
      begin
        ShGetFileInfo(PChar(lParam), 0, sfi, sizeof(sfi), SHGFI_DISPLAYNAME or
          SHGFI_PIDL);
        SendMessage(hwnd, BFFM_SETSTATUSTEXT, 0, Integer(@sfi.szDisplayName));
      end;
  end;
  Result := 0;
end;
// ------------------------------------------------------------------------------

procedure CoTaskMemFree(pv: Pointer); stdcall;
  external 'ole32.dll' name 'CoTaskMemFree';

// ------------------------------------------------------------------------------

function StripSlash(const Path: string): string;
var
  len: Integer;
begin
  Result := Path;
  len := length(Path);
  if (len = 0) or (Path[len] <> '\') then
    exit;
  setlength(Result, len - 1);
end;
// ------------------------------------------------------------------------------

function AppendSlash(const Path: string): string;
var
  len: Integer;
begin
  len := length(Path);
  if (len = 0) or (Path[len] = '\') then
    Result := Path
  else
    Result := Path + '\';
end;
// ------------------------------------------------------------------------------

function GetFolder(OwnerForm: TForm; const Caption: string;
  var Folder: string): boolean;
var
  displayname: array [0 .. MAX_PATH] of char;
  bi: TBrowseInfo;
  pidl: PItemIdList;
begin
  bi.hWndOwner := OwnerForm.Handle;
  bi.pIDLRoot := nil;
  bi.pszDisplayName := PChar(@displayname[0]);
  bi.lpszTitle := PChar(Caption);
  bi.ulFlags := BIF_RETURNONLYFSDIRS or BIF_STATUSTEXT;
  bi.lpfn := @BrowseProc;
  if Folder <> '' then
    Folder := StripSlash(Folder);
  bi.lParam := Integer(PChar(Folder));
  bi.iImage := 0;
  pidl := SHBrowseForFolder(bi);
  Result := pidl <> nil;
  if Result then
    try
      Result := SHGetPathFromIDList(pidl, PChar(@displayname[0]));
      Folder := displayname;
    finally
      CoTaskMemFree(pidl);
    end;
end;

// ------------------------------------------------------------------------------
// TFoldersFrame methods
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.Setup;
begin

  fFolderBmp := TBitmap.create;
  fFolderBmp.LoadFromResourceName(hInstance, 'FOLDER');
  fFolderBmp.Transparent := true;

  fBulletBmp := TBitmap.create;
  fBulletBmp.LoadFromResourceName(hInstance, 'BULLET');
  fBulletBmp.Transparent := true;

  fDirectoryWatch1 := TDirectoryWatch.create(frmDiffMain);
  fDirectoryWatch1.OnChange := DirectoryWatchOnChange;
  fDirectoryWatch2 := TDirectoryWatch.create(frmDiffMain);
  fDirectoryWatch2.OnChange := DirectoryWatchOnChange;

  fFolder1StringList := TStringList.create;
  fFolder2StringList := TStringList.create;
  with sgFolder1 do
  begin
    cells[0, 0] := 'Name';
    cells[1, 0] := 'Size';
    cells[2, 0] := 'Modified';
  end;
  with sgFolder2 do
  begin
    cells[0, 0] := 'Name';
    cells[1, 0] := 'Size';
    cells[2, 0] := 'Modified';
  end;

  sgFolder1.ColWidths[1] := frmDiffMain.Canvas.TextWidth
    (format('    %1.0n KB', [1024 * 99000 / 1]));
  sgFolder2.ColWidths[1] := sgFolder1.ColWidths[1];

  sgFolder1.ColWidths[2] := frmDiffMain.Canvas.TextWidth
    (formatDatetime(FormatSettings.ShortDateFormat + '        ' +
    FormatSettings.ShortTimeFormat, 0));
  sgFolder2.ColWidths[2] := sgFolder1.ColWidths[2];

end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.Cleanup;
begin
  fFolderBmp.free;
  fBulletBmp.free;
  ClearFolderSL(fFolder1StringList);
  ClearFolderSL(fFolder2StringList);
  fFolder1StringList.free;
  fFolder2StringList.free;
  fDirectoryWatch1.free;
  fDirectoryWatch2.free;
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.SetMenuEventsToFolderView;
begin
  with frmDiffMain do
  begin
    tbFolder.ImageIndex := ufrmDiffMain.folderView;
    tbFolder.Hint := 'Toggle to file view';
    tbOpen1.Hint := 'Open folder 1';
    tbOpen2.Hint := 'Open folder 2';
    mnuOpen1.OnClick := OpenClick;
    mnuOpen2.OnClick := OpenClick;
    tbOpen1.OnClick := OpenClick;
    tbOpen2.OnClick := OpenClick;
    mnuOpen1.Caption := 'Open folder 1';
    mnuOpen2.Caption := 'Open folder 2';
    tbOpen1.Hint := 'Open folder 1';
    tbOpen2.Hint := 'Open folder 2';

    mnuSave1.Enabled := false;
    mnuSave2.Enabled := false;
    tbSave1.Enabled := false;
    tbSave2.Enabled := false;

    mnucompare.OnClick := CompareClick;
    mnucompare.Enabled := not fFoldersCompared and
      (fFolder1StringList.Count > 0) and (fFolder2StringList.Count > 0);
    tbCompare.OnClick := CompareClick;
    tbCompare.Enabled := mnucompare.Enabled;

    mnuEdit.Enabled := false;
    mnuSearch.Enabled := false;
    mnuOptions.Enabled := false;

    tbHorzSplit.Enabled := false;
    tbFind.Enabled := false; // JCFaria
    tbReplace.Enabled := false;

    mnuCopyBlockLeft.Visible := false;
    mnuCopyBlockRight.Visible := false;
    N1.Visible := false;
    mnuCompareFiles.Visible := true;
    mnuCompareFiles.OnClick := sgFolder1DblClick;
    mnuNext.Visible := false;
    mnuPrev.Visible := false;
    tbNext.Enabled := false;
    tbPrev.Enabled := false;

    mnuSaveReport.Enabled := false;

    application.OnActivate := nil;
    if fFoldersCompared then
      Statusbar1.Panels[3].text := fDiffResultStr
    else
      Statusbar1.Panels[3].text := '';
    ActiveControl := sgFolder1;
  end;
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.OpenClick(Sender: TObject);
var
  IsFolder1: boolean;
begin
  with frmDiffMain do
    IsFolder1 := (Sender = mnuOpen1) or (Sender = tbOpen1);
  if IsFolder1 then
  begin
    if not GetFolder(frmDiffMain, 'Open folder 1', LastOpenedFolder1) then
      exit;
    DoOpenFolder(LastOpenedFolder1, true)
  end
  else
  begin
    if not GetFolder(frmDiffMain, 'Open folder 2', LastOpenedFolder2) then
      exit;
    DoOpenFolder(LastOpenedFolder2, false);
  end;
end;
// ---------------------------------------------------------------------

procedure TfrmFoldersFrame.DoOpenFolder(const Foldername: string;
  IsFolder1: boolean);
begin
  if IsFolder1 then
  begin
    LastOpenedFolder1 := Foldername;
    fDirectoryWatch1.Directory := Foldername;
    fDirectoryWatch1.Active := true;
  end
  else
  begin
    LastOpenedFolder2 := Foldername;
    fDirectoryWatch2.Directory := Foldername;
    fDirectoryWatch2.Active := true;
  end;
  LoadFolderList(Foldername, IsFolder1);

  frmDiffMain.Statusbar1.Panels[3].text := '';
  if not fFoldersCompared then
    exit;
  // reload the other folder too otherwise comparing will be broken
  // nb: LastOpenedFolders may have been changed in filesview so ...
  if IsFolder1 then
    LoadFolderList(trim(pnlCaptionRight.Caption), false)
  else
    LoadFolderList(trim(pnlCaptionLeft.Caption), true);
  fFoldersCompared := false;
end;
// ---------------------------------------------------------------------

procedure TfrmFoldersFrame.DirectoryWatchOnChange(Sender: TObject);
begin
  // a file or folder has been added, deleted or modified in
  // one of the directories so reload the directory list ...
  if Sender = fDirectoryWatch1 then
    DoOpenFolder(LastOpenedFolder1, true)
  else
    DoOpenFolder(LastOpenedFolder2, false);
end;
// ---------------------------------------------------------------------

procedure TfrmFoldersFrame.sgFolder1DrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  idx, textLen: Integer;
  FolderStringList: TStringList;
  sgFolder: TStringGrid;
begin
  if Sender = sgFolder1 then
  begin
    FolderStringList := fFolder1StringList;
    sgFolder := sgFolder1;
  end
  else
  begin
    FolderStringList := fFolder2StringList;
    sgFolder := sgFolder2;
  end;

  idx := ARow - 1;
  with sgFolder, Canvas do
  begin

    if (ARow > 0) and (FolderStringList.Count = 0) then
    begin
      brush.Color := Color;
      FillRect(Rect);
      exit;
    end;

    if gdFixed in State then
      brush.Color := clBtnFace
    else if (FolderStringList.Count = 0) then
      brush.Color := Color
    else
      case PFolderRec(FolderStringList.objects[idx]).Difference of
        fdNone:
          brush.Color := Color;
        fdAdded:
          brush.Color := AddClr;
        fdDeleted:
          brush.Color := DelClr;
        fdModified:
          brush.Color := ModClr;
      end;

    if gdSelected in State then
      brush.Color := MakeLighter(brush.Color);

    if ACol = 0 then
    begin
      textRect(Rect, Rect.Left + 24, Rect.Top + 2, cells[ACol, ARow]);
      if (idx < FolderStringList.Count) and not(gdFixed in State) then
      begin
        with PFolderRec(FolderStringList.objects[idx])^ do
          if Name = '' then { draw no image }
          else if IsDirectory then
            Draw(Rect.Left + 4, Rect.Top + 2, fFolderBmp)
          else
            Draw(Rect.Left + 4, Rect.Top + 2, fBulletBmp);
      end;

    end
    else if ACol < 3 then
    begin
      // right align ...
      textLen := TextExtent(cells[ACol, ARow]).cx;
      textRect(Rect, Rect.Right - textLen - 4, Rect.Top + 2, cells[ACol, ARow])
    end
    else
      textRect(Rect, Rect.Left + 4, Rect.Top + 2, cells[ACol, ARow]);

    if (gdFixed in State) then
    begin
      pen.Color := clBtnHighlight;
      moveto(Rect.Left, Rect.Bottom - 1);
      LineTo(Rect.Left, Rect.Top);
      LineTo(Rect.Right - 1, Rect.Top);
      pen.Color := clBtnShadow;
      LineTo(Rect.Right - 1, Rect.Bottom - 1);
      LineTo(Rect.Left, Rect.Bottom - 1);
    end
    else if (gdSelected in State) then
    begin
      pen.Color := clBtnShadow;
      if ACol = 0 then
      begin
        moveto(Rect.Left, Rect.Bottom - 1);
        LineTo(Rect.Left, Rect.Top);
      end
      else
        moveto(Rect.Left, Rect.Top);
      LineTo(Rect.Right, Rect.Top);

      if ACol = 2 then
      begin
        moveto(Rect.Right - 1, Rect.Top);
        LineTo(Rect.Right - 1, Rect.Bottom - 1);
      end
      else
        moveto(Rect.Right, Rect.Bottom - 1);
      LineTo(Rect.Left - 1, Rect.Bottom - 1);
    end;
  end;
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.LoadFolderList(const Path: string;
  IsFolder1: boolean);
var
  res: Integer;
  FolderStringList: TStringList;
  FolderRec: PFolderRec;
  sr: TSearchRec;
begin
  if not DirectoryExists(Path) then
    exit;
  if IsFolder1 then
    FolderStringList := fFolder1StringList
  else
    FolderStringList := fFolder2StringList;
  ClearFolderSL(FolderStringList);

  res := SysUtils.FindFirst(AppendSlash(Path) + '*.*', faAnyFile, sr);
  while res = 0 do
  begin
    if (sr.Name[1] <> '.') or // speeds this up a bit ....
      ((sr.Name <> '.') and (sr.Name <> '..')) then
    begin
      New(FolderRec);
      FolderRec.IsDirectory := (sr.Attr and faDirectory = faDirectory);
      if FolderRec.IsDirectory then
        FolderStringList.AddObject('D' + uppercase(sr.Name), Pointer(FolderRec))
      else
        FolderStringList.AddObject('F' + uppercase(sr.Name),
          Pointer(FolderRec));
      FolderRec.Name := sr.Name;
      FolderRec.Size := sr.Size;
      FolderRec.Modified := FileTime2DateTime(sr.FindData.ftLastWriteTime);
      FolderRec.Difference := fdNone;
    end;
    res := SysUtils.FindNext(sr);
  end;
  FolderStringList.Sort;

  DisplayFolderList(IsFolder1);
  if IsFolder1 then
    pnlCaptionLeft.Caption := '  ' + Path
  else
    pnlCaptionRight.Caption := '  ' + Path;

  with frmDiffMain do
  begin
    mnucompare.Enabled := (fFolder1StringList.Count > 0) and
      (fFolder2StringList.Count > 0);
    tbCompare.Enabled := mnucompare.Enabled;
    mnuCompareFiles.Enabled := false;
  end;
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.DisplayFolderList(IsFolder1: boolean);
var
  i, j: Integer;
  FolderStringList: TStringList;
  sgFolder: TStringGrid;
begin

  if IsFolder1 then
  begin
    FolderStringList := fFolder1StringList;
    sgFolder := sgFolder1;
  end
  else
  begin
    FolderStringList := fFolder2StringList;
    sgFolder := sgFolder2;
  end;

  if FolderStringList.Count = 0 then
    sgFolder.RowCount := 2
  else
    sgFolder.RowCount := FolderStringList.Count + 1;
  for i := 0 to FolderStringList.Count - 1 do
    with PFolderRec(FolderStringList.objects[i])^ do
    begin
      sgFolder.cells[0, i + 1] := Name;
      for j := 1 to 2 do
        sgFolder.cells[j, i + 1] := '';
      if (Name <> '') and not IsDirectory then
      begin
        sgFolder.cells[1, i + 1] := format('%1.0n KB', [(Size + 512) / 1024]);
        sgFolder.cells[2, i + 1] :=
          formatDatetime(FormatSettings.ShortDateFormat + '  ' +
          FormatSettings.ShortTimeFormat, Modified);
      end;
    end;
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.ClearFolderSL(folderSL: TStringList);
var
  i: Integer;
begin
  for i := 0 to folderSL.Count - 1 do
    if assigned(folderSL.objects[i]) then
      Dispose(PFolderRec(folderSL.objects[i]));
  folderSL.clear;
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.CompareClick(Sender: TObject);
begin
  DiffFolders;
  DisplayFolderList(true);
  DisplayFolderList(false);
  fFoldersCompared := true;
  frmDiffMain.mnucompare.Enabled := false;
  frmDiffMain.tbCompare.Enabled := false;
  // match up selections ready to keep them in sync ...
  sgFolder2.Selection := sgFolder1.Selection;
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.DiffFolders;
var
  FolderRec, FolderRec1, FolderRec2: PFolderRec;
  i, j, compResult, ADCnt, DDCnt, AFCnt, MFCnt, DFCnt: Integer;

  // ---------------------------------------------------------

  procedure Added;
  begin
    New(FolderRec);
    fFolder1StringList.InsertObject(i, '', Pointer(FolderRec));
    FolderRec.Name := '';
    FolderRec.IsDirectory := (fFolder2StringList[j][1] = 'D');
    FolderRec.Size := 0;
    FolderRec.Modified := 0;
    FolderRec.Difference := fdAdded;
    PFolderRec(fFolder2StringList.objects[j]).Difference := fdAdded;
    if FolderRec.IsDirectory then
      inc(ADCnt)
    else
      inc(AFCnt);
  end;
// ---------------------------------------------------------

  procedure Modified;
  begin
    FolderRec1.Difference := fdModified;
    FolderRec2.Difference := fdModified;
    inc(MFCnt);
  end;
// ---------------------------------------------------------

  procedure Deleted;
  begin
    New(FolderRec);
    fFolder2StringList.InsertObject(j, '', Pointer(FolderRec));
    FolderRec.Name := '';
    FolderRec.IsDirectory := (fFolder1StringList[i][1] = 'D');
    FolderRec.Size := 0;
    FolderRec.Modified := 0;
    FolderRec.Difference := fdDeleted;
    PFolderRec(fFolder1StringList.objects[i]).Difference := fdDeleted;
    if FolderRec.IsDirectory then
      inc(DDCnt)
    else
      inc(DFCnt);
  end;
// ---------------------------------------------------------

begin
  ADCnt := 0;
  DDCnt := 0;
  AFCnt := 0;
  MFCnt := 0;
  DFCnt := 0;
  i := 0;
  j := 0;
  while (i < fFolder1StringList.Count) and (j < fFolder2StringList.Count) do
  begin
    compResult := AnsiCompareText(fFolder1StringList[i], fFolder2StringList[j]);
    if compResult < 0 then
      Deleted
    else if compResult > 0 then
      Added
    else
    begin
      FolderRec1 := PFolderRec(fFolder1StringList.objects[i]);
      FolderRec2 := PFolderRec(fFolder2StringList.objects[j]);
      if not FolderRec1.IsDirectory and ((FolderRec1.Size <> FolderRec2.Size) or
        (FolderRec1.Modified <> FolderRec2.Modified)) then
        Modified;
    end;
    inc(i);
    inc(j);
  end;
  while (i < fFolder1StringList.Count) do
  begin
    Deleted;
    inc(i);
    inc(j);
  end;
  while (i < fFolder2StringList.Count) do
  begin
    Added;
    inc(i);
    inc(j);
  end;

  fDiffResultStr := '  ';
  if ADCnt > 0 then
    fDiffResultStr := fDiffResultStr + format('%d directories added, ',
      [ADCnt]);
  if DDCnt > 0 then
    fDiffResultStr := fDiffResultStr +
      format('%d directories deleted, ', [DDCnt]);
  if AFCnt > 0 then
    fDiffResultStr := fDiffResultStr + format('%d files added, ', [AFCnt]);
  if MFCnt > 0 then
    fDiffResultStr := fDiffResultStr + format('%d files modified, ', [MFCnt]);
  if DFCnt > 0 then
    fDiffResultStr := fDiffResultStr + format('%d files deleted, ', [DFCnt]);
  i := length(fDiffResultStr);
  if i > 2 then
    setlength(fDiffResultStr, i - 2)
  else
    fDiffResultStr := '  No differences found.';
  frmDiffMain.Statusbar1.Panels[3].text := fDiffResultStr;
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.sgFolder1TopLeftChanged(Sender: TObject);
begin
  if not fFoldersCompared then
    exit;
  if Sender = sgFolder1 then
    sgFolder2.TopRow := sgFolder1.TopRow
  else
    sgFolder1.TopRow := sgFolder2.TopRow;
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.sgFolder1Click(Sender: TObject);
var
  i: Integer;
begin
  if not TStringGrid(Sender).focused or not fFoldersCompared then
    exit;
  if Sender = sgFolder1 then
    sgFolder2.Selection := sgFolder1.Selection
  else
    sgFolder1.Selection := sgFolder2.Selection;
  i := sgFolder1.Selection.Top - 1;
  frmDiffMain.mnuCompareFiles.Enabled := assigned(fFolder1StringList.objects[i])
    and (PFolderRec(fFolder1StringList.objects[i]).Difference = fdModified);
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.FrameResize(Sender: TObject);
begin
  pnlLeft.width := pnlMain.ClientWidth div 2 - 1;

  sgFolder2.ColWidths[0] := sgFolder2.ClientWidth - sgFolder2.ColWidths[1] -
    sgFolder2.ColWidths[2];
  sgFolder1.ColWidths[0] := sgFolder2.ColWidths[0];
end;
// ------------------------------------------------------------------------------

procedure TfrmFoldersFrame.sgFolder1DblClick(Sender: TObject);
var
  i: Integer;
begin
  if not fFoldersCompared then
    exit;
  i := sgFolder1.Selection.Top - 1;
  if assigned(fFolder1StringList.objects[i]) and
    (PFolderRec(fFolder1StringList.objects[i]).Difference = fdModified) then
  begin
    // toggle to fileview ...
    frmDiffMain.mnuFolderClick(nil);
    // check for overwriting of opened files ...
    with TfrmFilesFrame(frmDiffMain.FilesFrame) do
    begin
      if (pnlCaptionLeft.Color = ISMODIFIED_COLOR) then
      begin
        case application.MessageBox
          (PChar('Save changes to'#10 + pnlCaptionLeft.Caption + ' ?  '),
          PChar(application.title), MB_YESNOCANCEL or MB_ICONSTOP or
          MB_DEFBUTTON3) of
          IDCANCEL:
            exit;
          IDYES:
            SaveFileClick(frmDiffMain.mnuSave1);
        end;
      end;
      if (pnlCaptionRight.Color = ISMODIFIED_COLOR) then
      begin
        case application.MessageBox
          (PChar('Save changes to'#10 + pnlCaptionRight.Caption + ' ?  '),
          PChar(application.title), MB_YESNOCANCEL or MB_ICONSTOP or
          MB_DEFBUTTON3) of
          IDCANCEL:
            exit;
          IDYES:
            SaveFileClick(frmDiffMain.mnuSave2);
        end;
      end;
      // proceed to opening and comparing files ...
      DoOpenFile(AppendSlash(LastOpenedFolder2) +
        PFolderRec(fFolder2StringList.objects[i]).Name, false);
      DoOpenFile(AppendSlash(LastOpenedFolder1) +
        PFolderRec(fFolder1StringList.objects[i]).Name, true);
    end;
    frmDiffMain.mnucompare.Click;
  end;
end;
// ------------------------------------------------------------------------------

end.
