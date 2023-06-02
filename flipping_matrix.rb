require 'minitest/autorun'
def flipping_matrix(arr)
  
end

class FlippingMatrixTest < MiniTest::Test
    def test_flipping_matrix
        arr = [[112, 42, 83, 119], [56, 125, 56, 49], [15, 78, 101, 43], [62, 98, 114, 108]]
        expected_result = 414
        result = flipping_matrix(arr)
        assert_equal expected_result, result
    end
end

