class Key
  attr_reader :key

  def initialize
    @key = ""
  end

  def self.generate_key
    @key = rand(00000..99999).to_s
  end
end
