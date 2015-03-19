# Recursive

def post_order_recursive(node)
	return unless node
	post_order_recursive(node.left)
	post_order_recursive(node.right)
	# visit(node)
end


# Iterative

def post_order_iterative(node)
	parent_stack = []
	last_visited = nil

	while !node.nil? || !parent_stack.empty?
		if node
			parent_stack << node
			node = node.left
		else
			peek_node = parent_stack.last
			if !peek_node.nil? && last_visited != peek_node.right
				node = peek_node.right
			else
				# visit (peek_node)
				last_visited = parent_stack.pop
			end
		end
	end
end