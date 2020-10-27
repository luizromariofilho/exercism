=begin
Write your code for the 'Scrabble Score' exercise in this file. Make the tests in
`scrabble_score_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/scrabble-score` directory.
=end
class Scrabble

  TEMPLATE = {}
  %w{ A E I O U L N R S T }.each { |letter| TEMPLATE[letter] = 1 }
  %w{ D G  }.each { |letter| TEMPLATE[letter] = 2 }
  %w{ B C M P }.each { |letter| TEMPLATE[letter] = 3 }
  %w{ F H V W Y }.each { |letter| TEMPLATE[letter] = 4 }
  %w{ K }.each { |letter| TEMPLATE[letter] = 5 }
  %w{ J X }.each { |letter| TEMPLATE[letter] = 8 }
  %w{ Q Z }.each { |letter| TEMPLATE[letter] = 10 }

  attr_reader :word 

  def initialize(word)
    @word = word  
  end

  def score
    return 0 if @word == nil || @word.empty? || @word.scan(/\S+/).empty?
    @word.chars.map(&:upcase).inject(0){ |total, c| total += TEMPLATE[c]; total }
  end

  def self.score(word)
    self.new(word).score
  end
end
