class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :comments
  has_many :reviews
  has_many :assigned_users_tasks
  has_many :assigned_tasks, :through => :assigned_users_tasks, source: :task
  has_many :tasks
  validates :first_name, :last_name, :tel, :passport, presence: true
  validates :first_name, :last_name, length: { minimum: 2}
  validates :inn, presence: true, length: { minimum: 12}
  validates  :passport, presence: true, length: { minimum: 8, maximum: 10}
  validates :role,  presence: true
  mount_uploader :photo, PhotoUploader



  ROLES = %i[работодатель работник].freeze

  def assign_task(task_id)
    assigned_users_tasks.create(task_id: task_id)
  end



end
