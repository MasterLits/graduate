class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :employer
      can :manage, Task
    elsif user.has_role? :worker
      can :read, Task
    else
      can :read, :all
    end
  end
end
