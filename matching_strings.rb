require 'minitest/autorun'

def matching_strings(strings, queries)
  results = []
  queries.each do |query|
    match = 0
    strings.each do |str|
      match += 1 if query == str
    end
    results << match
  end
  results
end

class MatchingStringsTest < MiniTest::Test
  def test_matching_string1
    strings = ['ab','ab', 'abc']
    queries = ['ab', 'abc', 'bc']
    expected_result = [2, 1, 0]
    result = matching_strings(strings, queries)
    assert_equal expected_result, result
  end

  def test_matching_string2
    strings = ['4', 'aba', 'baba', 'aba', 'xzxb', '3', 'aba', 'xzxb', 'ab']
    queries = ['xzxb', 'ab', 'bc']
    expected_result = [2, 1, 0]
    result = matching_strings(strings, queries)
    assert_equal expected_result, result
  end
end
