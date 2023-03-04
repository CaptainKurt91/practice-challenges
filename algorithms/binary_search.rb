# frozen_string_literal: true

# Log is always log2 meaning it is 2 to the power of n in reference to the Big O notation
# Examples:
# log 8 == 3 (Logarithm) beacuse 2**3 == 8 (Exponentials)
# log 1024 == 10 beacuse 2**10 == 1024

def binary_search(array, item)
  low = 0
  high = array.rindex(array.last) # returns the last index of the array not the element
  while low <= high
    mid = (low + high) / 2
    guess = array[mid]
    return mid if guess == item

    guess > item ? high = mid - 1 : low = mid + 1
    return nil if array.find(item) == false
  end
end
array = (1..256).to_a
p binary_search(array, 256)
# p binary_search(array, -1)
