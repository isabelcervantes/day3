use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun welcome(name :: String) -> String:
  doc: "Returns a greeting addressed to the given person"
  "Welcome to class, " + name
end


fun cake(tier1 :: String, tier2 :: String) -> Image:
  doc: "creates a cake with two layers"
  t1 = rectangle(50, 60, "solid", tier1)
  t2 = rectangle(70, 60, "solid", tier2)
  above(t1, t2)
end

fun cost(shirts :: Number, string :: Number) -> Number:
  doc: "evaluates total cost of tees"
  shirt-cost = shirts * 4
  string-cost = string * 0.1
  total = shirt-cost + string-cost
  total
end