module Commentable
	def comments
		@comments ||= []
	end

	def new_comment(comment)
		self.comments << comment
	end
end

class Magazine
	include Commentable
end

m = Magazine.new
m.new_comment("muito ruim!")
puts m.comments
