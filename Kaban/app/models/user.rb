class User < ApplicationRecord
  has_many :messages
  has_many :comments
  has_many :reviews
  has_many :task_users
  has_many :tasks, :through => :task_users


end
