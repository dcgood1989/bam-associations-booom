class Destination < ActiveRecord::Base
has_many :flights
has_many :airplanes, through: :flights

validates :city, uniqueness: {scope: :state}

  def location
    "#{self.city}, #{self.state}"
  end
end
