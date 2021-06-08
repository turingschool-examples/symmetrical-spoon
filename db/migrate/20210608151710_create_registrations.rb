class CreateRegistrations < ActiveRecord::Migration[5.2]
  def change
    create_table :registrations do |t|
      t.references :teams
      t.references :competitions

      t.timestamps
    end
  end
end
