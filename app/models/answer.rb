class Answer < ApplicationRecord
	belongs_to :question
	has_many :comments
	mount_uploader :avatar, AvatarUploader

	validates :content, presence: true
	validates :avatar, presence: true
	before_destroy do |answer|
		answer.comments.destroy_all
	end
end
