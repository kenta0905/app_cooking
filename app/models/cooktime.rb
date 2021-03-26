class Cooktime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '５分' },
    { id: 3, name: '１０分' },
    { id: 4, name: '１５分' },
    { id: 5, name: '２０分' },
    { id: 6, name: '３０分' },
    { id: 7, name: '４０分' },
    { id: 8, name: '５０分' },
    { id: 9, name: '６０分以上' },
    { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :cooks

  end