class CaeserCipher
  attr_reader :key, :rotor
  def initialize(key)
    @key = key
    chars = ("a".."z").to_a << " "
    nums = (1..27).to_a
    @rotor = nums.zip(chars).to_h
  end

  def rotate(letter, offset)
    # require "pry"; binding.pry
     num = @rotor.find{|k,v| v == letter }[0]
     (num += offset) % 27
     @rotor[num]
  end

end
