class Ability
  include CanCan::Ability

  def initialize(user)

    if user.blank?
      cannot :manage, :all
      can :read, Entry
      can :read, User
    else
      case user.level
      when 0,1,2
        can    :read,              [Entry, Category, User, Version]
        can    :update,             Entry
        can    :create,            [Entry, Version]
      when 3
        can :manage, :all
      end
    end
  end
end

