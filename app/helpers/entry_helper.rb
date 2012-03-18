module EntryHelper
  def show_entry_share_buttons
   content_tag(:div , :class => "pull-right share_bar") do
      share_button
    end
  end

  def show_entry_info(entry)
    content_tag(:small, itext("entry.entry_info", :versions => entry.history_versions_size, :gap => entry.updated_at.strftime("%Y-%m-%d")), :id => :version_info)
  end

  def show_entry_tools_bar(entry)
    contents_tag(:div , :class => "pull-right tools_bar") do |contents|
      contents << content_tag(:a, :class => " btn btn-mini", :href => "//") do
        content_tag(:i, "", :class => "icon-list-alt") + itext("entry.list_versions")
      end
      contents << content_tag(:a, :class => " btn btn-mini", :href => edit_entry_path(entry)) do
        content_tag(:i, "", :class => "icon-edit") + itext("entry.edit")
      end
    end
  end

  def old_show_entry_info(entry)
    contents_tag :header, :class => "jumbotron subhead" do |contents|
      contents << contents_tag(:div, :class => "pull-right entry_bar") do |items|
        items << show_entry_tools_bar(entry) 
      end
      contents << content_tag(:small, itext("entry.entry_info", :versions => entry.history_versions_size, :gap => entry.updated_at.strftime("%Y-%m-%d")), :id => :version_info)
    end
  end

  def show_entry_contributors(entry)
    contributors = []
    entry.versions.each do |version|
      contributors << version.reify.last_editor if version.reify
    end
    contributors << entry.last_editor
    contributors.uniq!
    contents_tag(:div, :id => "contributors") do |contents|
      contents << itext("entry.contributor")
      contributors.each do |contributor|
        contents << tag(:img, :alt => '', :src => gravatar(contributor.email), :id => "portrait_top_bar")
        contents << content_tag(:a, contributor.nickname, :href => user_path(contributor))
      end
    end
  end


  def render_entry_categories
    categories = EntryCategory.all
    header =  content_tag(:header, itext("entry.category"))
    body = contents_tag :ul, :class => "nav nav-list" do |contents|
      categories.each do |category|
        contents << content_tag(:a, category.name, :href => category_entries_path(category), :class => "each_category")
      end
    end
    header + body
  end

  def show_entry_new_header
    content_tag :h3, itext("entry.new")
  end

  def show_entry_edit_header
    content_tag :h3, itext("entry.edit")
  end
end
