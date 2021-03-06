class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.string :name
      t.string :quarter
      t.string :time
      t.integer :game_id
      t.string :description
      t.integer :violation_upvote, :default => 0
      t.integer :violation_downvote, :default => 0
      t.integer :player_id
      t.integer :ref_id
      t.integer :user_id
      t.timestamps
    end
  end
end
