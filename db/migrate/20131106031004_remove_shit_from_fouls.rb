class RemoveShitFromFouls < ActiveRecord::Migration
  def change
    remove_column :fouls, :text
  end
end
