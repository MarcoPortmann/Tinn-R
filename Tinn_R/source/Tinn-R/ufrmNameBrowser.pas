unit ufrmNameBrowser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Clipbrd,
  JvComponentBase, JvDockControlForm, Vcl.StdCtrls, System.RegularExpressions,
  Vcl.Menus, DScintilla;

type
  TfrmNameBrowser = class(TForm)
    panHeader: TPanel;
    lvNames: TListView;
    JvDockClientNameBrowser: TJvDockClient;
    edNameSearch: TButtonedEdit;
    popmenInsert: TPopupMenu;
    Insertandclose1: TMenuItem;
    procedure lvNamesDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure edNameSearchChange(Sender: TObject);
    procedure lvNamesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Insertandclose1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNameSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edNameSearchKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    iSelStart: Integer;
    liAllNames: TListView;
    SciInsertEd: TDScintilla;

    { Public declarations }
    procedure TryInsert;
    procedure CloseNamePopup;
  end;

var
  frmNameBrowser: TfrmNameBrowser;

implementation

uses ufrmMain, ufrmEditor;
{$R *.dfm}

procedure TfrmNameBrowser.edNameSearchChange(Sender: TObject);
var
  i: Integer;
  sSearch, s1, s2: String;
begin
  if frmTinnMain.bNameFormLoading then
  begin
    edNameSearch.Text := '';
    exit;
  end;

  sSearch := trim(edNameSearch.Text);
  if trim(edNameSearch.Text) = '' then
  begin
    lvNames.Items.BeginUpdate;
    lvNames.Items := liAllNames.Items;
    lvNames.ItemIndex := 0;
    lvNames.Items.EndUpdate;
  end
  else
  begin
    lvNames.Items.BeginUpdate;
    lvNames.Items := liAllNames.Items;
    s1 := sSearch;

    for i := lvNames.Items.Count - 1 downto 0 do
    begin

      s2 := lvNames.Items[i].Caption;
      if not TRegEx.IsMatch(s2, s1, [roIgnoreCase]) then
      begin
        lvNames.Items[i].Delete;
      end;
    end;
    // lvNames.Invalidate;
    // lvNames.Update;
    if lvNames.Items.Count > 0 then
      lvNames.ItemIndex := 0;
    lvNames.Items.EndUpdate;
  end;
end;

procedure TfrmNameBrowser.edNameSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    TryInsert;
end;

procedure TfrmNameBrowser.edNameSearchKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    Key := #0;
end;

procedure TfrmNameBrowser.FormCreate(Sender: TObject);
begin
  JvDockClientNameBrowser.DockStyle := frmTinnMain.JvDockVSNetStyle;
  ManualDock(frmTinnMain.JvDockServer.LeftDockPanel, nil, AlClient);
  ShowDockForm(frmNameBrowser);

end;

procedure TfrmNameBrowser.FormDeactivate(Sender: TObject);
begin
  if not frmTinnMain.bNameFormLoading then
  begin
    CloseNamePopup;
  end;
end;

procedure TfrmNameBrowser.FormDestroy(Sender: TObject);
begin
  liAllNames.free;
end;

procedure TfrmNameBrowser.FormShow(Sender: TObject);
begin
  BringToFront;
  BringWindowToTop(self.Handle);
  SetForegroundWindow(self.Handle);
  ShowDockForm(frmNameBrowser);
  SetWindowPos(Handle, HWND_TOP, 0, 0, 0, 0, SWP_NOMOVE + SWP_NOSIZE);
end;

procedure TfrmNameBrowser.Insertandclose1Click(Sender: TObject);
begin
  TryInsert;
end;

procedure TfrmNameBrowser.lvNamesDblClick(Sender: TObject);
begin
  TryInsert;
end;

procedure TfrmNameBrowser.lvNamesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    TryInsert;
end;

procedure TfrmNameBrowser.TryInsert;
var
  sInsert: String;
  i, iInsertPosition, iPosNow: Integer;
begin
  if not assigned(SciInsertEd) then
  begin
    CloseNamePopup;
    exit;
  end;

  sInsert := '';
  iInsertPosition := iSelStart;
  iPosNow := SciInsertEd.GetCurrentPos;
  if lvNames.SelCount = 1 then
  begin
    if SciInsertEd.GetTextRange(iInsertPosition-1, iInsertPosition) = '[' then
      sInsert := ', c('''+lvNames.Selected.Caption+''')]'
    else
    sInsert := lvNames.Selected.Caption;
  end;


  if lvNames.SelCount > 1 then
  begin
    iInsertPosition := iInsertPosition - 1;
    for i := 0 to lvNames.Items.Count - 1 do
      if lvNames.Items[i].Selected then
        if sInsert = '' then
          sInsert := quotedstr(lvNames.Items[i].Caption)
        else
          sInsert := sInsert + ', ' + quotedstr(lvNames.Items[i].Caption);

    sInsert := '[, c(' + sInsert + ')]';
  end;

  if SInsert = '' then
    if trim(edNameSearch.Text) <> ''  then
      sInsert := edNameSearch.Text;

  if sInsert <> '' then
  begin
    with SciInsertEd do
    begin
      frmTinnMain.bDoInsert := true;
      SetSelectionStart(iInsertPosition);
      SetSelectionEnd(iPosNow);
      ReplaceSel(sInsert);

      frmTinnMain.bDoInsert := false;
    end;
  end;
  CloseNamePopup;
end;

procedure TfrmNameBrowser.CloseNamePopup;
begin
  if assigned(SciInsertEd) then
    SciInsertEd.IndicatorClearRange(0, SciInsertEd.getCurrentPos);
  Visible := false;
  frmTinnMain.bNameFormLoading := false;
  frmTinnMain.bNameFormActive := false;
  SciInsertEd := nil;
end;

end.
