class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :resource_id }

  belongs_to :user
  belongs_to :resource, counter_cache: true
end
