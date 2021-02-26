require 'test_helper'

class UpdateBloggerTest < ActionDispatch::IntegrationTest
    test "should update user" do
        get bloggers_everything_path
        assert_response :success

        new_blogger = Blogger.new(name:"TesterMan", level: 10)
        new_blogger.save

        patch blogger_path(new_blogger), params: { blogger: { name: "Legolas", level: 30 } }
        assert_response :redirect
    end
    #follow_redirect!
    #assert_response :success
end