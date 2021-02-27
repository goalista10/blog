require 'test_helper'

class AddCommentOnBloggerTest < ActionDispatch::IntegrationTest
    test "should add comment on blogger" do
        get bloggers_everything_path
        assert_response :success

        new_blogger = Blogger.new(name:"TesterMan", level: 10)
        new_blogger.save

        get blogger_comment_page_path(new_blogger)
        assert_response :success

        post blogger_comment_page_path(new_blogger), params: { comment: { body: "Test Comment",Blogger_id:new_blogger.id} }
        assert_response :success
    end
end