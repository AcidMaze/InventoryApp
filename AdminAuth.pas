﻿unit AdminAuth;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  System.ImageList, Vcl.ImgList;

type
  TForm12 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    ImageList1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

{$R *.dfm}

uses DM, MainMenu;

procedure TForm12.Button1Click(Sender: TObject);
begin
  if (DataModule2.Admin.Lookup('login',LabeledEdit1.Text,'password')) <> LabeledEdit2.Text then
  ShowMessage('❎ Неверный логин или пароль!')
  else begin
    gAdmin := true;
    ShowMessage('✅ Вы успешно авторизировались в качестве администратора.');
    LabeledEdit1.Clear;
    LabeledEdit2.Clear;
    Form12.Close;
  end;
end;

procedure TForm12.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled := true;
end;

end.
