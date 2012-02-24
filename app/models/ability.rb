class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all
    #cannot :read, User
  end
end
