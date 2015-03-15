class Stack
	def initialize
		@store = Array.new
	end

	def push(item)
		@store.push(item)
		self
	end

	def pop
		@store.pop
	end

	def top
		@store[-1]
	end

	def empty?
		@store.empty?
	end

	def size
		@store.length
	end
end
