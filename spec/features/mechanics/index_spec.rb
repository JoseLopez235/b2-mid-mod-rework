require 'rails_helper'

describe 'As a user' do
  describe 'When I visit the mechanic index page' do
    it 'Should see a header "All Mechanic" and a list of the mechanic name and year of experience' do
      mechanic_1 = Mechanic.create(name: "Sam Mills", years_of_experience: 10)
      mechanic_2 = Mechanic.create(name: "Kara Smith", years_of_experience: 11)

      visit '/mechanics'

      expect(page).to have_content("All Mechanics")
      expect(page).to have_content("#{mechanic_1.name}- #{mechanic_1.years_of_experience} years of experience")
      expect(page).to have_content("#{mechanic_2.name}- #{mechanic_2.years_of_experience} years of experience")
    end
  end
end
