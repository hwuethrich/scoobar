require 'rails_helper'

RSpec.describe Booking, type: :model do

  subject { build(:booking) }

  describe 'Validations:' do
    it { should validate_uniqueness_of(:customer_id).scoped_to(:event_id) }
  end

  describe 'Associations:' do
    describe '#customer' do
      it 'updates the customers updated_at when saved' do

        subject.save
        old_updated_at = subject.customer.updated_at

        Timecop.freeze 1.hour.from_now

        subject.touch
        subject.save

        expect(subject.customer.updated_at).not_to eq old_updated_at
        expect(subject.customer.updated_at).to eq subject.updated_at
      end
    end
  end

end
