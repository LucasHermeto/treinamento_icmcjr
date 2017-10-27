class Pessoa
	attr_accessor :name

	def initialize(name)
		@name = name
		puts "Criando pessoa: #{name}"
	end

	def == (another)
		@name == another
	end


=begin
	def self.walk
		puts "Andando"
	end
=end
	class << self
		def walk
			puts "andando"
		end
	end

	private
	def go_bathroom
		puts "Estou indo para o banheiro"
	end

	public
	def public_method
		puts "Only a test"
	end
end

puts Pessoa.walk
p = Pessoa.new("Lucas")
#p.walk
#=> undefined method `anda'

if (p == "Felipe")
	puts "Mesma pessoa"
elsif 
	puts "Pessoas diferentes"
end

#Poliformismo
class Animal
	def eat
		"comendo"
	end
end

class Duck < Animal
	def quack
		"Quack!"
	end
end

duck = Duck.new
puts duck.eat
puts duck.quack


#Metaprogramming
class Student
end

class Teacher
	def teach(student)
		def student.write
			"Sei Escrever!"
		end
	end
end

juca = Student.new
puts juca.respond_to? :write
teacher = Teacher.new
teacher.teach juca
puts juca.write
