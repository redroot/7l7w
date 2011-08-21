// Add my own average to list
List myAvg := method(
  sum := 0

  for(i, 0, self size - 1,
    sum = sum + self at(i)
  )
  return (
    sum / self size
  )
)

test := list(1,2,3,4,5)
test myAvg println

"----- Matrix Fun ------" println
Matrix := Object clone do(
  
  master := list()
  
  // other methods
  build := method(x,y,
    temp := list()
    for(i,0,y-1,1,
      temp = list()
      for(j,0,x-1,1,
        temp append(i+j)
      )
      self master append(temp)
    )
  )
  
  get := method(x,y,
    return (
      master at(y-1) at(x-1)
    )
  )
  
  draw := method(
    result := ""
    for(i,0,master size - 1,
      line := ""
      for(j,0,master at(i) size -1,
        line = line .. master at(i) at(j)
      )
      
      result = result .. line .. "\n"
    )
    return(
      result
    )
  )
)

m := Matrix clone

m build(8,2)
m draw println

f := File with("matrix.txt")
f openForUpdating
f write(m draw)
f close

