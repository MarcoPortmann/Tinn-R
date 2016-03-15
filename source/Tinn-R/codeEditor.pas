unit codeEditor;

// -----------------------------------------------------------------------------
// Component Name:  TCodeEdit                                                  .
// Description:     Custom edit control which implements line coloring.        .
// Notes:           1. Assumes fixed pitched fonts only                        .
// 2. Max 65535 characters per line                           .
// Version:         1.4                                                        .
// Date:            5-JUN-2003                                                 .
// Target:          Win32, Delphi 3 - Delphi 7                                 .
// Author:          Angus Johnson - angusj-AT-myrealbox-DOT-com                .
// Copyright;       � 2003 Angus Johnson                                       .
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, ShellApi, Classes, Forms,
  Controls, Graphics, Clipbrd, System.Types;

type
  TDropFilesEvent = procedure(Sender: TObject; const Filename: string;
    var DropAccepted: boolean) of object;
  TPaintMargin = procedure(Sender: TObject; Canvas: TCanvas; MarginRec: TRect;
    LineNo, Tag: integer) of object;
  TUndoType = (utAddChar, utDelChar, utDelSel, utSetSel);
  TMouseAction = (maNone, maSelResize, maSelMove);

  TLineObj = class
  private
    fLineLen, fLineOffset: integer;
    fModified: boolean;
  public
    BackClr: TColor;
    Tag: longint;
    property LineModified: boolean read fModified;
    property LineOffset: integer read fLineOffset;
    property LineLen: integer read fLineLen;
  end;

  TCodeEdit = class; // forward declaration

  TLines = class(TStringList)
  private
    fOwner: TCodeEdit;
    fModified: boolean;
    fUpdating: boolean;
    procedure SetModified(value: boolean);
    procedure InternalInsertItem(Index: integer; const S: string);
    function GetLineObj(Index: integer): TLineObj;
  protected
    procedure Changed; override;
    procedure SetUpdateState(Updating: boolean); override;
    procedure Put(Index: integer; const S: string); override;
  public
    constructor Create(AOwner: TCodeEdit);
    destructor Destroy; override;
    function Add(const S: string): integer; override;
    procedure AddStrings(Strings: TStrings); override;
    procedure Assign(Source: TPersistent); override;
    function AddObject(const S: string; AObject: TObject): integer; override;
    procedure Insert(Index: integer; const S: string); override;
    procedure InsertObject(Index: integer; const S: string; AObject: TObject);
{$IFNDEF VER100} override; {$ENDIF}
    procedure Clear; override;
    procedure Delete(Index: integer); override;
    // todo - Implement DeleteRange method
    property LineObj[index: integer]: TLineObj read GetLineObj;
    property Modified: boolean read fModified write SetModified;
  end;

  PUndoItem = ^TUndoItem;

  TUndoItem = record
    fType: TUndoType;
    fOldCaretPt: TPoint;
    fOldSelEnd: integer;
    fOldSelStart: integer;
    fNewCaretPt: TPoint;
    fNewSelStart: integer;
    fNewSelEnd: integer;
    fDeletedText: string;
    fAddedText: string;
  end;

  TUndo = class
  private
    fOwner: TCodeEdit;
    fUndoPos: integer;
    fMaxSize: integer;
    fUndoList: TList;
    fLocked: boolean;
  public
    constructor Create(AOwner: TCodeEdit);
    destructor Destroy; override;
    procedure Add(aUndoItem: TUndoItem);
    procedure Clear;
    function DoUndo: boolean;
    function DoRedo: boolean;
    property MaxSize: integer read fMaxSize write fMaxSize;
  end;

  TCodeEdit = class(TCustomControl)
  private
    fLeftMargin: integer;
    fGutterWidth: integer;
    fTopMargin: integer;
    fCharWidth: integer;
    fLineHeight: integer;
    fVisibleLines: integer;
    fVisibleChars: integer;
    fCurrLongestLineLen: integer; // needed for horizontal scrollbar
    fTabSize: integer; // displays TAB as fTabSize spaces
    fVertScrollExp: integer; // required as WM_VSCROLL limits max size
    fVertOffset: integer;
    fHorzOffset: integer;
    fLines: TLines; // list of lines & TLineObj's
    fUndo: TUndo;
    fAutoLineNums: boolean;
    fCaretCreated: boolean;
    fCaretVisible: boolean;
    fCaretPt: TPoint;
    fCaretPt_Old: TPoint; // see DoOnCaretPtChange
    fCaretXPosPreferred: integer; // used when caret tracking vertically
    fSelStart: integer;
    fSelEnd: integer;
    fSelStart_Old: integer; // used solely to detect selection changes
    fSelEnd_Old: integer; // (see DoOnSelectionChange)
    fReadOnly: boolean;
    fWantTabs: boolean;
    fLineModClr: TColor;
    fMouseAction: TMouseAction;
    // event fields ...
    fOnDropFiles: TDropFilesEvent;
    fOnScroll: TNotifyEvent;
    fOnSelectionChange: TNotifyEvent;
    fOnCaretPtChange: TNotifyEvent;
    fPaintLeftMargin: TPaintMargin;
    procedure SetAutoLineNums(value: boolean);
    procedure UpdateScrollbars;
    procedure UpdateVertScroll;
    procedure UpdateHorzScroll;
    procedure InternalVScroll(vertOffset: integer);
    procedure InternalHScroll(horzOffset: integer);
    function ConvertTabs(const str: string): string;
    procedure PaintLine(LineNo: integer; Rec: TRect);
    procedure SetLeftOffset(LeftOffset: integer);
    procedure SetTopOffset(TopOffset: integer);
    procedure SetGutterWidth(value: integer);
    procedure SetCaretPt(pt: TPoint);
    procedure SetCaretPtInternal(pt: TPoint; KillSel: boolean);
    function GetColor: TColor;
    procedure SetColor(value: TColor);
    procedure UpdateCaret;
    procedure DestroyCaret;
    procedure CreateCaret;
    procedure RecalcDimensions;
    procedure DeleteSelection;
    function GetSelection: string;
    procedure SetSelection(const selText: string);
    function GetSelLength: integer;
    procedure SetSelLength(value: integer);
    function GetSelStart: integer;
    procedure SetSelStart(value: integer);
    procedure SetReadOnly(value: boolean);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure WMGetDlgCode(var Msg: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMVScroll(var Message: TWMScroll); message WM_VSCROLL;
    procedure WMHScroll(var Message: TWMScroll); message WM_HSCROLL;
    procedure WMSize(var Message: TWMSize); message WM_SIZE;
    procedure WMEraseBkgnd(var Message: TMessage); message WM_ERASEBKGND;
    procedure WMDropFiles(var Message: TWMDropFiles); message WM_DROPFILES;
    procedure CMFontChanged(var Message: TMessage); message CM_FONTCHANGED;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
    procedure WMKillFocus(var Message: TWMSetFocus); message WM_KILLFOCUS;
    procedure WMCUT(var Message: TMessage); message WM_CUT;
    procedure WMCOPY(var Message: TMessage); message WM_COPY;
    procedure WMPASTE(var Message: TMessage); message WM_PASTE;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure KeyPressWhileEditing(Key: Char); virtual;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState;
      X, Y: integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState;
      X, Y: integer); override;
    procedure Paint; override;
    function GetFont: TFont;
    procedure SetFont(value: TFont);
    procedure DoOnSelectionChange; virtual;
    procedure DoOnCaretPtChange; virtual;
    function CharPosFromCharPt(CharPt: TPoint): integer;
    function CharPtFromCharPos(CharPos: integer): TPoint;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure CutToClipBoard;
    procedure CopyToClipBoard;
    procedure PasteFromClipBoard;
    procedure Undo;
    procedure Redo;
    function GetCanUndo: boolean;
    function GetCanRedo: boolean;
    procedure ScrollCaretIntoView;
    property CharWidth: integer read fCharWidth;
    property LineHeight: integer read fLineHeight;
    property VisibleLines: integer read fVisibleLines;
    property SelStart: integer read GetSelStart write SetSelStart;
    property SelLength: integer read GetSelLength write SetSelLength;
    property Selection: string read GetSelection write SetSelection;
    property LeftVisibleChar: integer read fHorzOffset write SetLeftOffset;
    property TopVisibleLine: integer read fVertOffset write SetTopOffset;
    property CaretPt: TPoint read fCaretPt write SetCaretPt;
    property CanUndo: boolean read GetCanUndo;
    property CanRedo: boolean read GetCanRedo;
    function CharPtFromClientPt(pt: TPoint): TPoint;
    function ClientPtFromCharPt(pt: TPoint): TPoint;
  published
    property Color: TColor read GetColor write SetColor;
    property ModifiedLineColor: TColor read fLineModClr write fLineModClr;
    // only fixed pitched fonts allowed ...
    property Font: TFont read GetFont write SetFont;
    // When AutoLineNum = true, both GutterWidth and OnPaintLeftMargin are ignored
    property AutoLineNum: boolean read fAutoLineNums write SetAutoLineNums;
    // GutterWidth - ignored if AutoLineNum = true
    property GutterWidth: integer read fGutterWidth write SetGutterWidth;
    property Lines: TLines read fLines; // TStringList descendant class
    property ReadOnly: boolean read fReadOnly write SetReadOnly;
    property WantTabs: boolean read fWantTabs write fWantTabs;
    property OnDropFiles: TDropFilesEvent read fOnDropFiles write fOnDropFiles;
    // OnPaintLeftMargin - optional event for custom drawing in left margin
    property OnPaintLeftMargin: TPaintMargin read fPaintLeftMargin
      write fPaintLeftMargin;
    property OnScroll: TNotifyEvent read fOnScroll write fOnScroll;
    property OnSelectionChange: TNotifyEvent read fOnSelectionChange
      write fOnSelectionChange;
    property OnCaretPtChange: TNotifyEvent read fOnCaretPtChange
      write fOnCaretPtChange;
    property OnEnter;
    property OnExit;
    property OnDblClick;
    property OnMouseDown;
    property OnKeyDown;
  end;

