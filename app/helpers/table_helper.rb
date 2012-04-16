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
    contents << content_tag(:th, "edit") if options[:edit]
    contents << content_tag(:th, "destroy") if options[:destroy]
    contents << content_tag(:th, "lock?") if options[:lock_or_unlock]
  end

  def model_options_table_body(model, options, contents)
    if options[:lock_or_unlock]
      if model.lock
        contents << content_tag(:td, link_to(content_tag(:i, "", :class => "icon-edit") + "解除锁定", get_model_unlock_path(model), :method => :post))
      else
        contents << content_tag(:td, link_to(content_tag(:i, "", :class => "icon-edit") + "锁定", get_model_lock_path(model), :method => :post))
      end
    end
    contents << content_tag(:td, link_to(content_tag(:i, "", :class => "icon-edit") + "修改", get_model_edit_path(model))) if options[:edit]
    contents << content_tag(:td, link_to(content_tag(:i, "", :class => "icon-trash") + "删除", model, :method => :delete, :confirm=>"are you srue?")) if options[:destroy]
  end

  def get_model_edit_path(model)
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