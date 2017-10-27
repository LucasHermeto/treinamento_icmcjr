class Franchise
	def info
		puts "Restaurante faz parte da franquia"
	end
end

class Restaurant < Franchise
	def info
		super
		puts "Restaurante Fasano"
	end
end

def notify(franchise)
	franchise.info
end

r = Restaurant.new
notify r
