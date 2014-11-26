require 'rails_helper'

RSpec.describe Booking, type: :model do

  subject { build(:booking) }

  describe 'Validations:' do
    it { should validate_uniqueness_of(:customer_id).scoped_to(:event_id) }
  end

end
