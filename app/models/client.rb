class Client < ApplicationRecord
    has_many :memberships
    has_many :gyms, through: :memberships

    validates :name, presence:true
    validates :age, presence:true 
end
