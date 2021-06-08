class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.hometown :string
      t.nickname :string

      t.timestamps
    end
  end
end
