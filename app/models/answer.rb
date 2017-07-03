class Answer < ApplicationRecord
	belongs_to :question
	has_many :comments
	mount_uploader :avatar, AvatarUploader
end
