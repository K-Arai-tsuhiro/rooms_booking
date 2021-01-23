class User < ApplicationRecord
  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  has_one :profile, dependent: :destroy
  before_save { self.email = email.downcase }
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i       
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, uniqueness: true,
     length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  def update_without_current_password(params, *options)
    params.delete(:current_password)
    
    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end 
    
    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end 
end
