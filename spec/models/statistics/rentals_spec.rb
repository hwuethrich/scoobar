require 'rails_helper'

RSpec.describe Statistics::Rentals, type: :model do

  subject { Statistics::Rentals.new range: range }
  let(:range) { nil }

  before(:each) do
    customers = create_list :customer, 3

    categories = ['BCD', 'Torch', 'Wetsuit'].map do |name|
      create :equipment_category, name: name
    end

    equipments = [
      create(:equipment, category: categories[0], name: 'BCD #1'),
      create(:equipment, category: categories[0], name: 'BCD #2'),
      create(:equipment, category: categories[1], name: 'Torch #1'),
      create(:equipment, category: categories[2], name: 'Wetsuit #1')
    ]

    rentals = [
      create(:rental, start_time: '01/01/2013 10:00', equipment: equipments[0], customer: customers[0]),

      create(:rental, start_time: '01/01/2014 10:00', equipment: equipments[0], customer: customers[1]),
      create(:rental, start_time: '01/02/2014 10:00', equipment: equipments[1], customer: customers[0]),
      create(:rental, start_time: '02/02/2014 10:00', equipment: equipments[1], customer: customers[0]),
      create(:rental, start_time: '01/02/2014 10:00', equipment: equipments[2], customer: customers[1]),
      create(:rental, start_time: '01/03/2014 10:00', equipment: equipments[1], customer: customers[2]),

      create(:rental, start_time: '02/02/2015 10:00', equipment: equipments[0], customer: customers[0])
    ]
  end

  describe '#count_by_month' do
    context 'for rentals in a given year' do

      let(:range) { Date.new(2014, 1, 1)..Date.new(2014, 12, 31) }

      it 'counts number of rentals per month' do
        stats = subject.count_by_month
        expect(stats['Jan']).to eq 1
        expect(stats['Feb']).to eq 3
        expect(stats['Mar']).to eq 1
      end

      it 'uses 0 for months without bookings' do
        stats = subject.count_by_month
        expect(stats['Jun']).to eq 0
      end

    end
  end

end
