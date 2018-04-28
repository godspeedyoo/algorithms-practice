def canonical str
  str.chars.sort
end

def is_anagram? str1, str2
  canonical(str1) == canonical(str2)
end

p canonical "hello"
p is_anagram? "there", "three"