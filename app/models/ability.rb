class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new
    
    if user.role?(:admin)
      can :manage, :all
    else
      can :read, Article do |record|
        !record.draft && record.published_at <= Time.now.utc
      end
      can :read, Page do |record|
        !record.draft && record.published_at <= Time.now.utc
      end
    end
  end
end
