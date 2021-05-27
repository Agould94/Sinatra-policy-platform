class AddPolicyIdToPolicyPositions < ActiveRecord::Migration[5.2]
  def change
    add_column :policy_positions, :policy_id, :integer
  end
end
