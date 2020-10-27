=begin
Write your code for the 'Luhn' exercise in this file. Make the tests in
`luhn_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/luhn` directory.
=end
class Luhn
  def self.valid?(code)
    return false unless code && code.scan(/[^\d\s]/).length == 0 && code.scan(/\d/).length > 1 
    doubled = code.scan(/\d/).reverse.map(&:to_i).map.with_index do |number, idx| 
      if idx.odd?
        double = number * 2
        if double > 9
          double - 9 
        else
          double
        end
      else
        number
      end
    end
    doubled.sum % 10 == 0
  end
end
