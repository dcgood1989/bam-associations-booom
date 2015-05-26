class CreateAirplanes < ActiveRecord::Migration
  def change
    create_table :airplanes do |t|
      t.string :manufacturer
      t.string :airline
      t.integer :serial_number
    end
  end
end
