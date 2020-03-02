require "./test/test_helper"
require "./lib/enigma"


class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_key_shifts
    enigma = Enigma.new

    keys = {
      A: 12,
      B: 23,
      C: 34,
      D: 45
    }

    assert_equal keys, enigma.key_shifts("12345")
  end

  def test_offset_shifts
    enigma = Enigma.new

    offsets = {
      A: 0,
      B: 4,
      C: 0,
      D: 0
    }

    assert_equal offsets, enigma.offset_shifts("03022020")
  end

  def test_find_shifts
    enigma = Enigma.new

    shifts = {
      A: 12,
      B: 27,
      C: 34,
      D: 45
    }

    assert_equal shifts, enigma.find_shifts("12345", "03022020")
  end
end
