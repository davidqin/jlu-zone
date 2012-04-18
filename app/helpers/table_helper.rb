# coding: utf-8
module TableHelper
  def generate_models_table(models, attributes, options = {})
    contents_tag :table, :class => "table table-striped" do |contents|
      contents << generate_models_table_header(attributes, options)
      contents << generate_models_table_body(models, attributes, options)
    end    
  end

  def generate_models_table_header(attributes, options)
    content_tag :thead do
      contents_tag :tr do |contents|
        attributes.each do |attribute|
          contents << content_tag(:th) do
            attribute.to_s
          end          
        end
        model_options_table_header(options, contents)
      end      
    end
  end

  def generate_models_table_body(models, attributes, options)
    contents_tag :tbody do |trs|
      models.each do |model|
        trs << contents_tag(:tr) do |contents|
          attributes.each do |attribute|
            contents << content_tag(:td, td_content(model, attribute))
          end
           model_options_table_body(model, options, contents)
        end              
      end
    end
  end

  def model_options_table_header(options, contents)
    contents << content_tag(:th, "admin?") if options[:admin_permission]
    contents << content_tag(:th, "wiki?") if options[:wiki_permission]
    contents << content_tag(:th, "community?") if options[:community_permission]
    contents << content_tag(:th, "photo?") if options[:photo_permission]

    contents << content_tag(:th, "top?") if options[:move_to_top]
    contents << content_tag(:th, "lock?") if options[:lock_or_unlock]
    contents << content_tag(:th, "edit") if options[:edit]
    contents << content_tag(:th, "destroy") if options[:destroy]
  end

  def model_options_table_body(model, options, contents)
    contents << content_tag(:th, set_user_permission(model, :admin_permission)) if options[:admin_permission]
    contents << content_tag(:th, set_user_permission(model, :wiki_permission)) if options[:wiki_permission]
    contents << content_tag(:th, set_user_permission(model, :community_permission)) if options[:community_permission]
    contents << content_tag(:th, set_user_permission(model, :photo_permission)) if options[:photo_permission]
    if options[:move_to_top]
      contents << content_tag(:td, move_and_cancel_to_top_button(model))
    end
    if options[:lock_or_unlock]
      contents << content_tag(:td, show_buttons_for_manager(model))
    end
    contents << content_tag(:td, link_to(content_tag(:i, "", :class => "icon-edit") + "修改", get_model_edit_path(model))) if options[:edit]
    contents << content_tag(:td, link_to(content_tag(:i, "", :class => "icon-trash") + "删除", model, :method => :delete, :confirm=>"are you srue?")) if options[:destroy]
  end

  def get_model_edit_path(model)
    if model.is_a? User
      return ""
    end
    send("edit_" + model.model_type.to_s + "_path", model)
  end

  def get_model_lock_path(model)
    send("lock_" + model.model_type.to_s + "_path", model)
  end

  def get_model_unlock_path(model)
    send("unlock_" + model.model_type.to_s + "_path", model)
  end

  def td_content(model, attribute)
    result = model.send(attribute)
    return link_to(result.nickname, result) if result.respond_to?(:nickname)
    return link_to(result, model)
  end

end