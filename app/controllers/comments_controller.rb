class CommentsController < ApplicationController
	def post
		@comment = Comment.new(comment_params)
		@comment.save!
		@answer = @comment.answer
		@comments = @answer.comments
		respond_to do |format|
			format.html{}
			format.js{}
		end
	end
	private
	def comment_params
		params.require(:comment).permit([:answer_id, :user_id, :content])
	end
end
