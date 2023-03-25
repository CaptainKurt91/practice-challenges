require 'minitest/autorun'

def panagrams(str)
  letters = ('a'..'z').to_a
  str_arr = str.split('')
  count = 26
  letters.each do |e|
    count -= 1 if str_arr.find { |x| x.downcase == e }
  end
  count == 0 ? 'pangram' : 'not pangram'
end

class PanagramsTest < MiniTest::Test
  def test_panagrams
    str = 'We promptly judged antique ivory buckles for the next prize'
    expected_result = 'pangram'
    result = panagrams(str)
    assert_equal expected_result, result
  end

  def test_not_panagrams
    str = 'We promptly judged antique ivory buckles for the prize'
    expected_result = 'not pangram'
    result = panagrams(str)
    assert_equal expected_result, result
  end
end
