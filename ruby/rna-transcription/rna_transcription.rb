# Write your code for the 'Rna Transcription' exercise in this file. Make the tests in
# `rna_transcription_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/rna-transcription` directory.

class Complement
  class << self
    COMPLEMENT_RNA = {
      'G': 'C',
      'C': 'G',
      'T': 'A',
      'A': 'U'
    }.freeze

    def of_dna(sequence)
      sequence.split('').map do |nucleotides|
        COMPLEMENT_RNA[nucleotides.to_sym]
      end.compact.join('')
    end
  end
end
