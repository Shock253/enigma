require "./test/test_helper"
require "./lib/enigma"


class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_has_attributes
    enigma = Enigma.new
    assert_equal ("a".."z").to_a << " ", enigma.alphabet
  end

  def test_key_shifts
    enigma = Enigma.new

    keys = [
      12,
      23,
      34,
      45
    ]

    assert_equal keys, enigma.key_shifts("12345")
  end

  def test_offset_shifts
    enigma = Enigma.new

    offsets = [
      0,
      4,
      0,
      0
    ]

    assert_equal offsets, enigma.offset_shifts("03022020")
  end

  def test_find_shifts
    enigma = Enigma.new

    shifts = [
      20,
      27,
      34,
      45
    ]

    assert_equal shifts, enigma.find_shifts("12345", "030220")
  end

  def test_cipher_letter
    enigma = Enigma.new

    shifts = [
      3,
      27,
      73,
      20
    ]

    assert_equal "k", enigma.cipher_letter("h", shifts, 0, :encrypt)
    assert_equal "h", enigma.cipher_letter("k", shifts, 0, :decrypt)
  end


  def test_can_cipher_message
    enigma = Enigma.new

    assert_equal "keder ohulw", enigma.cipher("hello world", "02715", "040895", :encrypt)
    assert_equal "hello world", enigma.cipher("keder ohulw", "02715", "040895", :decrypt)
  end

  def test_default_date
    enigma = Enigma.new

    Date.stubs(:today).returns(Date.new(2020, 02, 03))

    assert_equal "030220", enigma.default_date
  end

  def test_default_key
    enigma = Enigma.new

    Random.stubs(:rand).returns(1, 2, 3, 4, 5)

    assert_equal "12345", enigma.default_key

    Random.stubs(:rand).returns(0, 0, 3, 4, 5)

    assert_equal "00345", enigma.default_key

  end

  def test_can_encrypt_and_default
    enigma = Enigma.new

    message = "hello world"

    encrypted = {
      encryption: "aesch cfklk",
      key: "12345",
      date: "030220"
    }

    assert_equal encrypted, enigma.encrypt(message, "12345", "030220")

    Date.stubs(:today).returns(Date.new(2020, 2, 3))
    Random.stubs(:rand).returns(1, 2, 3, 4, 5)

    assert_equal encrypted, enigma.encrypt(message, "12345")
    assert_equal encrypted, enigma.encrypt(message)
  end

  def test_decryption
    enigma = Enigma.new

    message = "aesch cfklk"
    key = "12345"
    date = "030220"

    decrypted = {
      encryption: "hello world",
      key: "12345",
      date: "030220"
    }

    assert_equal decrypted, enigma.decrypt(message, key, date)

    Date.stubs(:today).returns(Date.new(2020, 02, 03))

    assert_equal decrypted, enigma.decrypt(message, key)

  end
end
