class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if user.role?(:admin)
      can :manage, :all
    elsif user.role?(:user)
      can :update, User do |record|
        record == user
      end
    else
      can :create, User
    end
  end
end
