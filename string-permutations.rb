def all_permutations(str)
  return nil unless str
  return str if str.length == 1
  return ["#{str[0]}#{str[1]}", "#{str[1]}#{str[0]}"] if str.length == 2

  last_char = str[-1]
  letters = str[0...-1]

  result = []
  permutations_without_last_char = all_permutations(letters)
  puts "permutations_without_last_char: #{permutations_without_last_char}"
  permutations_without_last_char.each do |perm|
    puts "perm: #{perm}"
    0.upto(perm.length) do |position_index|
      temp = perm.dup
      new_permutation = temp.insert(position_index, last_char)
      puts "new perm: #{new_permutation}"
      result << new_permutation
    end
  end
  result.uniq
end

p all_permutations('a') === 'a'
p all_permutations('ab') === ['ab', 'ba']
p all_permutations('abc')
p all_permutations('abcd').length
p all_permutations('abcdeal').length
