class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '日本料理' },
    { id: 3, name: 'イタリア料理' },
    { id: 4, name: 'フランス料理' },
    { id: 5, name: '中華料理' },
    { id: 6, name: 'トルコ料理' },
    { id: 7, name: 'ロシア料理' },
    { id: 8, name: 'ドイツ料理' },
    { id: 9, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :users

  end