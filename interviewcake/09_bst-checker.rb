# Write a function to check that a binary tree is a valid binary search tree

def is_valid? root

	stack = []
	lower_limit = nil
	upper_limit = nil
	stack << [root, lower_limit, upper_limit]

	while !stack.empty?
		node, lower_limit, upper_limit = stack.pop
		
		# Given that nodes are unique integer values
		if lower_limit
			return false if node.value <= lower_limit
		elsif upper_limit
			return false if node.value >= upper_limit
		end

		stack << [node, lower_limit, node.value] if node.left
		stack << [node, node.value, upper_limit] if node.right

	end
	

end