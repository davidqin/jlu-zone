class Ability
  include CanCan::Ability

  def initialize(user)
    case user.level
    when 0
      can    :read,              [Entry, Category, User, Version]
      can    :create,            [Entry, Version]
      can    :manage, :all
    when 1
      can    :read,              [Entry, Category, User, Version]
      can    :create,            [Entry, Version]
      can    :update,             Entry
    when 2
      can    :read,              [Entry, Category, User, Version]
      can    :create,            [Entry, Category, Version]
      can    :update,             Entry
    when 3
      can :manage, :all
    end
  end
end
