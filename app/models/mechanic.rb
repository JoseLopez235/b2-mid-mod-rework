class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  def alphabetical_rides
    self.rides.order(:name)
  end
end
