class KeyGenerator

  def self.generate(master = self.make_master)
    # require "pry"; binding.pry
    keys = [master[0..1], master[1..2],master[2..3],master[3..4]]
    keys.map(&:to_i)
  end

  def self.make_master
    master = (1..99999).to_a.sample
    master = master.to_s
    require "pry"; binding.pry
    master = master.rjust(1,'0') until master.length == 5
    master
  end

end
