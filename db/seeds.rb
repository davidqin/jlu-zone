# coding: utf-8

## Generate users with different level
david = User.create( 
  nickname: 'david',
  password: '123456',
  admin_permission: true,
  password_confirmation: '123456',
  email: 'davidqhr@gmail.com')

acool = User.create( 
  nickname: 'Acool',
  password: '123456',
  admin_permission: true,
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

nevermore = User.create( 
  nickname: 'nevermore',
  password: '123456',
  password_confirmation: '123456',
  email: 'nevermore@gmail.com')

entry_dota = Entry.create(
  name: "dota",
  fonder: david,
  last_editor: david,
  content: "I\'m the 3th version")

## Generate tag categories
category_notice        = TagCategory.create(name: '活动')
category_campu         = TagCategory.create(name: '校区')
category_entertainment = TagCategory.create(name: '娱乐')
category_manage        = TagCategory.create(name: '站务')

## Generate tags

Tag.create(name: '文体活动',        number: "c-s-sports",    tag_category: category_notice) #Hard Tag
Tag.create(name: '电竞比赛',        number: "E-sports",      tag_category: category_notice) #Hard Tag
Tag.create(name: '活动通知',        number: "sports-notice", tag_category: category_notice) #Hard Tag

Tag.create(name: '前卫校区',        number: "qianwei", tag_category: category_campu)
Tag.create(name: '南岭校区',        number: "nanling", tag_category: category_campu)
Tag.create(name: '新民校区',        number: "xinmin", tag_category: category_campu)
Tag.create(name: '朝阳校区',        number: "chaoyang", tag_category: category_campu)
Tag.create(name: '南湖校区',        number: "nanhu", tag_category: category_campu)
Tag.create(name: '和平校区',        number: "heping", tag_category: category_campu)

Tag.create(name: '打游戏',          number: "E-games", tag_category: category_entertainment)
Tag.create(name: '看电影',          number: "movies", tag_category: category_entertainment)
Tag.create(name: '听音乐',          number: "songs", tag_category: category_entertainment)
  
Tag.create(name: '公告',           number: "ACG", tag_category: category_manage)
Tag.create(name: '反馈',           number: "One", tag_category: category_manage)
Tag.create(name: '社区开发',        number: "Piece", tag_category: category_manage)

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
