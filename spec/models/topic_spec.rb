require 'spec_helper'

describe Topic do

  let(:topic) { Factory(:topic) }
  describe 'Validates' do
    it 'should fail saving without a name' do
      topic                 = Topic.new
      topic.name            = ""
      topic.content         = "content"
      topic.fonder          = Factory(:user)
      topic.should          have(1).error_on(:name)
      topic.save.should     == false
    end

    it 'should fail saving without content' do
      topic                 = Topic.new
      topic.name            = "name"
      topic.content         = ""
      topic.fonder          = Factory(:user)
      topic.should          have(1).error_on(:content)
      topic.save.should     == false
    end

    it 'should fail saving uniqueness a name' do
      new_topic             = Factory.build(:topic)
      new_topic.name        = topic.name
      new_topic.save.should == false
    end
  end

  describe 'changes_after_user_last_read' do
    it 'should be 0 when no user login' do
      result = topic.get_changes_after_user_last_read(nil)
      result.should == 0
    end
  end
end 