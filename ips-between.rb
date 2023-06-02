require 'minitest/autorun'

def ips_between(start, finish)
  start_sum = 0
  finish_sum  = 0
  start_array = start.split(".").reverse
  finish_array = finish.split(".").reverse
  start_array.each_with_index { |n, i| start_sum += n.to_i*256**i }
  finish_array.each_with_index { |n, i| finish_sum += n.to_i*256**i }
  return (start_sum - finish_sum).abs
end

class IpsBetweenTest < Minitest::Test
  def test_ips_between_one
    start = "10.0.0.0"
    finsih = "10.0.0.50"
    expected_result = 50
    result = ips_between(start, finsih)
    assert_equal(expected_result, result)
  end
  def test_ips_between_two
    start = "20.0.0.10"
    finsih = "20.0.1.0"
    expected_result = 246
    result = ips_between(start, finsih)
    assert_equal(expected_result, result)
  end
end
