class Api::RefereeResource < JSONAPI::Resource
  attributes :name, :total_possessions, :total_fouls, :fouls_per_possession, :fouls_change, :number_of_games
  has_many :games
  has_many :referee_team_stats
end
