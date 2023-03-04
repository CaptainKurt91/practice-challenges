#games = ['1:0','2:0','3:0','4:0','2:1','3:1','4:1','3:2','4:2','4:3']
#
#def points(games)
#  points = 0
#  games.each do |game|
#    scores = game.split(':')
#    points += 3 if scores[0] > scores[1]
#    points += 1 if scores[0] == scores[1]
#  end
#  points
#end
#
#points(games)
# -----------------------------------------------------------------------------
# RGB to HEX converter

# def rgb(r, g, b)
#   array = [r, g, b]
#   hex = []
#   array.map do |n|
#     if n <= 0
#       hex << '00'
#     elsif n >= 255
#       hex << 'FF'
#     else
#       n <= 15 ? hex << "0#{n.to_s(16)}" : hex << n.to_s(16)
#     end
#   end
#   hex.join.upcase
# end

# Refactored RGB to HEX converter
# In this method are 2 pieces: Firstly, "stringformat"%what_to_format(takes an array as input)
# string format documentation: https://alvinalexander.com/programming/printf-format-cheat-sheet/, https://www.rubyguides.com/2012/01/ruby-string-formatting/
# Secondly, it takes the rgb numbers forcing it to stay within the range of 0 to 255. Example if r is 300 it would return 255 because of #min

# Full break down:
#map to a new array
  # take number, compare it with 255, get the min value
  ### if number is more than 255, 255 will be returned
  ### if number is less than 255, the number will be returned
  # take number, compare it to 0
  ### if number is more than 0, the number will be returned
  ### if number is less than 0, 0 will be returned

  # array = [r, g, b].map { |i| [[i, 255].min, 0].max }

  # you now have an array of valid numbers e.g [16, 16, 16]
  # create a template string and apply it to the array with % (called format_string in ruby docs %[flags][width][.precision]type)
  # template string location corresponds to array location ie template[0] => array[0]
  # %.2X does two things. .2x is converting the corresponding number in the array to hexidecimal with a precision of 2 digits
  # the % is placing it in that spot in the template string
  # the template string filled with the elements is returned

  # '%.2X%.2X%.2X' % array

# def rgb(r, g, b)
#   "%.2X%.2X%.2X" % [r,g,b].map{|i| [[i,255].min,0].max}
# end

# ------------------------------------------------------------------------------

# ROMAN_NUMERALS = {
#  '1000'=> 'M',
#  '900' => 'CM',
#  '500'=> 'D',
#  '400'=> 'CD',
#  '100'=> 'C',
#  '90'=> 'XC',
#  '50'=> 'L',
#  '40' => 'XL',
#  '10'=> 'X',
#  '9' => 'IX',
#  '5' => 'V',
#  '4' => 'IV',
#  '1' => 'I',
# }

# def solution(number)
#   numeral = []
#   remainder = number
#   ROMAN_NUMERALS.each do |n|
#     times = remainder / n[0].to_i
#     remainder = remainder % n[0].to_i
#     times.times {numeral << ROMAN_NUMERALS[n[0]]}
#   end
#   numeral.join
# end

# solution(1234)

# Refactored Roman numeral converter
# Look into recursion

# NUMERALS = { M: 1000, CM: 900, D: 500, CD: 400, C: 100, XC: 90,
#   L: 50, XL: 40, X: 10, IX: 9, V: 5, IV: 4, I: 1 }
#
# def solution(number)
# return '' if number <= 0
# NUMERALS.each { |key, val| return key.to_s + solution(number - val) if number >= val }
# end

# ------------------------------------------------------------------------------

# Narcissistic number is a positive number which is the sum of its own digits.
# Each digit is raised to the power of the number of digits in the number.
# For example, take 153 (3 digits), which is narcisstic:
  # 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153

# and 1652 (4 digits), which isn't:
  # 1^4 + 6^4 + 5^4 + 2^4 = 1 + 1296 + 625 + 16 = 1938

# value = 153
# def narcissistic?(value)
  # value == value.to_s.split('').map {|n| n.to_i ** value.to_s.size}.sum
  # refactored below faster with #chars
  # value == value.to_s.chars.map {|n| n.to_i ** value.to_s.size}.sum
 #end

# narcissistic?(value)

# --------------------------------------------------------------------------------
# first attempt
# def two_sum(numbers, target)
#   numbers.each_with_index do |n, index_a|
#     neg = n - target
#     numbers.each_with_index do |num, index_b|
#       next if index_a == index_b
#       return [index_a, index_b] if -neg == num
#     end
#   end
# end

# refactored
# def two_sum(numbers, target)
# numbers.each_with_index do |n, index_a|
#   numbers.each_with_index do |num, index_b|
#     neg = n - target
#     return [index_a, index_b] if -neg == num && index_a != index_b
#     end
#   end
# end
#
# p two_sum(numbers, target)

# ------------------------------------------------------------------------------
# Ask why below only returns one extra number in the sequence and about local and global varibles with the until statement, as it was returning nil

#  def tribonacci(signature, n)
#    sequence = signature
#    return [] if n == 0
#    return n if n == 1
#    sequence << signature.last(3).sum until sequence.length == n if n > 0
#    sequence
#  end

# # My Solution
# def tribonacci(signature,n)
#   sequence = signature
#   if n > 1
#     until sequence.length == n
#       sequence << sequence.last(3).sum
#     end
#   elsif n == 1
#     return [n]
#   elsif n == 0
#     return []
#   end
#   sequence
# end

# signature = [1, 1, 1]
# n = 2

#  p tribonacci(signature,n)

# Best practice
# Ask how this covers n when is equals 0 or 1
# def tribonacci(signature,n)
#   n.times.map{signature << signature.inject(:+); signature.shift}
# end

# test

# describe "Basic tests" do
#   it "should pass basic tests" do
#     Test.assert_equals(tribonacci([1,1,1],10),[1,1,1,3,5,9,17,31,57,105])
#     Test.assert_equals(tribonacci([0,0,1],10),[0,0,1,1,2,4,7,13,24,44])
#     Test.assert_equals(tribonacci([0,1,1],10),[0,1,1,2,4,7,13,24,44,81])
#     Test.assert_equals(tribonacci([1,0,0],10),[1,0,0,1,1,2,4,7,13,24])
#     Test.assert_equals(tribonacci([0,0,0],10),[0,0,0,0,0,0,0,0,0,0])
#     Test.assert_equals(tribonacci([1,2,3],10),[1,2,3,6,11,20,37,68,125,230])
#     Test.assert_equals(tribonacci([3,2,1],10),[3,2,1,6,9,16,31,56,103,190])
#     Test.assert_equals(tribonacci([1,1,1],1),[1])
#     Test.assert_equals(tribonacci([300,200,100],0),[])
#     Test.assert_equals(tribonacci([0.5,0.5,0.5],30),[0.5,0.5,0.5,1.5,2.5,4.5,8.5,15.5,28.5,52.5,96.5,177.5,326.5,600.5,1104.5,2031.5,3736.5,6872.5,12640.5,23249.5,42762.5,78652.5,144664.5,266079.5,489396.5,900140.5,1655616.5,3045153.5,5600910.5,10301680.5])
#   end
# end
