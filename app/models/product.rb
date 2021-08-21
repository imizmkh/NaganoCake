class Product < ApplicationRecord
  belongs_to :genre
  attachment :image
  validates :image, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true

end
