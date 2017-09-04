class CreateRefereeAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :referee_assignments do |t|
      t.references :referee, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
