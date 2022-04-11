class PostsController < ApplicationController
	 before_action :set_post , only: [:edit,:destroy,:show]

	def index
		@posts = Post.all
	end

	def show
	end

	def new
		@post = Post.new
	end

	def create 
		@post = Post.new(post_params)
		if @post.save
			flash[:success] = "Post created"
			redirect_to posts_path()
		else
			flash[:notice] = @post.errors.full_messages.to_sentence
			redirect_to new_post_path()
		end
	end
	
	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			flash[:success] = "Post deleted successfully!"
			redirect_to posts_path()
		else
			flash[:success] = @post.errors.full_messages.to_sentence
			redirect_to posts_path()
		end
	end


	private

	def set_post 
		@post = Post.find(params[:id])
	end

	def post_params
		params.require(:post).permit(:title,:content)
	end
end
