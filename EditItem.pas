unit EditItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.DBCtrls, System.ImageList, Vcl.ImgList, Vcl.ExtDlgs, DB, ADODB;

type
  TForm7 = class(TForm)
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    RichEdit1: TRichEdit;
    ComboBox1: TComboBox;
    Button3: TButton;
    ImageList1: TImageList;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation
uses DM,Sklad;
var isImage: bool;

{$R *.dfm}


procedure TForm7.Button1Click(Sender: TObject);
var today : TDateTime;
begin
  today := Now;
  if (Length(Edit1.Text) = 0) then
  begin
    ShowMessage('������! ������� ����� �������� ��������.');
    exit;
  end;
  if (Edit2.Text = '0') or (Length(Edit2.Text) = 0) or (Pos(' ',Edit2.Text) > 0) or (Pos('-',Edit2.Text) > 0) then
  begin
    ShowMessage('������! ���������� �� ����� ��������� ���� ��� ���� �������������.');
    exit;
  end;
  if (Length(Edit3.Text) = 0) or (Pos(' ',Edit3.Text) > 0) or (Pos('-',Edit3.Text) > 0) then
  begin
    ShowMessage('������! ������� ���������� ����.');
    exit;
  end;
  if (Length(Edit4.Text) = 0) then
  begin
    ShowMessage('������! ������� ������ �������������.');
    exit;
  end;
  isImage := false;
  DataModule2.DS_ItemsList.DataSet.Edit;
  DataModule2.DS_ItemsList.DataSet.FieldByname('type').Value:= IntToStr(ComboBox1.ItemIndex+1);
  DataModule2.DS_ItemsList.DataSet.FieldByname('name').Value:= Edit1.Text;
  DataModule2.DS_ItemsList.DataSet.FieldByname('ammount').Value:= Edit2.Text;
  DataModule2.DS_ItemsList.DataSet.FieldByname('price').Value:= Edit3.Text;
  DataModule2.DS_ItemsList.DataSet.FieldByname('producer').Value:= Edit4.Text;
  DataModule2.DS_ItemsList.DataSet.FieldByname('params').Value:= RichEdit1.Text;
  DataModule2.DS_ItemsList.DataSet.FieldByname('edit_data').Value:= today;
  DataModule2.DS_ItemsList.DataSet.Refresh;
  ShowMessage('��� ��������� ������� ���������!');
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  RichEdit1.Clear;
  ComboBox1.ClearSelection;
  Form7.Close;
end;

procedure TForm7.Button2Click(Sender: TObject);
begin
  Form7.Close;
end;

procedure TForm7.Button3Click(Sender: TObject);
var   blob: TStream;
      fs: TFileStream;
begin
  if OpenPictureDialog1.Execute then
  begin
    DataModule2.DS_ItemsList.DataSet.Edit;
    blob := DM.DataModule2.DS_ItemsList.DataSet.CreateBlobStream(DataModule2.DS_ItemsList.DataSet.FieldByname('image'), bmWrite);
    try
      blob.Seek(0, soFromBeginning);
      fs := TFileStream.Create(OpenPictureDialog1.FileName, fmShareDenyWrite);
      try
        blob.CopyFrom(fs, fs.Size);
        blob.Writedata(fs, fs.Size);
        isImage := true;
      finally
        fs.Free;
      end;
      finally
      blob.Free;
    end;
    DataModule2.DS_ItemsList.DataSet.Refresh;
    ShowMessage('����������� �������� ������� ����������.');
  end;
end;

procedure TForm7.ComboBox1Change(Sender: TObject);
begin
  if Edit4.Text = '1' then Edit4.Text := '������'
  else if Edit4.Text = '2' then Edit4.Text := '����������'
  else if Edit4.Text = '3' then Edit4.Text := '������� �����'
  else if Edit4.Text = '4' then Edit4.Text := '������������ �������������'
  else if Edit4.Text = '5' then Edit4.Text := '����������� ���������'
  else if Edit4.Text = '6' then Edit4.Text := '��������'
  else if Edit4.Text = '7' then Edit4.Text := '��������� �����';
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if isImage = true then
  begin
    isImage := false;
    DataModule2.DS_ItemsList.DataSet.Edit;
    DataModule2.DS_ItemsList.DataSet.FieldByname('image').Value := null;
    DataModule2.DS_ItemsList.DataSet.Post;
    ShowMessage('��� ��������� ���� ��������!');
  end;
  Form2.Enabled := true;
end;

end.
