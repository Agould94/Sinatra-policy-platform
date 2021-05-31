class AddOpposersToPolicyPositions < ActiveRecord::Migration[5.2]
  def change
    add_column :policy_positions, :opposers, :integer
  end
end
