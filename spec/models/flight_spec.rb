require 'rails_helper'

describe Flight do
  let(:airplane) { create_airplane }
  let(:destination) { create_destination }

  describe 'assocations' do
    let(:flight) { create_flight(airplane: airplane, destination: destination) }

    describe '#airplane' do
      it 'returns the airplane for the given flight' do
        expect(flight.airplane).to eq(airplane)
      end
    end

    describe '#destination' do
      it 'returns the destination for the given flight' do
        expect(flight.destination).to eq(destination)
      end
    end
  end

  describe 'validations' do
    it 'requires that flights be in the future' do
      past_flight = create_flight(airplane: airplane, destination: destination, departure_date: 2.days.ago.to_date)
      expect(past_flight.errors.messages).to eq({departure_date: ["can't be in the past"]})
    end
  end
end
