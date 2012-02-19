class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new # 防止用户未登录

    can :manage, :all # 可以管理所有资源

  end
end
