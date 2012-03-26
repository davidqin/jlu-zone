Factory.define :user do |f|
  f.sequence(:email)      { |n| "user#{n}@example.com" }
  f.sequence(:nickname)   { |n| "user#{n}" }
  f.password "123456"
  f.password_confirmation { |u| u.password }
end

Factory.define :entry_category do |f|
  f.sequence(:name) { |n| "category #{n}" }
  f.sequence(:number) { |n| "category number#{n}" }
end

Factory.define :entry do |f|
  f.sequence(:name) { |n| "Entry #{n}" }
  f.association :fonder,      :factory => :user
  f.association :last_editor, :factory => :user
  f.category_number nil
  f.content "I\'m the first version"
end

Factory.define :topic do |f|
  f.sequence(:name) { |n| "Topic #{n}" }
  f.association :fonder, :factory => :user
  f.content "I\'m a topic content"
end

Factory.define :entry_reply do |f|
  f.association :user
  f.association :resource, :factory => :entry
  f.content "I\'m a entry reply"
end

Factory.define :topic_reply do |f|
  f.association :user
  f.association :resource, :factory => :topic
  f.content "I\'m a topic reply"
end

Factory.define :reply do |f|
  f.association :user
  f.content "I\'m a reply"
end