procedure Register;
function Log10(int: integer): integer; // useful for calculating the width of

// the left margin when line numbering.
const
{$IFDEF LINUX}
  NEWLINE: Char = #10;
{$ELSE}
  NEWLINE: array [0 .. 1] of Char = #13#10;
{$ENDIF}

implementation

// ------------------------------------------------------------------------------
// Miscellaneous functions
// ------------------------------------------------------------------------------

const
  CARETWIDTH = 2;
  DEL = #7;
  BACKSPC = #8;
  TAB = #9;
  RETURN = #13;

procedure Register;
begin
  RegisterComponents('Samples', [TCodeEdit]);
end;
// ------------------------------------------------------------------------------

function min(int1, int2: integer): integer;
begin
  if int1 < int2 then
    Result := int1
  else
    Result := int2;
end;
// ------------------------------------------------------------------------------

function max(int1, int2: integer): integer;
begin
  if int1 > int2 then
    Result := int1
  else
    Result := int2;
end;
// ------------------------------------------------------------------------------

function PointsMatch(pt1, pt2: TPoint): boolean;
begin
  Result := (pt1.X = pt2.X) and (pt1.Y = pt2.Y);
end;
// ------------------------------------------------------------------------------

function Log10(int: integer): integer;
begin
  Result := 1;
  while int > 9 do
  begin
    inc(Result);
    int := int div 10;
  end;
end;
// ------------------------------------------------------------------------------

function HasTabs(const str: string): boolean;
var
  i: integer;
begin
  Result := true;
  for i := 1 to Length(str) do
    if str[i] = TAB then
      exit;
  Result := false;
end;

// ------------------------------------------------------------------------------
// TLine methods ...
// ------------------------------------------------------------------------------

constructor TLines.Create(AOwner: TCodeEdit);
begin
  inherited Create;
  fOwner := AOwner;
  Clear;
  fModified := false;
end;
// ------------------------------------------------------------------------------

destructor TLines.Destroy;
begin
  Clear;
  inherited;
end;
// ------------------------------------------------------------------------------

procedure TLines.Clear;
var
  i: integer;
begin
  with fOwner do
  begin
    fCurrLongestLineLen := 60;
    if fAutoLineNums then
      fGutterWidth := 20;
    fVertOffset := 0;
    fHorzOffset := 0;
    fCaretPt := Point(0, 0);
    fSelStart := 0;
    fSelEnd := 0;
  end;
  for i := 0 to count - 1 do
    objects[i].Free;
  inherited Clear;
end;
// ------------------------------------------------------------------------------

procedure TLines.Changed;
begin
  // if (UpdateCount > 0) then exit; //UpdateCount is not available in D3
  if not fUpdating then
    with fOwner do
    begin
      if csDestroying in ComponentState then
        exit;
      // update now ended
      UpdateScrollbars;
      if fAutoLineNums then
        GutterWidth := fCharWidth * (Log10(Lines.count) + 1);
      invalidate;
    end;
  inherited;
end;
// ------------------------------------------------------------------------------

procedure TLines.SetUpdateState(Updating: boolean);
begin
  fUpdating := Updating;
  inherited;
end;
// ------------------------------------------------------------------------------

procedure TLines.SetModified(value: boolean);
var
  i: integer;
begin
  if fModified = value then
    exit;
  fModified := value;
  for i := 0 to count - 1 do
    TLineObj(objects[i]).fModified := value;
end;
// ------------------------------------------------------------------------------

procedure TLines.InternalInsertItem(Index: integer; const S: string);
var
  i, SizeDif: integer;
  LineObj: TLineObj;
begin
  LineObj := TLineObj.Create;
  if index = 0 then
    LineObj.fLineOffset := 0
  else
    with TLineObj(objects[index - 1]) do
      LineObj.fLineOffset := fLineOffset + fLineLen + sizeof(NEWLINE);
  LineObj.fLineLen := Length(S);
  if LineObj.fLineLen > fOwner.fCurrLongestLineLen then
    fOwner.fCurrLongestLineLen := LineObj.fLineLen;
  LineObj.fModified := true;
  fModified := true;
  LineObj.BackClr := fOwner.Color;
{$IFDEF VER100}
  inherited Insert(Index, S);
  PutObject(Index, pointer(LineObj));
{$ELSE}
  inherited InsertObject(Index, S, pointer(LineObj));
{$ENDIF}
  // update any following line char offsets
  SizeDif := LineObj.fLineLen + sizeof(NEWLINE);
  for i := Index + 1 to count - 1 do
    with TLineObj(objects[i]) do
      fLineOffset := fLineOffset + SizeDif;
end;
// ------------------------------------------------------------------------------

function TLines.GetLineObj(Index: integer): TLineObj;
begin
  if (index < 0) or (index >= count) then
    raise Exception.Create('TLines.GetLineObj() - index out of bounds.');
  Result := TLineObj(objects[index]);
end;
// ------------------------------------------------------------------------------

procedure TLines.Put(Index: integer; const S: string);
var
  i, len, SizeDif: integer;
begin
  len := Length(S);
  // nb: range errors will be raised in the inherited Put() method
  if (index >= 0) and (index < count) then
    SizeDif := len - Length(Strings[Index])
  else
    SizeDif := 0; // just prevents warnings
  inherited Put(Index, S);
  TLineObj(objects[index]).fLineLen := len;
  TLineObj(objects[index]).fModified := true;
  fModified := true;
  if len > fOwner.fCurrLongestLineLen then
    fOwner.fCurrLongestLineLen := len;

  // update all following line char offsets ...
  if SizeDif = 0 then
    exit;
  for i := index + 1 to count - 1 do
    with TLineObj(objects[i]) do
      fLineOffset := fLineOffset + SizeDif;
end;
// ------------------------------------------------------------------------------

function TLines.Add(const S: string): integer;
begin
  Result := count;
  InternalInsertItem(count, S);
end;
// ------------------------------------------------------------------------------

procedure TLines.AddStrings(Strings: TStrings);
var
  i: integer;
begin
  BeginUpdate;
  try
    capacity := capacity + Strings.capacity;
    for i := 0 to Strings.count - 1 do
      InternalInsertItem(i, Strings[i]);
  finally
    EndUpdate;
  end;
end;
// ------------------------------------------------------------------------------

procedure TLines.Assign(Source: TPersistent);
var
  i: integer;
begin
  with fOwner do
    if assigned(fUndo) then
      fUndo.Clear;
  if Source is TLines then
  begin
    BeginUpdate;
    try
      Clear;
      AddStrings(TLines(Source));
      for i := 0 to count - 1 do
      begin
        TLineObj(objects[i]).BackClr :=
          TLineObj(TLines(Source).objects[i]).BackClr;
        TLineObj(objects[i]).Tag := TLineObj(TLines(Source).objects[i]).Tag;
      end;
    finally
      EndUpdate;
    end;
  end
  else
    inherited Assign(Source);
  Modified := false;
end;
// ------------------------------------------------------------------------------

function TLines.AddObject(const S: string; AObject: TObject): integer;
begin
  raise Exception.Create('TLines.AddObject - invalid method');
end;
// ------------------------------------------------------------------------------

procedure TLines.Insert(Index: integer; const S: string);
begin
  InternalInsertItem(Index, S);
end;
// ------------------------------------------------------------------------------

procedure TLines.InsertObject(Index: integer; const S: string;
  AObject: TObject);
begin
  raise Exception.Create('TLines.InsertObject - invalid method');
end;
// ------------------------------------------------------------------------------

procedure TLines.Delete(Index: integer);
var
  i, SizeDif: integer;
begin
  SizeDif := TLineObj(objects[Index]).fLineLen + sizeof(NEWLINE);
  objects[Index].Free;
  if SizeDif > 0 then
    for i := index + 1 to count - 1 do
      with TLineObj(objects[i]) do
        fLineOffset := fLineOffset - SizeDif;
  inherited Delete(Index);
  fModified := true;
end;

// ------------------------------------------------------------------------------
// TUndo methods ...
// ------------------------------------------------------------------------------

