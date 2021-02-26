require 'test_helper'

class CreateBloggerTest < ActionDispatch::IntegrationTest
    test "should make new user" do
        get bloggers_everything_path
        assert_response :success
        assert_difference 'Blogger.count', 1 do
            post bloggers_everything_path, params: { blogger: { name: "TesterMan", level: 30 } }
            assert_response :success
        end
    end
end