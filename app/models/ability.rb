class Ability
  include CanCan::Ability

  def initialize(user)

    if user.blank?
      cannot :manage, :all
      can :read, Entry
      can :read, Topic
      can :read, User
      can :read, Photo
    else
      if user.admin_permission
        can :manage, :all
      end

      can :read,    Entry do |entry|
        entry.lock == false
      end

      can :read,   [EntryCategory, User, Version, Topic, Photo]

      can :create, [Entry, Version, Reply, Topic]

      can :update,  Entry

      can :update,  Reply do |reply|
        reply.user_id == user.id
      end

      can :update,  Topic do |topic|
        topic.fonder_id == user.id
      end

      if user.community_permission

      end

      if user.wiki_permission

      end

      if user.photo_permission

      end
    end
  end
end

