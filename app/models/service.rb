class Service < ApplicationRecord
  belongs_to :salon
  has_many :appointments

  validates :name, presence: true, length: { maximum: 80,
                                                too_long: 'maximum 80 characters allowed.' }
  validates :cost, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :time_taken, presence: true
end
