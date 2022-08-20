object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 384
  Width = 549
  object Connection: TMyConnection
    Database = 'sql11420471'
    ConnectionTimeout = 30
    Username = 'sql11420471'
    Server = 'sql11.freesqldatabase.com'
    Connected = True
    Left = 168
    Top = 16
    EncryptedPassword = 'B2FF8BFFA9FFB9FFC9FFB6FFCEFF93FFACFF9AFF'
  end
  object ItemsList: TMyTable
    TableName = 'items'
    Connection = Connection
    Active = True
    CommandTimeout = 15
    Left = 24
    Top = 96
  end
  object DS_ItemsList: TMyDataSource
    DataSet = ItemsList
    Left = 24
    Top = 160
  end
  object CabinetList: TMyTable
    TableName = 'cabinets'
    Connection = Connection
    Active = True
    CommandTimeout = 15
    Left = 112
    Top = 96
  end
  object DS_CabinetList: TMyDataSource
    DataSet = CabinetList
    Left = 112
    Top = 160
  end
  object ItemsInCab: TMyTable
    TableName = 'items_incabinet'
    MasterFields = 'id'
    DetailFields = 'idCab'
    MasterSource = DS_CabinetList
    Connection = Connection
    Active = True
    CommandTimeout = 15
    Left = 328
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = 1
      end>
    Conditions = <
      item
        Name = '2'
      end>
  end
  object DS_ItemInCab: TMyDataSource
    DataSet = ItemsInCab
    Left = 328
    Top = 160
  end
  object ShowCabItem_Query: TMyQuery
    Connection = Connection
    SQL.Strings = (
      
        'SELECT * FROM items LEFT JOIN items_incabinet ON items.id = item' +
        's_incabinet.idItem')
    MasterSource = DS_CabinetList
    MasterFields = 'id'
    DetailFields = 'idCab'
    CommandTimeout = 15
    Active = True
    Left = 112
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id'
        ParamType = ptInput
        Value = 1
      end>
  end
  object DS_ShowCabItem: TMyDataSource
    DataSet = ShowCabItem_Query
    Left = 112
    Top = 304
  end
  object DS_ShowRemovedItem: TMyDataSource
    DataSet = ShowRemovedItem_Query
    Left = 248
    Top = 304
  end
  object ShowRemovedItem_Query: TMyQuery
    Connection = Connection
    SQL.Strings = (
      
        'SELECT * FROM items RIGHT JOIN remove_items ON items.id = remove' +
        '_items.idItem')
    CommandTimeout = 15
    Active = True
    Left = 248
    Top = 240
  end
  object Admin: TMyTable
    TableName = 'admin'
    Connection = Connection
    Active = True
    CommandTimeout = 15
    Left = 424
    Top = 80
  end
  object DS_User: TMyDataSource
    DataSet = User
    Left = 480
    Top = 144
  end
  object User: TMyTable
    TableName = 'users'
    Connection = Connection
    Active = True
    CommandTimeout = 15
    Left = 480
    Top = 80
  end
  object User_Query: TMyQuery
    Connection = Connection
    CommandTimeout = 15
    Left = 480
    Top = 256
  end
  object Admin_Query: TMyQuery
    Connection = Connection
    CommandTimeout = 15
    Left = 400
    Top = 256
  end
  object RemoveItemCommand: TMyCommand
    Connection = Connection
    CommandTimeout = 15
    Left = 280
    Top = 16
  end
  object DS_RemovedItemList: TMyDataSource
    DataSet = RemovedItemList
    Left = 240
    Top = 160
  end
  object RemovedItemList: TMyTable
    TableName = 'remove_items'
    Connection = Connection
    Active = True
    CommandTimeout = 15
    Left = 240
    Top = 88
  end
  object DS_Admin: TMyDataSource
    DataSet = Admin
    Left = 424
    Top = 144
  end
end
