class AddStatusToReactions < ActiveRecord::Migration[6.1]
  def change
    add_column :reactions, :status, :integer, default: 0

  end
end
