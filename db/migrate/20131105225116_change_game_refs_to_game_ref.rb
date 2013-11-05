class ChangeGameRefsToGameRef < ActiveRecord::Migration
  def change
    rename_table :game_refs, :game_ref
  end
end
