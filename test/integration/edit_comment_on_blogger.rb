require 'test_helper'

class AddCommentOnBloggerTest < ActionDispatch::IntegrationTest
    test "should add comment on blogger" do
        get bloggers_everything_path
        assert_response :success

        new_blogger = Blogger.new(name:"TesterMan", level: 10)
        new_blogger.save

        get blogger_comment_page_path(new_blogger)
        assert_response :success

        new_comment = new_blogger.comments.new(body:"Test Comment")
        new_comment.save

        get blogger_comment_edit_path(new_blogger,new_comment)
        assert_response :success

        patch comment_path(new_blogger,new_comment), params: { comment: { body: "Test Comment",Blogger_id:new_blogger.id} }
        assert_response :redirect
    end
end