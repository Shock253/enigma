module Shiftable
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
end
