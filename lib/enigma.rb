require "./spec/spec_helper"


class Enigma

  def encrypt(string, masterkey, ddmmyy)
    keys = KeyGenerator.generate(masterkey)
    offsets = OffsetGenerator.generate(ddmmyy)
  end

end
