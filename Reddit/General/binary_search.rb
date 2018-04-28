def bsearch_recursive_helper(val, arr, left, right)
  mid = (left + right) / 2
  return -1 if left > right
  return mid if val == arr[mid]

  if val > arr[mid]
    left = mid + 1
  else
    right = mid - 1
  end

  bsearch_recursive_helper(val, arr, left, right)
end

def bsearch(val, arr)
  bsearch_recursive_helper(val, arr, 0, arr.length - 1)
end

p bsearch(4, [1,2,3,4,5]) == 3
p bsearch(4, [1,2,3,5,6,7,8]) == -1
