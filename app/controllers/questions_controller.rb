class QuestionsController < ApplicationController
	include ApplicationHelper
	include QuestionsHelper

	load_and_authorize_resource

	def index
		authorize! :manage, @questions
		@questions = Question.all
	end

	def show
		@question = Question.find_by(id: params[:id])
		@answers = select_random(@question.answers)
	end

	def new
		@question = Question.new
		@categories_name = Category.all.collect {|p| [p.name, p.id]}
		2.times {@question.answers.build}
	end

	def create
		@question = Question.new(question_params)
		@question.save
		2.times do |index|
			answer = Answer.new(answer_params[:answers_attributes][index])
			answer.question_id = @question.id
			answer.save
			uploader = AvatarUploader.new(answer)
			uploader.store!(answer.avatar)
		end
	end

	def answer
		@question = Question.find_by(id: params[:question_id])
		@answer = Answer.find_by(id: params[:l_or_r])
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
		@question = Question.find_by(id: params[:question_id])
		@question.star += 1
		@question.save
		respond_to do |format|
			format.html {}
			format.js {}
		end
	end

	def next
		@category = Question.find_by(id: params[:question_id]).category
		@questions = @category.questions

		@next_question = select_random(@questions, 1)
		redirect_to question_path(@next_question)
	end

	def destroy
		@question = Question.find_by(id: params[:id])
		@question.destroy
		redirect_to questions_path
	end

	private
	def render_index
		if admin?
			render 'questions/_admin_index'
		else
			render 'questions/_user_index'
		end
	end

	def question_params
		params.require(:question).permit(:category_id, :content)
	end

	def answer_params
		params.require(:question).permit(answers_attributes: [:content, :avatar])
	end
end
