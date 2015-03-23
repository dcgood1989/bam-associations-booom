require 'rails_helper'

feature 'User management' do
  before do
    sign_up
  end

  scenario 'allows a new user to register' do
    expect(page).to have_content 'Welcome to the Flight Scheduler'
    expect(page).to have_content 'List of Flights'
  end

  scenario 'allows a user to log out' do
    click_link 'Sign out'

    expect(current_path).to eq(root_path)
    expect(page).to have_content 'Successfully signed out'

    visit root_path
    expect(page).to_not have_content 'Successfully signed out'
  end
end
