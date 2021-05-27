class Policy < ActiveRecord::Base
    belongs_to :topic
    belongs_to :user
    has_many :policy_positions
end
