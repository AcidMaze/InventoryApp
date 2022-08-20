unit DeleteUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, CRGrid, Vcl.StdCtrls, Vcl.CheckLst,System.UITypes;

type
  TForm17 = class(TForm)
    Panel1: TPanel;
    CRDBGrid1: TCRDBGrid;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation
uses DM, AdminPanel;

{$R *.dfm}

procedure TForm17.Button1Click(Sender: TObject);
var userResponse: integer;
begin
  userResponse := MessageDlg('�� ������������� ������ ������� ����� ������������?', mtConfirmation, [mbYes, mbNo], 0);
  case userResponse of
    mrYes:
    begin
      CRDBGrid1.DataSource.DataSet.Delete;
    end;
    mrNo: exit;
  end;
end;

procedure TForm17.Button2Click(Sender: TObject);
begin
  Form17.Close;
end;

procedure TForm17.FormActivate(Sender: TObject);
begin
  CRDBGrid1.Columns[0].Visible := false;
  CRDBGrid1.Columns[1].Title.Caption := '����� ������������';
  CRDBGrid1.Columns[1].Title.Color := clWhite;
  CRDBGrid1.Columns[2].Visible := false;
  CRDBGrid1.Columns[3].Visible := false;
  CRDBGrid1.Columns[4].Visible := false;
  CRDBGrid1.Columns[5].Visible := false;
  ShowScrollBar(CRDBGrid1.Handle, SB_HORZ, False);
end;

procedure TForm17.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form11.Enabled := true;
end;

end.
