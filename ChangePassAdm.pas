﻿unit ChangePassAdm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm13 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
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
  Form13: TForm13;

implementation

{$R *.dfm}

uses AdminPanel, DM, MainMenu;

procedure TForm13.Button1Click(Sender: TObject);
var myLookup: Variant;
begin
  myLookup := DataModule2.Admin.Lookup('password',LabeledEdit1.Text,'password');
  if VarType(myLookup) = varNull then
  begin
    ShowMessage('❎ Неверный пароль!');
    exit;
  end
  else if VarType(myLookup) = varString then
  begin
    if (Length(LabeledEdit2.Text) = 0) or (Pos(' ',LabeledEdit2.Text) > 0) or (Length(LabeledEdit3.Text) = 0) or (Pos(' ',LabeledEdit3.Text) > 0) then
    begin
      ShowMessage('❎ Поля ввода пусты или содержат пробелы!');
      exit;
    end;
    if LabeledEdit2.Text = LabeledEdit3.Text then
    begin
      DataModule2.DS_Admin.DataSet.Edit;
      DataModule2.DS_Admin.DataSet.FieldByName('password').Value := LabeledEdit3.Text;
      DataModule2.DS_Admin.DataSet.Refresh;
      ShowMessage('Пароль успешно изменён на: ' + LabeledEdit3.Text);
      Form13.Close;
    end
    else
    begin
      ShowMessage('❎ Пароли не совпадают!');
    end;
  end;
end;

procedure TForm13.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form11.Enabled := true;
end;

end.
