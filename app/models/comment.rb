class Comment < ApplicationRecord
validates: :body, presence: true, length: {minimum: 10, maximum: 80}
  belongs_to :user
  belongs_to :resource
end
