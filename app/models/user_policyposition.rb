class UserPolicyposition < ActiveRecord::Base
    belongs_to :user
    belongs_to :policy_position
end
