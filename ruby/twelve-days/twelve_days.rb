# Write your code for the 'Twelve Days' exercise in this file. Make the tests in
# `twelve_days_test.rb` pass.
#
# To get started with TDD, see the `README.md` file in your
# `ruby/twelve-days` directory.

class TwelveDays
  GIFTS = {
    1 => 'Partridge',
    2 => 'Turtle Doves',
    3 => 'French Hens',
    4 => 'Calling Birds',
    5 => 'Gold Rings',
    6 => 'Geese-a-Laying',
    7 => 'Swans-a-Swimming',
    8 => 'Maids-a-Milking',
    9 => 'Ladies Dancing',
    10 => 'Lords-a-Leaping',
    11 => 'Pipers Piping',
    12 => 'Drummers Drumming'
  }.freeze

  NUMBERS_TO_NAME = {
    1 => 'one',
    2 => 'two',
    3 => 'three',
    4 => 'four',
    5 => 'five',
    6 => 'six',
    7 => 'seven',
    8 => 'eight',
    9 => 'nine',
    10 => 'ten',
    11 => 'eleven',
    12 => 'twelve'
  }.freeze

  NUMBERS_TO_ORDINAL = {
    1 => 'first',
    2 => 'second',
    3 => 'third',
    4 => 'fourth',
    5 => 'fifth',
    6 => 'sixth',
    7 => 'seventh',
    8 => 'eighth',
    9 => 'ninth',
    10 => 'tenth',
    11 => 'eleventh',
    12 => 'twelfth'
  }.freeze

  def initialize
    @gifts = GIFTS
    @numbers_to_name = NUMBERS_TO_NAME
    @numbers_to_ordinal = NUMBERS_TO_ORDINAL
  end

  def self.song
    new.song
  end

  def song
    song = ''
    12.times do |index|
      day = index + 1
      subject = subject(day)
      song += "On the #{in_ordinal(day)} day of Christmas my true love gave to me: #{subject}\n"
      song += "\n" unless index == 11
    end
    song
  end

  def subject(day)
    case day
    when 1
      "a #{@gifts.fetch(day)} in a Pear Tree."
    when 2
      "#{in_words(day)} #{@gifts.fetch(day)}, and #{subject(day - 1)}"
    else
      "#{in_words(day)} #{@gifts.fetch(day)}, #{subject(day - 1)}"
    end
  end

  def in_words(int)
    @numbers_to_name.fetch(int)
  end

  def in_ordinal(int)
    @numbers_to_ordinal.fetch(int)
  end
end
