require "spec_helper"

describe Wiki::EntriesController do
  let(:category) { Factory :entry_category }
  let(:entry) { Factory :entry , :category_number => category.number}
  let(:user) { Factory :user }

  describe ":index" do
    it "should have an index action" do
      get :index, :category_number => category.number
      response.should be_success
      response.should render_template(:index)
    end
  end

  describe ":show" do
    it "should have an show action" do
      get :show, :id => entry
      response.should be_success
      response.should render_template(:show)
    end
  end

  describe ":edit" do
    it "should have an edit action, need user login in" do
      get :edit, :id => entry
      response.should redirect_to(new_user_session_path)

      sign_in user
      get :edit, :id => entry
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
    end

    it "should have an create action, need user login in" do
      sign_in user
      params = Factory.attributes_for(:entry, :category_number => category.number)
      post :create, :entry => params

      entry = Entry.find_by_name(params[:name])
      response.should redirect_to entry_path(entry)
    end

    it "should not create new entry if name is not present" do
      sign_in user
      params = Factory.attributes_for(:entry, :category_number => category.number)
      params[:name] = ""
      post :create, :entry => params
      response.should render_template(:new)
    end

#    it "should create new entry if all is well" do
#      sign_in user
#      params = Factory.attributes_for(:entry, :category_number => category.number)
#      params[:fonder_id] = user.id
#      post :create, :entry => params, :last_editor_id => user.id
#      response.should be_success
#    end
  end



  describe ":update" do
    it "should not allow anonymous access" do
      put :update
      response.should_not be_success
    end

    it "should update entry if all is well" do
      sign_in user

      params = Factory.attributes_for(:entry, :category_number => category.number)
      params[:fonder_id] = user.id
      params[:last_editor_id] = user.id
      
      entry  = user.entries.create!(params)
      params[:name] = "new title"
      params[:content] = "new_content"
      put :update, :entry => params, :id => entry.id
      response.should redirect_to(entry_path(entry.id))
      entry.reload
      entry.content.should == params[:content]
    end

    it "should not update page if content is not present" do
      sign_in user
      params = Factory.attributes_for(:entry, :category_number => category.number)
      params[:fonder_id] = user.id
      params[:last_editor_id] = user.id
      entry  = user.entries.create!(params)
      params[:name] = "new title"
      params[:content] = ""
      put :update, :entry => params, :id => entry.id
      response.should render_template(:edit)
    end
  end

  describe ":destroy" do
    it "should not allow anonymous access" do
      delete :destroy
      response.should_not be_success
    end

    it "should not destroy entry if it is user" do
      sign_in user
      delete :destroy, :id => entry.id
      category = entry.category.number
      response.should_not be_success
      response.should redirect_to(:root)
    end
    
    it "should destroy entry if it is admin" do
      admin = Factory(:user, :level => 3)
      sign_in admin
      category = entry.category.number
      delete :destroy, :id => entry.id
      response.should redirect_to(category_entries_path(category))
    end
  end
end
