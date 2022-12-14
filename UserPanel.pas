unit UserPanel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, System.UITypes;

type
  TForm15 = class(TForm)
    Panel1: TPanel;
    ImageList1: TImageList;
    Button4: TButton;
    Button3: TButton;
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation
uses DM, MainMenu, ChangeUserPass;

{$R *.dfm}

procedure TForm15.Button3Click(Sender: TObject);
begin
  Form19.Show;
  Form15.Enabled := false;
end;

procedure TForm15.Button4Click(Sender: TObject);
var userResponse: integer;
begin
  userResponse := MessageDlg('?? ????????????? ?????? ????? ?? ???????? ?????????????', mtConfirmation, [mbYes, mbNo], 0);
  case userResponse of
    mrYes:
    begin
      gUser := false;
      addAccess := false;
      editAccess := false;
      deleteAccess := false;
      printsaveAccess := false;
      Form15.Close;
    end;
    mrNo: exit;
  end;
end;

procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled := true;
end;

end.
