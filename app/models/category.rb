class Category < ApplicationRecord
	has_many :categorizations
	has_many :resources, through: :categorizations
end
