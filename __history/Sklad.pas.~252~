unit Sklad;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, CRGrid,
  Vcl.DBCGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Menus,
  System.UITypes, frxClass, frxDBSet;

type
  TForm2 = class(TForm)
    CRDBGrid1: TCRDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    DBRichEdit1: TDBRichEdit;
    Label6: TLabel;
    DBImage1: TDBImage;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    Label4: TLabel;
    ImgList: TImageList;
    Label8: TLabel;
    DBEdit7: TDBEdit;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Panel4: TPanel;
    Button4: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DBEdit4Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBEdit6Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses DM,  MainMenu, AddItem, EditItem;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  if (addAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('Ошибка! У вас недостаточно прав для совершения данного действия.');
    exit;
  end;
  Form3.Show;
  Form2.Enabled := false;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  if (editAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('Ошибка! У вас недостаточно прав для совершения данного действия.');
    exit;
  end;
  Form7.Caption := 'Редактирование предмета: ' + CRDBGrid1.DataSource.DataSet.Fields.FieldByname('name').Value;
  Form7.Edit1.Text := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('name').Value;
  Form7.Edit2.Text := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('ammount').Value;
  Form7.ComboBox1.ItemIndex := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('type').Value-1;
  Form7.Edit3.Text := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('price').Value;
  Form7.Edit4.Text := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('producer').Value;
  Form7.RichEdit1.Text := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('params').Value;
  Form7.Show;
  Form2.Enabled := false;
end;

procedure TForm2.Button3Click(Sender: TObject);
var userResponse:integer;
    i:integer;
    ammo:integer;
    name: string;
    number: string;
    today : TDateTime;
begin
  if (deleteAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('Ошибка! У вас недостаточно прав для совершения данного действия.');
    exit;
  end;
  today := Now;
  number := IntToStr(CRDBGrid1.DataSource.DataSet.Fields.FieldByname('id').Value);
  name := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('name').Value;
  ammo := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('ammount').Value;
  userResponse := MessageDlg('Вы действительно хотите удалить все предметы ' +name+ ' № ' +number+ '?', mtConfirmation, [mbYes, mbNo], 0);
  case userResponse of
    mrYes:
    begin
      for i:=1 to ammo do
      begin
        //Переносим все предметы в таблицу списанных предметов.
        DataModule2.DS_RemovedItemList.DataSet.Append;
        DataModule2.DS_RemovedItemList.DataSet.FieldByname('idItem').Value:= IntToStr(CRDBGrid1.DataSource.DataSet.Fields.FieldByname('id').Value);
        DataModule2.DS_RemovedItemList.DataSet.FieldByname('unicalNumber').Value:= '0001';// т.к. списывается со склада и ранее не использовался, ему присваивается стандартный номер.
        DataModule2.DS_RemovedItemList.DataSet.FieldByname('date').Value := today;
        DataModule2.DS_RemovedItemList.DataSet.Post;
      end;
      // Обнуляем количетство объектов.
      CRDBGrid1.DataSource.DataSet.Edit;
      CRDBGrid1.DataSource.DataSet.Fields.FieldByname('ammount').Value:= 0;
      CRDBGrid1.DataSource.DataSet.Refresh;
    end;
    mrNo: exit;
  end;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  if (printsaveAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('Ошибка! У вас недостаточно прав для совершения данного действия.');
    exit;
  end;
  frxReport1.ShowReport();
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  if (printsaveAccess <> true) and (gAdmin <> true) then
  begin
    ShowMessage('Ошибка! У вас недостаточно прав для совершения данного действия.');
    exit;
  end;
  frxReport1.Print();
end;

procedure TForm2.DBEdit4Change(Sender: TObject);
begin
  if DBEdit4.Text = '1' then DBEdit4.Text := 'Мебель'
  else if DBEdit4.Text = '2' then DBEdit4.Text := 'Канцтовары'
  else if DBEdit4.Text = '3' then DBEdit4.Text := 'Бытовая химия'
  else if DBEdit4.Text = '4' then DBEdit4.Text := 'Компьютерные комплектующие'
  else if DBEdit4.Text = '5' then DBEdit4.Text := 'Комьютерная переферия'
  else if DBEdit4.Text = '6' then DBEdit4.Text := 'Ноутбуки'
  else if DBEdit4.Text = '7' then DBEdit4.Text := 'Системные блоки'
  else if DBEdit4.Text = '8' then DBEdit4.Text := 'Спортивный инвентарь'
  else if DBEdit4.Text = '9' then DBEdit4.Text := 'Столовые принадлежности'
  else if DBEdit4.Text = '10' then DBEdit4.Text := 'Другое';
end;

procedure TForm2.DBEdit6Change(Sender: TObject);
begin
  if DBEdit6.Text = '0' then DBEdit6.Color := clRed
  else DBEdit6.Color := clWindow;
end;

procedure TForm2.FormActivate(Sender: TObject);
begin
  ShowScrollBar(CRDBGrid1.Handle, SB_HORZ, False);
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Enabled := true;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  CRDBGrid1.Columns[0].Visible := false;
  CRDBGrid1.Columns[1].Title.Caption := 'Название';
  CRDBGrid1.Columns[1].Title.Color := clWhite;
  CRDBGrid1.Columns[2].Visible := false;
  CRDBGrid1.Columns[3].Visible := false;
  CRDBGrid1.Columns[4].Visible := false;
  CRDBGrid1.Columns[5].Visible := false;
  CRDBGrid1.Columns[6].Visible := false;
  CRDBGrid1.Columns[7].Visible := false;
  CRDBGrid1.Columns[8].Visible := false;
  CRDBGrid1.Columns[9].Visible := false;

end;

end.
