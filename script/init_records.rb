user = User.find_by_nickname("david")
categories = EntryCategory.all
categories.each do |category|
  category.entries.destroy_all
  for i in 1..10 do
    entry = Entry.new
    entry.category_number = category.number
    entry.fonder = user
    entry.last_editor = user
    entry.name   = "Entry #{i} for #{category.number}"
    entry.content = "
# 如何快速正确的安装 Ruby, Rails 运行环境 
对于新入门的开发者，如何安装 Ruby, Ruby Gems 和 Rails 的运行环境可能会是个问题，本页主要介绍如何用一条靠谱的路子快速安装 Ruby 开发环境。
此安装方法同样适用于产品环境！

## 壹、操作系统的准备

### Mac 
请安装 [Xcode](http://developer.apple.com/xcode/) 开发工具，它将帮你安装好 Unix 环境需要的开发包.如果在App Store里安装,记得手动去运行!

### Ubuntu 
    $ sudo apt-get install wget vim build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libxml2-dev libxslt-dev autoconf automake libtool imagemagick libpcre3-dev

### Arch Linux
    $ sudo pacman -S git base-devel libxslt imagemagick

### Window

下载安装[Rails Installer](http://railsinstaller.org/)，跳过之后所有步骤。不推荐在Windows下做Rails开发。

## 贰、安装 rvm

    $ bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)

rvm的作用是可以在不同的ruby版本(1.8, 1.9, ree)之间快速切换

测试是否安装正确

```bash
$ rvm -v
rvm 1.9.2 by Wayne E. Seguin (wayneeseguin@gmail.com) [https://rvm.beginrescueend.com/]
```

## 叄、用 RVM 安装 Ruby 环境

```bash
$ rvm pkg install readline
$ rvm install 1.9.3 --with-readline-dir=$rvm_path/usr
$ rvmsudo install 1.9.3 --with-gcc=clang(Mac OSX下)
```

或者可以安装 1.8.7 版本，也可以是 1.9.3，只要将后面的版本号跟换一下就可以了
同样继续等待漫长的下载，编译过程，完成以后，Ruby, Ruby Gems 就安装好了。

## 肆、设置 Ruby 版本
RVM 装好以后，需要执行下面的命令将指定版本的 Ruby 设置为系统默认版本

```bash
$ rvm 1.9.3 --default
```

同样，也可以用其他版本号，前提是你有用 rvm install 安装过那个版本

这个时候你可以测试ruby是否安装正确

```bash
$ ruby -v
ruby 1.9.2p290 (2011-07-09 revision 32553) [x86_64-darwin10.8.0]

$ gem -v
1.8.6
```

## 伍、安装 Rails

```bash
$ gem install bundler rails
$ sudo gem install bundler rails(Mac OSX下)
```

然后测试安装是否正确

```bash
$ bundle -v
Bundler version 1.0.21

$ rails -v
Rails 3.1.1
```
    "
    entry.save
  end
end
tags = Tag.all
for i in 1..20 do
  user = User.find(rand(4) + 1)

  topic = user.topics.new
  topic.name = "Topic_#{i}"

  tags_num = rand(3) + 1
  topic_tag_array = []
  tags_num.times do
    topic_tag_array << tags[rand(9) + 1]
  end
  topic.tags = topic_tag_array.uniq

  topic.move_to_top = true if (rand(9) + 1 > 8)
  
  topic.content = "
响应 @zw963 主席的号召，本帖传教Vim，愿造福Vim新人

原是为Q群群友而作，现公之于众

完整配置下载地址：http://www.ruchee.com/download/Gvim_Ruby_2012-03-19.7z

本版本为Ruby专用，兼顾C/C++和其他语种，适用于Windows环境下的Gvim

[如想用于Linux环境，只需修改部分语句，请社区咨询]

主要特色：

使用Ruby专用的字体和着色模式
集成了snipMate插件，支持Tab键补全，对Ruby和erb模板文件支持良好
集成了ZenCoding插件，方便编写HTML和CSS
集成了Rails.vim，便于在Vim中进行RoR开发
支持单源文件一键编译和运行
支持括号自动匹配和补全
支持一键加载语法模板
其他常用按键请查看_vimrc最前面的注释说明
如果你是Vim已经入门的用户，使用方法自不待我多言

如果你是徘徊于Vim门外的爱好者，请按说明依次执行下述操作

访问http://www.vim.org/download.php#pc下载最新的 Gvim
安装Gvim到任意目录，这儿为方便讲解，我假定你安装到了D:\Apps\Gvim
将D:\Apps\Gvim\vim73目录加入环境变量 [不知何为环境变量者，请Google]
删除Gvim安装目录下的vimfiles目录
复制提供的vimfiles目录到D:\Apps\Gvim下，取代已删目录的位置
将提供的小工具软件全部复制到D:\Apps\Gvim\vim73目录下
复制提供的_vimrc到D:\Apps\Gvim进行替换
复制MONACO.TTF到C:\WINDOWS\Fonts目录下进行字体的安装
使用任意文本编辑器打开_vimrc，将名字、邮箱、网址等全部替换为你自己的信息，如遇路径不同也全部替换为你本机的实际路径
然后。。。然后就大功告成了，接下只需学习如何使用而已，使用说明全部集中在_vimrc文件的头部
教程资料文件夹提供有部分学习资料，可作参考

Gvim的完整配置版本请关注：http://www.oschina.net/code/snippet_103341_8984

Zen Coding使用说明：http://www.ruchee.com/code/linux/vim/zencoding.html
snipMate使用说明：请自行查看vimfiles/snippets目录下的ruby.snippets和eruby.snippets
Rails.vim的使用请自行Google [因为我本人几乎不用]
凡使用上有疑问，请社区咨询求解"
topic.save
end
