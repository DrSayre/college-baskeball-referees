class AddIndexToGames < ActiveRecord::Migration[5.1]
  def change
    add_index :games, [:played_at, :team_id, :opponent_team_id], unique: true
  end
end
