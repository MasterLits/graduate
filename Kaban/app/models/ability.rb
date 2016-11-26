class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :employer
      alias_action :create, :read, :update, :destroy, :to => :crud
      can :crud, Task
    elsif user.has_role? :worker
      can :read, Task
    else
      can :read, :all
    end
  end
end
