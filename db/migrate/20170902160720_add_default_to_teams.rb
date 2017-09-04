class AddDefaultToTeams < ActiveRecord::Migration[5.1]
  def change
    change_column :teams, :division_i, :boolean, default: false
  end
end
