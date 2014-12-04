require 'rails_helper'

RSpec.describe Event::Logbook, type: :model do

  describe 'Attributes:' do

    describe '#max_depth' do
      it { should validate_presence_of(:max_depth) }
    end
  end

end
