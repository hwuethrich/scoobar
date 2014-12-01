require 'rails_helper'

RSpec.describe Equipment, type: :model do

  subject { build :equipment }

  describe 'Attributes:' do

    describe '#category' do
      it { should validate_presence_of(:category) }
    end

    describe '#name' do
      it { should validate_presence_of(:name) }
      it { should validate_uniqueness_of(:name).scoped_to(:category_id) }
    end

  end

end
