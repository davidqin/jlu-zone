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

category_education     = EntryCategory.create(name: 'education',     number: 'education')
category_courses       = EntryCategory.create(name: 'courses',       number: 'courses',      parent: category_education)
category_teacher       = EntryCategory.create(name: 'teacher',       number: 'teacher',      parent: category_education)
category_association   = EntryCategory.create(name: 'association',   number: 'association')
category_entertainment = EntryCategory.create(name: 'entertainment', number: 'entertainment')
category_cinema        = EntryCategory.create(name: 'cinema',        number: 'cinema',       parent: category_entertainment)
category_internet_bar  = EntryCategory.create(name: 'internet_bar',  number: 'internet_bar', parent: category_entertainment)
category_billiards     = EntryCategory.create(name: 'billiards',     number: 'billiards',    parent: category_entertainment)
category_ktv           = EntryCategory.create(name: 'ktv',           number: 'ktv',          parent: category_entertainment)
category_diet          = EntryCategory.create(name: 'diet',          number: 'diet')
category_mess          = EntryCategory.create(name: 'mess',          number: 'mess',         parent: category_diet)

## Generate entries

entry_dota = Entry.create(
  name: "dota",
  fonder: david,
  last_editor: david,
  category_number: category_entertainment.number,
  content: "I\'m the 3th version")
