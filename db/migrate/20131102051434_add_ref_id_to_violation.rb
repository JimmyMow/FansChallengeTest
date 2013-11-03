class AddRefIdToViolation < ActiveRecord::Migration
  def change
    add_column :violations, :ref_id, :integer
  end
end
