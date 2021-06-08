class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.belongs_to :competition, index: true, foreign_key: true
      t.belongs_to :hometown, index: true, foreign_key: true
    end
  end
end
