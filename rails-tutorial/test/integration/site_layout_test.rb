require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
  end

  test "layout links without login" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

    get contact_path
    assert_select "title", full_title("Contact")

    get signup_path
    assert_select "title", full_title("Sign up")

    get about_path
    assert_select "title", full_title("About")

    get help_path
    assert_select "title", full_title("Help")

    # log_in_as(@user)
    # debugger
    # get "/users/#{@user.id}/edit"
    # assert_select "title", full_title
    # assert_template 'static_pages/home'
  end

end
