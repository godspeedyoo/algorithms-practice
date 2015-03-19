# Recursive
def in_order_recursive(node)
	return unless node
	in_order_recursive(node.left)
	# visit(node)
	in_order_recursive(node.right)
end

# Iterative 
def in_order_iterative(node)
	parent_stack = []
	while !node.nil? || !parent_stack.empty?
		if node
			parent_stack << node
			node = node.left
		else
			node = parent_stack.pop
			# do something/visit node
			node = node.right
		end
	end
end