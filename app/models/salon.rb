class Salon < ApplicationRecord
  serialize :days
  has_many :services

  validates :company_name, presence: true, length: { maximum: 60,
                                                too_long: 'maximum 60 characters allowed.' }
  validates :gstin, presence: true, uniqueness: true, length: { minimum: 15, maximum: 15 }
  validates :pan_number, presence: true, length: { minimum: 10, maximum: 10 }
  validates :address, :opening, :closing, presence: true

  before_validation :check_open_close_time

  private

  def check_open_close_time
    if opening >= closing
      errors.add(:salon, 'start time is greater than end time')
    end
  end

#   before_validation :put_days


#   def put_days
#     salons.days.clear
#     params[:salon][:days].each do |day|
#       salon.days << day if day.present?
#     end
#   end
end
