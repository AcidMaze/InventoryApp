unit AddItemToCab;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, CRGrid, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    CRDBGrid1: TCRDBGrid;
    DBImage1: TDBImage;
    Label7: TLabel;
    DBEdit6: TDBEdit;
    DBRichEdit1: TDBRichEdit;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  gItem:integer;
  gItemCount:integer;
  gName:string;


implementation
uses DM, Cabinets, Kolichestvo;

{$R *.dfm}

procedure TForm8.Button1Click(Sender: TObject);
begin
  gItem := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('id').Value;
  gItemCount := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('ammount').Value;
  gName := CRDBGrid1.DataSource.DataSet.Fields.FieldByname('name').Value;
  Form9.Caption :=  '������� ������ ���������� ���: ' +gName;
  Form8.Enabled := false;
  Form9.Show;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
  Form8.Close;
end;

procedure TForm8.FormActivate(Sender: TObject);
begin
  ShowScrollBar(CRDBGrid1.Handle, SB_HORZ, False);
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form4.Enabled := true;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
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
end;

end.
