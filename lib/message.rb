class Message
  attr_reader :text

  def initialize(file)
    @filename = file
    @text = ""
  end

  def read(file)
    message = File.open(@filename, "r")
    @text = File.read
    message.close
  end

end
