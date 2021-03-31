class Cook < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :cooktime

  belongs_to       :user
  has_many         :comments,  dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :catch_copy
    validates :material
    validates :making
  end

  with_options presence: true,numericality: { other_than: 1 } do
    validates :category_id
    validates :cooktime_id
  end

  validates :content, presence: true, unless: :was_attached?

  def self.search(search)
    if search != ""
      Cook.where('title LIKE(?)', "%#{search}%")
    else
      Cook.all
    end
  end

  def was_attached?
    self.image.attached?
  end

end
