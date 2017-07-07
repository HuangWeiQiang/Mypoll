class CategoriesController < ApplicationController
	include ApplicationHelper
	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		@category.state = 1
		if @category.save
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def index
		@categories = Category.all
		render_index
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		@category.update(category_params)
		@category.save
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
	end

	private
	def render_index
		if admin?
			render 'categories/_admin_index'
		else
			render 'categories/_user_index'
		end
	end

	def category_params
		params.require(:category).permit(:name, :image)
	end
end
