module CatalogHelper
  def show_catalog
    case catalog_type
    when :entry_category
      entry_catalog_list_navigation current_category
    else
      "sdf"
    end
  end
end