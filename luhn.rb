require 'pry'

class Luhn
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def addends
    output = []
    digit_array = number.to_s.split(//).reverse
    digit_array.map! { |x| x.to_i }
    digit_array.each_index do |index|
      if index % 2 != 0
        digit_array[index] = digit_array[index] * 2
        if digit_array[index] >= 10
          digit_array[index] -= 9
        end
      end
    end
    output = digit_array.reverse
    output
  end

  def checksum
    digits = []
    output = 0
    digits = addends
    digits.each { |x| output += x }
    output
  end

  def valid?
    number = checksum
    number % 10 == 0 
  end

  def self.create(number)
    digits = %w(0 1 2 3 4 5 6 7 9)
    num = Luhn.new(number)
    new_num = 0
    if !num.valid?
      digits.each do |x|
        new_num = num.number.to_s + x
        new_num = Luhn.new(new_num)
        #binding.pry
        break if new_num.valid?
      end
    end
    new_num.number.to_i
  end
end

puts num1 = Luhn.create(837_263_756)



