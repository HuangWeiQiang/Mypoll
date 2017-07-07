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
		initialize_new_question_instance_variables
	end

	def create
		@error_message = {}
		@question = Question.new(question_params)
		@question_error = @question.errors unless @question.save
		2.times do |index|
			answer = Answer.new(answer_params[index])
			answer.question_id = @question.id
			@error_message.merge!({index => answer.errors}) unless answer.save
			uploader = AvatarUploader.new(answer)
			uploader.store!(answer.avatar)
		end



		if @error_message.empty? && @question_error.nil?
			redirect_to categories_path
		else
			@question.destroy
			initialize_new_question_instance_variables(question_params, answer_params)
			render 'new'
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

	def category_questions
		@questions = Category.find(params[:category_id]).questions
		render 'index'
	end

	private
	def question_params
		params.require(:question).permit(:category_id, :content)
	end

	def answer_params
		params.require(:question).permit(answers_attributes: [:content, :avatar])[:answers_attributes]
	end

	def initialize_new_question_instance_variables(question_param = nil, answer_param = [])
		@question = Question.new(question_param)
		@categories_name = Category.all.collect {|p| [p.name, p.id]}
		2.times{|index| @question.answers.build(answer_param[index])}
	end
end
