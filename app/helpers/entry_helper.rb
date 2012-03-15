module EntryHelper
  def show_entry_functional_bar(entry)
    share_bar = content_tag(:div , :class => "pull-right share_bar") do
      share_button
    end
    content = contents_tag :div, :class => "info" do |contents|
      contents << show_entry_info(entry)
    end
    share_bar + content
  end

  def show_entry_info(entry)
    contents_tag :header, :class => "jumbotron subhead" do |contents|
      contents << contents_tag(:h1) do |item|
        item << entry.name
      end
      contents << contents_tag(:div, :class => "pull-right entry_bar") do |items|
        items << show_entry_tools_bar(entry) 
      end
      contents << content_tag(:small, itext("entry.entry_info", :versions => entry.history_versions_size, :gap => entry.updated_at.strftime("%Y-%m-%d")), :id => :version_info)
    end
  end

  def show_entry(entry)
    content_tag :div, :id => :show_entry do
      markdown(entry.content)
    end
  end

  def show_entry_inner_catalog
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
    html_contents do |contents|
      contents << content_tag(:a, :class => " btn btn-mini", :href => "//") do
        content_tag(:i, "", :class => "icon-list-alt") + itext("entry.list_versions")
      end
      contents << content_tag(:a, :class => " btn btn-mini", :href => edit_entry_path(entry)) do
        content_tag(:i, "", :class => "icon-edit") + itext("entry.edit")
      end
    end
  end

  def render_entry_categories
    categories = EntryCategory.all
    
    body = contents_tag :ul, :class => "nav nav-list" do |contents|
      contents << content_tag(:h2, itext("entry.category"))
      categories.each do |category|
        contents << content_tag(:a, category.name, :href => category_entries_path(category), :class => "each_category")
      end
    end
  end

  def show_entry_new_header
    content_tag :h3, itext("entry.new")
  end

  def show_entry_edit_header
    content_tag :h3, itext("entry.edit")
  end
end
