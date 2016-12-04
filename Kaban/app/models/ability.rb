class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    can :manage, :all if user.role == "admin"
    if user.role == "работодатель"
      can :read, User
      can [:edit,:update, :edit_profile,:get_profile], User do |user_some|
        user_some.id==user.id
      end
      can :read, Task
      can :create, Task
      can [:update,:edit,:destroy], Task do |task|
        task.user_id==user.id
      end
      can :read, Category
      can :read, Comment
      can :create, Comment
      can :update, Comment do |comment|
        comment.user_id==user.id
      end
      can :destroy, Comment do |comment|
        comment.user_id==user.id
      end
    elsif user.role == "работник"
      can [:edit,:update, :edit_profile, :get_profile], User do |user_some|
        user_some.id==user.id
      end
      can :read, Category
      can :read, User
      can :read, Task
      can :read, Comment
      can :create, Comment
      can :update, Comment do |comment|
        comment.user_id==user.id
      end
      can :destroy, Comment do |comment|
        comment.user_id==user.id
      end
      can [:assigned_tasks,:delete_user_assigned_task ], User
      can :assign_task, User
      end

    else
      can :read, Task
      can :read,  Category
    end
  end
