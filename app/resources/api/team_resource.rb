class Api::TeamResource < JSONAPI::Resource
  attributes :name, :total_possessions, :total_fouls, :fouls_per_possession, :wins, :losses, :number_of_games, :winning_percentage, :division_i
  has_many :games
  has_many :referees
  has_many :referee_team_stats

  filter :id
  filters :division_i
end
