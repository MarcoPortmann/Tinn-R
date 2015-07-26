unit ufrmTidyAbort;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmTidyAbort = class(TForm)
    Label1: TLabel;
    bAbort: TButton;
    procedure bAbortClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTidyAbort: TfrmTidyAbort;

implementation

uses ufrmMain;
{$R *.dfm}

procedure TfrmTidyAbort.bAbortClick(Sender: TObject);
begin
  frmTinnMain.bTidying := false;
  close;
  //FreeAndNil(frmTidyAbort);
end;

end.
