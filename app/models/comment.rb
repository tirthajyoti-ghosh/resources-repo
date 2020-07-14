class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :resource

  validates :body, presence: true
end
