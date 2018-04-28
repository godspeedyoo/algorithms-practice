ROMAN_TABLE = {
  'I'=> 1,
  'V'=> 5,
  'X'=> 10,
  'L'=> 50,
  'C'=> 100,
  'D'=> 500,
  'M'=> 1000
}

def to_roman_numeral int
end
  

def from_roman_numeral str
  total = 0
  prev_val = ROMAN_TABLE[str[0]]
  temp_total = prev_val
  return temp_total if str.length == 1

  str.chars.each_with_index do |char, index|
    char = char.upcase
    if index == 0
      prev_val = ROMAN_TABLE[char]
      next
    end
    current_val = ROMAN_TABLE[char]
    if prev_val == current_val
      temp_total += current_val
    elsif prev_val < current_val
      temp_total = current_val - prev_val
    elsif prev_val > current_val
      total += temp_total
      temp_total = current_val
    end

    prev_val = current_val
  end
  total += temp_total
end

def from_roman_numeral_recursive str
  
end

def convert_roman input
  return from_roman_numeral(input) if input.class == String
end
# if value is same as next, add to an accumulator
# if value is lower than next, subtract current accumulator from next value
#   if subtract occurs, add it to total value
# repeat 1/2
p convert_roman("III") == 3
p convert_roman("IX") == 9
p convert_roman("XXXIX") == 39
p convert_roman("XIX") == 19
p convert_roman("XXIV") == 24
p convert_roman("XLIII") == 43
p convert_roman("ID") == 499
