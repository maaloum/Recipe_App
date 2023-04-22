require 'rails_helper'

RSpec.describe 'Index page of Food', type: :system do
  user2 = User.create(name: 'Test', email: 'Test@rspec.check', password: '123456')
  subject do
    Food.new(name: 'Eggs', measurement_unit: 'grams', price: 10, quantity: 1, user_id: user2.id)
  end
  
  before { subject.save }
  describe 'foods index page testing' do
    before :each do
      visit user_foods_path
      fill_in 'Email', with: 'Test@rspec.check'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      click_link 'Foods'
    end

    it 'should display the food List' do
      expect(subject).to have_text('Food List')
    end

    # it 'should display the food name' do
    #   expect(page).to have_text('Eggs')
    # end

    # it 'should display the measurement_unit' do
    #   expect(page).to have_text('grams')
    # end

    # it 'should display the price' do
    #   expect(page).to have_text(10)
    # end

    # it 'should have an Add food button' do
    #   expect(page).to have_text('Add food')
    # end
  end
end
