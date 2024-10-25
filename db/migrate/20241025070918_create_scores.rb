class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.references :game, null: false, foreign_key: true
      t.string :player
      t.integer :points

      t.timestamps
    end
  end
end
