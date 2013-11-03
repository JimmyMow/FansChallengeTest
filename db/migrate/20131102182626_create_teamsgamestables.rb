class CreateTeamsgamestables < ActiveRecord::Migration
  def change
    create_table :teamsgamestables do |t|
      t.integer :team_id
      t.integer :game_id

      t.timestamps
    end
  end
end
