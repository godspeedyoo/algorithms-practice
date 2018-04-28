def is_palindrome?(str)
  left = 0
  right = str.length - 1

  while left < right
    return false if str[left] != str[right]
    left += 1
    right -= 1
  end

  true
end

p is_palindrome?("icebox") == false
p is_palindrome?("level") == true