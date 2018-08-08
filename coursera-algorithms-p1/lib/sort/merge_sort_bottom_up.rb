class MergeSortBottomUp
  class << self
    def sort(arr)
      result = arr.map { |el| [el] }
      size = 1
      # size represents the bottom up approach of the array sizes to combine
      # size is never more than half of arr.length as the final iteration will combine
      # the left half and right half of original array size
      while size < arr.length do
        i = 0
        # reset accumulator to accept new merged sub arrays
        accumulator = []
        while i < arr.length do
          # account for nil array access for i + 1
          if result[i] && result[i + 1]
            accumulator << merge(result[i], result[i + 1])
          elsif result[i]
            accumulator << result[i]
          end
          # move index up by 2 since we are merging first two sub arrays at a time
          i += 2
        end
        # copy new working array per every size bump
        result = accumulator.clone
        size += size
      end
      result.flatten!
    end

    private

    def merge(left_array, right_array)
      puts "called merge with #{left_array}, #{right_array}"
      result = []

      until left_array.empty? && right_array.empty? do
        puts "result is #{result}"
        puts "left: #{left_array}, right: #{right_array}"
        # Default to take from other array if array is empty
        if left_array.empty?
          result << right_array.shift
          next
        elsif right_array.empty?
          result << left_array.shift
          next
        end

        # Take the element with lesser value
        if left_array.first <= right_array.first
          result << left_array.shift
        else
          result << right_array.shift
        end
      end

      puts "returning result: #{result}"
      result
    end
  end
end

# MergeSortBottomUp.sort([1,2])

# [1,2,3,4]
# # while , merge i, i+1
# # size 1
# [[1,2], [3,4]]
# # size 2
# [[1,2,3,4]]
# # flatten
# [1,2,3,4]
