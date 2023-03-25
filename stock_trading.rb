# "First, I wanna know how much money I could have made yesterday if I'd been trading Apple stocks all day.
#
# So I grabbed Apple's stock prices from yesterday and put them in an array called stock_prices, where:
#
# The indices are the time (in minutes) past trade opening time, which was 9:30am local time.
# The values are the price (in US dollars) of one share of Apple stock at that time.
# So if the stock cost $500 at 10:30am, that means stock_prices[60] = 500.
#
# Write an efficient method that takes stock_prices and returns the best profit I could have made from one purchase and one sale of one share of Apple stock yesterday.
#
# For example:
#
#   stock_prices = [10, 7, 5, 8, 11, 9]
#
#   get_max_profit(stock_prices)
#   # returns 6 (buying for $5 and selling for $11)
#
#   Ruby
#   No "shorting"—you need to buy before you can sell. Also, you can't buy and sell in the same time step—at least 1 minute has to pass."

stock_prices = [9, 7, 4, 1]

def get_max_profit(stock_prices)
  raise('Error') if stock_prices.length <= 1

  profit_array = []

  # matrix design
  stock_prices.each_with_index do |buying_price, index|
    (index + 1).upto(stock_prices.length - 1) do |inner_time|
      selling_price = stock_prices[inner_time]
      profit_array << (selling_price - buying_price)
    end
  end

  profit_array.max
end

def get_max_profit_refactored(stock_prices)
  raise('Error') if stock_prices.length <= 1

  min_price = stock_prices[0]
  max_profit = stock_prices[1] - min_price

  stock_prices.each_with_index do |current_price, index|
    next if index.zero?

    potential_profit = current_price - min_price

    max_profit = [max_profit, potential_profit].max

    min_price = [min_price, current_price].min
  end

  max_profit
end
# ((index + 1)...stock_prices.length
get_max_profit_refactored(stock_prices)
