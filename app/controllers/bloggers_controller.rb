class BloggersController < ApplicationController
    def everything
        @test= "asd"
        @usersBlogger = Blogger.all
        @userBlogger = Blogger.new
    end

    def create
        @userBlogger = Blogger.new(user_params)
        @userBlogger.save
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @userBlogger = Blogger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:blogger).permit(:name, :level)
    end
end