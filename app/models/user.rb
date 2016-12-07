class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :messages
  has_many :comments
  has_many :reviews
  has_many :assigned_users_tasks
  has_many :assigned_tasks, :through => :assigned_users_tasks, source: :task
  has_many :tasks
  has_many :task_notifications, foreign_key: :creator_id



  mount_uploader :photo, PhotoUploader



  ROLES = %i[работодатель работник].freeze

  def assign_task(task_id)
    task = Task.find(task_id)

    assigned_users_tasks.create(task: task)
    TaskNotification.create(task: task, assigned_user_id: id, creator_id: task.user_id)
  end

end
