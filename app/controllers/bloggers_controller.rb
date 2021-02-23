class BloggersController < ApplicationController
    def everything
      @test= "asd"
      @usersBlogger = Blogger.all
      @userBlogger = Blogger.new
    end

    def create
      @userBlogger = Blogger.new(user_params)
      @userBlogger.save
      redirect_to bloggers_everything_path 
    end

    def delete
      @asd = Blogger.find(params[:format])
      @asd.destroy
      redirect_to bloggers_everything_path 
    end

    def edit
      @set = params[:id]
      @setuser = Blogger.find(params[:id])
    end

    def update
      Blogger.find(params[:id]).update(user_params)
      redirect_to bloggers_everything_path 
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:blogger).permit(:name, :level)
    end
end