use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time :: String, amount :: Number
  row: "08.00", 10.50
  row: "10.15", 8.00
end 

fun is-high-value(r :: Row) -> Boolean:
  doc: "decide if the row is a high value order"
  value = get-column(r, "amount")
  if value >= 8:
    true
  else:
    false
  end
where:
  is-high-value(get-row(orders, 2))is true
  is-high-value(get-row(orders, 3)) is false
end 


fun is-morning(time :: String) -> Boolean:
  doc: "returns if its morning or not"
  if time >= "11:59":
    true 
  else:
    false
  end  
end 


fun latest(times :: String) -> String:
  doc: "returns latest morning time"
  new-table = orders.order-by("time", true)
  new-table.filter(true)
end 
