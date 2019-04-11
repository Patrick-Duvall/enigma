require "./spec/spec_helper"

  describe OffsetGenerator do

    it 'generates 4 offsets using the date' do
      expect([5,5,6,1]).to eq(OffsetGenerator.generate(110419))
    end

    it 'converts a todays date to 6 digit ddmmyy format' do
      expect(110419).to eq( OffsetGenerator.convert_date)
    end

    it 'uses todays date if no date given' do
      expect([5,5,6,1]).to eq(OffsetGenerator.generate())
    end
  end
