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

  def encrypt(message, key = default_key, date = default_date)
    encrypted = cipher(message, key, date, :encrypt)
    {
      encryption: encrypted,
      key: key,
      date: date
    }
  end

  def decrypt(message, key, date = default_date)
    decrypted = cipher(message, key, date, :decrypt)
    {
      encryption: decrypted,
      key: key,
      date: date
    }
  end
end
