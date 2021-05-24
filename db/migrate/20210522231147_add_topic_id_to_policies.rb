class AddTopicIdToPolicies < ActiveRecord::Migration[5.2]
  def change
    add_column :policies, :topic_id, :integer
  end
end
