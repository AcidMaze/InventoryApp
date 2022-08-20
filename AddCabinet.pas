unit AddCabinet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm6 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
uses DM, Cabinets;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
begin
  if (Length(Edit1.Text) = 0) then
  begin
    ShowMessage('ќшибка! ¬ведите корректное название кабинета.');
    exit;
  end;
  DataModule2.DS_CabinetList.DataSet.Append;
  DataModule2.DS_CabinetList.DataSet.FieldByname('name').Value:= Edit1.Text;
  DataModule2.DS_CabinetList.DataSet.Post;
  DataModule2.DS_CabinetList.DataSet.Refresh;
  ShowMessage(Edit1.Text + ' успешно добавлен.');
  Form6.Close;
end;

procedure TForm6.Button2Click(Sender: TObject);
begin
  Form6.Close;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form4.Enabled := true;
end;

end.
