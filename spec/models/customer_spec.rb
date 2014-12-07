require 'rails_helper'

RSpec.describe Customer do

  subject { build(:customer) }

  describe 'Attributes:' do

    describe '#email' do
      it { should_not validate_presence_of(:email) }
      it { should_not allow_value('invalid', 'invalid@email').for(:email) }
      it { should allow_value('example@example.com', 'my-email@example.domain.co.uk').for(:email) }
    end

    describe '#date_of_birth' do
      it 'cannot have a birthday in the future' do
        subject.date_of_birth = Date.tomorrow
        expect(subject).to be_invalid
      end
    end

    describe '#age' do
      it 'calculates the years since date of birth' do
        subject.date_of_birth = (30.years.ago + 1.day)
        expect(subject.age).to eq(29)
      end
    end

  end

  describe 'Scopes:' do

    describe '.recent' do

      before(:each) do
        11.times do |n|
          create :customer, first_name: 'Customer %02d' % (n+1), updated_at: n.hours.ago
        end
      end

      it 'shows the 10 recently updated customers' do
        customers = Customer.recent

        expect(customers.count).to eq 10
        expect(customers[0].first_name).to eq 'Customer 11'
        expect(customers[9].first_name).to eq 'Customer 02'
      end

    end

  end

  describe 'Methods:' do
    describe '#destroy' do

      let(:customer) { create(:customer) }

      it 'deletes all rentals' do
        create_list(:rental, 10, customer: customer)
        expect { customer.destroy }.not_to raise_error
        expect(Rental.count).to be_zero
      end

      it 'deletes all bookings' do
        create_list(:booking, 10, customer: customer)
        expect { customer.destroy }.not_to raise_error
        expect(Booking.count).to be_zero
      end

    end
  end

end
