class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if user.role?(:admin)
      can :manage, :all
    elsif user.role?(:user)
#      can :update, User do |record|
#        record == user
#      end
#      can [:read,:update,:destroy], Article do |record|
#        record.user == user
#      end
    else
#      can :create, User
      can :read, Article do |record|
        !record.draft
      end
      can :read, Page do |record|
        !record.draft
      end
    end
  end
end
