class CreateCompetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :competitions do |t|
      t.name :string
      t.location :string
      t.sport :string

      t.timestamps
    end
  end
end
