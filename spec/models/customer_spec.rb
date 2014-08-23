require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe 'Validations:' do
  end

  describe 'Scopes:' do
  end

  describe '#age' do

    subject { Customer.new }

    it 'calculates the years since date of birth' do
      subject.date_of_birth = (30.years.ago + 1.day)
      expect(subject.age).to eq(29)
    end

  end

end
