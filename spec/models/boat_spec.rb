require 'rails_helper'

RSpec.describe Boat, type: :model do

  describe 'Validations:' do

    subject { Boat.new code: 'A', name: 'Boat 1' }

    it 'must have a unique code' do
      Boat.create code: 'A', name: 'Boat 2'
      expect(subject).not_to be_valid
    end

  end

  describe 'Scopes:' do

    describe '#alphabetical' do
      before(:each) do
        Boat.create code: '1', name: 'C'
        Boat.create code: '2', name: 'A'
        Boat.create code: '3', name: 'B'
      end

      it 'should order boats by name' do
        codes = Boat.alphabetical.map(&:name)
        expect(codes).to eq(['A', 'B', 'C'])
      end
    end

  end

end
