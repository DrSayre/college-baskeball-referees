class AddIndexToRefereeAssignments < ActiveRecord::Migration[5.1]
  def change
    add_index :referee_assignments, [:game_id, :referee_id], unique: true
  end
end
