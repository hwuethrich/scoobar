require 'rails_helper'

RSpec.describe Statistics::Events, type: :model do

  subject { Statistics::Events.new events: events, range: range }
  let(:range) { nil }

  before(:each) do
    start_times = [
      DateTime.new(2013, 01, 01, 16, 00),

      DateTime.new(2014, 01, 01, 00, 00),
      DateTime.new(2014, 01, 31, 00, 00),
      DateTime.new(2014, 05, 15, 16, 00),
      DateTime.new(2014, 12, 30, 20, 59),

      DateTime.new(2015, 01, 01, 16, 00)
    ]

    start_times.each do |start_time|
      create :event, start_time: start_time
    end
  end

  describe '#count_by_month' do
    context 'for events in a given year' do

      let(:range) { Date.new(2014, 1, 1)..Date.new(2014, 12, 31) }

      it 'counts number of events per month' do
        stats = subject.count_by_month
        expect(stats['Jan']).to eq 2
        expect(stats['May']).to eq 1
        expect(stats['Dec']).to eq 1
      end

      it 'uses 0 for months without events' do
        stats = subject.count_by_month
        expect(stats['Jun']).to eq 0
      end

    end
  end

end
