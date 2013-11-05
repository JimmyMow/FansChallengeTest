class RemoveGameIdFromRefs < ActiveRecord::Migration
  def change
    remove_column :refs, :game_id
  end
end
