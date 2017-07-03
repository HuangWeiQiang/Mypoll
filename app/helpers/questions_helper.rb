module QuestionsHelper
	def select_random(obj, limit = 2)
		random_obj = obj.shuffle[0...limit]
		if limit == 1
			return random_obj[0]
		else
			return random_obj
		end
	end

	def random_question_path(category)
		if category.questions.empty?
			return new_question_path
		else
			return question_path(id: select_random(category.questions, 1).id)
		end
	end
end
