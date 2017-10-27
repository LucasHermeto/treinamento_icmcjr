class Restaurant
	def initialize(name)
		puts "Criando um novo restaurante: #{name}"
		@@total ||= 0
		@@total = @@total + 1
		Restaurant.report
		@name = name
	end

	#Self ediferente de static em java
	class << self
		def report
			puts "Foram criados #{@@total} restaurantes"
		end
	end
end

r1 = Restaurant.new('Aleluia')
r2 = Restaurant.new('Cu do padre')
