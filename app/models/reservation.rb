class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  validates :start_at, presence: true
  validates :end_at, presence: true
  validates :persons, presence: true
  validate :end_after_start
  validate :start_after_today
  
  private
    def end_after_start
      errors.add(:end_at, "は、開始日以降を選択してください") if end_at.nil? || end_at < start_at
    end 
    
    def start_after_today
      errors.add(:start_at, "は、本日以降を選択してください") if start_at.nil? || start_at < Date.current
    end
end
