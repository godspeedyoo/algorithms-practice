# Given a sorted array of integers, determine the number of subarrays you can make where the largest number in that subarray is the sum of all the other numbers. 

# For example:
# input [1,2,3,4,6]

# [1,2,3]: 1 + 2 = 3
# [1,3,4]: 1 + 3 = 4
# [2,4,6]: 2 + 4 = 6
# [1,2,3,6]: 1 + 2 + 3 = 6

# so getSubarrays([1,2,3,4,6]) => 4﻿

def get_outcomes(target, integers)
	puts "match found!" if target == 0

	return 0 if target < 0
	return 1 if target == 0
	return 0 if integers.empty?

	outcomes = 0

	# iterate through largest to smallest by attempting to subtract the next largest num
	i = integers.length - 1
	while i > 0
		new_target = target - integers[i - 1]
		rest_of_integers = integers[0..(i - 1)]
		puts "Matching #{new_target} with #{rest_of_integers}"
		outcomes += get_outcomes(new_target, rest_of_integers)
		i -= 1
	end
	outcomes
end


def get_subarrays(integers)
	sub_arrays = 0

	i = integers.length - 1
	while i > 0
		target_num = integers[i]
		rest_of_integers = integers[0..i]

		# pop off the highest num and call get_outcomes
		# call get_outcomes(target_num, rest_of_integers)
		puts "Checking subarrays for #{target_num} with #{rest_of_integers}"
		sub_arrays += get_outcomes(target_num, rest_of_integers)
		i -= 1
	end

	return sub_arrays
end


p get_subarrays([1,2,3,4,6])
