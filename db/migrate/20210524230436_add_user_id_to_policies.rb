class AddUserIdToPolicies < ActiveRecord::Migration[5.2]
  def change
    add_column :policies, :user_id, :integer
  end
end
