require 'test_helper'

class MiniaturesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @miniature = miniatures(:one)
  end

  test "should get index" do
    get miniatures_url
    assert_response :success
  end

  test "should get new" do
    get new_miniature_url
    assert_response :success
  end

  test "should create miniature" do
    assert_difference('Miniature.count') do
      post miniatures_url, params: { miniature: { description: @miniature.description, title: @miniature.title, user_id: @miniature.user_id } }
    end

    assert_redirected_to miniature_url(Miniature.last)
  end

  test "should show miniature" do
    get miniature_url(@miniature)
    assert_response :success
  end

  test "should get edit" do
    get edit_miniature_url(@miniature)
    assert_response :success
  end

  test "should update miniature" do
    patch miniature_url(@miniature), params: { miniature: { description: @miniature.description, title: @miniature.title, user_id: @miniature.user_id } }
    assert_redirected_to miniature_url(@miniature)
  end

  test "should destroy miniature" do
    assert_difference('Miniature.count', -1) do
      delete miniature_url(@miniature)
    end

    assert_redirected_to miniatures_url
  end
end
