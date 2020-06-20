class Category < ApplicationRecord
	validates :name, length: {minimum: 2, maximum:20}
	has_many :categorizations
	has_many :resources, through: :categorizations
end
