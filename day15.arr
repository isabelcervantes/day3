use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#var my-var = initial-value
#for each(my-elt from my-list):
#code
# to
# handle
# my-elt
# and update
# my-var
#end
#my-var # final result

import lists as L
fun my-sum(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    total := total + n
  end
  total
where:
  my-sum([list: 0, 1, 2, 3]) is 6
end

fun product(num-list :: List<Number>) -> Number block:
  var total = 1
  for each(n from num-list):
    total := total * n
  end 
  total
where:
  product([list: 1, 2, 4]) is 8
end 


fun is-even(n :: Number) -> Boolean:
  num-modulo(n, 2) == 0
where:
  is-even(6) is true
  is-even(3) is false 
end 

fun sum-even-number(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from L.filter(is-even, num-list)):
      total := total + n
  end 
  total 
where:
  sum-even-number([list: 1, 4, 5, 6]) is 10
end 
  
fun my-length(num-list :: List<Number>) -> Number block:
  var total = 0
  for each(n from num-list):
    total := total + 1
  end 
  total
where: 
  my-length([list: 1, 2, 3, 4, 5]) is 5
  my-length([list: 2, 6]) is 2
end 
      
fun any-negative(num-list :: List<Number>) -> Boolean block:
  var result = false
  for each(n from num-list):
    result := result or (n < 0)
  end 
  result
where:
  any-negative([list: 4, 5, -7]) is true
  any-negative([list: 1, 2, 3, 0]) is false
end 

fun all-short-words(string-list :: List<String>) -> Boolean block:
  var result = true
  for each(string from string-list):
    result := result and (string-length(string) <= 4)
  end 
  result
where:
  all-short-words([list: "hi", "poop", "meh"]) is true
  all-short-words([list: "hi", "poop", "knowledge"]) is false
end 

fun reverse-list(num-list :: List<Number>) -> List<Number> block:
  var new-list = [list: ]
  for each(n from num-list):
    new-list := new-list.push(n)
  end 
  new-list
where:
  reverse-list([list: 1, 2, 3]) is [list: 3, 2, 1]
end 

fun concat-all(string-list :: List<String>) -> String block:
  var new-string = ""
  for each(string from string-list):
    new-string := new-string + string
  end 
  new-string
where: 
  concat-all([list: "hello", "world"]) is "helloworld"
end 