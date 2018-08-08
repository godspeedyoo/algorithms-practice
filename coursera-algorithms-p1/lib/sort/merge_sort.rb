class MergeSort
  def sort(arr)
    left_array = arr[0...(arr.length / 2)]
    right_array = arr[(arr.length / 2)..-1]

    return left_array if right_array.empty?
    return right_array if left_array.empty?
    puts "sort left: #{left_array}, right: #{right_array}"
    merge(sort(left_array), sort(right_array))
  end

  private

  def merge(left_array, right_array)
    # puts "called merge with #{left_array}, #{right_array}"
    result = []

    until left_array.empty? && right_array.empty? do
      # puts "result is #{result}"
      # puts "left: #{left_array}, right: #{right_array}"
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

    result
  end
end
