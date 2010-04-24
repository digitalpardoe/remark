class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if user.username
      can :manage, :all
    end
  end
end