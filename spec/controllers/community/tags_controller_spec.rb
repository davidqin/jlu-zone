require "spec_helper"

describe Community::TagsController do
  describe ":index" do
    it "should have an index action" do
      tag = FactoryGirl.create(:tag)
      get :index, :tag_id => tag.number
      response.should be_success
      response.should render_template(:index)
    end
  end
end