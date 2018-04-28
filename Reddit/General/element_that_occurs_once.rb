arr = [1,5,2,3,2,3,1]

def solve(arr)
  return -1 if arr.length == 0
  num = 0
  arr.each do |int|
    num ^= int
  end
  num
end

p solve(arr)