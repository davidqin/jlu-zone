# coding: utf-8

## Generate users with different level
david = User.create(
  nickname: 'david',
  password: '123456',
  #admin_permission: true,
  password_confirmation: '123456',
  email: 'davidqhr@gmail.com')

acool = User.create(
  nickname: 'Acool',
  password: '123456',
  #admin_permission: true,
  password_confirmation: '123456',
  email: 'dujiakun@gmail.com')

frank = User.create(
  nickname: 'frank',
  password: '123456',
  password_confirmation: '123456',
  email: 'frank@gmail.com')

kevin = User.create(
  nickname: 'kevin',
  password: '123456',
  password_confirmation: '123456',
  email: 'kevin@gmail.com')

lulu = User.create(
  nickname: 'lulu',
  password: '123456',
  password_confirmation: '123456',
  email: '129.911@gmail.com')

category_notice        = TagCategory.create(name: '活动')
category_campu         = TagCategory.create(name: '校区')
category_entertainment = TagCategory.create(name: '娱乐')
category_manage        = TagCategory.create(name: '站务')

Tag.create(name: '文体活动', number: "c-s-sports",    tag_category: category_notice) #Hard Tag
Tag.create(name: '电竞比赛', number: "E-sports",      tag_category: category_notice) #Hard Tag
Tag.create(name: '活动通知', number: "sports-notice", tag_category: category_notice) #Hard Tag

Tag.create(name: '前卫校区', number: "qianwei", tag_category: category_campu)
Tag.create(name: '南岭校区', number: "nanling", tag_category: category_campu)
Tag.create(name: '新民校区', number: "xinmin", tag_category: category_campu)
Tag.create(name: '朝阳校区', number: "chaoyang", tag_category: category_campu)
Tag.create(name: '南湖校区', number: "nanhu", tag_category: category_campu)
Tag.create(name: '和平校区', number: "heping", tag_category: category_campu)

Tag.create(name: '打游戏', number: "E-games", tag_category: category_entertainment)
Tag.create(name: '看电影', number: "movies", tag_category: category_entertainment)
Tag.create(name: '听音乐', number: "songs", tag_category: category_entertainment)
Tag.create(name: '扯淡', number: "chat", tag_category: category_entertainment)

Tag.create(name: '公告', number: "notices", tag_category: category_manage)
Tag.create(name: '反馈', number: "feedback", tag_category: category_manage)
Tag.create(name: '社区开发', number: "development", tag_category: category_manage)

PrintHouse.create(name: '泰安和书屋', phone: '123456', description: "哥打印的是寂寞，你懂么？", ip: '1.1.1.1')
PrintHouse.create(name: '经心食杂店', phone: '123456', description: "哥打印的是寂寞，你懂么？", ip: '1.1.1.1')
PrintHouse.create(name: '奔腾打印', phone: '123456', description: "哥打印的是寂寞，你懂么？", ip: '1.1.1.1')

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


# nevermore = User.create(
#   nickname: 'nevermore',
#   password: '123456',
#   password_confirmation: '123456',
#   email: 'nevermore@gmail.com')

## Generate tag categories


# ## Generate tags


#test_album = Album.create(name: '测试', description: '测试', fonder: acool)

## Generate albums
def create_photo(creater,url, album = nil)
  Photo.create(
  :description => "这仅仅就是个照片，看什么看，再看就把你吃掉",
  :fonder => creater,
  :img_url => url,
  :album => album
  )
end
#create_photo(david,"http://ww3.sinaimg.cn/mw205/a01660e0jw1drd404g3gcj.jpg")
#create_photo(david, "http://img.spriteapp.com/si/59/72/87acae83jw1drljvn12n6j_2.jpg")
#create_photo(david, "http://img.spriteapp.com/si/1e/e9/87bee8eejw1drm59rtxsxj_2.jpg")
#create_photo(david, "http://ww3.sinaimg.cn/mw205/a01660e0jw1drd404g3gcj.jpg")
#create_photo(david, "http://img.spriteapp.com/si/0a/7e/63943f51gw1drl908s0zmj_2.jpg")
#create_photo(david, "http://www.865q.cn/qqfzl/UploadPic/2009-8/2009831134032200.jpg")
#create_photo(david, "http://img.spriteapp.com/si/3f/b6/9770ce78jw1drlmc0rlxyj.jpg")
#create_photo(david, "http://ww3.sinaimg.cn/mw205/a01660e0jw1drd404g3gcj.jpg")
#create_photo(david, "http://img.spriteapp.com/si/f8/35/87acae83jw1drlm1njspcg.gif")
#create_photo(david, "http://img.spriteapp.com/si/dd/a6/633f6f25jw1drlkvt0thij.jpg")
#create_photo(david, "http://img.spriteapp.com/si/04/49/63943f51jw1drlk3wmrqqj_2.jpg")
#create_photo(david, "http://img.spriteapp.com/si/48/76/92c9aa30jw1drlf6ezbbdj.jpg")
#create_photo(david, "http://img.spriteapp.com/si/0a/7e/63943f51gw1drl908s0zmj_2.jpg")
#create_photo(david, "http://img.spriteapp.com/si/22/54/9770ce78jw1drliv6gimsj.jpg")
#create_photo(acool, "http://cdn.duitang.com/uploads/people/201203/30/20120330110303_sEneY.jpeg")
