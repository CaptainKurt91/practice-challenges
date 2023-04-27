require "minitest/autorun"
def birthday(segments, day, month)
    count = 0
    # This sets the range of the iteration. Minus month to have enough elements in the array
    # for the sub array
    (0..segments.length - month).each do |i| 
    # adding month to the index creates the end range of the sub array
    count += 1 if segments[i...(i + month)].sum == day    
   end
   count
end 
class BirthdayTest < MiniTest::Test
    def test_birthday_one
        segments = [4] 
        day = 4
        month = 1
        expected_result = 1
        result = birthday(segments, day, month)
        assert_equal expected_result, result
    end 

    def test_birthday_two
        segments = [1, 2, 1, 3, 2] 
        day = 3
        month = 2
        expected_result = 2
        result = birthday(segments, day, month)
        assert_equal expected_result, result
    end 

    # write test for birtday
    
end 