constructor TUndo.Create(AOwner: TCodeEdit);
begin
  fOwner := AOwner;
  fMaxSize := 100;
  fUndoList := TList.Create;
end;
// ------------------------------------------------------------------------------

destructor TUndo.Destroy;
begin
  Clear;
  fUndoList.Free;
end;
// ------------------------------------------------------------------------------

procedure TUndo.Add(aUndoItem: TUndoItem);
var
  UndoItem: PUndoItem;
begin
  if fLocked or (fMaxSize = 0) then
    exit;
  // set the Undo position to the top of the 'stack'
  // by trashing any previously undone items ...
  while fUndoPos < fUndoList.count do
  begin
    dispose(PUndoItem(fUndoList[fUndoPos]));
    fUndoList.Delete(fUndoPos);
  end;

  if fUndoList.count < fMaxSize then
  begin
    // add a new item ...
    new(UndoItem);
    fUndoList.Add(UndoItem);
  end
  else
  begin
    // if the list is full reuse the oldest item by moving it to the top ...
    UndoItem := PUndoItem(fUndoList[0]);
    fUndoList.Move(0, fUndoList.count - 1);
  end;
  fUndoPos := fUndoList.count;
  UndoItem^ := aUndoItem;
end;
// ------------------------------------------------------------------------------

procedure TUndo.Clear;
var
  i: integer;
begin
  for i := 0 to fUndoList.count - 1 do
    dispose(PUndoItem(fUndoList[i]));
  fUndoList.Clear;
end;
// ------------------------------------------------------------------------------

function TUndo.DoUndo: boolean;
begin
  if (fUndoList.count = 0) or (fUndoPos < 1) then
    Result := false
  else
    Result := true;
  if not Result then
    exit;

  if fUndoPos > fUndoList.count then
    fUndoPos := fUndoList.count;
  dec(fUndoPos);
  fLocked := true;
  try
    with fOwner, PUndoItem(fUndoList[fUndoPos])^ do
    begin
      case fType of
        utDelSel:
          begin
            // undo DeleteSelection ...
            fSelStart := fNewSelStart;
            fSelEnd := fNewSelStart;
            fCaretPt := fNewCaretPt;
            SetSelection(fDeletedText);
          end;
        utSetSel:
          begin
            // undo SetSelection ...
            fSelStart := fOldSelEnd;
            fSelEnd := fNewSelEnd;
            DeleteSelection;
            // if pasting over a selection then undo both ...
            if (fUndoPos > 0) and
              (PUndoItem(fUndoList[fUndoPos - 1]).fType = utDelSel) then
              DoUndo;
          end;
        utAddChar:
          begin
            // undo Add Char ...
            fSelStart := fOldSelEnd;
            fSelEnd := fOldSelEnd;
            fCaretPt := fOldCaretPt;
            KeyPressWhileEditing(DEL);
            CaretPt := fOldCaretPt;
            fSelStart := fOldSelEnd;
          end;
        utDelChar:
          begin
            // undo Delete Char ...
            fSelStart := fOldSelEnd;
            fSelEnd := fOldSelEnd;
            fCaretPt := fOldCaretPt;
            KeyPressWhileEditing(fDeletedText[1]);
            if fAddedText[1] = DEL then // as opposed to BACKSPC
            begin
              CaretPt := fOldCaretPt;
              fSelStart := fOldSelEnd;
            end;
          end;
      end;
      invalidate;
      DoOnCaretPtChange;
      DoOnSelectionChange;
    end;
  finally
    fLocked := false;
  end;
end;
// ------------------------------------------------------------------------------

function TUndo.DoRedo: boolean;
begin
  if (fUndoList.count = 0) or (fUndoPos = fUndoList.count) then
    Result := false
  else
    Result := true;
  if not Result then
    exit;
  fLocked := true;
  try
    with fOwner, PUndoItem(fUndoList[fUndoPos])^ do
    begin
      case fType of
        utDelSel:
          begin
            // redo DeleteSelection ...
            fSelStart := fOldSelStart;
            fSelEnd := fOldSelEnd;
            DeleteSelection;
            // if pasting over a selection then redo both ...
            if (fUndoPos < fUndoList.count - 1) and
              (PUndoItem(fUndoList[fUndoPos + 1]).fType = utSetSel) then
            begin
              inc(fUndoPos);
              DoRedo;
              exit;
            end;
          end;
        utSetSel:
          begin
            // redo SetSelection ...
            fCaretPt := fOldCaretPt;
            fSelStart := fOldSelEnd;
            fSelEnd := fOldSelEnd;
            SetSelection(fAddedText);
          end;
        utAddChar:
          begin
            // redo Add Char ...
            fSelStart := fOldSelEnd;
            fSelEnd := fOldSelEnd;
            fCaretPt := fOldCaretPt;
            KeyPressWhileEditing(fAddedText[1]);
          end;
        utDelChar:
          begin
            // redo Delete Char ...
            fSelStart := fOldSelEnd;
            fSelEnd := fOldSelEnd;
            fCaretPt := fOldCaretPt;
            KeyPressWhileEditing(DEL);
          end;
      end;
      invalidate;
      DoOnCaretPtChange;
      DoOnSelectionChange;
    end;
  finally
    fLocked := false;
  end;
  inc(fUndoPos);
end;

// ------------------------------------------------------------------------------
// TCodeEdit methods ...
// ------------------------------------------------------------------------------

constructor TCodeEdit.Create(AOwner: TComponent);
begin
  inherited;
  Font.Pitch := fpFixed;
{$IFDEF LINUX}
  Font.Name := 'Terminal';
{$ELSE}
  Font.Name := 'Courier New';
{$ENDIF}
  ControlStyle := [csCaptureMouse, csOpaque, csClickEvents, csDoubleClicks];
  fDoubleBuffered := true;
  Font.Size := 10;
  Canvas.Font.Assign(Font);
  fLines := TLines.Create(self);
  fUndo := TUndo.Create(self);
  fCaretPt := Point(0, 0);
  SetBounds(0, 0, 200, 80);
  ParentFont := false;
  ParentColor := false;
  tabstop := true;
  fLeftMargin := 4;
  fGutterWidth := 0;
  fTopMargin := 4;
  fAutoLineNums := true;
  fTabSize := 4; // if this is exposed make sure it can nver be less than 1
  Color := clWindow;
  fLineModClr := $E0E0E0;
  cursor := crIBeam;
end;
// ------------------------------------------------------------------------------

destructor TCodeEdit.Destroy;
begin
  fLines.Free;
  fUndo.Free;
  DestroyCaret;
  inherited;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    Style := Style or WS_VSCROLL or WS_HSCROLL or WS_TABSTOP;
    if NewStyleControls and Ctl3D then
      ExStyle := ExStyle or WS_EX_CLIENTEDGE
    else
      Style := Style or WS_BORDER;
  end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.CreateWnd;
begin
  inherited;
  if assigned(fOnDropFiles) then
    DragAcceptFiles(handle, true);
  if fAutoLineNums then
    GutterWidth := fCharWidth * (Log10(Lines.count) + 1);
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.DestroyWnd;
begin
  if assigned(fOnDropFiles) then
    DragAcceptFiles(handle, false);
  inherited;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMGetDlgCode(var Msg: TWMGetDlgCode);
begin
  if fWantTabs then
    Msg.Result := DLGC_WANTARROWS or DLGC_WANTTAB
  else
    Msg.Result := DLGC_WANTARROWS;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetAutoLineNums(value: boolean);
var
  newLM: integer;
begin
  if value = fAutoLineNums then
    exit;
  fAutoLineNums := value;
  if not fAutoLineNums then
    exit;
  newLM := fCharWidth * (Log10(Lines.count) + 1);
  if newLM = GutterWidth then
    exit;
  GutterWidth := newLM;
end;
// ------------------------------------------------------------------------------

function TCodeEdit.GetSelStart: integer;
begin
  Result := min(fSelStart, fSelEnd);
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetSelStart(value: integer);
begin
  fSelStart := value;
  SetCaretPtInternal(CharPtFromCharPos(fSelStart), false);
  invalidate;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetSelLength(value: integer);
begin
  fSelStart := min(fSelStart, fSelEnd);
  SetCaretPtInternal(CharPtFromCharPos(fSelStart + value), false);
  invalidate;
end;
// ------------------------------------------------------------------------------

function TCodeEdit.GetSelLength: integer;
begin
  Result := abs(fSelEnd - fSelStart);
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.DoOnSelectionChange;
begin
  if not assigned(fOnSelectionChange) then
    exit;
  // if not selected and not previously selected, or
  // selection unchanged from previously then don't notify as no change
  if ((fSelStart = fSelEnd) and (fSelStart_Old = fSelEnd_Old)) or
    ((fSelStart_Old = fSelStart) and (fSelEnd_Old = fSelEnd)) then
    // ie unchanged
  else
    fOnSelectionChange(self);
  fSelStart_Old := fSelStart;
  fSelEnd_Old := fSelEnd;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.DoOnCaretPtChange;
