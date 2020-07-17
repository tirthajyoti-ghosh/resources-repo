class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :resource, counter_cache: true
  
  validates :user_id, uniqueness: { scope: :resource_id }
end
