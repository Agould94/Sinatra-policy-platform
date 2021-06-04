class PolicyPosition < ActiveRecord::Base
    validates :case, length: { maximum: 1500 }
    has_many :user_policypositions
    has_many :users, through: :user_policypositions
    belongs_to :policy
end
