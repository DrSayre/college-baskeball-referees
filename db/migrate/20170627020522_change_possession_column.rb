class ChangePossessionColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :games, :possession, :possessions
    add_column :games, :points, :integer
    add_column :games, :opponent_points, :integer
    add_column :games, :overtimes, :integer
  end
end
