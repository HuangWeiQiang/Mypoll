class Category < ApplicationRecord
	mount_uploader :image, CategoryAvatarUploader
	has_many :questions
end
