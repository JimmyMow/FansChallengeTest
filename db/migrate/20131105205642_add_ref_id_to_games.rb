class AddRefIdToGames < ActiveRecord::Migration
  def change
    add_column :games, :ref_one_id, :integer
    add_column :games, :ref_two_id, :integer
    add_column :games, :ref_three_id, :integer
  end
end
