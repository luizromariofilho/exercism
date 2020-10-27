=begin
Write your code for the 'Series' exercise in this file. Make the tests in
`series_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/series` directory.
=end
require 'enumerator'

class Series
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def slices(quantity)
    raise ArgumentError if quantity > @number.length
    @number.chars.each_cons(quantity).map(&:join)
  end
end

