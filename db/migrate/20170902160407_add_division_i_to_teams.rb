class AddDivisionIToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :division_i, :boolean
  end
end
