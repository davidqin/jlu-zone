require 'spec_helper'

describe Topic do

  let(:topic) { FactoryGirl.create(:topic) }
  describe 'Validates' do
    it 'should fail saving without a name' do
      topic                 = Topic.new
      topic.name            = ""
      topic.content         = "content"
      topic.fonder          = FactoryGirl.create(:user)
      topic.save.should     == false
    end

    it 'should fail saving without content' do
      topic                 = Topic.new
      topic.name            = "name"
      topic.content         = ""
      topic.fonder          = FactoryGirl.create(:user)
      topic.save.should     == false
    end

    it 'should fail saving uniqueness a name' do
      new_topic             = FactoryGirl.build(:topic)
      new_topic.name        = topic.name
      new_topic.save.should == false
    end
  end
end 