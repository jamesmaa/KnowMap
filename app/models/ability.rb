class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    user ||= User.new # guest user (not logged in)
    can [:new, :create], User # sign up
    can :read, [Graph, Node]  # view Graphs and Nodes
    can :assign_roles, User
    
    # a user can edit their own profile
    can [:show, :edit, :update, :profile], User, :id => user.id
    
    def student
      can [:new, :create, :edit, :update], [Graph, Node]
    end
    def instructor
      student
    end
    def admin
      instructor
    end
    def super
      admin
      can :manage, :all
    end
        
    
    if user.role? :student
      student
    end
    if user.role? :instructor
      instructor
    end
    if user.role? :admin
      admin
    end
    if user.role? :super
      super
    end
  end
end