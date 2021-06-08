class CreateBrackets < ActiveRecord::Migration[5.2]
  def change
    create_table :brackets do |t|
      t.references :competition, foreign_key: true
      t.references :team, foreign_key: true
    end
  end
end
