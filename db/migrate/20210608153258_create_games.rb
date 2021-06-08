class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.references :competition, foreign_key: true
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
