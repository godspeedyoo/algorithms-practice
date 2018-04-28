def solve(ints)
  return nil if ints.length == 0
  seen = {}
  ints.each do |int|
    if seen.has_key? int
      seen[int] += 1 
    else
      seen[int] = 1
    end
  end

  modes = []
  seen.each do |k, v|
    modes << k if v == seen.values.max
  end

  if modes.length == 1
    modes[0]
  else
    modes
  end
end


puts "returns the most frequent integer"
p solve([1,2,3,1]) == 1

puts "returns nil for empty array"
p solve([]) == nil

puts "returns all frequent integers as an array"
p solve([1,4,4,4,3,2,1,1]) == [1,4]