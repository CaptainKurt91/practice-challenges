require 'minitest/autorun'

def lonely_integer(arr)
  arr = arr.map do |x|
    arr.filter do |y|
      y == x
    end
  end
  arr.each do |n|
    return n[0] if n.count == 1
  end
end

class LonelyIntegerTest < MiniTest::Test
  def test_lonely_integer_3doubles
    a = [1, 2, 3, 4, 3, 2, 1]
    expected_result = 4
    result = lonely_integer(a)
    assert_equal expected_result, result
  end

  def test_lonely_integer_double
    a = [0, 0, 1, 2, 1]
    expected_result = 2
    result = lonely_integer(a)
    assert_equal expected_result, result
  end

  def test_lonely_integer_triples
    a = [0, 0, 0, 1, 1, 3, 2, 2, 1]
    expected_result = 3
    result = lonely_integer(a)
    assert_equal expected_result, result
  end
end
