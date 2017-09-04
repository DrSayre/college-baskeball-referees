class AddFieldsToTeam < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :total_possessions, :integer
    add_column :teams, :total_fouls, :integer
    add_column :teams, :fouls_per_possession, :numeric
  end
end
