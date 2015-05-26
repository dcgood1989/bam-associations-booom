class Flight < ActiveRecord::Base
belongs_to :airplane
belongs_to :destination

validate :past_departures

  def past_departures
    if departure_date < Time.now
      errors[:departure_date] << "can't be in the past"
    end
  end

end
