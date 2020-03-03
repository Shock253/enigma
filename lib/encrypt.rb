require_relative "enigma"

new_file = File.open(ARGV[0], "r")
message = new_file.read.split("\n").join(" ")
new_file.close

enigma = Enigma.new

new_file = File.open(ARGV[1], "w")

encrypted_hash = enigma.encrypt(message)
new_file.write(encrypted_hash[:encryption])
new_file.close

puts "Created '#{ARGV[0]}' with the key #{encrypted_hash[:key]} and date #{encrypted_hash[:date]}"
