require 'rails_helper'

RSpec.describe Event, type: :model do
  it_behaves_like 'is time range'

  subject { build(:event) }

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
end
