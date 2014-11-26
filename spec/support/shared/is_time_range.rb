RSpec.shared_examples "is time range" do

  it 'must implement #start_time' do
    expect(subject.respond_to?(:start_time)).to eq(true)
  end

  it 'must implement #end_time' do
    expect(subject.respond_to?(:end_time)).to eq(true)
  end

  describe '#duration' do
    it 'calculates the minutes between #start_time and #end_time' do
      subject.start_time = DateTime.now
      subject.end_time = subject.start_time + 45.minutes
      expect(subject.duration).to eq(45)
    end

    it 'is nil if #start_time is undefined' do
      subject.start_time = nil
      subject.end_time = DateTime.now
      expect(subject.duration).to be_nil
    end

    it 'is nil if #end_time is undefined' do
      subject.start_time = DateTime.now
      subject.end_time = nil
      expect(subject.duration).to be_nil
    end
  end

  describe '#duration=' do
    it 'sets the #end_time x minutes after the #start_time' do
      subject.start_time = DateTime.parse('1.1.2014 14:00')
      subject.duration = 145
      expect(subject.end_time).to eq(DateTime.parse('1.1.2014 16:25'))
    end
  end

  context 'which ends in the past' do
    before(:each) do
      subject.start_time = 10.hours.ago
      subject.duration = 60
    end

    it { is_expected.not_to be_future }
    it { is_expected.to be_past }
    it { is_expected.not_to be_current }
  end

  context 'which begins in the future' do
    before(:each) do
      subject.start_time = 10.hours.from_now
      subject.duration = 60
    end

    it { is_expected.to be_future }
    it { is_expected.not_to be_past }
    it { is_expected.not_to be_current }
  end

  context 'which begins in the past and ends in the future' do
    before(:each) do
      subject.start_time = 1.hours.ago
      subject.duration = 120
    end

    it { is_expected.not_to be_future }
    it { is_expected.not_to be_past }
    it { is_expected.to be_current }
  end

end
