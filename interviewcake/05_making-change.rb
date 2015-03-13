# Imagine you landed a new job as a cashier...
# Your quirky boss found out that you're a programmer and has a weird request about something they've been wondering for a long time.

# Write a function that, given:

# an amount of money
# a list of coin denominations
# computes the number of ways to make amount of money with coins of the available denominations.

# Example: for amount=4 (4¢) and denominations=[1,2,3] (1¢, 2¢ and 3¢), your program would output 4—the number of ways to make 4¢ with those denominations:

# 1¢, 1¢, 1¢, 1¢
# 1¢, 1¢, 2¢
# 1¢, 3¢
# 2¢, 2¢

# O(n * m) solution:
#--------------------------------------------
# class FindChange
# 	def initialize
# 		@memo = {}
# 	end

# 	def change(amount, denominations)
# 		memo_key = [amount, denominations].to_s
# 		if @memo.has_key?(memo_key)
# 			puts "grabbing memo #{memo_key}"
# 			return @memo[memo_key]
# 		end

# 		puts "match found!" if amount == 0
# 		return 1 if amount == 0
# 		return 0 if amount < 0
# 		return 0 if denominations.empty?

# 		puts "checking ways to make #{amount} with #{denominations}"

# 		coin = denominations[0]
# 		rest_of_coins = denominations[1..-1]

# 		possibilities = 0
# 		while amount >= 0
# 			possibilities += change(amount, rest_of_coins)
# 			# puts "Subtracting amount of #{amount} by #{coin}"
# 			amount -= coin
# 		end

# 		@memo[memo_key] = possibilities
# 		return possibilities

# 	end

# end
# x = FindChange.new
# x.change(4, [1,2,3])

def change_bottom_up(amount, denominations)
	ways = Array.new(amount + 1) {0}
	ways[0] = 1

	for coin in denominations
		for higher_amount in [coin..(amount + 1)]
			higher_amount_remainder = higher_amount - coin
			ways[higher_amount] += ways[higher_amount_remainder]

		end
	end
end