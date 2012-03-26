class Ability
  include CanCan::Ability

  def initialize(user)

    if user.blank?
      cannot :manage, :all
      can :read, Entry
      can :read, Topic
      can :read, User
    else
      case user.level
      when 0,1,2
        can :read,   [Entry, EntryCategory, User, Version, Topic]

        can :create, [Entry, Version, Reply, Topic]

        can :update,  Entry

        can :update,  Reply do |reply|
          reply.user_id == user.id
        end

        can :update,  Topic do |topic|
          topic.fonder_id == user.id
        end
      when 3
        can :manage, :all
      end
    end
  end
end

