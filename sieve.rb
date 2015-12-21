require 'pry'

class Sieve
  attr_accessor :end_range

  def initialize(end_range)
    @end_range = end_range
  end

  def primes
    range_array = (2..end_range).to_a
    output = []
    prime = 2
    range_array.each do |p|      
      if p.class != String 
      # find next prime after 2
        if p > prime
          prime = p 
        end       
        range_array.map! do |x|
          if x % prime == 0 && x != prime
            x.to_s + "f" # flagging it
          else
            x
          end
        end
      end
    end
    # return only the integers in the array
    range_array.each do |x| 
      # binding.pry
      if x.class != String
        output << x 
      end
    end
    output
  end
end

puts Sieve.new(1000).primes