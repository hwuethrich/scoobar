require 'rails_helper'

RSpec.describe Rental, type: :model do
  it_behaves_like 'is time range'

  describe 'Attributes:' do

    describe '#customer' do
      it { should validate_presence_of(:customer) }
    end

    describe '#equipment' do
      it { should validate_presence_of(:equipment) }
    end

    describe '#start_date' do
      it { should validate_presence_of(:start_time) }
    end

    describe '#end_date' do
      it { should_not validate_presence_of(:end_time) }
    end

  end

end
