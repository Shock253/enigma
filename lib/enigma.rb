require_relative "modules/shiftable"
require "date"

class Enigma
  attr_reader :alphabet
  include Shiftable

  def initialize
    @alphabet = ("a".."z").to_a << " "
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