begin
  if not assigned(fOnCaretPtChange) then
    exit;
  if not PointsMatch(fCaretPt_Old, fCaretPt) then
    fOnCaretPtChange(self);
  fCaretPt_Old := fCaretPt;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetReadOnly(value: boolean);
begin
  fReadOnly := value;
end;
// ------------------------------------------------------------------------------

function TCodeEdit.GetColor: TColor;
begin
  Result := inherited Color;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetColor(value: TColor);
var
  i: integer;
  oldColor: TColor;
begin
  oldColor := inherited Color;
  if oldColor = value then
    exit;
  Canvas.Brush.Color := value;
  for i := 0 to fLines.count - 1 do
    if TLineObj(fLines.objects[i]).BackClr = oldColor then
      TLineObj(fLines.objects[i]).BackClr := value;
  inherited Color := value;
end;
// ------------------------------------------------------------------------------

function TCodeEdit.GetFont: TFont;
begin
  Result := inherited Font;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetFont(value: TFont);
begin
  // todo - prevent proportional font assignments here
  inherited Font := value;
  RecalcDimensions;
  if fAutoLineNums then
    GutterWidth := fCharWidth * (Log10(Lines.count) + 1);
  DestroyCaret;
  CreateCaret;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.CMFontChanged(var Message: TMessage);
var
  dc: HDC;
  savedFont: HFont;
  tm: TTextMetric;
begin
  inherited;
  dc := GetDC(0);
  try
    savedFont := SelectObject(dc, Font.handle);
    GetTextMetrics(dc, tm);
    SelectObject(dc, savedFont);
  finally
    ReleaseDC(0, dc);
  end;
  fCharWidth := tm.tmAveCharWidth;
  fLineHeight := tm.tmHeight + tm.tmExternalLeading;
  Canvas.Font.Assign(Font);
  invalidate;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMDropFiles(var Message: TWMDropFiles);
var
  DropAccepted: boolean;
  buffer: array [0 .. MAX_PATH] of Char;
begin
  inherited;
  if assigned(fOnDropFiles) then
  begin
    DropAccepted := false;
    // we're only interested in the first file...
    DragQueryFile(Message.Drop, 0, @buffer, sizeof(buffer));
    fOnDropFiles(self, buffer, DropAccepted);
    Message.Result := integer(DropAccepted);
  end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetGutterWidth(value: integer);
begin
  if fGutterWidth = value then
    exit;
  fGutterWidth := max(0, value);
  RecalcDimensions;
  UpdateCaret;
  invalidate;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetLeftOffset(LeftOffset: integer);
var
  Msg: TWMScroll;
  MaxChar: integer;
begin
  MaxChar := max(0, fCurrLongestLineLen - (ClientWidth - fGutterWidth)
    div fCharWidth + 3);
  Msg.ScrollCode := SB_THUMBTRACK;
  Msg.Pos := min(LeftOffset, MaxChar);
  WMHScroll(Msg);
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetTopOffset(TopOffset: integer);
var
  Msg: TWMScroll;
begin
  if fVertOffset = TopOffset then
    exit;
  Msg.ScrollCode := SB_THUMBTRACK;
  Msg.Pos := TopOffset shr fVertScrollExp;
  WMVScroll(Msg);
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.UpdateScrollbars;
var
  si: TScrollInfo;
begin
  if not handleallocated then
    exit;
  si.cbSize := sizeof(TScrollInfo);
  si.fMask := SIF_RANGE or SIF_POS or SIF_PAGE;
  si.nMin := 0;

  // si.nMax only allows WORD sized integers ...
  fVertScrollExp := 0;
  si.nMax := fLines.count;
  while si.nMax >= $7FFF do
  begin
    si.nMax := si.nMax div 2;
    inc(fVertScrollExp);
  end;

  si.nPage := cardinal((ClientHeight div fLineHeight) shr fVertScrollExp);
  si.nPos := fVertOffset shr fVertScrollExp;
  SetScrollInfo(handle, SB_VERT, si, true);

  si.nMax := fCurrLongestLineLen + 2;
  si.nPage := cardinal((ClientWidth - fGutterWidth) div fCharWidth);
  si.nPos := fHorzOffset;
  SetScrollInfo(handle, SB_HORZ, si, true);
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMVScroll(var Message: TWMScroll);
var
  newOffset: integer;
begin
  fVisibleLines := (ClientHeight - fTopMargin) div fLineHeight;
  case Message.ScrollCode of
    SB_PAGEUP:
      newOffset := fVertOffset - fVisibleLines;
    SB_PAGEDOWN:
      newOffset := fVertOffset + fVisibleLines;
    SB_LINEUP:
      newOffset := fVertOffset - 1;
    SB_LINEDOWN:
      newOffset := fVertOffset + 1;
    SB_THUMBTRACK:
      newOffset := Message.Pos shl fVertScrollExp;
  else
    exit;
  end;
  InternalVScroll(newOffset);
  Message.Result := 0;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.InternalVScroll(vertOffset: integer);
begin
  if vertOffset < 0 then
    vertOffset := 0
  else if vertOffset > fLines.count - fVisibleLines + 1 then
    vertOffset := max(0, fLines.count - fVisibleLines + 1);
  if fVertOffset = vertOffset then
    exit;
  fVertOffset := vertOffset;
  UpdateVertScroll;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.UpdateVertScroll;
var
  si: TScrollInfo;
  SaveSelEnd: integer;
begin
  si.cbSize := sizeof(TScrollInfo);
  si.fMask := SIF_POS;
  si.nPos := fVertOffset shr fVertScrollExp;
  SetScrollInfo(handle, SB_VERT, si, true);
  SaveSelEnd := fSelEnd; // in a selection scroll move we must preserve SelEnd
  UpdateCaret;
  fSelEnd := SaveSelEnd;
  if assigned(fOnScroll) then
    fOnScroll(self);
  invalidate;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMHScroll(var Message: TWMScroll);
var
  newOffset: integer;
begin
  // todo - fix up for fLeftMargin too ...
  case Message.ScrollCode of
    SB_PAGEUP:
      newOffset := fHorzOffset - (ClientWidth - integer(fGutterWidth))
        div fCharWidth;
    SB_PAGEDOWN:
      newOffset := fHorzOffset + (ClientWidth - fGutterWidth) div fCharWidth;
    SB_LINEUP:
      newOffset := fHorzOffset - 1;
    SB_LINEDOWN:
      newOffset := fHorzOffset + 1;
    SB_THUMBTRACK:
      newOffset := Message.Pos;
  else
    exit;
  end;
  InternalHScroll(newOffset);
  Message.Result := 0;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.InternalHScroll(horzOffset: integer);
var
  MaxChar: integer;
begin
  MaxChar := max(0, fCurrLongestLineLen - (ClientWidth - fGutterWidth)
    div fCharWidth + 3);
  if horzOffset < 0 then
    horzOffset := 0
  else if horzOffset > MaxChar then
    horzOffset := MaxChar;
  if fHorzOffset = horzOffset then
    exit;
  fHorzOffset := horzOffset;
  UpdateHorzScroll;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.UpdateHorzScroll;
var
  si: TScrollInfo;
  SaveSelEnd: integer;
begin
  si.cbSize := sizeof(TScrollInfo);
  si.fMask := SIF_POS;
  si.nPos := fHorzOffset;
  SetScrollInfo(handle, SB_HORZ, si, true);
  SaveSelEnd := fSelEnd;
  UpdateCaret;
  fSelEnd := SaveSelEnd;
  if assigned(fOnScroll) then
    fOnScroll(self);
  invalidate;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMSize(var Message: TWMSize);
begin
  RecalcDimensions;
  UpdateScrollbars;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.RecalcDimensions;
var
  oldVisibleLines, oldVisibleChars: integer;
begin
  oldVisibleLines := fVisibleLines;
  oldVisibleChars := fVisibleChars;
  // make sure that as much of the text as possible scrolls into view ...
  fVisibleLines := (ClientHeight - fTopMargin) div fLineHeight - 1;
  if (fVertOffset > 0) and (fVisibleLines > oldVisibleLines) and
    (fVertOffset + fVisibleLines > fLines.count) then
    fVertOffset := max(0, fLines.count - fVisibleLines);
  fVisibleChars := (ClientWidth - fGutterWidth - fLeftMargin)
    div fCharWidth - 1;
  if (fHorzOffset > 0) and (fVisibleChars > oldVisibleChars) and
    (fHorzOffset + fVisibleChars > fCurrLongestLineLen) then
    fHorzOffset := max(0, fCurrLongestLineLen - fVisibleChars);
end;
// ------------------------------------------------------------------------------

function TCodeEdit.CharPtFromClientPt(pt: TPoint): TPoint;
var
  i, newX, len: integer;
