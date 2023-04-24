require 'minitest/autorun'

def two_arrays(num, arr_a, arr_b)
    arr_a.sort!
    arr_b = arr_b.sort.reverse
    arr_a.each_with_index do |a, i| 
        return "NO" if a + arr_b[i] < num
    end
    return "YES"
end

class TwoArrays < Minitest::Test
  def test_two_arrays_yes
    num = 10
    arr_a = [2, 1, 3]
    arr_b = [7, 8, 9]
    expected_result = "YES"
    result = two_arrays(num, arr_a, arr_b)
    assert_equal(expected_result, result)
  end

  def test_two_arrays_no
    num = 5
    arr_a = [1, 2, 2, 1]
    arr_b = [3, 3, 3, 4]
    expected_result = "NO"
    result = two_arrays(num, arr_a, arr_b)
    assert_equal(expected_result, result)
  end
end