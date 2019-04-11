class OffsetGenerator


  def self.generate(ddmmyy)
    (ddmmyy * ddmmyy).to_s[-4..-1].split('').map(&:to_i)
  end

  def self.convert_date
    Time.now.strftime("%d%m%y").to_i
  end

end
