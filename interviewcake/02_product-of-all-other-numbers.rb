# You have an array of integers, and for each index you want to find the product of every integer except the integer at that index.
# Write a function get_products_of_all_ints_except_at_index() that takes an array of integers and returns an array of the products.

# For example, given:

#   [1, 7, 3, 4]
# your function would return:

#   [84, 12, 28, 21]
# by calculating:

#   [7*3*4, 1*3*4, 1*7*4, 1*7*3]
# Do not use division in your solution.

integers = [1, 2, 6, 5, 9]


def product_except_at_index(integers)
	products = Array.new(integers.length){1}

	i = 0
	product_so_far = 1
	while i < integers.length 
		products[i] = product_so_far
		product_so_far *= integers[i]
		i += 1
	end

	i = integers.length - 1
	product_so_far = 1
	while i >= 0
		products[i] *= product_so_far
		product_so_far *= integers[i]
		i -= 1
	end

	p products
end

product_except_at_index(integers)