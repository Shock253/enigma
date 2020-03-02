require "./test/test_helper"
require "./lib/enigma"


class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
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
      12,
      27,
      34,
      45
    ]

    assert_equal shifts, enigma.find_shifts("12345", "03022020")
  end

  # def test_can_cipher_message
  #   enigma = Enigma.new
  #
  #   assert_equal "keder ohulw", enigma.cipher("hello world", "12345", "03022020")
  # end
end
