module EntryHelper
  def show_entry_functional_bar(entry)
    contents_tag :div, :class => "info page-header" do |contents|
      contents << show_entry_info(entry)
      contents << contents_tag(:div, :class => "pull-right") do |items|
        items << show_entry_tools_bar(entry)
      end
    end
  end

  def show_entry_info(entry)
    #gap = (Time.now - entry.updated_at)
    #content_tag(:abbr, "", options.merge(:title => time.iso8601))    
    content_tag(:h1, entry.name) + itext("entry.entry_info", :versions => entry.history_versions_size, :gap => entry.updated_at.strftime("%Y-%m-%d"))
  end

  def show_entry_contributors(entry)
    contributors = []
    entry.versions.each do |version|
      contributors << version.reify.last_editor if version.reify
    end
    contributors << entry.last_editor
    contributors.uniq!
    contents_tag(:div, :class => "contributors") do |contents|
      contents << itext("entry.contributor")
      contributors.each do |contributor|
        contents << tag(:img, :alt => '', :src => gravatar(contributor.email), :id => "portrait_top_bar")
        contents << content_tag(:a, contributor.nickname, :href => user_path(contributor))
      end
    end
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