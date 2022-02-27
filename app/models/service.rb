class Service < ApplicationRecord
  belongs_to :salon
  has_many :appointments
end
