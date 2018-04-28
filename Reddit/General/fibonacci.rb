def fib_iterative(n)
  sequence = [0, 1]
  prev_prev_index = 0
  prev_index = 1
  return sequence[n] if n <= 1

  (n - 1).times do
    sequence << sequence[prev_index] + sequence[prev_prev_index]
    prev_index += 1
    prev_prev_index += 1
  end

  sequence[n]
end

def fib_recursive(n)
  return 0 if n <= 0
  return 1 if n == 1
  num = fib_recursive(n - 1) + fib_recursive(n - 2)
end
# 0 1 1 2 3 5

p fib_iterative(6) == 8

p fib_recursive(6) == 8
