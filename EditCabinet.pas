unit EditCabinet;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm10 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

uses Cabinets, DM;

procedure TForm10.Button1Click(Sender: TObject);
begin
  if (Length(Edit1.Text) = 0) then
  begin
    ShowMessage('������! ������� ����� �������� ��������.');
    exit;
  end;
  DataModule2.DS_CabinetList.DataSet.Edit;
  DataModule2.DS_CabinetList.DataSet.FieldByname('name').Value:= Edit1.Text;
  DataModule2.DS_CabinetList.DataSet.Refresh;
  ShowMessage('��� ��������� ������� ���������!');
  Edit1.Clear;
  Form10.Close;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
  Form10.Close;
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form4.Enabled := true;
end;

end.
