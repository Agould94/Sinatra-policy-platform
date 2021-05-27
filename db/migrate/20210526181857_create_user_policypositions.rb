class CreateUserPolicypositions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_policypositions do |t|
      t.integer :user_id
      t.integer :policy_position_id
      t.timestamps null: false
    end
  end
end
