require "spec_helper"

describe Community::TopicsController do
  
  let(:topic) { FactoryGirl.create :topic }
  let(:user) { FactoryGirl.create :user }

  describe ":index" do
    it "should have an index action" do
      get :index
      response.should be_success
      response.should render_template(:index)
    end
  end

  describe ":show" do
    it "should have an show action" do
      get :show, :id => topic
      response.should be_success
      response.should render_template(:show)
    end
  end

  describe ":edit" do
    it "can not edit other\'s topic" do
      get :edit, :id => topic
      response.should redirect_to(new_user_session_path)

      sign_in user
      get :edit, :id => topic
      response.should_not be_success
    end

    it "one can edit his topic" do
      get :edit, :id => topic
      response.should redirect_to(new_user_session_path)

      sign_in topic.fonder
      get :edit, :id => topic
      response.should be_success
      response.should render_template(:edit)
    end
  end

  describe ":new" do
    it "should have an new action, need user login in" do
      get :new
      response.should redirect_to(new_user_session_path)

      sign_in user
      get :new
      response.should be_success
      response.should render_template(:new)
    end
  end

  describe ":create" do
    it "should not allow anonymous access" do
       post :create
       response.should_not be_success
       response.should redirect_to(new_user_session_path)
    end

    it "should have an create action, need user login in" do
      sign_in user
      params = FactoryGirl.attributes_for(:topic)
      post :create, :topic => params

      topic = Topic.find_by_name(params[:name])
      response.should redirect_to topic_path(topic)
    end

    it "should not create new entry if name is not present" do
      sign_in user
      params        = FactoryGirl.attributes_for(:topic)
      params[:name] = ""
      post :create, :entry => params
      response.should render_template(:new)
    end
  end

  describe ":update" do
    it "should not allow anonymous access" do
      put :update, :id => topic
      response.should_not be_success
      response.should redirect_to(new_user_session_path)

      sign_in user
      put :update, :id => topic
      response.should_not be_success
    end

    it "should update entry if all is well" do
      sign_in user

      params           = FactoryGirl.attributes_for(:topic)
      topic            = user.topics.create!(params)
      
      params[:name]    = "new title"
      params[:content] = "new_content"
      put :update, :topic => params, :id => topic.id

      response.should redirect_to(topic_path(topic.id))

      topic.reload
      topic.content.should == params[:content]
    end

    it "should not update page if content is not present" do
      sign_in user
      params           = FactoryGirl.attributes_for(:topic)
      topic            = user.topics.create!(params)
      params[:name]    = "new title"
      params[:content] = ""
      put :update, :topic => params, :id => topic.id
      response.should render_template(:edit)
    end
  end

  describe ":destroy" do
    it "should not allow anonymous access" do
      delete :destroy
      response.should_not be_success
      response.should redirect_to(new_user_session_path)
    end

    it "should destroy entry if it is admin" do
      admin = FactoryGirl.create(:user, :admin_permission => true)
      sign_in admin
      delete :destroy, :id => topic.id
      response.should redirect_to("/community")
    end
  end
end
