=begin
Write your code for the 'Isogram' exercise in this file. Make the tests in
`isogram_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/isogram` directory.
=end
class Isogram
  
  def self.isogram?(input)
    input
      .chars
      .flat_map{ |w| w.gsub(/^[^a-z0-9]+|[^a-z0-9]+$/i,'').split(/-|,/) }
      .map(&:downcase)
      .inject(Hash.new(0)) { |total, c| total[c] += 1; total  }
      .select { |k,v| v > 1 }
      .empty?
  end
end
