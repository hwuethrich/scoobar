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

end
