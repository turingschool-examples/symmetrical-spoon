class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :players, :teams_id, :team_id
  end
end
