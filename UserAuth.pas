﻿unit UserAuth;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm14 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    ImageList1: TImageList;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation
uses DM, MainMenu;

{$R *.dfm}

procedure TForm14.Button1Click(Sender: TObject);
begin
  if (DataModule2.User.Lookup('login',LabeledEdit1.Text,'password')) <> LabeledEdit2.Text then
  ShowMessage('❎ Неверный логин или пароль!')
  else begin
    gUser := true;
    with DM.DataModule2.User_Query do
    begin
      Active := false;
      SQL.Clear;
      SQL.Text := 'SELECT * FROM users WHERE password =' + QuotedStr(LabeledEdit2.Text);
      Active:= true;
    end;
    addAccess := DM.DataModule2.User_Query.FieldByName('addAccess').Value;
    editAccess := DM.DataModule2.User_Query.FieldByName('editAccess').Value;
    deleteAccess := DM.DataModule2.User_Query.FieldByName('deleteAccess').Value;
    printsaveAccess := DM.DataModule2.User_Query.FieldByName('printsaveAccess').Value;
    ShowMessage('✅ Вы успешно авторизировались в качестве пользователя.');
    LabeledEdit1.Clear;
    LabeledEdit2.Clear;
    Form14.Close;
  end;
end;

procedure TForm14.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled := true;
end;

end.
