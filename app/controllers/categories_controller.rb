class CategoriesController < ApplicationController
	include ApplicationHelper
	def index
		@categories = Category.all
		render_index
	end
	private
	def render_index
		if admin?
			render 'categories/_admin_index'
		else
			render 'categories/_user_index'
		end
	end
end
