unit MainMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, MemDS, DBAccess, MyAccess,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Menus,
  Vcl.Imaging.pngimage,
  ShellAPI;

type
  TForm1 = class(TForm)
    ImageList1: TImageList;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Panel3: TPanel;
    Image1: TImage;
    StaticText1: TStaticText;
    Button5: TButton;
    Button4: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  gAdmin: boolean;
  gUser: boolean;
  addAccess: boolean;
  editAccess: boolean;
  deleteAccess: boolean;
  printsaveAccess: boolean;

implementation
uses DM, Sklad, Cabinets, RemovedItems, AdminAuth, AdminPanel, UserAuth, UserPanel;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (gUser <> true) and (gAdmin <> true) then
  begin
    Form14.Show;
    Form1.Enabled := false;
    exit;
  end;
  Form2.Show;
  Form1.Enabled := false;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if (gUser <> true) and (gAdmin <> true) then
  begin
    Form14.Show;
    Form1.Enabled := false;
    exit;
  end;
  Form4.Show;
  Form1.Enabled := false;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if (gUser <> true) and (gAdmin <> true) then
  begin
    Form14.Show;
    Form1.Enabled := false;
    exit;
  end;
  Form5.Show;
  Form1.Enabled := false;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if gUser = false then
  begin
    Form14.Show;
    Form1.Enabled := false;
  end
  else if gUser = true then
  begin
    Form15.Show;
    Form1.Enabled := false;
  end;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if gAdmin = true then
  begin
    Form11.Show;
    Form1.Enabled := false;
  end
  else if gAdmin = false then
  begin
    Form12.Show;
    Form1.Enabled := false;
  end;

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'D:\Технарь Жека ПКС17\Диплом\Программа\helpuser.chm',nil, nil, SW_SHOW);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  StaticText1.Alignment := taCenter;
  StaticText1.Height := 110;
  StaticText1.Width := 220;
end;


end.
