class User < ActiveRecord::Base
    has_secure_password
    validates :username, uniqueness: :true
    has_many :policies
    has_many :user_policypositions
    has_many :policy_positions, through: :user_policypositions
end
