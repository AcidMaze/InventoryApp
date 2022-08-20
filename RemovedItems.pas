unit RemovedItems;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Mask, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, CRGrid, Vcl.Menus,
  System.ImageList, Vcl.ImgList, frxClass, frxDBSet, frxServer;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBRichEdit1: TDBRichEdit;
    DBImage1: TDBImage;
    CRDBGrid1: TCRDBGrid;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    ImageList1: TImageList;
    Panel4: TPanel;
    Button4: TButton;
    Button5: TButton;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
uses MainMenu, DM;

{$R *.dfm}

procedure TForm5.Button4Click(Sender: TObject);
begin
  if (printsaveAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('������! � ��� ������������ ���� ��� ���������� ������� ��������.');
    exit;
  end;
  frxReport1.ShowReport();
end;

procedure TForm5.Button5Click(Sender: TObject);
begin
  if (printsaveAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('������! � ��� ������������ ���� ��� ���������� ������� ��������.');
    exit;
  end;
  frxReport1.Print();
end;

procedure TForm5.DBEdit4Change(Sender: TObject);
begin
  if DBEdit4.Text = '1' then DBEdit4.Text := '������'
  else if DBEdit4.Text = '2' then DBEdit4.Text := '����������'
  else if DBEdit4.Text = '3' then DBEdit4.Text := '������� �����'
  else if DBEdit4.Text = '4' then DBEdit4.Text := '������������ �������������'
  else if DBEdit4.Text = '5' then DBEdit4.Text := '����������� ���������'
  else if DBEdit4.Text = '6' then DBEdit4.Text := '��������'
  else if DBEdit4.Text = '7' then DBEdit4.Text := '��������� �����'
  else if DBEdit4.Text = '8' then DBEdit4.Text := '���������� ���������'
  else if DBEdit4.Text = '9' then DBEdit4.Text := '�������� ��������������'
  else if DBEdit4.Text = '10' then DBEdit4.Text := '������';
end;

procedure TForm5.FormActivate(Sender: TObject);
begin
  ShowScrollBar(CRDBGrid1.Handle, SB_HORZ, False);
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled := true;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  DataModule2.DS_ShowRemovedItem.DataSet.Refresh;
  CRDBGrid1.Columns[0].Visible := false;
  CRDBGrid1.Columns[1].Title.Caption := '��������';
  CRDBGrid1.Columns[1].Title.Color := clWhite;
  CRDBGrid1.Columns[2].Visible := false;
  CRDBGrid1.Columns[3].Visible := false;
  CRDBGrid1.Columns[4].Visible := false;
  CRDBGrid1.Columns[5].Visible := false;
  CRDBGrid1.Columns[6].Visible := false;
  CRDBGrid1.Columns[7].Visible := false;
  CRDBGrid1.Columns[8].Visible := false;
  CRDBGrid1.Columns[9].Visible := false;
  CRDBGrid1.Columns[10].Visible := false;
  CRDBGrid1.Columns[11].Visible := false;
  CRDBGrid1.Columns[12].Visible := false;
  CRDBGrid1.Columns[13].Visible := false;
end;

end.
