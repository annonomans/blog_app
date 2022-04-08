class CommentsController < ApplicationController

	def create
		@comment = Comment.create(:user_id => current_user.id,:post_id => params[:post_id],:body => params[:body])
		if @comment.save
			flash[:success] = "Comment added"
			redirect_to "/posts/#{params[:post_id]}"
		else
			flash[:notice] = @comment.errors.full_messages.to_sentence
			redirect_to "/posts/#{params[:post_id]}"
			
		end
	end

end
