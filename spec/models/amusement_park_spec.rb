require 'rails_helper'

RSpec.describe AmusementPark, type: :model do
  describe 'Relationship' do
    it {should have_many :rides}
  end

  describe 'Instance methods' do
    it 'Ride Average Rating' do
      amusement_park = AmusementPark.create(name: "Hershey Park", admission_price: 50.00)
      ride_1 = amusement_park.rides.create(name: "Lightning Racer", thrill_rating: 8)
      ride_2 = amusement_park.rides.create(name: "Storm Runner", thrill_rating: 2)
      ride_3 = amusement_park.rides.create(name: "The Great Bear", thrill_rating: 10)

      expect(amusement_park.ride_average_rating.round(2)).to eq(6.67)
    end
  end
end
