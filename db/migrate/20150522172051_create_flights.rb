class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.belongs_to :airplane
      t.belongs_to :destination
      t.date :departure_date
    end
  end
end
