require "./spec/spec_helper"

  describe OffsetGenerator do

    it 'generates 4 offsets using the date' do
      expect([5,5,6,1]).to eq(OffsetGenerator.generate(110419))
    end

    it 'converts a date to 6 digit ddmmyy format'

  end
