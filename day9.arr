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

#helper function to compute distance 
fun distance(row :: Row) -> Number:
 doc: "computes distance using x and y coordinates"
  take x and y from row data
  x = get-column(row, x-coordinate)
     y = get-column(row, y-coordinate)
 num-sqrt(num-sqr(x) + num-sqr(y)) 
where:
 distance(get-row(items, 0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
    distance(get-row(items, 5)) is-roughly 5
end 
  
items-with-dist = build-column(items, "distance", distance)

fun sub-10(n :: Number) -> Number:
  doc: "subtracts 10"
  n - 10
where:
  sub-10(40) is 30
  sub-10(-20) is -30
  sub-10(30) is 20
end 

newT = table: itemnew :: String, x-coordinatenew :: Number, y-coordinatenew :: Number
  row: "Sword of Dawn",           2.3,  -8.7
  row: "Healing Potion",         -4.5,   1.2
  row: "Dragon Shield",           7.8,  -5.6
  row: "Magic Staff",             -0.9,   6.4
  row: "Elixir of Strength",      5.1,  -3.3
  row: "Cloak of Invisibility",  0.3,    0.4
  row: "Ring of Fire",            3.8,  -9.2
  row: "Boots of Swiftness",     -1.7,   4.9
  row: "Amulet of Protection",    8.2,  -7.4
  row: "Orb of Wisdom",          -2.9,  -2.1
  end

dis0 = distance(get-row(newT, 0))
dis1 = distance(get-row(newT, 1))
dis2 = distance(get-row(newT, 2))
dis3 = distance(get-row(newT, 3))
dis4 = distance(get-row(newT, 4))
dis5 = distance(get-row(newT, 5))
dis6 = distance(get-row(newT, 6))
dis7 = distance(get-row(newT, 7))
dis8 = distance(get-row(newT, 8))
dis9 = distance(get-row(newT, 9))

table1 = table: distances :: Number
  row: dis0
  row: dis1
  row: dis2
  row: dis3
  row: dis4
  row: dis5
  row: dis6
  row: dis7
  row: dis8
  row: dis9
end 

orderedtable = order table1:
  distances descending
end 


