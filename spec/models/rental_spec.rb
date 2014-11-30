require 'rails_helper'

RSpec.describe Rental, type: :model do

  describe 'Attributes:' do

    describe '#customer' do
      it { should validate_presence_of(:customer) }
    end

    describe '#equipment' do
      it { should validate_presence_of(:equipment) }
    end

  end

end
