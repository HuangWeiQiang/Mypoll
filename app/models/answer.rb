class Answer < ApplicationRecord
	belongs_to :question
	has_many :comments
	mount_uploader :avatar, AvatarUploader
	before_destroy do |answer|
		answer.comments.destroy_all
	end
end
