require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'Relationship' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'Instance Methods' do
    it "alphabetical_rides" do
      amusement_park = AmusementPark.create(name: "Hershey Park", admission_price: 50.00)
      ride_1 = amusement_park.rides.create(name: "Lightning Racer", thrill_rating: 8)
      ride_2 = amusement_park.rides.create(name: "Storm Runner", thrill_rating: 2)
      ride_3 = amusement_park.rides.create(name: "The Great Bear", thrill_rating: 10)
      ride_4 = amusement_park.rides.create(name: "Splash Zone", thrill_rating: 1)
      mechanic = Mechanic.create(name: "Kara Smith", years_of_experience: 11)

      RideMechanic.create(ride_id: ride_1.id, mechanic_id: mechanic.id)
      RideMechanic.create(ride_id: ride_2.id, mechanic_id: mechanic.id)
      RideMechanic.create(ride_id: ride_3.id, mechanic_id: mechanic.id)
      RideMechanic.create(ride_id: ride_4.id, mechanic_id: mechanic.id)

      expect(mechanic.alphabetical_rides).to eq([ride_1,ride_4,ride_2,ride_3])
    end
  end
end
