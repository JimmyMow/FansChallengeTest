class DropTable < ActiveRecord::Migration
  def change
    drop_table :teamsgamestables
  end
end
