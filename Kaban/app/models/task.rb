class Task < ApplicationRecord
  has_many :comments
  has_many :statuses
  has_many :assigned_users_tasks
  has_many :assigned_users, :through => :assigned_users_tasks, source: :user
  belongs_to :user
  belongs_to :category
  validates :body, :cost, :location, :title, :category, presence: true

  def self.search(search)
    where("title LIKE ?", "%#{search}%")
  end

end
