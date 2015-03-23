require 'rails_helper'

describe Destination do
  describe 'assocations' do
    let(:airplane) { create_airplane }
    let(:destination) { create_destination }
    let!(:flight) { create_flight(airplane: airplane, destination: destination) }

    describe '#flights' do
      it 'returns all associated flights' do
        expect(destination.flights).to eq(Array(flight))
      end
    end

    describe '#airplanes' do
      it 'returns all associated airplanes' do
        expect(destination.airplanes).to eq(Array(airplane))
      end
    end
  end

  describe 'validations' do
    describe '#city' do
      it 'validates the uniqueness of city scoped to the state' do
        Destination.create(city: 'Boulder', state: 'CO')
        dupe_destination = Destination.new(city: 'Boulder', state: 'CO')
        dupe_destination.save
        different_state = Destination.new(city: 'Boulder', state: 'NV')

        expect(dupe_destination.errors.messages).to eq({city: ["has already been taken"]})
        expect(different_state.valid?).to eq(true)
      end
    end
  end
end
