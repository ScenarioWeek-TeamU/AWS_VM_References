require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
    fixtures :projects
    fixtures :users

    setup do
        post "/login", params: { session: { email: users(:one).email, password: 'testtest' } }
    end

    test "can get projects - logged in" do
        get '/projects'
        assert_response :success
        assert_equal '/projects', path
    end

    test "can create a new project" do
        post "/projects", params: { project: { title: 'testproject3' } }
        assert_response :redirect
        follow_redirect!
        assert_response :success
        assert_equal '/projects', path

        #test database has the new project
        testproject = Project.where(:user => users(:one)).where(:title => 'testproject3').first
        assert_equal 'testproject3', testproject.title
    end

    # test "can edit a project title" do
    #     project_edit_url = "/projects/" + projects(:project1).id.to_s

    #     put project_edit_url, params: { project: { title: 'testproject999' } }
    #     assert_response :success

    #     #test database has the new changes
    #     assert_equal 'testproject999', Project.where(:user => users(:one)).where(:title => 'testproject999').first.title
    # end

    # test "can delete a project" do
    #     project_delete_url = "/projects/" + projects(:project1).id.to_s

    #     delete project_delete_url
    #     assert_response :redirect
    #     follow_redirect!
    #     assert_response :success
    #     assert_equal '/projects', path

    #     #test database has the new project
    #     assert_equal nil, Project.select("title").where(:user => users(:one)).where(:title => 'testproject999').first
    # end
end
