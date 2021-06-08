class CreateHometowns < ActiveRecord::Migration[5.2]
  def change
    create_table :hometowns do |t|
      t.string :hometown
      t.string :nickname

      t.timestamps
    end
  end
end
