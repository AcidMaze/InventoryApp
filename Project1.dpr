program Project1;

uses
  Vcl.Forms,
  MainMenu in 'MainMenu.pas' {Form1},
  DM in 'DM.pas' {DataModule2: TDataModule},
  Sklad in 'Sklad.pas' {Form2},
  AddItem in 'AddItem.pas' {Form3},
  Cabinets in 'Cabinets.pas' {Form4},
  RemovedItems in 'RemovedItems.pas' {Form5},
  AddCabinet in 'AddCabinet.pas' {Form6},
  EditItem in 'EditItem.pas' {Form7},
  AddItemToCab in 'AddItemToCab.pas' {Form8},
  Kolichestvo in 'Kolichestvo.pas' {Form9},
  EditCabinet in 'EditCabinet.pas' {Form10},
  AdminPanel in 'AdminPanel.pas' {Form11},
  AdminAuth in 'AdminAuth.pas' {Form12},
  ChangePassAdm in 'ChangePassAdm.pas' {Form13},
  UserAuth in 'UserAuth.pas' {Form14},
  UserPanel in 'UserPanel.pas' {Form15},
  AddUser in 'AddUser.pas' {Form16},
  DeleteUser in 'DeleteUser.pas' {Form17},
  ChangeUserAccess in 'ChangeUserAccess.pas' {Form18},
  ChangeUserPass in 'ChangeUserPass.pas' {Form19};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TForm19, Form19);
  Application.Run;
end.
