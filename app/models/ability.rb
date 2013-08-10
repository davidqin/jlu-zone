class Ability
  include CanCan::Ability
  #alias_action :index, :show, :recent_photos, :to => :read
  def initialize user
    @user = user

    if user.blank?
      user_blank_permission
    else
      common_user_permission
    end

  end

  def user_blank_permission
    can [:read, :tag_index], Topic
  end

  def common_user_permission
    can [:read, :tag_index], Topic
    can :create, Topic
    can :update, Topic do |t|
      t.fonder_id == @user.id
    end
  end

  def foo user
    if user.blank?
      cannot :manage, :all
      read_unlock Entry
      read_unlock Topic
      can :tag_index, Topic
      can :read, User
      can :read, Photo
      can :recent_photos, Photo
    else

      if user.lock
        cannot :manage, :all
        return
      end

      can :tag_index, Topic

      cannot :manage, :all
      can :recent_photos, Photo

      if user.admin_permission
        can :manage, :all
      end

      read_unlock Entry
      read_unlock Topic
      read_unlock Photo

      can :read,   [User, Topic]

      can :create, [Entry, Reply, Topic, Photo]

      can :update,  Entry

      update_self user, Reply
      update_self user, Topic
      update_self user, Photo

      if user.community_permission

      end

      if user.wiki_permission

      end

      if user.photo_permission

      end
    end
  end

  private

  def read_unlock(klass)
    can :read, klass do |i|
      i.lock == false
    end

  end

  def update_self(user, klass)
    can :update,  klass do |i|
      i.fonder_id == user.id
    end
  end
end

