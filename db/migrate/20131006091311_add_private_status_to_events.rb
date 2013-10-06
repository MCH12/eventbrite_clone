class AddPrivateStatusToEvents < ActiveRecord::Migration
  def change
    add_column :events, :private_status, :boolean
  end
end
