require "spec_helper"

describe Community::CommunityController do
  describe ":index" do
    it "should have an index action" do
      get :index
      response.should be_success
      response.should render_template(:index)
    end
  end
end