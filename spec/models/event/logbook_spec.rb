require 'rails_helper'

RSpec.describe Event::Logbook, type: :model do

  describe 'Attributes:' do

    describe '#max_depth' do
      it { should validate_presence_of(:max_depth) }
    end

    describe '#dive_time' do
      it { should validate_presence_of(:dive_time) }
    end

    describe '#time_in' do
      it { should validate_presence_of(:time_in) }
    end

  end

  describe 'Methods:' do

    context 'for a logbook with time in and dive time' do
      subject { build :event_logbook, time_in: '01-01-2014 14:00', dive_time: 65 }
      its(:time_out) { should eq(subject.time_in + 65.minutes) }
      its(:formatted_time_in) { should eq '14:00' }
      its(:formatted_time_out) { should eq '15:05' }
    end

    context 'for a logbook with neither time in nor dive time' do
      subject { build :event_logbook, time_in: nil, dive_time: nil }
      its(:time_out) { should be_nil }
      its(:formatted_time_in) { should be_nil }
      its(:formatted_time_out) { should be_nil }
    end

  end

end
