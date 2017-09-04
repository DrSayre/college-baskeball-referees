class AddColumnDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :teams, :total_possessions, 0
    change_column_default :teams, :total_fouls, 0
    change_column_default :teams, :fouls_per_possession, 0
  end
end
