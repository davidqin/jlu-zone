module CatelogHelper
  def entry_catalog_list_navigation(catalog)
    catalog_list = []
    catalog_list << entry_catalog_list_navigation_part_root_catalog
    catalog_list << entry_catalog_list_navigation_part_sub_catalogs(catalog) if catalog
    catalog_list.flatten!
    options = {}#can add current_class
    contents_tag(:li, options) do |li_contents|
      catalog_list.each do |catalog|
        is_last_catalog  = catalog == catalog_list.last
        li_contents << link_to(catalog[:name], catalog[:url])
        li_contents << breadcrumb_navigation_delimiter unless is_last_catalog
      end
    end
  end

  def entry_catalog_list_navigation_part_root_catalog
    navigation = {}
    navigation[:name] = itext('entry.root_catalog')
    navigation[:url]  = "/"
    navigation
  end

  def entry_catalog_list_navigation_part_sub_catalogs(catalog)
    navigation_list = []
    
    unless catalog
      return navigation_list
    end
    
    catalog_list = [catalog.ancestors.reverse, catalog]
    catalog_list.flatten!

    catalog_list.each do |catalog|
      navigation = {}
      navigation[:name] = catalog.name
      navigation[:url]  = category_entries_path(catalog.number)
      
      navigation_list << navigation
    end
    
    navigation_list
  end

  def breadcrumb_navigation_delimiter
    content_tag :span, "/", :class => "divider"
  end
end