class KeyGenerator

  def self.generate(master = self.make_master)
    keys = [master[0..1], master[1..2],master[2..3],master[3..4]].map(&:to_i)
  end

  def self.make_master
    master = rand(1..99999).to_s
    master = ('0' + master) until master.length == 5
    master
  end

end
