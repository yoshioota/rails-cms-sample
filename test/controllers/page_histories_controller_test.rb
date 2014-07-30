require 'test_helper'

class PageHistoriesControllerTest < ActionController::TestCase
  setup do
    @page_history = page_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:page_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create page_history" do
    assert_difference('PageHistory.count') do
      post :create, page_history: { body: @page_history.body, body_source: @page_history.body_source, page_id: @page_history.page_id, title: @page_history.title }
    end

    assert_redirected_to page_history_path(assigns(:page_history))
  end

  test "should show page_history" do
    get :show, id: @page_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @page_history
    assert_response :success
  end

  test "should update page_history" do
    patch :update, id: @page_history, page_history: { body: @page_history.body, body_source: @page_history.body_source, page_id: @page_history.page_id, title: @page_history.title }
    assert_redirected_to page_history_path(assigns(:page_history))
  end

  test "should destroy page_history" do
    assert_difference('PageHistory.count', -1) do
      delete :destroy, id: @page_history
    end

    assert_redirected_to page_histories_path
  end
end
