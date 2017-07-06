class Question < ApplicationRecord
	belongs_to :category
	has_many :answers
	accepts_nested_attributes_for :answers
	before_destroy do |question|
		question.answers.destroy_all
	end
end
