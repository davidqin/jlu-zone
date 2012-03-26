# coding: utf-8

## Generate users with different level
david = User.create( 
  nickname: 'david',
  password: '123456',
  level: 3,
  password_confirmation: '123456',
  email: 'davidqhr@gmail.com')

mario = User.create( 
  nickname: 'mario',
  password: '123456',
  level: 3,
  password_confirmation: '123456',
  email: 'mario@gmail.com')

frank = User.create( 
  nickname: 'frank',
  password: '123456',
  level: 2,
  password_confirmation: '123456',
  email: 'frank@gmail.com')

kevin = User.create( 
  nickname: 'kevin',
  password: '123456',
  level: 1,
  password_confirmation: '123456',
  email: 'kevin@gmail.com')

nevermore = User.create( 
  nickname: 'nevermore',
  password: '123456',
  level: 0,
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

category_development   = TagCategory.create(name: '开发')
category_entertainment = TagCategory.create(name: '娱乐')
category_manage        = TagCategory.create(name: '站务')

## Generate tags
Tag.create(name: 'Ruby',          tag_category: category_development)
Tag.create(name: 'Ruby on Rails', tag_category: category_development)
Tag.create(name: 'RubyGems',      tag_category: category_development)
Tag.create(name: 'MongoDB',       tag_category: category_development)
Tag.create(name: 'Redis',         tag_category: category_development)
Tag.create(name: 'Python',        tag_category: category_development)
Tag.create(name: 'JavaScript',    tag_category: category_development)
Tag.create(name: 'jQuery',        tag_category: category_development)

Tag.create(name: 'ACG',           tag_category: category_entertainment)
Tag.create(name: 'One',           tag_category: category_entertainment)
Tag.create(name: 'Piece',         tag_category: category_entertainment)
Tag.create(name: '进击的巨人',     tag_category: category_entertainment)
Tag.create(name: 'PS3',           tag_category: category_entertainment)

Tag.create(name: '综合',           tag_category: category_manage)
Tag.create(name: '功能特性',       tag_category: category_manage)