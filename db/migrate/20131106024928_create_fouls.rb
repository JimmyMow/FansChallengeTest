class CreateFouls < ActiveRecord::Migration
  def change
    create_table :fouls do |t|
      t.integer :game_id
      t.integer :ref_id
      t.integer :user_id
      t.integer :commit_player_id
      t.integer :fouled_player_id

      t.timestamps
    end
  end
end
