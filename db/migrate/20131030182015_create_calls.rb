class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.string :description
      t.string :comment
      t.timestamps
    end
  end
end
