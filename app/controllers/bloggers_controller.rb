class BloggersController < ApplicationController
    def everything
      @all_bloggers = Blogger.all
    end

    def create
      @new_blogger = Blogger.new(user_params)
      @new_blogger.save
      redirect_to bloggers_everything_path 
    end

    def delete
      @to_be_deleted = Blogger.find(params[:format])
      @to_be_deleted.destroy
      redirect_to bloggers_everything_path 
    end

    def edit
      @blogger_id = params[:id]
      @edit_blogger = Blogger.find(params[:id])
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