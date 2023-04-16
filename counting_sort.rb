# frozen_string_literal: true

require 'minitest/autorun'

def count_sort(arr)
  hash = arr.reduce({}) { |k, v| k[v] ||= 0; k[v] += 1; k }
  freqency_arr = Array.new(100) { 0 }
  freqency_arr.map.with_index { |_k, v| hash[v] ? hash[v] : 0 }
end

# freqency_arr.each_with_index do |e, i|
# freqency_arr[i] = (arr.find_all { _1 == i }).count # Finds all occurences of the number matching the index creating an arr then counts it
# end

class CountSortTets < MiniTest::Test
  def test_count_sort
    arr = [63, 25, 73, 1, 98, 73, 56, 84, 86, 57, 16, 83, 8, 25, 81, 56, 9, 53,
           98, 67, 99, 12, 83, 89, 80, 91, 39, 86, 76, 85, 74, 39, 25, 90, 59,
           10, 94, 32, 44, 3, 89, 30, 27, 79, 46, 96, 27, 32, 18, 21, 92, 69,
           81, 40, 40, 34, 68, 78, 24, 87, 42, 69, 23, 41, 78, 22, 6, 90, 99,
           89, 50, 30, 20, 1, 43, 3, 70, 95, 33, 46, 44, 9, 69, 48, 33, 60, 65,
           16, 82, 67, 61, 32, 21, 79, 75, 75, 13, 87, 70, 33]
    expected_result = [0, 2, 0, 2, 0, 0, 1, 0, 1, 2, 1, 0, 1, 1, 0, 0, 2, 0, 1,
                       0, 1, 2, 1, 1, 1, 3, 0, 2, 0, 0, 2, 0, 3, 3, 1, 0, 0, 0,
                       0, 2, 2, 1, 1, 1, 2, 0, 2, 0, 1, 0, 1, 0, 0, 1, 0, 0, 2,
                       1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 2, 1, 3, 2, 0, 0, 2, 1, 2,
                       1, 0, 2, 2, 1, 2, 1, 2, 1, 1, 2, 2, 0, 3, 2, 1, 1, 0, 1,
                       1, 1, 0, 2, 2]
    result = count_sort(arr)
    assert_equal expected_result, result
  end
end
