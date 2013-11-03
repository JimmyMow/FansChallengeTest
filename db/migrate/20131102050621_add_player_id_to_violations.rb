class AddPlayerIdToViolations < ActiveRecord::Migration
  def change
    add_column :violations, :player_id, :integer
  end
end
