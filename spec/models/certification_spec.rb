require 'rails_helper'

RSpec.describe Certification, type: :model do

  before(:each) do
    create :customer, certification_name: 'SSI OW'
    create :customer, certification_name: 'PADI OW'
    create :customer, certification_name: 'PADI OW'
    create :customer, certification_name: 'PADI RD'
  end

  describe 'Class Methods:' do

    describe '.all' do
      it 'returns a certification for each uniq customer certification name' do
        certifications = described_class.all
        expect(certifications.size).to eq(3)
        expect(certifications).to eq ['PADI OW', 'PADI RD', 'SSI OW']
      end
    end

  end
end
