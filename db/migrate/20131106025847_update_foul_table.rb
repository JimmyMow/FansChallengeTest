class UpdateFoulTable < ActiveRecord::Migration
  def change
    add_column :fouls, :text, :text
    add_column :fouls, :foul_upvote, :integer, :default => 0
    add_column :fouls, :foul_downvote, :integer, :default => 0
  end
end
