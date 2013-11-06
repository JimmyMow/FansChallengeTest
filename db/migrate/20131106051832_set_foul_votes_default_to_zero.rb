class SetFoulVotesDefaultToZero < ActiveRecord::Migration
  def change
    change_column :fouls, :foul_upvote, :integer, :default => 0
    change_column :fouls, :foul_downvote, :integer, :default => 0

  end
end
