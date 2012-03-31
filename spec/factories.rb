FactoryGirl.define do
  factory :user do
    sequence(:email)      { |n| "user#{n}@example.com" }
    sequence(:nickname)   { |n| "user#{n}" }
    password "123456"
    password_confirmation { |u| u.password }
  end

  factory :entry_category do
    sequence(:name) { |n| "category #{n}" }
    sequence(:number) { |n| "category number#{n}" }
  end

  factory :entry do
    sequence(:name) { |n| "Entry #{n}" }
    association :fonder,      :factory => :user
    association :last_editor, :factory => :user
    category_number nil
    content "I\'m the first version"
  end

  factory :topic do
    sequence(:name) { |n| "Topic #{n}" }
    association :fonder, :factory => :user
    content "I\'m a topic content"
  end

  factory :entry_reply do
    association :user
    association :resource, :factory => :entry
    content "I\'m a entry reply"
  end

  factory :topic_reply do
    association :user
    association :resource, :factory => :topic
    content "I\'m a topic reply"
  end

  factory :reply do
    association :user
    content "I\'m a reply"
  end
end