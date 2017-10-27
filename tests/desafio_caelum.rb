class Class
	attr_accessor :names

	def initialize(*names)
		@names = []
		names.each do |n|
			@names << n
		end
	end

	def each
		@names.each do |n|
			yield n
		end
	end
end

fj91 = Class.new("Guilherme", "Paulo", "Paniz")

fj91.each do |name|
	puts name
end
