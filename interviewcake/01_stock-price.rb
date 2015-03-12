# I have an array stock_prices_yesterday where:

# The indices are the time, as a number of minutes past trade opening time, which was 9:30am local time.
# The values are the price of Apple stock at that time, in dollars.
# For example, the stock cost $500 at 10:30am, so stock_prices_yesterday[60] = 500.

# Write an efficient algorithm for computing the best profit I could have made from 1 purchase and 1 sale of 1 Apple stock yesterday. For this problem, we won't allow "shorting"—you must buy before you sell.

def most_profit(stock_prices)
	
	max_profit = 0
	min = stock_prices.first
	

	i = 1
	while i < stock_prices.length
		min = stock_prices[i] if stock_prices[i] < min
		max_profit = [max_profit,(stock_prices[i] - min)].max
		i += 1
	end	
	return max_profit
end
