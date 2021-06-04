class Topic < ActiveRecord::Base
    validates :name, length: {maximum: 20}
    has_many :policies
end
