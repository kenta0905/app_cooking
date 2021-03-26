class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_many   :cooks   , dependent: :destroy
has_many   :comments, dependent: :destroy

extend ActiveHash::Associations::ActiveRecordExtensions
belongs_to :genre
  
with_options presence: true do
   validates :nickname
   validates :profile
end
  
with_options presence: true,numericality: { other_than: 1 } do  
   validates :genre_id
end  

end
