require 'rails_helper'

RSpec.describe Boat, type: :model do

  describe 'Attributes:' do

    subject { build(:boat) }

    describe '#code' do
      it { should validate_presence_of(:code) }
      it { should validate_uniqueness_of(:code) }
      it { should ensure_length_of(:code).is_at_most(3) }
    end

    describe '#capacity' do
      it { should validate_numericality_of(:capacity).is_greater_than(0) }
      it { should_not validate_presence_of(:capacity) }
    end

  end

  describe 'Scopes:' do

    describe '#alphabetical' do
      before(:each) do
        ['C', 'A', 'B'].each { |name| create(:boat, name: name) }
      end

      it 'should order boats by name' do
        names = Boat.alphabetical.map(&:name)
        expect(names).to eq(['A', 'B', 'C'])
      end
    end

    describe '#search' do
      before(:each) do
        create(:boat, code: 'AB', name: 'BB')
        create(:boat, code: 'BA', name: 'BB')
        create(:boat, code: 'C1', name: 'XX')
        create(:boat, code: 'XX', name: 'XX')
      end

      it 'finds boats by name or code (case-insensitive)' do
        codes = Boat.search('b').map(&:code)
        expect(codes).to match_array(['AB', 'BA'])
      end
    end

  end

end
