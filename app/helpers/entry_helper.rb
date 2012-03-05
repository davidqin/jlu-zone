module EntryHelper
  def show_entry_info(entry)
    gap = Time.now - entry.updated_at
    itext("entry.entry_info", :versions => entry.history_versions_size, :gap => gap)
  end
end