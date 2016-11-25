class User < ApplicationRecord
  has_many :messages
  has_many :comments
  has_many :reviews
  has_and_belongs_to_many :tasks
end
