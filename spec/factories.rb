Factory.define :user do |f|
  f.sequence(:email) { |n| "user#{n}@example.com" }
  f.sequence(:nickname) { |n| "user#{n}" }
  f.password "123456"
  f.level 0
  f.password_confirmation { |u| u.password }
end


Factory.define :category do |f|
  f.sequence(:name) { |n| "category #{n}" }
  f.parent nil
  f.sequence(:number) { |n| "category number#{n}" }
end

Factory.define :entry do |f|
  f.sequence(:name) { |n| "Entry #{n}" }
  f.association :fonder, :factory => :user
  f.category_number nil
  f.content "I\'m the first version"
end


