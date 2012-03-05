module StatisticsHelper
  def users_statistics
    itext("users_statistics", :users => User.all.size)
  end

  def entries_statistics
    itext("entries_statistics", :entries => Entry.all.size)
  end
end