begin
  Result := Point(0, 0);
  if fLines.count = 0 then
    exit;
  // get line index and char index ...
  Result.Y := min(fLines.count, max(0, fVertOffset + (pt.Y - fTopMargin)
    div fLineHeight));
  if (Result.Y = fLines.count) then
  begin
    dec(Result.Y);
    Result.X := $FFFF;
  end
  else
  begin
    Result.X := fHorzOffset + (pt.X - fGutterWidth - fLeftMargin)
      div fCharWidth;
    // adjust X offset for any tab chars
    if HasTabs(fLines[Result.Y]) then
    begin
      len := Length(fLines[Result.Y]);
      newX := 0;
      i := 0;
      while (i < len) and (newX < Result.X) do
      begin
        inc(i);
        if fLines[Result.Y][i] = #9 then
          inc(newX, fTabSize)
        else
          inc(newX);
      end;
      Result.X := i;
    end;
    Result.X := min(Length(fLines[Result.Y]), Result.X);
  end;
end;
// ------------------------------------------------------------------------------

function TCodeEdit.ClientPtFromCharPt(pt: TPoint): TPoint;
var
  i, newX: integer;
  S: string;
begin
  Result := Point(0, 0);
  if (fLines.count = 0) then
    exit;
  pt.Y := min(max(0, pt.Y), fLines.count - 1);
  pt.X := max(0, pt.X);
  Result.Y := (pt.Y - fVertOffset) * fLineHeight + fTopMargin;
  Result.Y := min(max(0, Result.Y), ClientHeight); // keep within client bounds
  S := copy(fLines[pt.Y], 1, pt.X);
  newX := Length(S);
  if HasTabs(S) then
    for i := 1 to Length(S) do
      if S[i] = TAB then
        inc(newX, fTabSize - 1);
  Result.X := (newX - fHorzOffset) * fCharWidth + fLeftMargin;
  Result.X := min(max(0, Result.X), ClientWidth);
end;
// ------------------------------------------------------------------------------

function TCodeEdit.CharPosFromCharPt(CharPt: TPoint): integer;
begin
  if (CharPt.Y = fLines.count) then
    Result := 0
  else if CharPt.Y = fLines.count then
    with fLines.LineObj[CharPt.Y - 1] do
      Result := fLineOffset + fLineLen
  else
    Result := fLines.LineObj[CharPt.Y].fLineOffset + CharPt.X;
end;
// ------------------------------------------------------------------------------

function TCodeEdit.CharPtFromCharPos(CharPos: integer): TPoint;
var
  L, H, i: integer;
begin
  inc(CharPos); // avoids some fiddling
  L := 0;
  H := fLines.count - 1;
  while L <= H do
  begin
    i := (L + H) shr 1;
    if fLines.LineObj[i].fLineOffset - CharPos < 0 then
      L := i + 1
    else
      H := i - 1;
  end;
  Result.Y := max(0, L - 1);
  if Result.Y = fLines.count then
    Result.X := 0
  else
    with fLines.LineObj[Result.Y] do
      Result.X := min(fLineLen, CharPos - fLineOffset - 1);
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.MouseDown(Button: TMouseButton; Shift: TShiftState;
  X, Y: integer);
var
  tmpCharPt: TPoint;
  tmpPos: integer;
begin
  if (csDesigning in ComponentState) then
    exit;
  inherited MouseDown(Button, Shift, X, Y);

  if { CanFocus and } not Focused then
  begin
    SetFocus;
    if ValidParentForm(self).ActiveControl <> self then
      MouseCapture := false;
  end;

  fMouseAction := maSelResize; // assume start of text selection

  if (Button = mbLeft) and (X > fGutterWidth) then
  begin
    tmpCharPt := CharPtFromClientPt(Point(X, Y));
    if ssDouble in Shift then
    begin
      // do a double-click word selection ...
      if (fLines.count = 0) or (fLines.LineObj[tmpCharPt.Y].fLineLen = 0) then
        exit;
      inc(tmpCharPt.X);
      if tmpCharPt.X > fLines.LineObj[tmpCharPt.Y].fLineLen then
        tmpCharPt.X := fLines.LineObj[tmpCharPt.Y].fLineLen;
      if not CharInSet(fLines[tmpCharPt.Y][tmpCharPt.X],
        ['0' .. '9', 'A' .. 'Z', 'a' .. 'z']) then
        exit;
      while (tmpCharPt.X < fLines.LineObj[tmpCharPt.Y].fLineLen) and
        CharInSet(fLines[tmpCharPt.Y][tmpCharPt.X + 1],
        ['0' .. '9', 'A' .. 'Z', 'a' .. 'z']) do
        inc(tmpCharPt.X);
      SetCaretPtInternal(tmpCharPt, false);
      while (tmpCharPt.X > 1) and
        CharInSet(fLines[tmpCharPt.Y][tmpCharPt.X - 1],
        ['0' .. '9', 'A' .. 'Z', 'a' .. 'z']) do
        dec(tmpCharPt.X);
      fSelStart := fLines.LineObj[tmpCharPt.Y].fLineOffset + tmpCharPt.X - 1;
    end
    else
    begin
      tmpCharPt := CharPtFromClientPt(Point(X, Y));
      tmpPos := CharPosFromCharPt(tmpCharPt);
      // check if clicking within a current selection
      if (tmpPos > min(fSelStart, fSelEnd)) and
        (tmpPos < max(fSelStart, fSelEnd)) then
      begin
        // ie: starting a selection move ...
        fMouseAction := maSelMove;
        ReleaseCapture;
        cursor := crDrag;
        MouseCapture := true;
      end
      else
        // otherwise just move the caret to the corresponding character ...
        SetCaretPtInternal(tmpCharPt, true);
    end;
    invalidate;
  end;

end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.MouseMove(Shift: TShiftState; X, Y: integer);
var
  pt: TPoint;
  tmpSelEnd: integer;
begin
  inherited MouseMove(Shift, X, Y);
  if (csDesigning in ComponentState) or (fMouseAction = maNone) then
    exit;

  if (Shift * [ssLeft, ssRight, ssMiddle] = [ssLeft]) then
  begin
    // if maSelResize then expand/contract the selection
    // otherwise (maSelMove) reposition the selection drop pt...
    tmpSelEnd := fSelEnd;
    pt := CharPtFromClientPt(Point(X, Y));
    if (X > fGutterWidth) and not PointsMatch(pt, CaretPt) then
    begin
      SetCaretPtInternal(pt, false);
      if (fMouseAction = maSelMove) then
        fSelEnd := tmpSelEnd;
      invalidate;
    end;
    // scroll selection if necessary ...
    if Y < LineHeight then
      InternalVScroll(fVertOffset - 1)
    else if Y > ClientHeight - LineHeight then
      InternalVScroll(fVertOffset + 1);
    if X < fGutterWidth + fLeftMargin + CharWidth then
      InternalHScroll(fHorzOffset - 1)
    else if X > ClientWidth - CharWidth then
      InternalHScroll(fHorzOffset + 1);
  end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.MouseUp(Button: TMouseButton; Shift: TShiftState;
  X, Y: integer);
var
  insertPos: integer;
  tmpCaretPt: TPoint;
  tmpSelText: string;
begin
  inherited MouseUp(Button, Shift, X, Y);

  if (fMouseAction = maSelMove) then // internal drag and drop
  begin
    insertPos := CharPosFromCharPt(fCaretPt);
    if (insertPos < min(fSelStart, fSelEnd)) or
      (insertPos > max(fSelStart, fSelEnd)) then
    begin
      tmpSelText := GetSelection;
      tmpCaretPt := fCaretPt;
      DeleteSelection;
      if fSelStart < insertPos then
      begin
        // Whenever moving a block further down, great care is needed as the
        // the real drop point will move up because of deleting the selection...
        dec(insertPos, Length(tmpSelText));
        fCaretPt := CharPtFromCharPos(insertPos);
      end
      else
        // restore fCaretPt as DeleteSelection moves it to the wrong place
        fCaretPt := tmpCaretPt;
      fSelStart := insertPos;
      fSelEnd := insertPos;
      SetSelection(tmpSelText);
      fSelStart := insertPos; // restore the selection
      invalidate;
      DoOnCaretPtChange;
    end;
  end;
  fMouseAction := maNone;
  cursor := crIBeam;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  CreateCaret;
  UpdateCaret;
  invalidate;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMKillFocus(var Message: TWMSetFocus);
begin
  inherited;
  DestroyCaret;
  invalidate;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.KeyDown(var Key: Word; Shift: TShiftState);
