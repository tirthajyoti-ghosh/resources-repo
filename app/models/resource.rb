class Resource < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :categorizations, dependent: :destroy
	has_many :categories, through: :categorizations
	has_many :votes, dependent: :destroy

	validates :title, presence: true
	validates :link, presence: true
	validates :notes, presence: true, length: {minimum: 10, maximum: 140}

	default_scope -> { order(created_at: :desc) }

	def category_list=(category_string)
    category_names = category_string.split(',').collect { |s| s.strip }.uniq
    new_or_found_categories = category_names.collect { |name| Category.find_or_create_by(name: name) }
		self.categories = new_or_found_categories
	end

	def category_list
		categories.join(' ')
	end	

  def self.already_voted?(resource, user_id)
    Vote.exists?(user_id: user_id, resource_id: resource.id)
  end
end
