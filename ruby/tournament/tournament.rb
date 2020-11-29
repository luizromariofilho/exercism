# frozen_string_literal: true
=begin
Write your code for the 'Tournament' exercise in this file. Make the tests in
`tournament_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/tournament` directory.
=end

class Tournament
  attr_accessor :teams
  attr_reader :input

  def initialize(input)
    @input = input
    @teams = [
      { name: 'Allegoric Alaskans', matches: 0, points: 0, wins: 0, losses: 0, tieds: 0 },
      { name: 'Blithering Badgers', matches: 0, points: 0, wins: 0, losses: 0, tieds: 0 },
      { name: 'Devastating Donkeys', matches: 0, points: 0, wins: 0, losses: 0, tieds: 0 },
      { name: 'Courageous Californians', matches: 0, points: 0, wins: 0, losses: 0, tieds: 0 }
    ]
  end

  def self.tally(input)
    return Tournament.new(input.chomp!).headers if input.chomp.empty?

    Tournament.new(input.chomp!).tally
  end

  def tally
    input.lines.each do |line|
      name_team1, name_team2, result = line.chomp.split(';')
      result.chomp!

      team1 = find_team_from_name(name_team1)
      team2 = find_team_from_name(name_team2)
      case result
      when 'win'
        add_win(team1)
        add_loss(team2)
      when 'draw'
        add_draw(team1, team2)
      when 'loss'
        add_win(team2)
        add_loss(team1)
      end
    end
    outcome
  end

  def add_win(team)
    team[:matches] += 1
    team[:points] += 3
    team[:wins] += 1
    team
  end

  def add_draw(team1, team2)
    team1[:matches] += 1
    team1[:points] += 1
    team1[:tieds] += 1

    team2[:matches] += 1
    team2[:points] += 1
    team2[:tieds] += 1

    { team1: team1, team2: team2 }
  end

  def add_loss(team)
    team[:matches] += 1
    team[:losses] += 1
    team
  end

  def find_team_from_name(name)
    teams.find { |team| team[:name] == name }
  end

  def outcome
    sorting_teams
    table_teams
  end

  def sorting_teams
    teams.sort_by! { |team| [-team[:points], team[:name]] }
  end

  def table_teams
    headers + rows.join
  end

  def rows
    teams
      .select { |team| team[:matches].positive? }
      .map do |team|
        "#{team[:name].ljust(31)}|  #{team[:matches]} |  #{team[:wins]} |  #{team[:tieds]} |  #{team[:losses]} |  #{team[:points]}\n"
      end
  end

  def headers
    <<~TALLY
    Team                           | MP |  W |  D |  L |  P
    TALLY
  end
end
