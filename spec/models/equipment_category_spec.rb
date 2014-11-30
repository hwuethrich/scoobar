require 'rails_helper'

RSpec.describe Equipment::Category, type: :model do

  describe 'Attributes:' do

    describe '#name' do
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name) }
    end

  end


  describe 'Scopes:' do

    describe '#alphabetical' do
      before(:each) do
        ['C', 'A', 'B'].each { |name| create(:equipment_category, name: name) }
      end

      it 'should order equipment categories by name' do
        names = Equipment::Category.alphabetical.map(&:name)
        expect(names).to eq(['A', 'B', 'C'])
      end
    end

  end
end
