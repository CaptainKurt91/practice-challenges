require 'minitest/autorun'

def flibbing_bits(n)
  binary = n.to_s(2)
  binary_array = binary.split("")
  diff = binary_array.count
  num = 32 - diff
  num.times {binary_array.insert(0, "0")}
  binary = binary_array.map {|n| n = n == "0" ?  1 :  0}
  binary.join.to_i(2)
end

class FlippingBitsTest < MiniTest::Test
  def test_flipping_bits_nine
    n = 9
    expected_result = 4294967286
    result = flibbing_bits(n)
    assert_equal expected_result, result
  end
end
