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
  validates :first_name, :last_name, :tel, presence: true
  validates :first_name, :last_name, length: { minimum: 2}
  validates :tel, format: { with: /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/ }

  mount_uploader :photo, PhotoUploader



  ROLES = %i[работодатель работник].freeze

  def assign_task(task_id)
    assigned_users_tasks.create(task_id: task_id)
  end



end
