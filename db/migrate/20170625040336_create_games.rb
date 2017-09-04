class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.references :team, foreign_key: true
      t.integer :fouls
      t.integer :possession
      t.date :played_at
      t.references :opponent_team, foreign_key: { to_table: :team }

      t.timestamps
    end
  end
end
