class User < ActiveRecord::Base
    has_secure_password
    validates :username, uniqueness: :true
    validates :password, length: { in: 6..20 }
    validates :biography, length: {maximum: 500}
    has_many :policies
    has_many :user_policypositions
    has_many :policy_positions, through: :user_policypositions
end
