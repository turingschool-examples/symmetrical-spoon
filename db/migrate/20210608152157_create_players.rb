class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.name :string
      t.age :integer
      t.team :references

      t.timestamps
    end
  end
end
