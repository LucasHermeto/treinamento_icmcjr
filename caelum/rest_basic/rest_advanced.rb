#coding: utf-8

class Restaurant 
	attr_accessor :grade
	attr_accessor :name

	def initialize(name)
		puts "Criando um novo restaurante: #{name}"
		@@total ||= 0
		@@total = @@total + 1
		Restaurant.report
		@name = name
	end

	def quality(msg="Obrigado")
		puts "A nota do #{@name} foi #{@grade}. #{msg}"
	end

	def close_account(data)
		puts "Conta fechada no valor de #{data[:value]} " +
		"e com nota #{data[:grade]}. Comentario: "+
		"#{data[:comment]}"
	end

	class << self
		def report
			puts "Foram criados #{@@total} restaurantes"
		end
	end

end

class Franchise
	def initialize
		@restaurants = []
	end

	def add(*restaurants)
		for restaurant in restaurants
			@restaurants << restaurant
		end
	end

	def show
		@restaurants.each do |r|
			puts r.name
		end
	end

	def report
		@restaurants.each do |r|
			yield r
		end
	end

	def method_missing(name, *args)
		@restaurants.each do |r|
			return "O Restaurante #{r.name} já foi cadastrado"
		end
		return "O restaurante #{args[0]} não foi cadastrado ainda."
	end

	def expand(restaurant)
		def restaurant.vips
			puts "Restaurant #{self.name} agora com área VIP!"
		end
	end	
end

restaurant1 = Restaurant.new("Fasano")
restaurant2 = Restaurant.new("Fogo de Chao")

restaurant1.grade = 10
restaurant2.grade = 1

restaurant1.quality
restaurant2.quality('Comida ruim.')

franchise = Franchise.new
franchise.add restaurant1, restaurant2

puts "\n"
franchise.show
puts "\n"

restaurant2.close_account :value => 50, :grade => 9, :comment => "Gostei!"

puts "\n"
franchise.report do |r|
	puts "Restaurante cadastrado: #{r.name}"
end


puts franchise.registered?("Fosano")
puts franchise.registered?("Boteco")

franchise.expand restaurant1
restaurant1.vips

puts franchise.registered?("Fosano")
puts franchise.registered?("Boteco")
