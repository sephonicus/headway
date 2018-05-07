RSpec.describe Headway::Progress, '#formatted_percentage' do
  let(:progress) { Headway::Progress.new }

  it 'returns the percentage formatted for presentation' do
    allow(progress).to receive(:percentage).and_return(51.3333333)
    expect(progress.formatted_percentage).to eq '51.3%'

    allow(progress).to receive(:percentage).and_return(52.5555555)
    expect(progress.formatted_percentage).to eq '52.6%'
  end
end
