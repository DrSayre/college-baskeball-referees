class AddColumnsToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :number_of_games, :integer
    add_column :teams, :wins, :integer
    add_column :teams, :losses, :integer
    add_column :teams, :winning_percentage, :numeric
  end
end
