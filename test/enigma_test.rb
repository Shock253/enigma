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
end
