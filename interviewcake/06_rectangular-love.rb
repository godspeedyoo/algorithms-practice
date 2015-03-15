# A crack team of love scientists from OkEros (a hot new dating site) have devised a way to represent dating profiles as rectangles on a two-dimensional plane.
# They need help writing an algorithm to find the intersection of two users' love rectangles. They suspect finding that intersection is the key to a matching algorithm so powerful it will cause an immediate acquisition by Google or Facebook or Obama or something.

# It must
# be love
# Write a function to find the rectangular intersection of two given love rectangles.

# Love rectangles are defined as hash maps ↴ like this:

#   my_rectangle = {

#     # coordinates of bottom-left corner:
#     'x': 1, 
#     'y': 5, 

#     # width and height
#     'width': 10,
#     'height': 4,

#     }
# Your output rectangle should use this format as well.

# second rectangle coordinates must be
# check if it intersects at all based on x coords
# x <= x_2 <= (x + width) 
# or
# x <= (x_2 + width_2) <= (x + width)

	rect_1 = {
		x: 1, 
		y: 5, 
		w: 10,
		h: 4,
		}

	# x_range = rect_1[:x]..rect_1[:x + :w]
	# x_range = [1,11]

	rect_2 = {
		x: 7,
		y: 3,
		w: 5,
		h: 10
	}

	def find_range_overlap(coord_1, width_1, coord_2, width_2)
		highest_start = [coord_1, coord_2].max
		lowest_end = [(coord_1 + width_1), (coord_2 + width_2)].min 
		# if there is no overlap
		return nil if highest_start >= lowest_end

		overlap_width = lowest_end - highest_start
		return [highest_start, overlap_width]

	end
	# x2_range = rect_2[:x]..rect_2[:x + :w]
	# x2_range = [7,12]

	# # check if one x_range lies within the other
	# # if second rect's beginning x lies within first AND
	# # second rect's ending x is outside
	# if (x2_range[0] <= x_range[1] 
	# 	&& x2_range[0] >= x_range[0]
	# 	&& x2_range[1] > x_range[1])

	# 	intersection_rect[:x] = rect_2[:x]
	# 	# the width of intersection should be the difference between
	# 	# the x coordinate and greater of the two bottom right x coord
	# 	intersection_rect[:w] = [(rect_1[:x] + rect_1[:w]),
	# 														(rect_2[:x] + rect_2[:w])].max - intersection_rect[:x]
	# end
	# # if second rect's end x lies within first
	# # AND second rect's first x is outside

	# if (x2_range[1] <= x_range[1] 
	# 	&& x2_range[1] >= x_range[0]
	# 	&& x2_range[0] < x_range[0])

	# 	intersection_rect[:x] = rect_1[:x]
	# 	intersection_rect[:w] = [(rect_1[:x] + rect_1[:w]),
	# 														(rect_2[:x] + rect_2[:w])].min - intersection_rect[:x]
	# end

	# # check if both x beginning and end lie within first rect
	# # beginning check
	# if (x2_range[0] <= x_range[1]
	# 	&& x2_range[0] >= x_range[0]
	# # end check
	# 	&& x2_range[1] <= x_range[1]
	# 	&& x2_range[1] >= x_range[0])
	# 	intersection_rect[:x] = rect_2

	# x_overlap = [(11-7),(1-12)]