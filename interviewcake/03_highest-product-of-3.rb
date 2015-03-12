# Given an array_of_ints, find the highest_product you can get from three of the integers.
# The input array_of_ints will always have at least three integers. Integers can be negative.
array_of_ints = [1, 10, -5, 1, -100]

def highest_product_of_three(integers)
	highest_3_product = -50
	highest_2_product = 10
	lowest_2_product = -50
	highest = 10
	lowest = -5

	i = 3
	while i < integers.length
		highest_3_product = [highest_3_product, (highest_2_product * integers[i]), (lowest_2_product * integers[i])].max
		if integers[i] * highest > highest_2_product
			highest_2_product = integers[i] * highest
			highest = integers[i] if integers[i] > highest
		elsif integers[i] * lowest < lowest_2_product
			lowest_2_product = integers[i] * lowest
			lowest = integers[i] if integers[i] < lowest
		end
		i += 1
	end

	p highest_3_product

end

highest_product_of_three(array_of_ints)