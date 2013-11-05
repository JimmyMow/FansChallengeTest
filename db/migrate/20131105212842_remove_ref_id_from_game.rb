class RemoveRefIdFromGame < ActiveRecord::Migration
  def change
    remove_column :games, :ref_one_id
    remove_column :games, :ref_two_id
    remove_column :games, :ref_three_id
  end
end
