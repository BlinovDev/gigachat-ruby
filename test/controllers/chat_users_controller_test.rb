require "test_helper"

class ChatUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chat_user = chat_users(:one)
  end

  test "should get index" do
    get chat_users_url
    assert_response :success
  end

  test "should get new" do
    get new_chat_user_url
    assert_response :success
  end

  test "should create chat_user" do
    assert_difference("ChatUser.count") do
      post chat_users_url, params: { chat_user: { chat_id: @chat_user.chat_id, user_id: @chat_user.user_id } }
    end

    assert_redirected_to chat_user_url(ChatUser.last)
  end

  test "should show chat_user" do
    get chat_user_url(@chat_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_chat_user_url(@chat_user)
    assert_response :success
  end

  test "should update chat_user" do
    patch chat_user_url(@chat_user), params: { chat_user: { chat_id: @chat_user.chat_id, user_id: @chat_user.user_id } }
    assert_redirected_to chat_user_url(@chat_user)
  end

  test "should destroy chat_user" do
    assert_difference("ChatUser.count", -1) do
      delete chat_user_url(@chat_user)
    end

    assert_redirected_to chat_users_url
  end
end
