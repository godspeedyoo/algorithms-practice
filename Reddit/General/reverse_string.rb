def reverse_iterative(str)
  index = str.length - 1
  reversed_str = ''
  while index >= 0 
    reversed_str += str[index]
    index -= 1
  end
  reversed_str
end

def reverse_recursive(str)
  return str if str.length == 1
  return "" if str.length < 1

  reversed_str = ''
  reversed_str += str[-1] + reverse_recursive(str[0..-2])
end

p reverse_recursive("hello") == "olleh"
p reverse_iterative("hello") == "olleh"

