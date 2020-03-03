class Enigma
  attr_reader :alphabet

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def key_shifts(key)
    shifts = []
    key = key.split("")
    key.each_cons(2) do |key_section|
      shifts << key_section.join.to_i
    end
    shifts
  end

  def offset_shifts(date)
    date = date.to_i
    date = date * date
    date = date.to_s
    offset_string = date[-4..-1]
    [
      offset_string[0].to_i,
      offset_string[1].to_i,
      offset_string[2].to_i,
      offset_string[3].to_i
    ]
  end

  def find_shifts(key, date)
    shifts = []

    keys = key_shifts(key)
    offsets = offset_shifts(date)

    keys.each_with_index do |key_shift, index|
      shifts << key_shift + offsets[index]
    end
    shifts
  end

  def cipher(message, key, date, mode)
    shifts = find_shifts(key, date)
    ciphered = ""
    message.split("").each_with_index do |letter, index|
      ciphered << cipher_letter(letter, shifts, index, mode)
    end
    ciphered
  end

  def cipher_letter(letter, shifts, index, mode)
    key = index % 4
    letter_index = alphabet.index(letter)
    if mode == :encrypt
      ciphered_index = (letter_index + shifts[key]) % 27
    elsif mode == :decrypt
      ciphered_index = (letter_index - shifts[key]) % 27
    end
    alphabet[ciphered_index]
  end

  def default_date
    date = Date.today
    date.strftime("%d%m%y")
  end

  def default_key
    key = ""
    5.times do
      key << Random.rand(0..9).to_s
    end
    key
  end

  def encrypt(message, key, date = default_date)
    encrypted = cipher(message, key, date, :encrypt)
    {
      encryption: encrypted,
      key: key,
      date: date
    }
  end
end



# # Find key shifts
# # => without default
# # => with default
#
# # Find offset shifts
# # => without default
# # => with default
#
# # Combine to get shifts
#
# keys = {
#   A: 1,
#   B: 2,
#   C: 3,
#   D: 4
# }
#
# keys = key_shifts(key)
#
# def key_shifts(key)
#   shifts = []
#   key = key.split("")
#   key.each_cons(2) do |key_section|
#     shifts << key_section.join.to_i
#   end
#   keys = [:A, :B, :C, :D]
#   Hash[keys.zip(shifts)]
# end
#
# def offset_shifts(date)
#
# end
#
# def find_shifts(keys, offsets)
#   key shifts + offset shifts
# end
#
# shifts = keys.reduce(Hash.new) do |shifts, keys|
#   shifts[keys[0]] ||= offsets[keys[0]] + keys[1]
# end
#
# # Loop over message and shift by tr(alphabet, alphabet.rotate(key[:key]))
# # cipher(message, mode, key = Random.rand, date)
