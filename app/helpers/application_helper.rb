module ApplicationHelper
	def admin?
		user = User.find_by(id: session["warden.user.user.key"][0][0])
		ability = Ability.new(user)
		return ability.can?(:manage, :all)
	end
end
