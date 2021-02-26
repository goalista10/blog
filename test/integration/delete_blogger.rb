require 'test_helper'

class DeleteBloggerTest < ActionDispatch::IntegrationTest
    test "should delete user" do
        get bloggers_everything_path
        assert_response :success

        assert_difference 'Blogger.count', 0 do
            new_blogger = Blogger.new(name:"TesterMan", level: 10)
            new_blogger.save

            delete bloggers_everything_path(new_blogger)
            assert_response :redirect
        end
        #follow_redirect!
        #assert_response :success
    end
end