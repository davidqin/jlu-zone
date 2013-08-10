# coding: utf-8

FactoryGirl.define do
  factory :tag_category do
    name '测试用的tag_category'
  end
end

FactoryGirl.define do
  factory :tag do
    tag_category FactoryGirl.create(:tag_category)
    name '测试用的tag_category'
    sequence(:number) { |n| "#{tag_}n" }
  end
end