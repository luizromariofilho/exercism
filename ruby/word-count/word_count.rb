=begin
Write your code for the 'Word Count' exercise in this file. Make the tests in
`word_count_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/word-count` directory.
=end
class Phrase
  attr_reader :phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    @phrase
      .scan(/\S+/)
      .flat_map{ |w| w.gsub(/^[^a-z0-9]+|[^a-z0-9]+$/i,'').split(/-|,/) }
      .map(&:downcase)
      .inject(Hash.new(0)) { |total, word| total[word] += 1 ;total}
  end
end
