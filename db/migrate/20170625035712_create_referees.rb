class CreateReferees < ActiveRecord::Migration[5.1]
  def change
    create_table :referees do |t|
      t.string :name

      t.timestamps
    end
  end
end
