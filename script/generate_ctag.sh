ctags -R -f ~/Documents/wiki/.tags ~/Documents/wiki ~/.rvm/rubies/ruby-1.9.3-p0 ~/.rvm/gems/ruby-1.9.3-p0@wiki/gems ~/.rvm/gems/ruby-1.9.3-p0@wiki/bundler/gems 2> /tmp/log
cp ~/Documents/wiki/.tags ~/Documents/wiki/tags
ls -l ~/Documents/wiki/.tags -h
