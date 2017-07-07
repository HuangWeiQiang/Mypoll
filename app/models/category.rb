class Category < ApplicationRecord
	mount_uploader :image, CategoryAvatarUploader
	has_many :questions
	validates :name, presence: true
	validates :image, presence: true
	before_destroy do |category|
		category.questions.destroy_all
	end
end
