class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length:{minimum: 5, maximum: 10}

  has_many :resources
  has_many :comments
  has_many :votes
  has_many :saved_resources, through: :savings, source: :resource
end
