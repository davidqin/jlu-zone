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

## Generate categories

category_education     = EntryCategory.create(name: '教学', number: 'education')
category_courses       = EntryCategory.create(name: '选修课', number: 'courses')
category_teacher       = EntryCategory.create(name: '老师', number: 'teacher')
category_association   = EntryCategory.create(name: '社团', number: 'association')
category_cinema        = EntryCategory.create(name: '电影院', number: 'cinema')
category_internet_bar  = EntryCategory.create(name: '网吧', number: 'internet_bar')
category_billiards     = EntryCategory.create(name: '台球厅', number: 'billiards')
category_ktv           = EntryCategory.create(name: 'KTV', number: 'ktv')
category_mess          = EntryCategory.create(name: '食堂', number: 'mess')

## Generate entries

entry_dota = Entry.create(
  name: "dota",
  fonder: david,
  last_editor: david,
  category_number: category_courses.number,
  content: "I\'m the 3th version")

## Generate tag categories
category_notice        = TagCategory.create(name: '公告')
category_development   = TagCategory.create(name: '开发')
category_entertainment = TagCategory.create(name: '娱乐')
category_manage        = TagCategory.create(name: '站务')

## Generate tags
Tag.create(name: '活动通知',       number: "activity", tag_category: category_notice) #Hard Tag

Tag.create(name: 'Ruby',          number: "Ruby", tag_category: category_development)
Tag.create(name: 'Ruby-on-Rails', number: "Ruby-on-Rails", tag_category: category_development)
Tag.create(name: 'RubyGems',      number: "RubyGems", tag_category: category_development)
Tag.create(name: 'MongoDB',       number: "MongoDB", tag_category: category_development)
Tag.create(name: 'Redis',         number: "Redis", tag_category: category_development)
Tag.create(name: 'Python',        number: "Python", tag_category: category_development)
Tag.create(name: 'JavaScript',    number: "JavaScript", tag_category: category_development)
Tag.create(name: 'jQuery',        number: "jQuery", tag_category: category_development)

Tag.create(name: 'ACG',           number: "ACG", tag_category: category_entertainment)
Tag.create(name: 'One',           number: "One", tag_category: category_entertainment)
Tag.create(name: 'Piece',         number: "Piece", tag_category: category_entertainment)
Tag.create(name: '进击的巨人',     number: "进击的巨人", tag_category: category_entertainment)
Tag.create(name: 'PS3',           number: "PS3", tag_category: category_entertainment)

Tag.create(name: '综合',           number: "综合", tag_category: category_manage)
Tag.create(name: '功能特性',       number: "功能特性", tag_category: category_manage)

## Generate albums
def create_album(creater,*urls)
  url_hash = {}
  urls.each do |url|
    index = urls.index(url)
    url_hash[index.to_s] = {:img_url => url}
  end
  Album.create(
  :description => "这仅仅就是个照片，看什么看，再看就把你吃掉", 
  :user => creater,
  :photos_attributes => url_hash
  )  
end
create_album(david,"http://ww3.sinaimg.cn/mw205/a01660e0jw1drd404g3gcj.jpg")

create_album(david, "http://img.spriteapp.com/si/59/72/87acae83jw1drljvn12n6j_2.jpg")
create_album(david, "http://img.spriteapp.com/si/1e/e9/87bee8eejw1drm59rtxsxj_2.jpg", 
                    "http://ww3.sinaimg.cn/mw205/a01660e0jw1drd404g3gcj.jpg", 
                    "http://img.spriteapp.com/si/0a/7e/63943f51gw1drl908s0zmj_2.jpg")
create_album(david, "http://www.865q.cn/qqfzl/UploadPic/2009-8/2009831134032200.jpg")
create_album(david, "http://img.spriteapp.com/si/3f/b6/9770ce78jw1drlmc0rlxyj.jpg")
create_album(david, "http://ww3.sinaimg.cn/mw205/a01660e0jw1drd404g3gcj.jpg")
create_album(david, "http://img.spriteapp.com/si/f8/35/87acae83jw1drlm1njspcg.gif")
create_album(david, "http://img.spriteapp.com/si/dd/a6/633f6f25jw1drlkvt0thij.jpg")
create_album(david, "http://img.spriteapp.com/si/04/49/63943f51jw1drlk3wmrqqj_2.jpg")
create_album(david, "http://img.spriteapp.com/si/48/76/92c9aa30jw1drlf6ezbbdj.jpg")
create_album(david, "http://img.spriteapp.com/si/0a/7e/63943f51gw1drl908s0zmj_2.jpg")
create_album(david, "http://img.spriteapp.com/si/22/54/9770ce78jw1drliv6gimsj.jpg")
create_album(acool, "http://cdn.duitang.com/uploads/people/201203/30/20120330110303_sEneY.jpeg")
