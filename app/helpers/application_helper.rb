module ApplicationHelper
	def admin?
		return false unless is_sign_in?
		user = User.find_by(id: session["warden.user.user.key"][0][0])
		ability = Ability.new(user)
		return ability.can?(:manage, :all)
	end

	def is_sign_in?
		return session["warden.user.user.key"] ? true : false
	end
end
