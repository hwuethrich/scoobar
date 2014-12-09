require 'rails_helper'

RSpec.describe Event, type: :model do
  it_behaves_like 'is time range'

  subject { build(:event) }

  describe 'Attributes:' do

    describe '#capacity' do
      it { should validate_numericality_of(:capacity).is_greater_than(0) }

      context 'with a boat with limited capacity' do

        let(:boat) { build(:boat, capacity: 10) }
        subject { build(:event, boat: boat) }

        it 'inherits the boats capacity' do
          expect(subject.capacity).to eq(10)
        end

        context 'when the event is saved' do
          before(:each) { subject.save }

          it 'does not persist the capacity'  do
            boat.capacity = 20
            expect(subject.capacity).to eq(20)
          end
        end
      end
    end

    describe '#price' do

      context 'for a trip with a price' do
        let(:trip) { create :trip, price: 100 }

        context 'when the event has a price' do
          subject { create :event, trip: trip, price: 150 }

          it 'returns the price of the event' do
            expect(subject.price).to eq 150
          end
        end

        context 'when the event has no price' do
          subject { create :event, trip: trip, price: nil }

          it 'returns the price of the trip' do
            expect(subject.price).to eq 100
          end
        end

      end

      context 'for a trip without a price' do
        let(:trip) { create :trip, price: nil }
        subject { create :event, trip: trip, price: nil }

        it 'returns nil' do
          expect(subject.price).to be_nil
        end

      end

    end

  end

end
