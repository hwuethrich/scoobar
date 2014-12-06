require 'rails_helper'

RSpec.describe Guide, type: :model do

  describe 'Attributes:' do

    describe '#name' do
      it { should validate_presence_of(:name) }
    end

  end

end
