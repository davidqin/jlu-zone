alias wiki-open-current='gnome-open .'
alias oc='wiki-open-current'
alias wiki-open='gnome-open'
alias o='wiki-open'
alias wiki-git-diff='git diff > ~/.tmp/diff; wiki-open ~/.tmp/diff'

function wiki-cd {
  cd ~/Documents/wiki/
}

function wiki-server {
  cd ~/Documents/wiki/
  rails server
}

function wiki-tags {  
  ctags -R -f ~/Documents/wiki/.tags ~/Documents/wiki ~/.rvm/rubies/ruby-1.9.3-p0 ~/.rvm/gems/ruby-1.9.3-p0@wiki/gems ~/.rvm/gems/ruby-1.9.3-p0@wiki/bundler/gems 2> /tmp/log
  cp ~/Documents/wiki/.tags ~/Documents/wiki/tags
  ll ~/Documents/wiki/.tags -h
}

function wiki-git-pull {
  cd ~/Documents/wiki/
  git pull
  rake init
}

function wiki-git-add-commit {
  if [ -n "$1" ]; then
    MESSAGE=$1
  else
    MESSAGE="No message."
  fi  
  git add .
  git commit -am "$MESSAGE"
}

function wiki-git-add-commit-compress {
  wiki-git-add-commit "$1"
  wiki-git-compress "$1"
}

function wiki-git-add-commit-push {
  wiki-git-add-commit "$1"
  git push
}

function wiki-serial-1 {
  echo '----------------------------------------------------------------'
  echo 'wiki Serial 1'
  echo '----------------------------------------------------------------'

  wiki-git-add-commit-compress "$1"
  rake test
}

function wiki-serial-2 {
  echo '----------------------------------------------------------------'
  echo 'wiki Serial 2'
  echo '----------------------------------------------------------------'

  wiki-git-add-commit-compress "$1"
  rake db:init
  rake test
}
