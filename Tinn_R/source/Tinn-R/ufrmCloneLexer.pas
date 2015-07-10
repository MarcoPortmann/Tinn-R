unit ufrmCloneLexer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin, Data.DB,
  Vcl.ExtCtrls;

type
  TfrmCloneDialog = class(TForm)
    OK: TButton;
    Button2: TButton;
    leLexerName: TLabeledEdit;
    seLexerId: TSpinEdit;
    Label1: TLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCloneDialog: TfrmCloneDialog;

implementation
uses uModDados;
{$R *.dfm}

procedure TfrmCloneDialog.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if self.ModalResult = mrOK then
  begin
   if moddados.cdLexers2.Locate('LexerName', ('Test'), [loCaseInsensitive]) then
      showmessage('yes');

   if moddados.cdLexers2.Locate('LexerName', (trim(leLexerName.Text)),   [loCaseInsensitive]) then
   begin
     CanClose := false;
     messagedlg('Highlighter name already exists.', mtError, [mbOK], 0);
   end else
   if moddados.cdLexers2.Locate('LexerId', (seLexerId.Value), [loCaseInsensitive]) then
   begin
     CanClose := false;
     messagedlg('Highlighter ID already exists.', mtError, [mbOK], 0);
   end
  end;
end;

end.
