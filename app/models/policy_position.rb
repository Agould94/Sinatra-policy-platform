class PolicyPosition < ActiveRecord::Base
    has_many :user_policypositions
    has_many :users, through: :user_policypositions
    belongs_to :policy
end
