unit ChangeUserPass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm19 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    Button1: TButton;
    LabeledEdit3: TLabeledEdit;
    ImageList1: TImageList;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation
uses DM, UserPanel;
{$R *.dfm}


procedure TForm19.Button1Click(Sender: TObject);
var myLookup: Variant;
begin
  myLookup := DataModule2.User.Lookup('password',LabeledEdit1.Text,'password');
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
      DataModule2.DS_User.DataSet.Edit;
      DataModule2.DS_User.DataSet.FieldByName('password').Value := LabeledEdit3.Text;
      DataModule2.DS_User.DataSet.Refresh;
      ShowMessage('Пароль успешно изменён на: ' + LabeledEdit3.Text);
      Form19.Close;
    end
    else
    begin
      ShowMessage('❎ Пароли не совпадают!');
    end;
  end;

end;

procedure TForm19.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form15.Enabled := true;
end;

end.
