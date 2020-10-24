class AmusementPark < ApplicationRecord
  has_many :rides

  def ride_average_rating
    self.rides.average(:thrill_rating)
  end
end
