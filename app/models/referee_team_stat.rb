class RefereeTeamStat < ApplicationRecord
  self.table_name =  'referee_team_stats'
  self.primary_key =  'id'
  belongs_to :referee
  belongs_to :team
end
