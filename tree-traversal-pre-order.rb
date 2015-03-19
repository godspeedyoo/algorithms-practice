# Recursive
def pre_order_recursive(node)
	return unless node
	# visit(node)
	pre_order_recursive(node.left)
	pre_order_recursive(node.right)
end


# Iterative
def pre_order_iterative(node)
	parent_stack = []
	while !node.nil? || !parent_stack.empty?
		if node
			# visit(node)
			parent_stack << node.right if node.right
			node = node.left
		else
			node = parent_stack.pop
		end
	end
end