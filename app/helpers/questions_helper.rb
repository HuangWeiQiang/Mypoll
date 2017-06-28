module QuestionsHelper
	def select_random(obj, limit = 2)
		return obj.shuffle[0...limit]
	end
end
