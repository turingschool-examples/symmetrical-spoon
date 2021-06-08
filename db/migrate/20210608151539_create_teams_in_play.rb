class CreateTeamsInPlay < ActiveRecord::Migration[5.2]
  def change
    create_table :teams_in_plays do |t|
      t.references :team
      t.references :competition
    end
  end
end