var
  SelectionVisible: boolean;

  procedure ChangeCaretPtY(NewVal: integer);
  begin
    fCaretPt.Y := NewVal;
    fCaretPt.X := max(fCaretXPosPreferred, fCaretPt.X);
    UpdateCaret;
    if not(ssShift in Shift) then
      fSelStart := fSelEnd;
    DoOnCaretPtChange;
    DoOnSelectionChange;
  end;

  procedure ChangeCaretPtX(NewVal: integer; AllowNextLine: boolean);
  begin
    if not AllowNextLine then
      fCaretPt.X := NewVal
    else if (NewVal < 0) and (fCaretPt.Y > 0) then
    begin
      dec(fCaretPt.Y);
      fCaretPt.X := $FFFF;
    end
    else if (NewVal > fCaretPt.X) and (fCaretPt.Y < fLines.count - 1) and
      (fCaretPt.X = fLines.LineObj[fCaretPt.Y].fLineLen) then
    begin
      inc(fCaretPt.Y);
      fCaretPt.X := 0;
    end
    else
      fCaretPt.X := NewVal;
    fCaretXPosPreferred := fCaretPt.X;
    UpdateCaret;
    if not(ssShift in Shift) then
      fSelStart := fSelEnd;
    DoOnCaretPtChange;
    DoOnSelectionChange;
  end;

  procedure NextWord;
  var
    S: string;
    len: integer;
  begin
    if (fLines.count = 0) then
      exit;
    S := fLines[fCaretPt.Y];
    len := Length(S);
    if (fCaretPt.X = len) then
    begin
      if (fCaretPt.Y = fLines.count - 1) then
        exit;
      inc(fCaretPt.Y);
      fCaretPt.X := 0;
    end
    else
    begin
      while (fCaretPt.X < len) and (S[fCaretPt.X + 1] > #32) do
        inc(fCaretPt.X);
      while (fCaretPt.X < len) and (S[fCaretPt.X + 1] < #33) do
        inc(fCaretPt.X);
    end;
    UpdateCaret;
    fCaretXPosPreferred := fCaretPt.X;
    if not(ssShift in Shift) then
      fSelStart := fSelEnd;
    DoOnCaretPtChange;
    DoOnSelectionChange;
  end;

  procedure PrevWord;
  var
    S: string;
  begin
    if (fLines.count = 0) then
      exit;
    S := fLines[fCaretPt.Y];
    fCaretPt.X := min(Length(S), fCaretPt.X);
    while (fCaretPt.X > 0) and (S[fCaretPt.X] < #33) do
      dec(fCaretPt.X);
    if (fCaretPt.X = 0) then
    begin
      if fCaretPt.Y > 0 then
      begin
        dec(fCaretPt.Y);
        fCaretPt.X := $FFFF;
      end;
    end
    else
      while (fCaretPt.X > 0) and (S[fCaretPt.X] > #32) do
        dec(fCaretPt.X);
    UpdateCaret;
    fCaretXPosPreferred := fCaretPt.X;
    if not(ssShift in Shift) then
      fSelStart := fSelEnd;
    DoOnCaretPtChange;
    DoOnSelectionChange;
  end;

begin
  if assigned(OnKeyDown) then
    OnKeyDown(self, Key, Shift);
  if (ssAlt in Shift) then
    exit;

  SelectionVisible := fSelEnd <> fSelStart;
  case Key of
    VK_UP:
      ChangeCaretPtY(fCaretPt.Y - 1);
    VK_DOWN:
      ChangeCaretPtY(fCaretPt.Y + 1);
    VK_PRIOR:
      ChangeCaretPtY(fCaretPt.Y - fVisibleLines);
    VK_NEXT:
      ChangeCaretPtY(fCaretPt.Y + fVisibleLines);
    VK_HOME:
      begin
        if (ssCtrl in Shift) then
          ChangeCaretPtY(0);
        ChangeCaretPtX(0, false);
      end;
    VK_END:
      begin
        if (ssCtrl in Shift) then
          ChangeCaretPtY(fLines.count);
        ChangeCaretPtX($FFFF, false);
      end;
    VK_LEFT:
      if (ssCtrl in Shift) then
        PrevWord
      else
        ChangeCaretPtX(fCaretPt.X - 1, true);
    VK_RIGHT:
      if (ssCtrl in Shift) then
        NextWord
      else
        ChangeCaretPtX(fCaretPt.X + 1, true);
    VK_DELETE:
      if not(ssCtrl in Shift) then
        KeyPressWhileEditing(DEL);
  end;
  ScrollCaretIntoView;
  if SelectionVisible or (ssShift in Shift) then
    invalidate; // because selection changing
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key <> #0) then
    case Key of
      ^A:
        begin
          fSelStart := 0;
          SetCaretPtInternal(Point($FFFF, fLines.count - 1), false);
          ScrollCaretIntoView;
          invalidate;
          DoOnSelectionChange;
        end;
      ^C:
        CopyToClipBoard;
      ^V:
        if not fReadOnly then
          PasteFromClipBoard;
      ^X:
        if fReadOnly then
          CopyToClipBoard
        else
          CutToClipBoard;
    else
      KeyPressWhileEditing(Key);
    end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.DeleteSelection;
var
  i: integer;
  selStartPt, selEndPt: TPoint;
  sLead, sTrail: string;
  UndoItem: TUndoItem;
begin
  if (fSelEnd = fSelStart) or fReadOnly then
    exit;
  selStartPt := CharPtFromCharPos(min(fSelStart, fSelEnd));
  selEndPt := CharPtFromCharPos(max(fSelStart, fSelEnd));

  UndoItem.fType := utDelSel;
  UndoItem.fOldSelStart := fSelStart;
  UndoItem.fOldSelEnd := fSelEnd;
  UndoItem.fDeletedText := GetSelection;

  if (selStartPt.X = 0) and (selStartPt.Y = 0) and
    (selEndPt.Y = fLines.count - 1) and
    (selEndPt.X = fLines.LineObj[selEndPt.Y].fLineLen) then
  begin
    // everything selected so just clear and exit ...
    fLines.Clear;
    UndoItem.fNewSelStart := 0;
    UndoItem.fNewCaretPt := Point(0, 0);
    fUndo.Add(UndoItem);
    exit;
  end;
  fLines.BeginUpdate;
  try
    sLead := copy(fLines[selStartPt.Y], 1, selStartPt.X);
    sTrail := copy(fLines[selEndPt.Y], selEndPt.X + 1, $FFFF);
    if selStartPt.X = 0 then
    begin
      for i := selEndPt.Y - 1 downto selStartPt.Y do
        fLines.Delete(i);
      if selEndPt.X > 0 then
        fLines[selStartPt.Y] := sTrail;
    end
    else
    begin
      fLines[selStartPt.Y] := sLead;
      for i := selEndPt.Y downto selStartPt.Y + 1 do
        fLines.Delete(i);
      fLines[selStartPt.Y] := fLines[selStartPt.Y] + sTrail;
    end;
  finally
    fLines.EndUpdate;
  end;
  SetCaretPtInternal(selStartPt, true);
  UndoItem.fNewSelStart := min(fSelStart, fSelEnd);
  UndoItem.fNewCaretPt := fCaretPt;
  fUndo.Add(UndoItem);
end;
// ------------------------------------------------------------------------------

function TCodeEdit.GetSelection: string;
var
  selStartPt, selEndPt: TPoint;
  p: pchar;
  S: string;
  len: integer;
begin
  if (fSelEnd = fSelStart) then
    exit;
  selStartPt := CharPtFromCharPos(min(fSelStart, fSelEnd));
  selEndPt := CharPtFromCharPos(max(fSelStart, fSelEnd));
  setLength(Result, abs(fSelEnd - fSelStart));
  if selStartPt.Y >= fLines.count then
    exit; // todo - add assert here (shouldn't happen)
  if selStartPt.Y = selEndPt.Y then
  begin
    Result := copy(fLines[selStartPt.Y], selStartPt.X + 1,
      selEndPt.X - selStartPt.X);
  end
  else
  begin
    // copy the selected portion of the first line to Result ...
    S := copy(fLines[selStartPt.Y], selStartPt.X + 1, $FFFF) + NEWLINE;
    p := pchar(Result);
    System.Move(S[1], p^, Length(S));
    inc(p, Length(S));
    inc(selStartPt.Y);
    while selStartPt.Y < selEndPt.Y do
    begin
      len := fLines.LineObj[selStartPt.Y].fLineLen;
      if len > 0 then
      begin
        System.Move(fLines[selStartPt.Y][1], p^, len);
        inc(p, len);
      end;
      System.Move(NEWLINE, p^, sizeof(NEWLINE));
      inc(p, sizeof(NEWLINE));
      inc(selStartPt.Y);
    end;
    S := copy(fLines[selStartPt.Y], 1, selEndPt.X);
    if Length(S) > 0 then
      System.Move(S[1], p^, Length(S));
  end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetSelection(const selText: string);
var
  sLead, sTrail: string;
  i, XOffset: integer;
  HasTrailingCR: boolean;
  sl: TStringList;
  UndoItem: TUndoItem;
begin
  if fReadOnly then
    exit;
  DeleteSelection;

  if selText = '' then
    exit;

  UndoItem.fType := utSetSel;
  UndoItem.fOldSelEnd := fSelEnd;
  UndoItem.fOldCaretPt := fCaretPt;

  if fLines.count = 0 then
    fLines.Add('');
  sl := TStringList.Create;
  fLines.BeginUpdate;
  try
    sLead := fLines[fCaretPt.Y];
    sTrail := copy(sLead, fCaretPt.X + 1, $FFFF);
    sLead := copy(sLead, 1, fCaretPt.X);
    sl.Text := selText;
    HasTrailingCR := CharInSet(selText[Length(selText)], [#10, #13]);
    XOffset := Length(sl[sl.count - 1]);
    // this is a bit messy but is necessary to preserve LineObj status
    // and reflect 'typical' windows behaviour ...
    if fCaretPt.X = 0 then
    begin
      if HasTrailingCR then
      begin
        for i := 0 to sl.count - 1 do
        begin
          fLines.Insert(fCaretPt.Y, sl[i]);
          inc(fCaretPt.Y);
        end;
      end
      else
      begin
        for i := 0 to sl.count - 2 do
        begin
          fLines.Insert(fCaretPt.Y, sl[i]);
          inc(fCaretPt.Y);
        end;
        fCaretPt.X := XOffset;
        fLines[fCaretPt.Y] := sl[sl.count - 1] + fLines[fCaretPt.Y];
      end;
    end
    else
    begin
      if HasTrailingCR then
        sl.Add('');
      fLines[fCaretPt.Y] := sLead + sl[0];
      for i := 1 to sl.count - 1 do
      begin
        inc(fCaretPt.Y);
        fLines.Insert(fCaretPt.Y, sl[i]);
      end;
      fCaretPt.X := Length(fLines[fCaretPt.Y]);
      if Length(sTrail) > 0 then
        fLines[fCaretPt.Y] := fLines[fCaretPt.Y] + sTrail;
    end;
  finally
    fLines.EndUpdate;
    sl.Free;
  end;
  SetCaretPtInternal(fCaretPt, true);
  UndoItem.fNewSelEnd := fSelEnd;
  UndoItem.fAddedText := selText;
  fUndo.Add(UndoItem);
  ScrollCaretIntoView;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.Undo;
begin
  fUndo.DoUndo;
  ScrollCaretIntoView;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.Redo;
begin
  fUndo.DoRedo;
  ScrollCaretIntoView;
end;
// ------------------------------------------------------------------------------

function TCodeEdit.GetCanUndo: boolean;
begin
  with fUndo do
    Result := (fUndoList.count > 0) and (fUndoPos > 0);
end;
// ------------------------------------------------------------------------------

function TCodeEdit.GetCanRedo: boolean;
begin
  with fUndo do
    Result := (fUndoList.count > 0) and (fUndoPos < fUndoList.count);
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.CutToClipBoard;
begin
  CopyToClipBoard;
  DeleteSelection;
  DoOnSelectionChange;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.CopyToClipBoard;
var
  S: string;
begin
  S := GetSelection;
  if S = '' then
    exit;
  Clipboard.Open;
  try
    Clipboard.AsText := S;
  finally
    Clipboard.Close;
  end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMCUT(var Message: TMessage);
begin
  CutToClipBoard;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMCOPY(var Message: TMessage);
begin
  CopyToClipBoard;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMPASTE(var Message: TMessage);
begin
  PasteFromClipBoard;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.PasteFromClipBoard;
begin
  Clipboard.Open;
  try
    SetSelection(Clipboard.AsText);
    DoOnSelectionChange;
  finally
    Clipboard.Close;
  end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.KeyPressWhileEditing(Key: Char);
var
  S, s2: string;
  UndoItem: TUndoItem;
begin
  if fReadOnly or not CharInSet(Key, [DEL, BACKSPC, TAB, RETURN, #32 .. #255]) then
    exit;
  if (fLines.count = 0) then
  begin
    if CharInSet(Key, [DEL, BACKSPC]) then
      exit;
    // add a new line ...
    fLines.Add('');
    fCaretPt.X := 0;
    if Key = RETURN then
      exit;
  end;

  UndoItem.fType := utAddChar; // will change if key is DEL or BACKSPC
  UndoItem.fAddedText := Key;
  UndoItem.fOldSelEnd := fSelEnd; // updated if DeleteSelection called
  UndoItem.fOldCaretPt := fCaretPt; // updated if DeleteSelection called

  case Key of
    DEL:
      if (fSelEnd <> fSelStart) then
      begin
        DeleteSelection;
        UndoItem.fType := utDelChar;
      end
      else if fCaretPt.X = fLines.LineObj[fCaretPt.Y].fLineLen then
      begin
        if fCaretPt.Y = fLines.count - 1 then
          exit;
        // joins 2 lines ...
        UndoItem.fType := utDelChar;
        UndoItem.fDeletedText := #13;
        if fCaretPt.X = 0 then
          fLines.Delete(fCaretPt.Y)
        else if fLines.LineObj[fCaretPt.Y + 1].fLineLen = 0 then
          fLines.Delete(fCaretPt.Y + 1)
        else
        begin
          fLines[fCaretPt.Y] := fLines[fCaretPt.Y] + fLines[fCaretPt.Y + 1];
          fLines.Delete(fCaretPt.Y + 1);
        end;
        fUndo.Add(UndoItem);
      end
      else
      begin
        // delete a char ...
        S := fLines[fCaretPt.Y];
        if fCaretPt.X + 1 > Length(S) then
          exit; // oops, shouldn't happen
        UndoItem.fType := utDelChar;
        UndoItem.fDeletedText := S[fCaretPt.X + 1];
        Delete(S, fCaretPt.X + 1, 1);
        fLines[fCaretPt.Y] := S;
        fUndo.Add(UndoItem);
      end;
    BACKSPC:
      if (fSelEnd <> fSelStart) then
      begin
        DeleteSelection;
        UndoItem.fType := utDelChar;
      end
      else if fCaretPt.X = 0 then
      begin
        if (fCaretPt.Y = 0) then
          exit;
        // joins 2 lines ...
        if fLines.LineObj[fCaretPt.Y - 1].fLineLen = 0 then
        begin
          dec(fCaretPt.Y);
          fLines.Delete(fCaretPt.Y);
        end
        else if fLines.LineObj[fCaretPt.Y].fLineLen = 0 then
        begin
          fLines.Delete(fCaretPt.Y);
          dec(fCaretPt.Y);
          fCaretPt.X := fLines.LineObj[fCaretPt.Y].fLineLen;
        end
        else
        begin
          S := fLines[fCaretPt.Y];
          fLines.Delete(fCaretPt.Y);
          dec(fCaretPt.Y);
          fCaretPt.X := fLines.LineObj[fCaretPt.Y].fLineLen;
          fLines[fCaretPt.Y] := fLines[fCaretPt.Y] + S;
        end;
        UndoItem.fType := utDelChar;
        UndoItem.fDeletedText := #13;
        UndoItem.fOldCaretPt := fCaretPt;
        UndoItem.fOldSelEnd := CharPosFromCharPt(fCaretPt);
        fUndo.Add(UndoItem); // behaves like a DEL while at end of previous line
      end
      else
      begin
        // deletes a char in the line ...
        S := fLines[fCaretPt.Y];
        UndoItem.fType := utDelChar;
        UndoItem.fDeletedText := S[fCaretPt.X];
        Delete(S, fCaretPt.X, 1);
        fLines[fCaretPt.Y] := S;
        dec(fCaretPt.X);
        UndoItem.fOldSelEnd := fSelEnd - 1; // treat it as if a DEL key
        dec(UndoItem.fOldCaretPt.X);
        fUndo.Add(UndoItem);
      end;
    RETURN:
      begin
        DeleteSelection;
        UndoItem.fOldSelEnd := fSelEnd;
        UndoItem.fOldCaretPt := fCaretPt;
        if fCaretPt.X = 0 then
          fLines.Insert(fCaretPt.Y, '')
        else if fCaretPt.X = fLines.LineObj[fCaretPt.Y].fLineLen then
          fLines.Insert(fCaretPt.Y + 1, '')
        else
        begin
          S := copy(fLines[fCaretPt.Y], 1, fCaretPt.X);
          s2 := copy(fLines[fCaretPt.Y], fCaretPt.X + 1, $FFFF);
          fLines[fCaretPt.Y] := S;
          fLines.Insert(fCaretPt.Y + 1, s2);
        end;
        inc(fCaretPt.Y);
        fCaretPt.X := 0;
      end;
    // OTHERWISE any other key ...
  else
    begin
      DeleteSelection;
      UndoItem.fOldSelEnd := fSelEnd;
      UndoItem.fOldCaretPt := fCaretPt;
      // add new char ...
      S := fLines[fCaretPt.Y];
      Insert(Key, S, fCaretPt.X + 1);
      fLines[fCaretPt.Y] := S;
      inc(fCaretPt.X);
    end;
  end; // endcase
  fCaretXPosPreferred := fCaretPt.X;
  UpdateCaret;
  fSelStart := fSelEnd;
  ScrollCaretIntoView;
  DoOnCaretPtChange;
  if UndoItem.fType = utAddChar then
  begin
    UndoItem.fNewSelEnd := fSelEnd;
    UndoItem.fNewCaretPt := fCaretPt;
    fUndo.Add(UndoItem);
  end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.WMEraseBkgnd(var Message: TMessage);
begin
  Message.Result := 1;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.Paint;
var
  i: integer;
  Rec: TRect;
  numStr: string;
  leftMargColor: TColor;
begin
  if Focused then
    leftMargColor := $AAEEEE
  else // pale yellowy gray
    leftMargColor := $D0D0D0; // pale silvery gray
  with Canvas do
  begin
    Rec := clientrect;
    Rec.Left := fGutterWidth;
    Brush.Color := Color;
    fillrect(Rec);
    // draw fixed left margin ...
    if fGutterWidth > 0 then
    begin
      Rec := clientrect;
      Rec.Right := fGutterWidth;
      Brush.Color := leftMargColor;
      fillrect(Rec);
      Brush.Color := Color;
      pen.Color := clGray;
      moveto(Rec.Right - 1, Rec.Top);
      lineto(Rec.Right - 1, Rec.Bottom);
      pen.Color := clSilver;
      moveto(Rec.Right - 2, Rec.Top);
      lineto(Rec.Right - 2, Rec.Bottom);
      pen.Color := clBlack;
    end;
    // draw each visible line ...
    for i := 0 to fLines.count - fVertOffset - 1 do
    begin
      if (i > fVisibleLines) then
        break;

      Rec := clientrect;
      Rec.Left := fGutterWidth + fLeftMargin;
      // paint the top margin the color of the preceeding line ...
      if i = 0 then
      begin
        if fVertOffset > 0 then
          if TLineObj(fLines.objects[fVertOffset - 1]).fModified then
            Brush.Color := fLineModClr
          else
            Brush.Color := TLineObj(fLines.objects[fVertOffset - 1]).BackClr
        else
          Brush.Color := Color;
        Rec.Top := 0;
        Rec.Bottom := fTopMargin;
        fillrect(Rec);
      end;

      Rec.Top := fTopMargin + (i * fLineHeight);
      Rec.Bottom := Rec.Top + fLineHeight;

      // draw stuff in left margin ...
      if fAutoLineNums then
      begin
        Brush.Color := leftMargColor;
        numStr := inttostr(fVertOffset + i + 1);
        TextOut(fGutterWidth - textwidth(numStr) - 4, Rec.Top, numStr);
        Brush.Color := Color;
      end
      else if assigned(fPaintLeftMargin) then
      begin
        Brush.Color := leftMargColor;
        fPaintLeftMargin(self, Canvas, Rect(0, Rec.Top, fGutterWidth - 3,
          Rec.Bottom), fVertOffset + i + 1,
          TLineObj(fLines.objects[fVertOffset + i]).Tag);
        Brush.Color := Color;
      end;
      // paint text ...
      PaintLine(fVertOffset + i, Rec);
    end;
  end;
end;
// ------------------------------------------------------------------------------

function TCodeEdit.ConvertTabs(const str: string): string;
var
  i, j: integer;
begin
  Result := str;
  for i := Length(str) downto 1 do
    if str[i] = TAB then
    begin
      Result[i] := ' ';
      for j := 2 to fTabSize do
        Insert(' ', Result, i);
    end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.PaintLine(LineNo: integer; Rec: TRect);
var
  str: string;
  containsTabs: boolean;
  i, relSelStart, relSelEnd, lft: integer;
  lineClr, oldFntCol: TColor;
begin
  str := fLines[LineNo];
  containsTabs := HasTabs(str);
  if containsTabs then
    str := ConvertTabs(str);
  with TLineObj(fLines.objects[LineNo]) do
  begin
    if fModified then
      lineClr := fLineModClr
    else
      lineClr := BackClr;
    Canvas.Brush.Color := lineClr;
    relSelStart := min(fSelStart, fSelEnd);
    relSelEnd := max(fSelStart, fSelEnd);
    // IF THE LINE CONTAINS SELECTED TEXT ...
    if (relSelEnd <> relSelStart) and (relSelStart <= fLineOffset + fLineLen)
      and (relSelEnd >= fLineOffset) then
    begin
      // lft == text offset relative to rec based on Horz scroll
      lft := Rec.Left - fCharWidth * fHorzOffset;
      // get selStart & selEnd relative to curent line
      relSelStart := max(0, relSelStart - fLineOffset);
      relSelEnd := min(fLineLen, relSelEnd - fLineOffset);
      // adjust relSelStart & relSelEnd if text contains tabs
      if containsTabs then
      begin
        for i := relSelStart downto 1 do
          if fLines[LineNo][i] = TAB then
            inc(relSelStart, fTabSize - 1);
        for i := relSelEnd downto 1 do
          if fLines[LineNo][i] = TAB then
            inc(relSelEnd, fTabSize - 1);
      end;
      // adjust relSelStart & relSelEnd for Horz scroll pos
      relSelStart := max(0, relSelStart - fHorzOffset);
      relSelEnd := max(0, relSelEnd - fHorzOffset - relSelStart);
      if relSelStart > 0 then
      begin
        // paint the portion of the line prior to the selection
        Canvas.TextRect(Rec, lft, Rec.Top, str);
        inc(Rec.Left, fCharWidth * relSelStart);
      end;
      // paint selected text ...
      oldFntCol := Canvas.Font.Color;
      Canvas.Font.Color := clHighlightText;
      if Focused then
        Canvas.Brush.Color := clHighlight
      else
        Canvas.Brush.Color := clLtGray;
      Canvas.TextRect(Rec, lft, Rec.Top, str);
      Canvas.Brush.Color := lineClr;
      Canvas.Font.Color := oldFntCol;
      if max(fSelStart, fSelEnd) - fLineOffset <= fLineLen then
      begin
        // paint the portion of the line after the selection ...
        inc(Rec.Left, fCharWidth * relSelEnd);
        Canvas.TextRect(Rec, lft, Rec.Top, str);
      end;
    end
    else
      // IF THE LINE DOESN'T CONTAIN ANY SELECTED TEXT
      Canvas.TextRect(Rec, Rec.Left - fCharWidth * fHorzOffset, Rec.Top, str);
  end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.CreateCaret;
begin
  if fCaretCreated or (csDesigning in ComponentState) or ReadOnly or not Focused
  then
    exit;
  Windows.CreateCaret(handle, 0, CARETWIDTH, fLineHeight - 2);
  fCaretCreated := true;
  UpdateCaret;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.DestroyCaret;
begin
  if not fCaretCreated then
    exit;
  if fCaretVisible then
    HideCaret(handle);
  Windows.DestroyCaret;
  fCaretCreated := false;
  fCaretVisible := false;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetCaretPt(pt: TPoint);
begin
  SetCaretPtInternal(pt, true); // removes any selection
  ScrollCaretIntoView;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.SetCaretPtInternal(pt: TPoint; KillSel: boolean);
begin
  fCaretXPosPreferred := pt.X;
  fCaretPt := pt;
  UpdateCaret;
  if KillSel then
    fSelStart := fSelEnd;
  DoOnCaretPtChange;
  DoOnSelectionChange;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.UpdateCaret;
var
  HideCaret: boolean;
  StrHasTabs: boolean;
  i, tmpX: integer;
begin
  with fCaretPt do
  begin
    if Y >= fLines.count then
      Y := fLines.count - 1;
    if Y < 0 then
      Y := 0;
    if (fLines.count = 0) or (X < 0) then
    begin
      X := 0;
      tmpX := X;
    end
    else
    begin
      StrHasTabs := HasTabs(fLines[Y]);
      X := min(X, Length(fLines[Y]));
      tmpX := X;
      if StrHasTabs then
      begin
        for i := 1 to X do
          if fLines[Y][i] = #9 then
            inc(tmpX, fTabSize - 1);
      end;
    end;
  end;

  fSelEnd := CharPosFromCharPt(fCaretPt);

  // now display caret ...
  if not fCaretCreated then
    exit;
  HideCaret := (fCaretPt.Y < fVertOffset) or (tmpX < fHorzOffset);
  if not fCaretVisible and HideCaret then
    exit // don't update or unhide charet
  else if HideCaret then
  begin
    Windows.HideCaret(handle);
    fCaretVisible := false;
  end
  else
  begin
    Windows.SetCaretPos(fGutterWidth + fLeftMargin + (tmpX - fHorzOffset) *
      fCharWidth, fTopMargin + (fCaretPt.Y - fVertOffset) * fLineHeight + 1);
    if not fCaretVisible then
    begin
      ShowCaret(handle);
      fCaretVisible := true;
    end;
  end;
end;
// ------------------------------------------------------------------------------

procedure TCodeEdit.ScrollCaretIntoView;
begin
  if fCaretPt.X < fHorzOffset then
  begin
    fHorzOffset := max(0, fCaretPt.X);
    UpdateHorzScroll;
  end
  else if fCaretPt.X > fHorzOffset + fVisibleChars then
  begin
    fHorzOffset := max(0, fCaretPt.X - fVisibleChars);
    UpdateHorzScroll;
  end;
  if fCaretPt.Y < fVertOffset then
  begin
    fVertOffset := max(0, fCaretPt.Y);
    UpdateVertScroll;
  end
  else if fCaretPt.Y > fVertOffset + fVisibleLines then
  begin
    fVertOffset := max(0, fCaretPt.Y - fVisibleLines);
    UpdateVertScroll;
  end;
end;
// ------------------------------------------------------------------------------

end.