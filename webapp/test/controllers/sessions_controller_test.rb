require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  fixtures :users

  test "should get login" do
    get "/login"
    assert_response :success
  end

  test "can login to app with correct details" do
    post "/login", params: { session: { email: users(:one).email, password: 'testtest' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal '/projects', path
  end

  test "cannot login to app with incorrect details" do
    post "/login", params: { session: { email: users(:two).email, password: 'asdasdasda' } }
    assert_equal '/login', path
  end


end
