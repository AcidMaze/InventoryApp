unit Cabinets;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, CRGrid,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, System.ImageList, Vcl.ImgList,
  Vcl.DBCtrls, Vcl.Menus,
  System.UITypes, Vcl.Mask, frxClass, frxDBSet;

type
  TForm4 = class(TForm)
    ImgList: TImageList;
    Panel1: TPanel;
    CRDBGrid2: TCRDBGrid;
    DBImage1: TDBImage;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel3: TPanel;
    Button8: TButton;
    Button9: TButton;
    DBEdit1: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel4: TPanel;
    Button4: TButton;
    Button5: TButton;
    Button3: TButton;
    CRDBGrid1: TCRDBGrid;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  gCab: integer;
implementation
uses MainMenu, DM, AddCabinet, AddItemToCab, EditCabinet;

{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  if (addAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('������! � ��� ������������ ���� ��� ���������� ������� ��������.');
    exit;
  end;
  Form6.Show;
  Form4.Enabled := false;
end;

procedure TForm4.Button2Click(Sender: TObject);
begin
  if (editAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('������! � ��� ������������ ���� ��� ���������� ������� ��������.');
    exit;
  end;
  Form10.Show;
  Form10.Caption := '�������������� '+CRDBGrid1.DataSource.DataSet.Fields.FieldByname('name').Value;
  Form4.Enabled := false;
end;

procedure TForm4.Button4Click(Sender: TObject);
begin
  if (printsaveAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('������! � ��� ������������ ���� ��� ���������� ������� ��������.');
    exit;
  end;
  frxReport1.ShowReport();
end;

procedure TForm4.Button5Click(Sender: TObject);
begin
  if (printsaveAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('������! � ��� ������������ ���� ��� ���������� ������� ��������.');
    exit;
  end;
  frxReport1.Print();
end;

procedure TForm4.Button8Click(Sender: TObject);
begin
  if (addAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('������! � ��� ������������ ���� ��� ���������� ������� ��������.');
    exit;
  end;
  gCab := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('id').Value;
  Form8.Caption := '���������� ��������� � '+CRDBGrid1.DataSource.DataSet.Fields.FieldByname('name').Value;;
  Form8.Show;
  Form4.Enabled := false;
end;

procedure TForm4.Button9Click(Sender: TObject);
var userResponse: integer;
    name: string;
    id: string;
    today : TDateTime;
begin
  if (deleteAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('������! � ��� ������������ ���� ��� ���������� ������� ��������.');
    exit;
  end;
  today := Now;
  name := CRDBGrid2.DataSource.DataSet.Fields.FieldByname('name').Value;
  id := CRDBGrid2.DataSource.DataSet.Fields.FieldByname('id_1').Value;
  userResponse := MessageDlg('�� ������������� ������ ������� �������: ' +name+ ' �'+id+'?', mtConfirmation, [mbYes, mbNo], 0);
  case userResponse of
    mrYes:
    begin
      DataModule2.DS_RemovedItemList.DataSet.Append;
      DataModule2.DS_RemovedItemList.DataSet.FieldByname('idItem').Value:= IntToStr(CRDBGrid2.DataSource.DataSet.Fields.FieldByname('id').Value);
      DataModule2.DS_RemovedItemList.DataSet.FieldByname('unicalNumber').Value:= id;
      DataModule2.DS_RemovedItemList.DataSet.FieldByname('date').Value := today;
      DataModule2.DS_RemovedItemList.DataSet.Post;
      try
        with DataModule2.RemoveItemCommand do
        begin
          SQL.Clear;
          SQL.Text := 'DELETE FROM `items_incabinet` WHERE `id` = ' + QuotedStr(id);
          Execute;
        end;
      finally
        ShowMessage('������� ������� �����.');
      end;
    end;
    mrNo: exit;
  end;
end;

procedure TForm4.FormActivate(Sender: TObject);
begin
  CRDBGrid1.Columns[0].Visible := false;
  CRDBGrid1.Columns[1].Title.Caption := '��������';
  CRDBGrid1.Columns[1].Title.Color := clWhite;
  CRDBGrid2.Columns[0].Visible := false;
  CRDBGrid2.Columns[1].Title.Caption := '��������';
  CRDBGrid2.Columns[1].Title.Color := clWhite;
  CRDBGrid2.Columns[2].Visible := false;
  CRDBGrid2.Columns[3].Visible := false;
  CRDBGrid2.Columns[4].Visible := false;
  CRDBGrid2.Columns[5].Visible := false;
  CRDBGrid2.Columns[6].Visible := false;
  CRDBGrid2.Columns[7].Visible := false;
  CRDBGrid2.Columns[8].Visible := false;
  CRDBGrid2.Columns[9].Visible := false;
  CRDBGrid2.Columns[10].Visible := false;
  CRDBGrid2.Columns[11].Visible := false;
  CRDBGrid2.Columns[12].Visible := false;
  CRDBGrid2.Columns[13].Visible := false;
  ShowScrollBar(CRDBGrid2.Handle, SB_HORZ, False);
  ShowScrollBar(CRDBGrid1.Handle, SB_HORZ, False);
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled := true;
end;

end.
