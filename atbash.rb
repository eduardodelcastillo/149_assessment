require 'pry'
# Atbash Cipher

# First 13 letters: A|B|C|D|E|F|G|H|I|J|K|L|M
# Last 13 letters:  Z|Y|X|W|V|U|T|S|R|Q|P|O|N

ATBASH = { 'A' => 'Z', 'B' => 'Y', 'C' => 'X', 'D' => 'W', 'E' => 'V', 'F' => 'U', 'G' => 'T', 'H' => 'S', 'I' => 'R', 'J' => 'Q', 'K' => 'P', 'L' => 'O', 'M' => 'N', 'N' => 'M', 'O' => 'L', 'P' => 'K', 'Q' => 'J', 'R' => 'I', 'S' => 'H', 'T' => 'G', 'U' => 'F', 'V' => 'E', 'W' => 'D', 'X' => 'C', 'Y' => 'B', 'Z' => 'A'}

class Atbash
  attr_accessor :word

  def self.encode(word)
    code = []
    temp_code = []
    output = ""
    counter = 0
    word.gsub!(/[\s,.]/,"") # remove space, comma and period
    word.split(//).each do |letter|
      if ATBASH.has_key?(letter.upcase)
        code << ATBASH.fetch(letter.upcase)
      else
        code << letter
      end
    end
    # group into 5 characters with space in between
    code.each do |letter|
        temp_code << letter 
        if (temp_code.size - counter) % 5 == 0
          temp_code << " "
          counter += 1
        end
    end
    output = temp_code.join.downcase.rstrip
  end
end

plaintext = 'The quick brown fox jumps over the lazy dog.'
puts Atbash.encode(plaintext)