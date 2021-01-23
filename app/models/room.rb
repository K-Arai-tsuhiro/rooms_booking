class Room < ApplicationRecord
  
  belongs_to :user
  has_many :reservations, dependent: :destroy
  
  validates :image, presence: true
  validates :fee, presence: true
  validates :description, length: {maximum: 250}
  validates :address, presence: true, length: {maximum: 100}
  validates :roomname, presence: true, length: {maximum: 50}
  
  mount_uploader :image, ImageUploader
end
