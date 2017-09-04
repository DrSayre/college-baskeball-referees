class RenameChangeColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :referees, :change, :fouls_change
  end
end
