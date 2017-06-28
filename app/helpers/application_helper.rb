module ApplicationHelper
	def admin?
		user = User.find_by(id: session['user_id'])
		return (user && (user.level > 0))
	end
end
