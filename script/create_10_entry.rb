$user = User.find_by_nickname("David")
categories = Category.all
categories.each do |category|
  for i in 1..10 do
    entry = category.entries.new
    entry.name   = "Entry #{i} for #{category.number}"
    entry.fonder = $user
    entry.save
    version = entry.versions.new
    version.editor  = $user
    version.content = "Version"
    version.save
  end
end
