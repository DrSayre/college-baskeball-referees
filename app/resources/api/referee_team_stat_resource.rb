class Api::RefereeTeamStatResource < JSONAPI::Resource
  attributes :total_fouls, :total_possessions, :fouls_per_possession, :referee_change, :games
  has_one :referee
  has_one :team

  filter :id
  filters :team_id, :referee_id
end
