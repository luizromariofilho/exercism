=begin
Write your code for the 'Raindrops' exercise in this file. Make the tests in
`raindrops_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/raindrops` directory.
=end
class Raindrops
  
  def self.convert(number)
    string = ""
    string = string + "Pling" if number % 3 == 0
    string = string + "Plang" if number % 5 == 0
    string = string + "Plong" if number % 7 == 0
    string = number.to_s unless number % 3 == 0 || number % 5 == 0 || number % 7 == 0
    string
  end

end
