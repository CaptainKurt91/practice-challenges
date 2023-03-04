require "minitest/autorun"

# how long the string would be and matches to the orthers strings in the array

def compare_anagrams(a, b)
  a.chars.sort == b.chars.sort
end

def anagrams(array)
  result = []
  array.each do |word|
    unless result.find { |element| compare_anagrams(element, word) }
      result << word
    end
  end
  result.sort
  # anagram of word is !== to words in the result array push word into array
end

class AnagramTest < MiniTest::Test
  def test_anagram
    str = ['code', 'doce', 'ecod', 'framer', 'frame']
    expected_result = ["code", "frame", "framer"]
    result = anagrams(str)
    assert_equal expected_result, result
  end
end
