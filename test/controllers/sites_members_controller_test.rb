require 'test_helper'

class SitesMembersControllerTest < ActionController::TestCase
  setup do
    @sites_member = sites_members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sites_members)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sites_member" do
    assert_difference('SitesMember.count') do
      post :create, sites_member: { site_id: @sites_member.site_id, user_id: @sites_member.user_id }
    end

    assert_redirected_to sites_member_path(assigns(:sites_member))
  end

  test "should show sites_member" do
    get :show, id: @sites_member
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sites_member
    assert_response :success
  end

  test "should update sites_member" do
    patch :update, id: @sites_member, sites_member: { site_id: @sites_member.site_id, user_id: @sites_member.user_id }
    assert_redirected_to sites_member_path(assigns(:sites_member))
  end

  test "should destroy sites_member" do
    assert_difference('SitesMember.count', -1) do
      delete :destroy, id: @sites_member
    end

    assert_redirected_to sites_members_path
  end
end
