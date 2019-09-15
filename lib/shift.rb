class Shift
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def shift(text,key,date,boolean)
    shifts = generate_shifts(key, date)
    message = text.split("").each do |letter|
        shift = shifts[0]
        shift = (shifts[0] * -1) if boolean == true
      shifted = @alphabet.rotate(shift)
      if '!"#$%&\'()*+,-./:;<=>?@[\]^_`{|}~'.include? letter
        letter = letter
      else
        letter.replace(shifted[@alphabet.index(letter)])
      end
      shifts.rotate!
    end
    message.join
  end

  def generate_keys(key)
    keys = [(key[0] + key[1]).to_i, (key[1] + key[2]).to_i, key_C = (key[2] + key[3]).to_i, key_D = (key[3] + key[4]).to_i]
  end

  def generate_offsets(date)
    offset = (date.to_i**2).to_s[-4..-1]
    offset.split("").map {|num| num.to_i }
  end

  def generate_shifts(key,date)
    generate_keys(key).zip(generate_offsets(date)).map {|array| array.sum}.flatten
  end


end
