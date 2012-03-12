module EntryHelper
  def show_entry_functional_bar(entry)
    contents_tag :div, :class => "info" do |contents|
      contents << show_entry_info(entry)
      contents << show_entry_tools_bar(entry)
    end
  end

  def show_entry_info(entry)
    #gap = (Time.now - entry.updated_at)
    #content_tag(:abbr, "", options.merge(:title => time.iso8601))
    itext("entry.entry_info", :versions => entry.history_versions_size, :gap => entry.updated_at.strftime("%Y-%m-%d"))
  end

  def show_entry_tools_bar(entry)
    contents = []
    contents << content_tag(:a, :class => " btn btn-mini", :href => "//") do
      content_tag(:i, "", :class => "icon-list-alt") + itext("entry.list_versions")
    end
    contents << content_tag(:a, :class => " btn btn-mini", :href => edit_entry_path(entry)) do
      content_tag(:i, "", :class => "icon-edit") + itext("entry.edit")
    end
    contents
  end

  def render_entry_categories
    categories = EntryCategory.all
    
    body = contents_tag :ul, :class => "nav nav-list" do |contents|
        contents << content_tag(:h2, itext("entry.category"))
      categories.each do |category|
        contents << content_tag(:li,content_tag(:a, category.name, :href => category_entries_path(category)))
      end
    end
  end
end