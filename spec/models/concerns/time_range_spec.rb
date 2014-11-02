require 'rails_helper'

RSpec.describe TimeRange do

  class TimeRangeClass
    attr_accessor :start_time, :end_time
    include TimeRange
  end

  context 'when included in a class' do
    subject { TimeRangeClass.new }
    it_behaves_like 'is time range'
  end

end
