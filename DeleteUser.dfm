object Form17: TForm17
  Left = 537
  Top = 329
  Caption = #1059#1076#1072#1083#1080#1090#1100' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
  ClientHeight = 230
  ClientWidth = 349
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 333
    Height = 153
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object CRDBGrid1: TCRDBGrid
      Left = 16
      Top = 16
      Width = 303
      Height = 121
      Color = clBtnHighlight
      DataSource = DataModule2.DS_User
      FixedColor = clBtnHighlight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto Lt'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Panel2: TPanel
    Left = 110
    Top = 167
    Width = 231
    Height = 50
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    object Button1: TButton
      Left = 16
      Top = 8
      Width = 89
      Height = 33
      Caption = #1059#1076#1072#1083#1080#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Century Gothic'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 128
      Top = 8
      Width = 89
      Height = 33
      Caption = #1047#1072#1082#1088#1099#1090#1100
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Century Gothic'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
  end
end
