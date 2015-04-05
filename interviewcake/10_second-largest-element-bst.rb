# Write a function to find the 2nd largest element in a binary search tree

def find_second_largest root
	return nil unless root

	current_node = root
	parent_stack = []
	# traverse to find max int (right most)
	until current_node.right.nil?
		parent_stack << current_node
		current_node = current_node.right
	end
	# current_node is now the max value of tree
	# now check for a left subtree, otherwise return parent
	current_node = current_node.left if current_node.left

	# if left subtree exists, travers right to find the second largest value
	until current_node.right.nil?
		current_node = current_node.right
	end
	
	current_node
end