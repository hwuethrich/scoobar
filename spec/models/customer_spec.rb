require 'spec_helper'

RSpec.describe Customer do

  subject { Customer.new }

  describe 'Validations:' do

    it 'cannot have a birthday in the future' do
      subject.date_of_birth = Date.tomorrow
      expect(subject.valid?).to eq(false)
    end

  end

  describe '#age' do
    it 'calculates the years since date of birth' do
      subject.date_of_birth = (30.years.ago + 1.day)
      expect(subject.age).to eq(29)
    end
  end

end
