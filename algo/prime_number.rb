# Use RSpec to test the following exercise! You may wish to wrap the methods below in a class to help facilitate this.

# First, implement the is_prime? method below. It should accept a number as an argument and return
# true if the number is prime and false if it is not. A prime number is a number that is only
# divisible by itself and the number 1.


# Second, implement the highest_prime_number_under method below. It should accept a number as
# an argument and return the highest prime number under that number. For example, the
# highest prime number under 10 is 7.

require 'rspec'

class PrimeNums

  def is_prime?(number)
    if number < 0
      nil
    elsif number == 0
      false
    elsif number == 1 || number == 2
      true
    else
      (2...number).all?{|divisor| number % divisor != 0}
    end
  end

  def highest_prime_number_under(number)
    (0...number).to_a.reverse.find{|num| is_prime?(num)}
  end

end

#Testing is_prime? method

RSpec.describe PrimeNums do
  describe '#is_prime?' do
    it 'returns false for 0' do
      prime = PrimeNums.new
      result = prime.is_prime?(0)
      expect(result).to eq(false)
    end
  end
end

RSpec.describe PrimeNums do
  describe '#is_prime?' do
    it 'returns true for 1' do
      prime = PrimeNums.new
      result = prime.is_prime?(1)
      expect(result).to eq(true)
    end
  end
end

RSpec.describe PrimeNums do
  describe '#is_prime?' do
    it 'returns true for 2' do
      prime = PrimeNums.new
      result = prime.is_prime?(2)
      expect(result).to eq(true)
    end
  end
end

RSpec.describe PrimeNums do
  describe '#is_prime?' do
    it 'returns false for 18' do
      prime = PrimeNums.new
      result = prime.is_prime?(18)
      expect(result).to eq(false)
    end
  end
end

RSpec.describe PrimeNums do
  describe '#is_prime?' do
    it 'returns true for 17' do
      prime = PrimeNums.new
      result = prime.is_prime?(17)
      expect(result).to eq(true)
    end
  end
end

#Testing highest_prime_number_under method

RSpec.describe PrimeNums do
  describe '#highest_prime_number_under' do
    it 'returns 7 when given 10' do
      prime = PrimeNums.new
      result = prime.highest_prime_number_under(10)
      expect(result).to eq(7)
    end
  end
end

RSpec.describe PrimeNums do
  describe '#highest_prime_number_under' do
    it 'returns 13 when given 17' do
      prime = PrimeNums.new
      result = prime.highest_prime_number_under(17)
      expect(result).to eq(13)
    end
  end
end
