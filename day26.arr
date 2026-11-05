use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L
num1 = [list: -2, 4, 6, -1]
num2 = [list: -2, -3, -4]

fun has-positive(num-list :: List<Number>) -> Boolean block:
  doc: "takes list of numbers and returns true if at least 1 is positive"
  var result = false
  for each(num from num-list):
    if num > 0:
      result := true
    else:
      result
    end 
  end 
  result 
where:
  has-positive(num1) is true 
  has-positive(num2) is false
end 

num3 = [list: 1, 2, 3, 4, 5]



fun all-increasing(num-list :: List<Number>) -> Boolean block:
  doc: "takes list of numbers returns true if each number is greater than previous"
  var past = L.get(num-list, 0)
  var result = true
  for each(n from num-list):
    if n < past block:
      result := false
      past := n
    else:
      past := n
    end 
  end 
  result
where:
  all-increasing(num3) is true 
  all-increasing(num1) is false
end 
    
