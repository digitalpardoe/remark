class Ability
  include CanCan::Ability
  
  def initialize(user)
    false
  end
end