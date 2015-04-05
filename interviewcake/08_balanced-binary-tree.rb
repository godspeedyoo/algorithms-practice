# Write a function to see if a binary tree ↴ is "superbalanced" (a new tree property we just made up).

def is_balanced? root
	return if root.nil?
	depths = []
	node_stack = []
	node_stack << [root, 0]

	while !node_stack.empty?
		node, depth = node_stack.pop
		# if node is a leaf, store its depth
		if node.left.nil? && node.right.nil?
			depths << depth if !depths.include? depth
			return false if (depths.size > 2) || 
											((depths[0] - depths[1]).abs > 1)
		else
			node_stack << [node.left, depth + 1] if node.left
			node_stack << [node.right, depth + 1] if node.right
		end
	end

	return true
end


