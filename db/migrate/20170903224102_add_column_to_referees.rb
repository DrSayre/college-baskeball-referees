class AddColumnToReferees < ActiveRecord::Migration[5.1]
  def change
    add_column :referees, :number_of_games, :integer
  end
end
