class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :cook

  validates :text, presence: true
end
