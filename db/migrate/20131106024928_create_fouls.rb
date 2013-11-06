class CreateFouls < ActiveRecord::Migration
  def change
    create_table :fouls do |t|
      t.integer :game_id
      t.integer :ref_id
      t.integer :user_id
      t.integer :commit_player_id
      t.integer :fouled_player_id
      t.integer :foul_upvote, default: 0
      t.integer :foul_downvote, default: 0
      t.string :name
      t.string :quarter
      t.string :time
      t.string :description
      t.timestamps
    end
  end
end
