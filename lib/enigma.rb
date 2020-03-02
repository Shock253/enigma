class Enigma
  def key_shifts(key)
    shifts = []
    key = key.split("")
    key.each_cons(2) do |key_section|
      shifts << key_section.join.to_i
    end
    keys = [:A, :B, :C, :D]
    Hash[keys.zip(shifts)]
  end

  def offset_shifts(date)

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
