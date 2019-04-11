class CaeserCipher
  attr_reader :key, :rotor
  def initialize(key)
    @key = key
    chars = ("a".."z").to_a << " "
    nums = (0..26).to_a
    @rotor = nums.zip(chars).to_h
  end

  def rotate(letter, offset)
     num = @rotor.find{|k,v| v == letter }[0]
     num = (num + offset + key) % 27
     @rotor[num]
  end

end
