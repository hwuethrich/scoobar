require 'rails_helper'

RSpec.describe Customer do

  subject { build(:customer) }

  describe 'Attributes:' do

    describe '#email' do
      it { should validate_presence_of(:email) }
      it { should_not allow_value('invalid', 'invalid@email').for(:email) }
      it { should allow_value('example@example.com', 'my-email@example.domain.co.uk').for(:email) }
    end

    describe '#date_of_birth' do
      it 'cannot have a birthday in the future' do
        subject.date_of_birth = Date.tomorrow
        expect(subject).to be_invalid
      end
    end

    describe '#age' do
      it 'calculates the years since date of birth' do
        subject.date_of_birth = (30.years.ago + 1.day)
        expect(subject.age).to eq(29)
      end
    end

  end

end
