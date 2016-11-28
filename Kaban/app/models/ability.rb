class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :employer
      can [:create, :read], Task
      can [:update, :destroy], Task  do |task|
        task.user_id == user.id
        end
    elsif user.has_role? :worker
      can :read, Task
    else
      can :read, :all
    end
  end
end
