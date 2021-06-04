class Policy < ActiveRecord::Base
    validates :title, length:{maximum: 90}
    validates :body, length:{maximum:2000}
    belongs_to :topic
    belongs_to :user
    has_many :policy_positions
end
