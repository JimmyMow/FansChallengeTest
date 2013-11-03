class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :coach
      t.string :name
      t.string :img
      t.integer :game_id

      t.timestamps
    end
  end
end
