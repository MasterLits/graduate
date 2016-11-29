class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :employer
      can :read, User
      can :edit, User do |user_some|
        user_some.id==user.id
      end
      can :read, Category
      can [:create, :read], Task
      can [:update, :destroy], Task  do |task|
        task.user_id == user.id
        end
    elsif user.has_role? :worker
      can :read, User
      can :read, Task
      can :read, Category
      can :create, Task
    elsif user.has_role? :admin
      can :manage, :all
    else
      can :read, :all
    end
  end
end
