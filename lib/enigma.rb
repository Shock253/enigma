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
    date = date.to_i
    date = date * date
    date = date.to_s
    offset_string = date[-4..-1]
    {
      A: offset_string[0].to_i,
      B: offset_string[1].to_i,
      C: offset_string[2].to_i,
      D: offset_string[3].to_i
    }
  end

  def find_shifts(key, date)
    shifts = {}

    keys = key_shifts(key)
    offsets = offset_shifts(date)

    keys.each do |key_section, key_shift|
      shifts[key_section] = key_shift + offsets[key_section]
    end
    shifts
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
