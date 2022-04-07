class PostsController < ApplicationController
	# before_action :authorize_user , except: [:index,:show]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
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

	def edit
		@post = Post.find(params[:id])
	end

	def update
	end

	def destroy
		@post = @post.find(params[:id])
		if @post.destroy
			redirect_to posts_path()
		else

		end
	end


	private

	def post_params
		params.require(:post).permit(:title,:content)
	end
end
