class CommentsController < ApplicationController
    def load
        @all_comments = Blogger.find(params[:id]).comments
        @blogger = Blogger.find(params[:id])
        @add_comment = Blogger.find(params[:id]).comments.build
        render "comments/all"
    end

    def make
        @save_comment = Blogger.find(params[:id]).comments.build(comment_params)
        if @save_comment.save
            load()
        else
            @show_error = @save_comment
            render "bloggers/fail"
        end
    end

    def delete
        @to_be_deleted = Blogger.find(params[:id]).comments.find(params[:format])
        @to_be_deleted.destroy
        redirect_to blogger_comment_path 
    end

    def edit
        @to_be_updated = Blogger.find(params[:id]).comments.find(params[:cid])

    end

    def update
        Comment.find(params[:cid]).update(comment_params)
        redirect_to blogger_comment_page_path 
    end

    private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:body, :blogger_id)
    end
end
