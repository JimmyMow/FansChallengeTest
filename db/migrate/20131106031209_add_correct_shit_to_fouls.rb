class AddCorrectShitToFouls < ActiveRecord::Migration
  def change
    add_column :fouls, :name, :string
    add_column :fouls, :quarter, :string
    add_column :fouls, :time, :string
    add_column :fouls, :description, :string
  end
end
