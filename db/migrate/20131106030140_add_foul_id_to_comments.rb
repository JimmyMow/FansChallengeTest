class AddFoulIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :foul_id, :integer
  end
end
