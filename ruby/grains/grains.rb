# Write your code for the 'Grains' exercise in this file. Make the tests in
# `grains_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/grains` directory.

class Grains
  class << self
    def total
      2**64 - 1
    end

    def square(number_of_square)
      raise ArgumentError unless (1..64).include?(number_of_square)

      2**(number_of_square - 1)
    end
  end
end
