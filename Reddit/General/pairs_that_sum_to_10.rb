def solve(ints)
  ints.sort!
  pairs = []
  left = 0
  right = ints.length - 1

  while left < right
    current_sum = ints[left] + ints[right]
    if current_sum == 10
      pairs << [ints[left], ints[right]]
      left += 1
      right -= 1
    elsif current_sum < 10
      left += 1
    elsif current_sum > 10
      right -= 1
    end
  end

  pairs
end

p solve([1,4,9,6,7,8,10,2]) == [[1,9], [2,8], [4,6]]

