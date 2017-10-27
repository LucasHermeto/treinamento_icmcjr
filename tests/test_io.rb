require 'net/http'

print "Escreva um texto: "
text = gets
File.open("names.txt", "w") do |f|
	f << text
end
=begin
Dir.entries("names").each do |file_name|
	idea = File.read(file_name)
	puts idea
end
=end

Net::HTTP.start('www.caelum.com.br', 80) do |http|
	#print(http.get('/').body)
end
