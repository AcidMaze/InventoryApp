object Form18: TForm18
  Left = 439
  Top = 274
  Caption = #1053#1072#1089#1090#1088#1086#1081#1082#1072' '#1087#1088#1072#1074' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1077#1081
  ClientHeight = 244
  ClientWidth = 558
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
    Left = 21
    Top = 21
    Width = 529
    Height = 161
    Color = clBtnHighlight
    ParentBackground = False
    TabOrder = 0
    object CRDBGrid1: TCRDBGrid
      Left = 16
      Top = 8
      Width = 281
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
    object GroupBox1: TGroupBox
      Left = 303
      Top = 16
      Width = 195
      Height = 113
      Caption = #1055#1088#1072#1074#1072' '#1087#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1103
      TabOrder = 1
      object DBCheckBox1: TDBCheckBox
        Left = 11
        Top = 16
        Width = 97
        Height = 17
        Caption = #1044#1086#1073#1072#1074#1083#1103#1090#1100
        DataField = 'addAccess'
        DataSource = DataModule2.DS_User
        TabOrder = 0
      end
      object DBCheckBox2: TDBCheckBox
        Left = 11
        Top = 39
        Width = 97
        Height = 17
        Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
        DataField = 'editAccess'
        DataSource = DataModule2.DS_User
        TabOrder = 1
      end
      object DBCheckBox3: TDBCheckBox
        Left = 11
        Top = 62
        Width = 97
        Height = 17
        Caption = #1059#1076#1072#1083#1103#1090#1100
        DataField = 'deleteAccess'
        DataSource = DataModule2.DS_User
        TabOrder = 2
      end
      object DBCheckBox4: TDBCheckBox
        Left = 11
        Top = 85
        Width = 171
        Height = 17
        Caption = #1055#1077#1095#1072#1090#1072#1090#1100'/'#1057#1086#1093#1088#1072#1085#1103#1090#1100' '#1074' '#1092#1072#1081#1083
        DataField = 'printsaveAccess'
        DataSource = DataModule2.DS_User
        TabOrder = 3
      end
    end
  end
  object Panel2: TPanel
    Left = 319
    Top = 188
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
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
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
