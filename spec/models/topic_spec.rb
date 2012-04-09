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

  describe "add_user_score" do
    it "should only add 5 times score when create more than 5 topics" do
      user = FactoryGirl.create(:user)
      score_before = user.score
      10.times do
        FactoryGirl.create(:topic, :fonder => user)
      end
      user.reload
      user.score.should == score_before + Topic.create_score * 5
    end
  end
end 