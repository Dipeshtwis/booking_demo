class Salon < ApplicationRecord
  serialize :days
  has_many :services
#   before_validation :put_days


#   def put_days
#     salons.days.clear
#     params[:salon][:days].each do |day|
#       salon.days << day if day.present?
#     end
#   end
end
