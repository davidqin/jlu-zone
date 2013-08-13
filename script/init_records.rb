user = User.find_by_nickname("david")
# for i in 1..10 do
#   entry = Entry.new
#   entry.fonder = user
#   entry.last_editor = user
#   entry.name   = "Entry #{i}"
#   entry.content = "
# # 如何快速正确的安装 Ruby, Rails 运行环境
# 对于新入门的开发者，如何安装 Ruby, Ruby Gems 和 Rails 的运行环境可能会是个问题，本页主要介绍如何用一条靠谱的路子快速安装 Ruby 开发环境。
# 此安装方法同样适用于产品环境！

# ## 壹、操作系统的准备

# ### Mac
# 请安装 [Xcode](http://developer.apple.com/xcode/) 开发工具，它将帮你安装好 Unix 环境需要的开发包.如果在App Store里安装,记得手动去运行!

# ### Ubuntu
# $ sudo apt-get install wget vim build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev autoconf automake libtool imagemagick libpcre3-dev

# ### Arch Linux
# $ sudo pacman -S git base-devel libxslt imagemagick

# ### Window

# 下载安装[Rails Installer](http://railsinstaller.org/)，跳过之后所有步骤。不推荐在Windows下做Rails开发。

# ## 贰、安装 rvm

# $ bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

# rvm的作用是可以在不同的ruby版本(1.8, 1.9, ree)之间快速切换

# 测试是否安装正确

# ```bash
# $ rvm -v
# rvm 1.9.2 by Wayne E. Seguin (wayneeseguin@gmail.com) [https://rvm.beginrescueend.com/]
# ```

# ## 叄、用 RVM 安装 Ruby 环境

# ```bash
# $ rvm pkg install readline
# $ rvm install 1.9.3 --with-readline-dir=$rvm_path/usr
# $ rvmsudo install 1.9.3 --with-gcc=clang(Mac OSX下)
# ```

# 或者可以安装 1.8.7 版本，也可以是 1.9.3，只要将后面的版本号跟换一下就可以了
# 同样继续等待漫长的下载，编译过程，完成以后，Ruby, Ruby Gems 就安装好了。

# ## 肆、设置 Ruby 版本
# RVM 装好以后，需要执行下面的命令将指定版本的 Ruby 设置为系统默认版本


# ```bash
# $ rvm 1.9.3 --default
# ```

# 同样，也可以用其他版本号，前提是你有用 rvm install 安装过那个版本

# 这个时候你可以测试ruby是否安装正确

# ```bash
# $ ruby -v
# ruby 1.9.2p290 (2011-07-09 revision 32553) [x86_64-darwin10.8.0]

# $ gem -v
# 1.8.6
# ```

# ## 伍、安装 Rails

# ```bash
# $ gem install bundler rails
# $ sudo gem install bundler rails(Mac OSX下)
# ```

# 然后测试安装是否正确

# ```bash
# $ bundle -v
# Bundler version 1.0.21

# $ rails -v
# Rails 3.1.1
# ```
# "
#   entry.save
# end