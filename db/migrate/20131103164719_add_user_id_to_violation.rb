class AddUserIdToViolation < ActiveRecord::Migration
  def change
    add_column :violations, :user_id, :integer
  end
end
