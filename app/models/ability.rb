class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if user.username
      can :manage, :all
    else
      can :create, User
      can :update, User do |record|
        record == user
      end
    end
  end
end
