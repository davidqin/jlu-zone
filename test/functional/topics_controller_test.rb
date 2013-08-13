# coding: utf-8
require 'test_helper'
class TopicsControllerTest < ActionController::TestCase

  setup do
    @user = FactoryGirl.create(:user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end

  test 'index' do
    get :index
    assert_template :index
  end

  test 'tag_index' do
    tag = FactoryGirl.create(:tag)

    get :tag_index, tag_id: tag.id
    assert_template :index
  end

  test 'new' do
    get :new
    assert_redirected_to new_user_session_path

    sign_in @user
    get :new
    assert_template :new
  end

  test 'create' do
    params = { name: 'new_name', content: "new_content", tag_string: "a,b,c" }
    sign_in @user

    tag_count = Tag.count

    assert_difference -> { Topic.count }, 1 do
      post :create, topic: params
    end

    # tag增加的数量
    assert_equal Tag.count, tag_count + 3

    assert_redirected_to assigns(:topic)
  end

  test 'show' do
    topic = FactoryGirl.create(:topic, fonder: @user)

    get :show, id: topic.id
    assert_template :show
  end

  test 'edit' do
    topic = FactoryGirl.create(:topic, fonder: @user)

    get :edit, id: topic.id
    assert_redirected_to new_user_session_path

    sign_in @user
    get :edit, id: topic.id
    assert_response 200
    assert_template :edit
  end

end