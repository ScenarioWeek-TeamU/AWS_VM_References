require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get '/users/new'
    assert_response :success
  end

  test "can register an account with valid details" do
    post "/users", params: { user: { name: 'testuser1', email: 'testuser1@test.com', password: 'asdasd', password_confirmation: 'asdasd' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_equal '/projects', path

    #test database has the new user
    assert_equal 'testuser1', User.select("name").where(:email => "testuser1@test.com").first.name
  end

  test "cannot register an account with invalid email" do
    post "/users", params: { user: { name: 'testuser1', email: 'tasdasd12', password: 'asdasd', password_confirmation: 'asdasd' } }
    assert_response :ok
    assert_equal '/users', path
  end

  test "cannot register an account with invalid password" do
    post "/users", params: { user: { name: 'testuser1', email: 'testuser1@test.com', password: 'aa', password_confirmation: 'aa' } }
    assert_response :ok
    assert_equal '/users', path
  end

  test "cannot register an account with non-matching passwords" do
    post "/users", params: { user: { name: 'testuser1', email: 'testuser1@test.com', password: 'asdasd321', password_confirmation: 'asdasd123' } }
    assert_response :ok
    assert_equal '/users', path
  end

end
