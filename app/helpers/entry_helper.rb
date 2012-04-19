module EntryHelper
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

  def show_entry_tools_bar(entry)
    html_contents do |contents|
      contents << show_buttons_for_manager(entry)
      #contents << content_tag(:a, :class => " btn btn-mini", :href => "//") do
      #  content_tag(:i, "", :class => "icon-list-alt") + itext("entry.list_versions")
      #end
      contents << content_tag(:a, :class => " btn btn-mini", :href => edit_entry_path(entry)) do
        content_tag(:i, "", :class => "icon-edit") + itext("entry.edit")
      end
    end
  end

  def show_entry_version_info(entry)
    itext("entry.entry_info", :versions => entry.history_versions_size, :gap => entry.updated_at.strftime("%Y-%m-%d"))
  end
end
