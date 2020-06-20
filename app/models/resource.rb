class Resource < ApplicationRecord
	validates :link, presence: true
	validates :notes, presence: true, length: {minimum: 10, maximum: 140}


	belongs_to :user
	has_many :comments
	has_many :categorizations
	has_many :categories, through: :categorizations
	has_many :votes
end
