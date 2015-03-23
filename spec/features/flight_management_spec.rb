require 'rails_helper'

feature 'Flight management' do
  let!(:airplane) { create_airplane(manufacturer: 'Boeing', airline: 'United', serial_number: 1234567) }
  let!(:destination) { create_destination(city: 'Newton', state: 'MA') }

  scenario 'lists all flights on the flights index' do
    create_flight(airplane: airplane, destination: destination)
    create_flight(airplane: create_airplane(manufacturer: 'Boeing', airline: 'Southwest', serial_number: 8765432),
      destination: create_destination(city: 'Boulder', state: 'CO'))

    sign_up

    expect(current_path).to eq(flights_path)
    expect(page).to have_content 'United Boeing 1234567 to Newton, MA'
    expect(page).to have_content 'Southwest Boeing 8765432 to Boulder, CO'
  end

  scenario 'allows a user to create a new flight by selecting an airplane, destination, and departing_at' do
    sign_up
    click_link 'New Flight'

    select('United Boeing 1234567', from: 'Airplane')
    select('Newton, MA', from: 'Destination')
    fill_in 'Departure Date', with: '01/01/2528'

    click_on 'Create Flight'

    expect(page).to have_content 'Successfully created flight to Newton, MA'
    expect(page).to have_content 'United Boeing 1234567 to Newton, MA'
    expect(current_path).to eq(flights_path)
  end

  scenario 'shows an error if a user tries to create a flight in the past' do
    sign_up
    click_link 'New Flight'

    select('United Boeing 1234567', from: 'Airplane')
    select('Newton, MA', from: 'Destination')
    fill_in 'Departure Date', with: '01/01/1995'

    click_on 'Create Flight'

    expect(page).to have_content 'Error creating flight'
    expect(page).to have_content "Departure date can't be in the past"
  end

  scenario 'allows a user to update the plane for a flight, but not destination or departing at' do
    flight = create_flight(airplane: create_airplane(manufacturer: 'Boeing', airline: 'Southwest', serial_number: 8765432),
      destination: create_destination(city: 'Boulder', state: 'CO'))
    sign_up
    click_link 'Southwest Boeing 8765432 to Boulder, CO'

    select('United Boeing 1234567', from: 'Airplane')
    click_on 'Update Flight'

    expect(page).to have_content 'Flight successfully updated'
    expect(current_path).to eq(flights_path)
  end
end
