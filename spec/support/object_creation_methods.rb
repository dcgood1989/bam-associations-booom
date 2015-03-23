def create_airplane(overrides={})
  defaults = {manufacturer: 'Boeing', airline: 'United', serial_number: 1234567}
  Airplane.create(defaults.merge(overrides))
end

def create_destination(overrides={})
  defaults = {city: 'Denver', state: 'CO'}
  Destination.create(defaults.merge(overrides))
end

def create_flight(overrides={})
  defaults = {airplane: create_airplane, destination: create_destination,
    departure_date: 2.days.from_now}
  Flight.create(defaults.merge(overrides))
end
