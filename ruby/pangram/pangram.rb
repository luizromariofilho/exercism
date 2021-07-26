# Write your code for the 'Pangram' exercise in this file. Make the tests in
# `pangram_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/pangram` directory.

class Pangram
  class << self
    ALPHABETIC = ('A'..'Z').to_a.freeze

    def pangram?(sentence)
      return false if sentence.strip.empty?

      # require 'pry'; binding.pry
      (ALPHABETIC - cleared_sentence(sentence)).empty?
    end

    def cleared_sentence(sentence)
      sentence.gsub!(/[^a-zA-Z]/, '')
      converted_in_array = sentence.chars
      updcased = converted_in_array.map(&:upcase)
      updcased.uniq
    end
  end
end
