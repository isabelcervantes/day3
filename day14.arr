use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
import lists as L

discount-codes = [list: "NEWYEAR", "student", "NONE", "student", "VIP", "none"]
#Map to upper case
discount-codes-upper = L.map(lam(s :: String) -> String: string-to-upper(s) end , discount-codes)
#What are all the discount codes people are using?


fun is-valid-code(s :: String) -> Boolean:
  doc: "returns True if the code is not NONE"
  not(s == "NONE")
where:
  is-valid-code("VIP") is true
  is-valid-code("NONE") is false
end 
discount-codes-valid = L.filter(is-valid-code, discount-codes-upper)

L.distinct(discount-codes)

responses = [list: "yes", "NO", "maybe", "Yes", "no", "Maybe"]

responses-lower = L.map(lam(s :: String) -> String: string-to-lower(s) end , responses)

fun definitive(s :: String) -> Boolean:
  doc: "returns only definitive answers"
  if s == "maybe":
    false
  else:
    true
  end 
where:
  definitive("maybe") is false
  definitive("yes") is true
end 

products = 
  table: name :: String, price :: Number
    row: "laptop", 999.99
    row: "mouse", 25.50
    row: "keyboard", 75.00
    row: "monitor", 299.99
  end 

fun under-hundred(n :: Number) -> Boolean:
  doc: "returns true for prices under 100"
  if n < 100:
    true
  else:
    false
  end
where: 
  under-hundred(67) is true
  under-hundred(102) is false
end 

products-cheap = L.filter(under-hundred, get-column(products, "price"))

products-discount = L.map(lam(n :: Number) -> Number: (n - (n * 0.1)) end , products-cheap)


fruits = [list: "apple", "banana", "cherry", "date", "elderberry"]

third = L.get(fruits, 2)

fun fruits2(s :: String) -> Boolean:
  doc: "returns true if name is 5 characters or longer"
  if string-length(s) >= 5:
    true
  else:
    false
  end 
where:
  fruits2("date") is false
  fruits2("strawberry") is true
end 
long-fruits = L.filter(fruits2, fruits)