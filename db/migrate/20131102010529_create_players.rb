class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :number
      t.integer :team_id
      t.string :img
      t.timestamps
    end
  end
end
