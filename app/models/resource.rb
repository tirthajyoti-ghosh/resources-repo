class Resource < ApplicationRecord
	validates :link, presence: true
	validates :notes, presence: true, length: {minimum: 10, maximum: 140}


	belongs_to :user
	has_many :comments
	has_many :categorizations
	has_many :categories, through: :categorizations
	has_many :votes

	def category_list=(category_string)
    category_names = category_string.split(',').collect { |s| s.strip }.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
		self.categories = new_or_found_categories
	end
end
