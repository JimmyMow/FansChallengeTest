class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :date_time
      t.integer :away_team_id
      t.integer :home_team_id
      t.timestamps
    end
  end
end
