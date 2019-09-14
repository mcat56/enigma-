class Key

  def initialize
  end

  def self.generate_key
    @key = rand(0..99999).to_s.rjust(5,"0")
  end
end
