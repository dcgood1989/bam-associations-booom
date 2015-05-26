class Airplane < ActiveRecord::Base

has_many :flights
has_many :destinations, through: :flights
validates :serial_number, uniqueness: true

  def plane_information
    "#{self.airline} #{self.manufacturer} #{self.serial_number}"
  end
end
