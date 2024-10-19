# frozen_string_literal: true

RSpec.describe ApexCharts::Series::PolarSeries do
  let(:data1) {
    [25, 100, 200, 125]
  }
  let(:data2) {
    {
      data: data1
    }
  }
  let(:data3) {
    data1.map {|m| {data: m} }
  }
  let(:data4) {
    [
      {name: 'Series A', data: 25},
      {name: 'Series B', data: 100},
      {name: 'Series C', data: 200},
      {name: 'Series D', data: 125}
    ]
  }
  let(:expected) {
    {
      series: [25, 100, 200, 125]
    }
  }
  let(:expected_with_names) {
    {
      labels: ['Series A', 'Series B', 'Series C', 'Series D'],
      series: [25, 100, 200, 125]
    }
  }

  it 'returns data series and labels (if any)' do
    expect(described_class.new(data1).sanitized).to eq(expected)
    expect(described_class.new(data2).sanitized).to eq(expected)
    expect(described_class.new(data3).sanitized).to eq(expected)
    expect(described_class.new(data4).sanitized).to eq(expected_with_names)
  end

  context 'sample' do
    it 'returns correct sample' do
      expect(described_class.new(data1).sample).to eq(25)
      expect(described_class.new(data2).sample).to eq(25)
      expect(described_class.new(data3).sample).to eq(25)
      expect(described_class.new(data4).sample).to eq(25)
    end
  end
end
