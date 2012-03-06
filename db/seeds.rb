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

category_education     = Category.create(name: 'education',     number: 'education')
category_courses       = Category.create(name: 'courses',       number: 'courses',      parent: category_education)
category_teacher       = Category.create(name: 'teacher',       number: 'teacher',      parent: category_education)
category_association   = Category.create(name: 'association',   number: 'association')
category_entertainment = Category.create(name: 'entertainment', number: 'entertainment')
category_cinema        = Category.create(name: 'cinema',        number: 'cinema',       parent: category_entertainment)
category_internet_bar  = Category.create(name: 'internet_bar',  number: 'internet_bar', parent: category_entertainment)
category_billiards     = Category.create(name: 'billiards',     number: 'billiards',    parent: category_entertainment)
category_ktv           = Category.create(name: 'ktv',           number: 'ktv',          parent: category_entertainment)
category_diet          = Category.create(name: 'diet',          number: 'diet')
category_mess          = Category.create(name: 'mess',          number: 'mess',         parent: category_diet)

## Generate entries

entry_dota = Entry.create(
  name: "dota",
  fonder: david,
  category_number: category_entertainment.number,
  content: "I\'m the 3th version")

dota_version_two = Version.create(
  entry: entry_dota,
  editor: david,
  content: "I\'m the 2th version")

dota_version_one = Version.create(
  entry: entry_dota,
  editor: mario,
  content: "I\'m the 1th version")

#  david:
#  email: david@gmail.com
#  encrypted_password: $2a$10$l88MILY5zzQ8Ns3hQxaYQO4xa8mJo.mDcRnNEm63FaXMcZQ7pILbe
#  nickname: David
#  campus: qianweinanqu
#  department: software
#  level: 3
#  major: software
#  gender: 0
#  grade: '2010'
#  renren: david@gmail.com
#  qq: '123456'
#  idiograph: test
#
#mario:
#  email: mario@gmail.com
#  encrypted_password: $2a$10$l88MILY5zzQ8Ns3hQxaYQO4xa8mJo.mDcRnNEm63FaXMcZQ7pILbe
#  nickname: Mario
#  campus: qianweinanqu
#  department: software
#  level: 3
#  major: software
#  gender: 0
#  grade: '2010'
#  renren: mario@gmail.com
#  qq: '234567'
#  idiograph: test
#
#kevin:
#  email: kevin@gmail.com
#  encrypted_password: $2a$10$l88MILY5zzQ8Ns3hQxaYQO4xa8mJo.mDcRnNEm63FaXMcZQ7pILbe
#  nickname: Kevin
#  campus: qianweinanqu
#  department: software
#  major: software
#  gender: 0
#  grade: '2010'
#  level: 2
#  renren: kevin@gmail.com
#  qq: '345678'
#  idiograph: test
#
#frank:
#  email: frank@gmail.com
#  encrypted_password: $2a$10$l88MILY5zzQ8Ns3hQxaYQO4xa8mJo.mDcRnNEm63FaXMcZQ7pILbe
#  nickname: Frank
#  campus: qianweinanqu
#  department: software
#  major: software
#  gender: 0
#  grade: '2010'
#  level: 1
#  renren: frank@gmail.com
#  qq: '456789'
#  idiograph: test
#
#nevermore:
#  email: nevermore@gmail.com
#  encrypted_password: $2a$10$l88MILY5zzQ8Ns3hQxaYQO4xa8mJo.mDcRnNEm63FaXMcZQ7pILbe
#  nickname: nevermore
#  campus: qianweinanqu
#  department: software
#  major: software
#  gender: 0
#  grade: '2010'
#  level: 0
#  renren: nevermore@gmail.com
#  qq: '456789'
#  idiograph: test