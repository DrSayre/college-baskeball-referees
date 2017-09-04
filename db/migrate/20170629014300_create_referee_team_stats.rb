class CreateRefereeTeamStats < ActiveRecord::Migration[5.0]
  def change
    create_view :referee_team_stats
  end
end
