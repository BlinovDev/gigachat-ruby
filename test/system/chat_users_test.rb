require "application_system_test_case"

class ChatUsersTest < ApplicationSystemTestCase
  setup do
    @chat_user = chat_users(:one)
  end

  test "visiting the index" do
    visit chat_users_url
    assert_selector "h1", text: "Chat users"
  end

  test "should create chat user" do
    visit chat_users_url
    click_on "New chat user"

    fill_in "Chat", with: @chat_user.chat_id
    fill_in "User", with: @chat_user.user_id
    click_on "Create Chat user"

    assert_text "Chat user was successfully created"
    click_on "Back"
  end

  test "should update Chat user" do
    visit chat_user_url(@chat_user)
    click_on "Edit this chat user", match: :first

    fill_in "Chat", with: @chat_user.chat_id
    fill_in "User", with: @chat_user.user_id
    click_on "Update Chat user"

    assert_text "Chat user was successfully updated"
    click_on "Back"
  end

  test "should destroy Chat user" do
    visit chat_user_url(@chat_user)
    click_on "Destroy this chat user", match: :first

    assert_text "Chat user was successfully destroyed"
  end
end
