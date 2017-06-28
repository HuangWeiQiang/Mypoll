class QuestionsController < ApplicationController
	include ApplicationHelper
	include QuestionsHelper
	def index
		@questions = Question.all
	end

	def show
		@question = Question.find_by(params[:id])
		@answers = select_random(@question.answers)
	end

	def new

	end

	def answer
		@question = Question.find_by(params[:question_id])
		@answer = @question.answers.find_by(id: params[:l_or_r])
		@comment = Comment.new
		@comments = @answer.comments
		if @answer
			@answer.count += 1
		else
			redirect_to @question
		end
		@answer.save

		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	def star
		@question = Question.find_by(params[:question_id])
		@question.star += 1
		@question.save
		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	private
	def render_index
		if admin?
			render 'questions/_admin_index'
		else
			render 'questions/_user_index'
		end
	end
end
