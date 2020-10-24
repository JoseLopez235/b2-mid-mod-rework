require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the amusement park show page' do
    it "Should see name, admission price, ride names, and average rating" do
      amusement_park = AmusementPark.create(name: "Hershey Park", admission_price: 50.00)
      ride_1 = amusement_park.rides.create(name: "Lightning Racer", thrill_rating: 8)
      ride_2 = amusement_park.rides.create(name: "Storm Runner", thrill_rating: 2)
      ride_3 = amusement_park.rides.create(name: "The Great Bear", thrill_rating: 10)

      visit "/amusement_parks/#{amusement_park.id}"

      expect(page).to have_content(amusement_park.name)
      expect(page).to have_content("Admissions : $#{amusement_park.admission_price}")
      within "#rides-info" do
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_2.name)
        expect(page).to have_content(ride_3.name)
        expect(page).to have_content("Average Thrill Rating of Rides: #{(amusement_park.ride_average_rating).round(2)}")
      end
    end
  end
end
