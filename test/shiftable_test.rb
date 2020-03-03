require "./test/test_helper"
require "./lib/modules/shiftable"

class DummyEnigma
  include Shiftable

end

class ShiftableTest < Minitest::Test

  def test_key_shifts
    dummy = DummyEnigma.new

    keys = [
      12,
      23,
      34,
      45
    ]

    assert_equal keys, dummy.key_shifts("12345")
  end

  def test_offset_shifts
    dummy = DummyEnigma.new

    offsets = [
      0,
      4,
      0,
      0
    ]

    assert_equal offsets, dummy.offset_shifts("03022020")
  end

  def test_find_shifts
    dummy = DummyEnigma.new

    shifts = [
      20,
      27,
      34,
      45
    ]

    assert_equal shifts, dummy.find_shifts("12345", "030220")
  end
end
