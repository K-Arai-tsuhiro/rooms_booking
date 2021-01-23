class Profile < ApplicationRecord
  belongs_to :user
  
  validates :introduction, length: {maximum: 500}
  
  mount_uploader :profile_photo, ImageUploader
end
