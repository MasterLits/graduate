class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
      can :manage, :all if user.role == "admin"
      if user.role == "работодатель"
        can :read, User
        can :edit, User do |user_some|
        user_some.id==user.id
        end
       can :read, Category
       can [:create, :read], Task
    elsif user.role == "работник"
      can :read, Category
      can :read, User
      can :create, Task
  else
      can :read, :all
    end
  end
end


