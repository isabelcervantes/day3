use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

data QTree:
  |question(text :: String, yes :: QTree, no :: QTree)
  |answer(text :: String)
end 

game = question("mammal?",
  answer("whale"),
  question("water?",
    answer("shark"),
    question("rodent?",
   answer("capybara?"),
      answer("bird")
      )
    )
  )
    
data River:
|merge(width :: Number, left :: River, right :: River)
|stream(flow-rate :: Number)
end 

a = stream(10)
b = stream(10)
c = stream(3)
d = stream(3)
e = stream(1)
x = merge(5, a, b)
y = merge(4, x, c)
w = merge(6, d, e)
z = merge(2, w, y)

fun count-merges(rvr :: River) -> Number:
  doc: "counts the number of merges in the river network"
  cases(River) rvr:
    |stream(f) => 0
    |merge(wd, l, r) => 1 + count-merges(l) + count-merges(r)
  end 
where:
  count-merges(z) is 4
  count-merges(w) is 1
end 

fun count-streams(rvr :: River) ->
  Number:
  doc: "counts amount of individual streams that feed into river network"
  cases(River) rvr:
    |stream(f) => 1
    |merge(wd, l, r) => 1 + count-streams(l) + count-streams(r)
  end 
where:
  count-streams(x) is 3
  count-streams(y) is 5  
end 

fun max-width(rvr :: River) -> Number:
  doc: "finds max width among all merge points in river network"
  cases(River) rvr:
    |stream(f) => 0
    |merge(wd, l, r) => 
      num-max(wd, num-max(max-width(1), max-width(r)))
  end 
where:
  max-width(y) is 5
  max-width(z) is 6
end 