class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :nick_name
      t.string :home_town
      t.timestamps
    end
  end
end
