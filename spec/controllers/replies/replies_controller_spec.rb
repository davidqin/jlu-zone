require "spec_helper"

describe Replies::RepliesController do
  describe ":create" do
    it "should not allow anonymous access" do
       #reply = params = Factory.attributes_for(:topic_reply)
       post :create
       response.should_not be_success
       response.should redirect_to(new_user_session_path)
    end
  end

  describe ":edit" do
    it "should not allow anonymous access" do
       get :edit
       response.should_not be_success
       response.should redirect_to(new_user_session_path)
    end
  end

  describe ":upadte" do
    it "should not allow anonymous access" do
       put :update
       response.should_not be_success
       response.should redirect_to(new_user_session_path)
    end
  end
end
