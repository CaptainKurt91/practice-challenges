require 'minitest/autorun'

def time_conversion(str)
  arr = str.split(':')
  hour = arr[0]
  arr.delete_at(0)
  hour.include?('12') ? midnight_or_noon?(s, arr) : to_24hr_time(hour, s, arr)
  arr.join(':').gsub(/[APM]/, '')
end

def to_24hr_time(hour, str, arr)
  hour = str.include?('AM') ? hour.to_i : hour.to_i + 12
  hour >= 10 ? arr.insert(0, hour.to_s) : arr.insert(0, "0#{hour}")
end

def midnight_or_noon?(str, arr)
  if str.include?('AM')
    arr.insert(0, '00')
  else
    arr.insert(0, '12')
  end
end

class TimeConversionTest < MiniTest::Test
  def test_conversion_am
    str = '06:40:03AM'
    expected_result = '06:40:03'
    result = time_conversion(str)
    assert_equal expected_result, result
  end

  def test_conversion_pm
    str = '07:05:45PM'
    expected_result = '19:05:45'
    result = time_conversion(str)
    assert_equal expected_result, result
  end

  def test_conversion_midnight
    str = '12:40:22AM'
    expected_result = '00:40:22'
    result = time_conversion(str)
    assert_equal expected_result, result
  end

  def test_conversion_noon
    str = '12:45:54PM'
    expected_result = '12:45:54'
    result = time_conversion(str)
    assert_equal expected_result, result
  end
end

# def time_conversion(s)
#   arr = s.split(':')
#   hour = pm?(s) ? arr[0].to_i + 12 : midnight(s)
#   arr.delete_at(0)
#   if hour >= 24
#     arr.insert(0, "00")
#   elsif hour >= 10 && hour <= 23
#     arr.insert(0,"#{hour}")
#   else
#     arr.insert(0,"0#{hour}")
#   end
#   # arr.insert(0, "00") if hour >= 24 || hour == 12
#   # arr.insert(0,"0#{hour}") if hour <= 9
#   # arr.insert(0,"#{hour}") if hour >= 10 && hour <= 23
#   arr.join(":").gsub(/[APM]/, '')
# end
#
# def pm?(string)
#   string.include?("PM") && !(string.include "12")
# end
#
# def midnight(string)
#   arr = string.split(':')
#   if string.include?("AM")
#     0
#   else
#     arr[0].to_i
#   end
# end
