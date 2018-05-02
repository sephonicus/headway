RSpec.describe Headway::Progress, 'single stage' do
  let(:progress) { Headway::Progress.new }

  it 'supports tracking and reporting progress' do
    expect(progress.percentage).to eq 0.0
    expect(progress.completed?).to be_falsy

    progress.set_percentage 13.3
    expect(progress.percentage).to eq 13.3
    expect(progress.completed?).to be_falsy

    progress.set_percentage 62.7
    expect(progress.percentage).to eq 62.7
    expect(progress.completed?).to be_falsy

    progress.set_complete
    expect(progress.percentage).to eq 100.0
    expect(progress.completed?).to be_truthy
  end
end
