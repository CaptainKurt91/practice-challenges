require 'minitest/autorun'
# def program_contest(ratings)
#   bais_array = []
#   ratings.each do |n1|
#     p n1
#     ratings.each do |n2|
#       next if ratings
#     end
#   end
# end

def program_contest(ratings)
  bias = 0
  until ratings.empty?
    ratings.sort!
    a, b = ratings.pop(2) # pop returns the element being removed from the array
    bias += b - a
  end
  bias
end

ratings = [4, 2, 5, 1]

program_contest(ratings)

class ProgramContestTest < MiniTest::Test
  def test_program
    ratings = [4, 2, 5, 1]
    expected_result = 2
    result = program_contest(ratings)
    assert_equal expected_result, result
  end
end
