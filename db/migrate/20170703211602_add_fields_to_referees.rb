class AddFieldsToReferees < ActiveRecord::Migration[5.1]
  def change
    add_column :referees, :total_possessions, :integer
    add_column :referees, :total_fouls, :integer
    add_column :referees, :fouls_per_possession, :numeric
    add_column :referees, :change, :numeric
  end
end
