class ChangeTopicPoliciesToStrings < ActiveRecord::Migration[5.2]
  def change
    change_table :topics do |t|
      t.change :policies, :string
    end 
  end
end
