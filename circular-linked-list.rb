# find the beginning node of a circular linked list

def find_beginning(head)
	# returns nil if head does not exist
	return nil unless head
	
	# set up two pointers that move at rates 1 and 2 nodes per iteration
	slow = head
	fast = head



	# loop while linked list continues and find where they meet
	while fast && fast.next
		slow = slow.next
		fast = fast.next.next
		break if slow == fast
	end

	return nil unless fast && fast.next

	# move slow pointer back to head, expect the meeting point to be beginning of loop
	slow = head
	while slow != head
		slow = slow.next
		fast = fast.next
	end

	return fast

end