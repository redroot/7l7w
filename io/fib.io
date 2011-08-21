// utility functions

breakln := method("________________" println)

// Fibonacci Sequences

"Fibonacci Sequence -----" println

fib := method(n,
	res := 0
	if(n == 0 or n == 1) then(res = 1) else(
		res = fib(n-1) + fib(n-2)
	)
	return res
)

i := 0
for(i, 1, 11, fib(i) println)

breakln

// Adding all elements in a two dimensional array (list)
"Adding all elements in a two dim array, should be 28" println

twoDim := list(
  list(1,2),
  list(3,4),
  list(5,6,7)
)

j := 0
k := 0
sum := 0
for(j,1,twoDim size, 1,
   for(k,1,twoDim at(j - 1) size,
      sum = sum + twoDim at(j - 1) at(k - 1)
   )
)

"Result is: " .. sum println
