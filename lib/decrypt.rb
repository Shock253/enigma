require_relative "enigma"

new_file = File.open(ARGV[0], "r")
message = new_file.read.split("\n").join(" ")
new_file.close

enigma = Enigma.new

new_file = File.open(ARGV[1], "w")

decrypted_hash = enigma.decrypt(message, ARGV[2], ARGV[3])
new_file.write(decrypted_hash[:decryption])
new_file.close

puts "Created '#{ARGV[1]}' with the key #{decrypted_hash[:key]} and date #{decrypted_hash[:date]}"
