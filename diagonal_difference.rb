require 'minitest/autorun'

# def diagonal_difference(arr)
#   num = Integer.sqrt(arr.count)
#   left_to_right = l_to_r(num, arr)
#   right_to_left = r_to_l(num, arr)
#   (left_to_right.inject(:+) - right_to_left.inject(:+)).abs
# end

# def l_to_r(num, arr)
#   row = 0
#   left_to_right = []
#   num.times do
#     index = row * num + row
#     left_to_right << arr[index]
#     row += 1
#   end
#   left_to_right
# end

# def r_to_l(num, arr)
#   row = 0
#   right_to_left = []
#   num.times do
#     index = (row + 1) * num - (row + 1)
#     right_to_left << arr[index]
#     row += 1
#   end
#   right_to_left
# end

def diagonal_difference(arr)
  num = Math.sqrt(arr.length).to_i
  arr = arr.each_slice(num).to_a
  primary_diagonal_sum = 0
  secondary_diagonal_sum = 0

  arr.each_with_index do |row, index|
    primary_diagonal_sum += row[index]
    secondary_diagonal_sum += row[arr.length - index - 1]
  end
  (primary_diagonal_sum - secondary_diagonal_sum).abs
end

class DiagonalDifferenceTest < MiniTest::Test
  def test_diagonal_difference_3by3
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

  def test_diagonal_difference_ninetynine
    arr = [100, -73, 28, 71, -35, -94, 11, 7, -5, 31, 57, -4, -35, -33, 86, 71, 84, 81, 6, 26, -85, 99, -48, -77, 58,
           77, 64, 34, 37, -72, -47, -94, 60, 12, -23, 81, 63, 52, -76, 23, 62, 11, 17, -98, -96, 66, 18, -52, 63, 16,
           55, -38, 98, 46, 83, 34, -52, 90, -47, -32, 40, 81, -40, -19, 54, 44, -22, 71, 52, 98, 16, -7, 8, -67, -90,
           -15, -19, -60, -13, -37, -79, -19, -3, -17, 52, 98, -80, 96, -1, 73, 60, 96, -22, 68, 68, -27, -37, -50, -100, 65]
    expected_result = 333
    result = diagonal_difference(arr)
    assert_equal expected_result, result
  end
end
