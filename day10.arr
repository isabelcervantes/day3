use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
  row: "Cloak of Invisibility",  3,    4
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end


transform-column(items, "x-coordinate", 
  lam(n :: Number) -> Number: n - 10 end)
check:
  test-table = table: x-coordinate :: Number
    row: 23
    row: -45
    row: 78
  end 
  expected-table = table: x-coordinate :: Number
    row: 13
    row: -45 - 10
    row: 78 - 10
  end 
  transform-column(test-table, "x-coordinate", 
    lam(n :: Number) -> Number: n - 10 end) is 
  expected-table
end 

table1 = table: price :: Number
  row: 45
  row: 70
  row: 20
end 

tax-list = [list: 0.05, 0.05, 0.08]

fun add-tax(t :: Table) -> Table:
  table2 = add-col(t, "tax", tax-list)
  table2
end 
  
  