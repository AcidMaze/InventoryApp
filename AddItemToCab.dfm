object Form8: TForm8
  Left = 390
  Top = 219
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1088#1077#1076#1084#1077#1090' '#1074' '#1082#1072#1073#1080#1085#1077#1090
  ClientHeight = 438
  ClientWidth = 644
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
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 8
    Width = 617
    Height = 361
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object Label7: TLabel
      Left = 349
      Top = 203
      Width = 86
      Height = 18
      Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto'
      Font.Style = []
      ParentFont = False
    end
    object CRDBGrid1: TCRDBGrid
      Left = 16
      Top = 8
      Width = 327
      Height = 342
      Color = clBtnFace
      DataSource = DataModule2.DS_ItemsList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Roboto Cn'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object DBImage1: TDBImage
      Left = 397
      Top = 8
      Width = 178
      Height = 178
      BorderStyle = bsNone
      DataField = 'image'
      DataSource = DataModule2.DS_ItemsList
      Stretch = True
      TabOrder = 1
    end
    object DBEdit6: TDBEdit
      Left = 441
      Top = 202
      Width = 158
      Height = 23
      BevelKind = bkSoft
      BiDiMode = bdRightToLeft
      BorderStyle = bsNone
      DataField = 'ammount'
      DataSource = DataModule2.DS_ItemsList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto Lt'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object DBRichEdit1: TDBRichEdit
      Left = 349
      Top = 231
      Width = 250
      Height = 119
      BevelKind = bkSoft
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      DataField = 'params'
      DataSource = DataModule2.DS_ItemsList
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Roboto Lt'
      Font.Style = []
      ParentBiDiMode = False
      ReadOnly = True
      TabOrder = 3
      Zoom = 100
    end
  end
  object Panel2: TPanel
    Left = 402
    Top = 375
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
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
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
