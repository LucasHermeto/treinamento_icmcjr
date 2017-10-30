puts "Hello World!" #Imprime e pula linha
print "Hello World!" #Imprime
p "Hello World!" #Chama o metodo inspect do elemento

=begin
	Eu sou um comentario de blocos e nao sou muito usado
=end

#Pelo uso de inferencia de tipos nao e preciso declarar tipo de variavel
year = 1996 

name = gets
#Interpolacao so funciona com aspas duplas
print "My name is #{name.capitalize}"
# Para manter a funcao capitalize usar bang (!)
print "MY NAME IS #{name.capitalize!}, #{name}!!!\n"

# E póssivel mudar o tipo de valor da variavel
age = 20
age = '20'
name ||= "anonymous" #Se a variavel estiver vazia usar "anonymous"
puts name

puts age.class # Imprime o tipo da variavel

#Concatenacao de string
message = "Good Morning, "
message << "how are you?"
message = message + " I'm fine and you?"
message += " Fine too."

#Operadores aritmeticos
2 + 2
5 - 3
10 / 2 #caso a divisao tenha fracional usar 15.0 / 2
15 * 2
3 ** 2

#Range
list = (1..5).to_a

#Simbolos
# Sao imutaveis e usados como identificadores e para numemclatura (labels)
puts :symble

#Tipos
3.times{
	puts "3 is an object"
}

# Estruturas de controle
variable = nil
if (variable)
	puts "only print if variable != null"
elsif (!variable)
	puts "Now I can be printed!"
end

if (3 == 3)
	puts "3 == 3"
end

def worldCup (year)
	case year
	when 1895..1993
		"I don't care!"
	when 1994
		"EUA :("
	when 1998
		"France"
	end
end

puts worldCup(1994)

for i in (1..3)
	x  = i
	print "#{i} Hey, " 
end
puts "Out of the loop"

#Expressoes regulares
where1 = /rio/ =~ "sao paulo"
where2 = /paulo/ =~ "sao paulo"

print "#{where1} - #{where2}\n"

#Enviando mensagem ao objeto
person = Object.new()

def person.talk()
	"Hello! My name is Jeff"
end
person.send(:talk)

puts "\n"

#Classes
class Person
	def initialize(name="")
		@name = name
	end
	
	#acessor (getter - Java)
	def name
		@name
	end

	#(set - Java)
	def name=(new_name)
		@name = new_name
	end

	def talk()
		puts "Hello!"
	end

	def change(clothe, place='banheiro')
		"Trocando de #{roupa} no #{lugar}"
	end
end

p = Person.new
p.talk
#p.name=("Lucas Hermeto") tambem funciona
#Syntax Sugar
p.name= "Lucas Hermeto"
puts p.name


#Synstax Sugar
#10.+(3) (mesma coisa que 10+3)

#Colecoes
list = Array.new
list << "RR-71"
list << "RR-75"
list << "FJ-91"

puts list.size
puts list[0]

list2 = [1, 2, 'string', :symble, /$regex^/]
puts list2[2]

# Lista de metodos do objeto
# client = "Lucas"
# puts client.methods 


# Multiplo parametros 
def buy(*products) #splat
	puts products.size
end
buy('macbook', 'smartphone', 'shoes')

#Hashes
config = Hash.new
config[:port] = 80
config[:ssh] = false
config[:name] = "icmcjunior.com.br"

puts config.size
puts config[:ssh]

#Usos de hash
class Account
	def transfers(args)
		puts "Enviado #{args[:value]} para #{args[:to]}, #{args[:date]}"
	end
end

student = Account.new
#student.transfers({:to => 'escola', :date => Time.now, :value => 50.00})
student.transfers :to => 'escola', :date => Time.now, :value => 50.00


#Blocos e Programacao funcional
class Bank
	def initialize(bills)
		@bills = bills
	end

	def status
		sale = 0
		for bill in @bills
			sale += bill
			
			if block_given?
				yield(sale)
			end
		end
		puts "Status atualizado"
		sale
	end
end

bank = Bank.new([200, 300, 400])
bank.status

#bank.status {|sale| puts sale}
bank.status do |sale|
	puts sale
end

#Utilizacao de blocos pela biblioteca do Ruby
list3 = ["rails", "rake", "ruby", "rvm"]
list3.each do |program|
	puts program
end

names = ["Lucas", "Marcella"]
upper_names = names.map do |name| 
	name.upcase
end
puts upper_names

caelum = [
	{:ruby => 'rr-71', :java => 'fj-11'},
	{:ruby => 'rr-75', :java => 'fj-21'}
]

puts "Sort 1"
caelum.sort_by {|course| course[:ruby]}.each do |course|
	puts "Curso de RoR na Caelum: #{course[:ruby]}"
end

puts "Sort 2"
caelum.sort_by {|course| course[:ruby]}.each do |course|
	next if course[:ruby] == 'rr-71'
	puts "Curso de RoR na Caelum: #{course[:ruby]}"
end


#Tratamento de erros
print "Digite um número: "
number = gets.to_i

begin
	result = 100 / number
rescue
	puts "Número digitado inválido!"
	exit
end

puts "100/#{number} e #{result}"


def age_verify (age)
	unless age > 18
		raise ArgumentError,
		"Você precisa ser maior de idade para jogar jogos violentos."
	end
end

#age_verify(17)

#Ou
class AgeInsufficientException < Exception
end

def age_verify2 (age)
	raise AgeInsufficientException,
	"Você precisa ser maior de idade..." unless age > 18
end

begin 
	age_verify2(13)
rescue AgeInsufficientException => e
	puts "Foi lançada a exception: #{e}"
end

#Usando throw e catch
def search_bills(name)
	if name.size < 10
		throw :invalid_name, "Nome inválido, digite novamente"
	end

	"client #{name}"
end

def exec_search(name)
	catch :invalid_name do
		client = search_bills(name)
		return client
	end
end

puts exec_search("ana")
puts exec_search("Lucas Hermeto")
