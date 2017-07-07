class User < ApplicationRecord
  rolify
	has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	mount_uploader :avatar, AvatarUploader

  after_create do |user|
		user.add_role :user
  end

	before_destroy do |user|
		user.comments.destroy_all
	end
end
