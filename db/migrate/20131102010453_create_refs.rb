class CreateRefs < ActiveRecord::Migration
  def change
    create_table :refs do |t|
      t.string :number_name
      t.integer :game_id
      t.string :img

      t.timestamps
    end
  end
end
