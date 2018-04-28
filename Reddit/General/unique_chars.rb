def unique_chars(str)
  seen = []

  str.each_char do |char|
    return false if seen.include? char
    seen << char
  end
  true
end

p unique_chars("abcdefg") == true
p unique_chars("hello") == false


