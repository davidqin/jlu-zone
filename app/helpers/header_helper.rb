module HeaderHelper
  def index_header(options = {})
    base_text = "header.#{controller_model_type.pluralize}_#{params[:action]}"
    itext(base_text,options)
  end
end