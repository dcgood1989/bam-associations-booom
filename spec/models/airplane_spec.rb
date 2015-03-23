require 'rails_helper'

describe Airplane do
  let(:airplane) { create_airplane }

  describe 'assocations' do
    let(:destination) { create_destination }
    let!(:flight) { create_flight(airplane: airplane, destination: destination) }

    describe '#flights' do
      it 'returns all associated flights' do
        expect(airplane.flights).to eq(Array(flight))
      end
    end

    describe '#destinations' do
      it 'returns all associated destinations' do
        expect(airplane.destinations).to eq(Array(destination))
      end
    end
  end

  describe 'validations' do
    describe '#serial_number' do
      it 'requires each airplane to have a unique serial number' do
        dupe_airplane = Airplane.new(serial_number: airplane.serial_number)
        dupe_airplane.save

        expect(dupe_airplane.errors.messages).to eq({serial_number: ['has already been taken']})
      end
    end
  end
end
