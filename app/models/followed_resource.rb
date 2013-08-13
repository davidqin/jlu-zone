class FollowedResource < ActiveRecord::Base
  belongs_to :user
  belongs_to :followed_resource, :polymorphic => true

  def self.create_followed_resource(resource_model, user)
    if check_model_is_followed(user, resource_model)
      return true
    end

    followed_resource = FollowedResource.new
    followed_resource.user = user
    followed_resource.followed_resource = resource_model

    followed_resource.save
  end

  def self.destroy_followed_resource(resource_model, user)
    followed_resource.delete
    not check_model_is_followed(user, resource_model)
  end

  def self.check_model_is_followed(user, model)
    user.followed_resources.find_by_followed_resource_id_and_followed_resource_type(model.id, model.model_type.to_s.classify).present?
  end
end