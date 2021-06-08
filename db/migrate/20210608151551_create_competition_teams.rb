class CreateCompetitionTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :competition_teams do |t|
      t.references :competitions, foreign_key: true
      t.references :teams, foreign_key: true

      t.timestamps
    end
  end
end
