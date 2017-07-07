module ApplicationHelper
	def admin?
		return false unless is_sign_in?
		user = User.find_by(id: user_id)
		ability = Ability.new(user)
		return ability.can?(:manage, :all)
	end

	def user_id
		is_sign_in? ? session["warden.user.user.key"][0][0] : 1
	end

	def is_sign_in?
		return session["warden.user.user.key"] ? true : false
	end
end
