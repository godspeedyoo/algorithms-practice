# Write a function to find the 2nd largest element in a binary search tree

def find_second_largest root
	return nil unless root
	return nil unless root.right || root.left
	parent_stack = []

	# check if there is a right subtree
	if root.right
		current_node = root
		# traverse to find max int (right most)
		until current_node.right.nil?
			parent_stack << current_node
			current_node = current_node.right
		end
		# current_node is now the max value of tree
		# now check for a left subtree, otherwise return parent
		if current_node.left
			current_node = current_node.left
			# if left subtree exists, travers right to find the second largest value
			current_node = find_max current_node
		else
			return parent_stack.pop
		end
	# return second largest within left subtree if left exists and right does not
	elsif root.left && root.right.nil?
		current_node = root.left
		return current_node unless current_node.right
		return find_max current_node
	end
	
end


def find_max node
	until node.right.nil?
		current_node = current_node.right
	end
	current_node
end