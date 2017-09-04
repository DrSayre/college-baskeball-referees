class AddColumnDefaultToReferees < ActiveRecord::Migration[5.1]
  def change
    change_column_default :referees, :total_possessions, 0
    change_column_default :referees, :total_fouls, 0
    change_column_default :referees, :fouls_per_possession, 0
    change_column_default :referees, :fouls_change, 0
  end
end
