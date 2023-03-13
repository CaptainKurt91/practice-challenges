require 'minitest/autorun'

def diagonal_difference(arr)
  num = Integer.sqrt(arr.count)
  row = 0
  left_to_right = []
  num.times do
    index = row * num + row
    left_to_right << arr[index]
    row += 1
  end
  row = 0
  right_to_left = []
  num.times do
    index = (row + 1) * num - (row + 1)
    right_to_left << arr[index]
    row += 1
  end
  diff = left_to_right.inject(:+) - right_to_left.inject(:+)
  diff.negative? ? -diff : diff
end

class DiagonalDifferenceTest < MiniTest::Test
  def test_diagonal_difference_one
    arr = [1, 2, 3, 4, 5, 6, 9, 8, 9]
    expected_result = 2
    result = diagonal_difference(arr)
    assert_equal expected_result, result
  end

  def test_diagonal_difference
    arr = [11, 2, 4, 4, 5, 6, 10, 8, -12]
    expected_result = 15
    result = diagonal_difference(arr)
    assert_equal expected_result, result
  end
end
