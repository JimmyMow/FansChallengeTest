class DropGamerefs < ActiveRecord::Migration
  def change
    drop_table :game_ref
  end
end
