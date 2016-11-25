class Task < ApplicationRecord
  has_many :comments
  has_many :statuses
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories
end
