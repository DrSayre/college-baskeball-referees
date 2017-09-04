class Api::GameResource < JSONAPI::Resource
  attributes :fouls, :possessions, :played_at, :points, :opponent_points, :overtimes
  has_one :team
  has_one :opponent_team
  has_many :referees

  filter :id
  filters :team_id, :referee_id
end
