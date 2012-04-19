
# RailsAdmin config file. Generated on April 16, 2012 17:20
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  # If your default_local is different from :en, uncomment the following 2 lines and set your default locale here:
  # require 'i18n'
  # I18n.default_locale = :de

  config.current_user_method { current_user } # auto-generated

  # If you want to track changes on your models:
  # config.audit_with :history, User

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, User

  # Set the admin name here (optional second array element will appear in a beautiful RailsAdmin red ©)
  config.main_app_name = ['Wiki', 'Admin']
  # or for a dynamic name:
  # config.main_app_name = Proc.new { |controller| [Rails.application.engine_name.titleize, controller.params['action'].titleize] }


  #  ==> Global show view settings
  # Display empty fields in show views
  # config.compact_show_view = false

  #  ==> Global list view settings
  # Number of default rows per-page:
  # config.default_items_per_page = 20

  #  ==> Included models
  # Add all excluded models here:
  # config.excluded_models = [Album, Entry, FollowedResource, LikedResource, Photo, Reply, Tag, TagCategory, Topic, TopicReadHistory, User, UserNotice]

  # Add models here if you want to go 'whitelist mode':
  # config.included_models = [Album, Entry, FollowedResource, LikedResource, Photo, Reply, Tag, TagCategory, Topic, TopicReadHistory, User, UserNotice]

  # Application wide tried label methods for models' instances
  # config.label_methods << :description # Default is [:name, :title]

  #  ==> Global models configuration
  # config.models do
  #   # Configuration here will affect all included models in all scopes, handle with care!
  #
  #   list do
  #     # Configuration here will affect all included models in list sections (same for show, export, edit, update, create)
  #
  #     fields_of_type :date do
  #       # Configuration here will affect all date fields, in the list section, for all included models. See README for a comprehensive type list.
  #     end
  #   end
  # end
  #
  #  ==> Model specific configuration
  # Keep in mind that *all* configuration blocks are optional.
  # RailsAdmin will try his best to provide the best defaults for each section, for each field.
  # Try to override as few things as possible, in the most generic way. Try to avoid setting labels for models and attributes, use ActiveRecord I18n API instead.
  # Less code is better code!
  # config.model MyModel do
  #   # Cross-section field configuration
  #   object_label_method :name     # Name of the method called for pretty printing an *instance* of ModelName
  #   label 'My model'              # Name of ModelName (smartly defaults to ActiveRecord's I18n API)
  #   label_plural 'My models'      # Same, plural
  #   weight -1                     # Navigation priority. Bigger is higher.
  #   parent OtherModel             # Set parent model for navigation. MyModel will be nested below. OtherModel will be on first position of the dropdown
  #   navigation_label              # Sets dropdown entry's name in navigation. Only for parents!
  #   # Section specific configuration:
  #   list do
  #     filters [:id, :name]  # Array of field names which filters should be shown by default in the table header
  #     items_per_page 100    # Override default_items_per_page
  #     sort_by :id           # Sort column (default is primary key)
  #     sort_reverse true     # Sort direction (default is true for primary key, last created first)
  #     # Here goes the fields configuration for the list view
  #   end
  # end

  # Your model's configuration, to help you get started:

  # All fields marked as 'hidden' won't be shown anywhere in the rails_admin unless you mark them as visible. (visible(true))

  # config.model Album do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :photos, :has_many_association 
  #     configure :followed_resources, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :description, :string 
  #     configure :user_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Entry do
  #   # Found associations:
  #     configure :fonder, :belongs_to_association 
  #     configure :last_editor, :belongs_to_association 
  #     configure :versions, :has_many_association         # Hidden 
  #     configure :replies, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :fonder_id, :integer         # Hidden 
  #     configure :last_editor_id, :integer         # Hidden 
  #     configure :content, :text 
  #     configure :catalog, :boolean 
  #     configure :lock, :boolean 
  #     configure :number, :string 
  #     configure :replies_num, :integer 
  #     configure :appreciation, :integer 
  #     configure :objection, :integer 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model FollowedResource do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :followed_resource, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :followed_resource_id, :integer         # Hidden 
  #     configure :followed_resource_type, :string         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model LikedResource do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :liked_resource, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :liked_resource_id, :integer         # Hidden 
  #     configure :liked_resource_type, :string         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Photo do
  #   # Found associations:
  #     configure :album, :belongs_to_association 
  #     configure :fonder, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :img_url, :carrierwave 
  #     configure :album_id, :integer         # Hidden 
  #     configure :description, :text 
  #     configure :lock, :boolean 
  #     configure :fonder_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Reply do
  #   # Found associations:
  #     configure :resource, :polymorphic_association 
  #     configure :fonder, :belongs_to_association 
  #     configure :notices_to_users, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :resource_id, :integer         # Hidden 
  #     configure :resource_type, :string         # Hidden 
  #     configure :fonder_id, :integer         # Hidden 
  #     configure :content, :text 
  #     configure :floor_num, :integer 
  #     configure :number, :string 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Tag do
  #   # Found associations:
  #     configure :tag_category, :belongs_to_association 
  #     configure :topics, :has_and_belongs_to_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :number, :string 
  #     configure :tag_category_id, :integer         # Hidden 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model TagCategory do
  #   # Found associations:
  #     configure :tags, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model Topic do
  #   # Found associations:
  #     configure :fonder, :belongs_to_association 
  #     configure :replies, :has_many_association 
  #     configure :user_reply_notices, :has_many_association 
  #     configure :topic_read_histories, :has_many_association 
  #     configure :followed_resources, :has_many_association 
  #     configure :liked_resources, :has_many_association 
  #     configure :tags, :has_and_belongs_to_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :name, :string 
  #     configure :fonder_id, :integer         # Hidden 
  #     configure :content, :text 
  #     configure :number, :string 
  #     configure :replies_num, :integer 
  #     configure :read_times, :integer 
  #     configure :move_to_top, :boolean 
  #     configure :lock, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model TopicReadHistory do
  #   # Found associations:
  #     configure :user, :belongs_to_association 
  #     configure :topic, :belongs_to_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :user_id, :integer         # Hidden 
  #     configure :topic_id, :integer         # Hidden 
  #     configure :last_read_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model User do
  #   # Found associations:
  #     configure :entries, :has_many_association 
  #     configure :photos, :has_many_association 
  #     configure :topics, :has_many_association 
  #     configure :replies, :has_many_association 
  #     configure :notices, :has_many_association 
  #     configure :topic_read_histories, :has_many_association 
  #     configure :liked_resources, :has_many_association 
  #     configure :liked_topics, :has_many_association 
  #     configure :liked_photos, :has_many_association 
  #     configure :followed_resources, :has_many_association 
  #     configure :followed_topics, :has_many_association 
  #     configure :followed_photos, :has_many_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :email, :string 
  #     configure :password, :password         # Hidden 
  #     configure :password_confirmation, :password         # Hidden 
  #     configure :reset_password_token, :string         # Hidden 
  #     configure :number, :string 
  #     configure :reset_password_sent_at, :datetime 
  #     configure :remember_created_at, :datetime 
  #     configure :sign_in_count, :integer 
  #     configure :current_sign_in_at, :datetime 
  #     configure :last_sign_in_at, :datetime 
  #     configure :current_sign_in_ip, :string 
  #     configure :last_sign_in_ip, :string 
  #     configure :score, :integer 
  #     configure :gender, :integer 
  #     configure :nickname, :string 
  #     configure :campus, :string 
  #     configure :department, :string 
  #     configure :major, :string 
  #     configure :grade, :string 
  #     configure :renren, :string 
  #     configure :qq, :string 
  #     configure :idiograph, :string 
  #     configure :full_info, :boolean 
  #     configure :today_topic_count, :integer 
  #     configure :today_last_topic_time, :datetime 
  #     configure :today_reply_count, :integer 
  #     configure :today_last_reply_time, :datetime 
  #     configure :today_photo_count, :integer 
  #     configure :today_last_photo_time, :datetime 
  #     configure :admin_permission, :boolean 
  #     configure :wiki_permission, :boolean 
  #     configure :community_permission, :boolean 
  #     configure :photo_permission, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
  # config.model UserNotice do
  #   # Found associations:
  #     configure :to_user, :belongs_to_association 
  #     configure :from_user, :belongs_to_association 
  #     configure :notice_resource, :polymorphic_association   #   # Found columns:
  #     configure :id, :integer 
  #     configure :to_user_id, :integer         # Hidden 
  #     configure :from_user_id, :integer         # Hidden 
  #     configure :notice_resource_id, :integer         # Hidden 
  #     configure :notice_resource_type, :string         # Hidden 
  #     configure :read, :boolean 
  #     configure :created_at, :datetime 
  #     configure :updated_at, :datetime   #   # Sections:
  #   list do; end
  #   export do; end
  #   show do; end
  #   edit do; end
  #   create do; end
  #   update do; end
  # end
end
