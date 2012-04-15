class LikedResource < ActiveRecord::Base
  belongs_to :user
  belongs_to :liked_resource, :polymorphic => true
  def self.create_liked_resource(resource_model, user)
    unless resource_model
      return false
    end

    if check_model_is_liked(user, resource_model)
      return true
    end
    
    liked_resource                   = LikedResource.new
    liked_resource.user              = user
    liked_resource.liked_resource = resource_model

    unless liked_resource.save
      return false
    end

    unless check_model_is_liked(user, resource_model)
      return false
    end
    true    
  end

  def self.destroy_liked_resource(resource_model, user)
    return false unless resource_model

    liked_resource = check_model_is_liked(user, resource_model)
    unless liked_resource
      return true
    else
      liked_resource.delete
      return !check_model_is_liked(user, resource_model)
    end
  end

  def self.check_model_is_liked(user, model)
    user.liked_resources.find_by_liked_resource_id_and_liked_resource_type(model.id, model.model_type.to_s.classify)
  end
end