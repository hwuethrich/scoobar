require 'rails_helper'

RSpec.describe Trip, type: :model do

  describe 'Attributes:' do

    subject { build :trip }

    describe '#code' do
      it { should validate_presence_of(:code) }
      it { should validate_uniqueness_of(:code) }
      it { should ensure_length_of(:code).is_at_most(3) }
    end

    describe '#price' do
      it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
      it { should_not validate_presence_of(:price) }
    end

  end
end
