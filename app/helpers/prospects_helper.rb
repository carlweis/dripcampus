module ProspectsHelper
	def score_color(score)
		if score > 300
			'score-high'
		elsif score > 100
			'score-medium'
		else
			'score-low'
		end
	end
end
