require 'rails_helper'

describe 'As a user' do
  describe 'When I go to the mechanic show page' do
    it "Should see their name, years of experience, rides their working on and have a form that adds more rides to the mechanic workload" do
      amusement_park = AmusementPark.create(name: "Hershey Park", admission_price: 50.00)
      ride_1 = amusement_park.rides.create(name: "Lightning Racer", thrill_rating: 8)
      ride_2 = amusement_park.rides.create(name: "Storm Runner", thrill_rating: 2)
      ride_3 = amusement_park.rides.create(name: "The Great Bear", thrill_rating: 10)
      ride_4 = amusement_park.rides.create(name: "Splash Zone", thrill_rating: 1)
      mechanic = Mechanic.create(name: "Kara Smith", years_of_experience: 11)

      RideMechanic.create(ride_id: ride_1.id, mechanic_id: mechanic.id)
      RideMechanic.create(ride_id: ride_2.id, mechanic_id: mechanic.id)
      RideMechanic.create(ride_id: ride_3.id, mechanic_id: mechanic.id)

      visit "/mechanics/#{mechanic.id}"

      expect(page).to have_content("Mechanic: #{mechanic.name}")
      expect(page).to have_content("Years of Experience: #{mechanic.years_of_experience}")

      within '#current-rides' do
        expect(page).to have_content("Current Rides They're Working On:")
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_2.name)
        expect(page).to have_content(ride_3.name)
      end



      expect(page).to have_content("Add A Ride To Workload:")
      fill_in :ride_id, with: ride_4.id
      expect(page).to have_button("Submit")
      click_on "Submit"
      expect(current_path).to eq("/mechanics/#{mechanic.id}")

      within '#current-rides' do
        expect(page).to have_content("Current Rides They're Working On:")
        expect(page).to have_content(ride_1.name)
        expect(page).to have_content(ride_2.name)
        expect(page).to have_content(ride_3.name)
        expect(page).to have_content(ride_4.name)
      end
    end
  end
end
