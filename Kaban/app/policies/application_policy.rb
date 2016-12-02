class ApplicationPolicy
  attr_reader :user, :task

  def initialize(user, task)
    @user = user
    @task = task
  end

  def update?
    user.employer? or not task.published?
  end
end


