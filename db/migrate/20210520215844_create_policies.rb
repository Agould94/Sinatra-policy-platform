class CreatePolicies < ActiveRecord::Migration[4.2]
  def change
    create_table :policies do |t|
      t.string :title
      t.string :body
      t.string :author
      t.integer :adopters

      t.timestamps null: false
    end
  end
end
