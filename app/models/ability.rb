class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # Admins can do everything
    if user.admin? 
    	can :manage, :all
    # Everyone else can see everything, and manage everything they own
    else
	    can :manage, User, id: user.id
	    can :manage, [Post, Comment], user_id: user.id
	    can :read, :all
	  end
  end
end
