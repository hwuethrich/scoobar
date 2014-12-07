require 'rails_helper'

RSpec.describe Statistics::Bookings, type: :model do

  subject { Statistics::Bookings.new range: range }
  let(:range) { nil }

  before(:each) do

    customers = create_list :customer, 2

    start_times = [
      DateTime.new(2013, 01, 01, 16, 00), # 0: Jan 2013
      DateTime.new(2014, 01, 01, 00, 00), # 1: Jan 2014
      DateTime.new(2014, 01, 15, 00, 00), # 2: Jan 2014
      DateTime.new(2014, 02, 15, 00, 00), # 3: Feb 2014
      DateTime.new(2015, 01, 01, 16, 00)  # 4: Jan 2015
    ]

    events = start_times.map do |start_time|
      create :event, start_time: start_time
    end

    create :booking, customer: customers[0], event: events[0]
    create :booking, customer: customers[0], event: events[1] # Jan 2014 + 1
    create :booking, customer: customers[0], event: events[2] # Jan 2014 + 1
    create :booking, customer: customers[1], event: events[1] # Jan 2014 + 1
    create :booking, customer: customers[1], event: events[3] # Feb 2014 + 1
    create :booking, customer: customers[1], event: events[4]
  end

  context 'for bookings in a given year' do
    let(:range) { Date.new(2014, 1, 1)..Date.new(2014, 12, 31) }

    describe '#count' do
      it 'counts the total bookings' do
        expect(subject.count).to eq(4)
      end
    end

    describe '#count_by_month' do

      it 'counts number of events per month' do
        stats = subject.count_by_month

        expect(stats['Jan']).to eq 3
        expect(stats['Feb']).to eq 1
      end

      it 'uses 0 for months without bookings' do
        stats = subject.count_by_month
        expect(stats['Jun']).to eq 0
      end

    end
  end

end
