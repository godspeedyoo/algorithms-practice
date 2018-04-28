require 'set'
# str = "abc"

# ab
# ba

# cab
# cba

# acb
# bca

# abc
# bac

# for each variation of input string without the final letter
# add final letter in each possible position


# combinations = solve(rest_of_letters)



def solve(str)
  return str if str.length == 1
  return [str[0] + str[1], str[1] + str[0]] if str.length == 2

  last_letter, rest_of_letters = str[-1], str[0..-2]

  combinations = Set.new
  possible_positions = (0..rest_of_letters.length)
  combinations_without_last_letter = solve(rest_of_letters)
  combinations_without_last_letter.each do |perm|
    possible_positions.each do |position|
      combinations.add(perm[0...position] + last_letter + perm[position..-1])
    end
  end
  combinations
end



p solve("catt")