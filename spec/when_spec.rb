RSpec.describe Headway::When, '#formatted_now' do
  context 'when not given a time generator' do
    subject { Headway::When.new.formatted_now }

    it 'uses the default Time.now' do
      allow(Time).to receive(:now).and_return(Time.new 2018, 5, 6, 22, 48)
      expect(subject).to eq '10:48pm, 5/6'
    end
  end

  context 'when given a time generator' do
    subject { Headway::When.new(now: generator).formatted_now }

    let(:generator) { -> { Time.new 2017, 4, 5, 21, 47 } }

    it 'uses the generator' do
      allow(Time).to receive(:now).and_return(Time.new 2018, 5, 6, 22, 48)
      expect(subject).to eq '9:47pm, 4/5'
    end
  end
end
