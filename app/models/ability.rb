class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :manage, User, id: user.id
    can [:update, :destroy, :create], [Post, Comment], user_id: user.id
    can :read, [Post, Comment]
  end
end
