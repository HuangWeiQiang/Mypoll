class Category < ApplicationRecord
	mount_uploader :image, CategoryAvatarUploader
	has_many :questions
	before_destroy do |category|
		category.questions.destroy_all
	end
end
