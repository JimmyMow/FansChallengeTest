class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :text
      t.integer :violation_id
      t.integer :upvote, :default => 0
      t.integer :downvote, :default => 0
      t.integer :user_id
      t.integer :foul_id
      t.timestamps
    end
  end
end
