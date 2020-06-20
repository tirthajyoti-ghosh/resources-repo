class Resource < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :categorizations
    has_many :categories, through: :categorizations
    has_many :votes

end
