require "application_system_test_case"

class MiniaturesTest < ApplicationSystemTestCase
  setup do
    @miniature = miniatures(:one)
  end

  test "visiting the index" do
    visit miniatures_url
    assert_selector "h1", text: "Miniatures"
  end

  test "creating a Miniature" do
    visit miniatures_url
    click_on "New Miniature"

    fill_in "Description", with: @miniature.description
    fill_in "Title", with: @miniature.title
    fill_in "User", with: @miniature.user_id
    click_on "Create Miniature"

    assert_text "Miniature was successfully created"
    click_on "Back"
  end

  test "updating a Miniature" do
    visit miniatures_url
    click_on "Edit", match: :first

    fill_in "Description", with: @miniature.description
    fill_in "Title", with: @miniature.title
    fill_in "User", with: @miniature.user_id
    click_on "Update Miniature"

    assert_text "Miniature was successfully updated"
    click_on "Back"
  end

  test "destroying a Miniature" do
    visit miniatures_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Miniature was successfully destroyed"
  end
end
