class Category < ApplicationRecord
	validates :name, length: {minimum: 2, maximum:20}
	has_many :categorizations, dependent: :destroy
	has_many :resources, through: :categorizations

  def to_s
    name
  end
end
