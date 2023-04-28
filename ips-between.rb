require 'minitest/autorun'

def ips_between(start, finish)
  start_array = start.split(".")
  finish_array = finish.split(".")
  
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
