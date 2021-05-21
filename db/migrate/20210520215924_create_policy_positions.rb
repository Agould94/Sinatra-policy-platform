class CreatePolicyPositions < ActiveRecord::Migration[4.2]
  def change
    create_table :policy_positions do |t|
      t.string :author
      t.string :for_or_against
      t.string :case
      t.integer :adopters
      t.timestamps null: false
    end
  end
end
