use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun choose-hat(temp :: Number) -> String:
  doc: "returns a message describing temperature appropriate headgear"
  if temp > 70:
    "sun hat"
  else if temp > 50:
    "no hat"
  else:
    "winter hat"
  end
end 

fun add-glasses(outfit :: String) -> String:
  doc: "adds glasses to any outfit"
  outfit + ", and glasses"
end 
  
fun choose-outfit(temp1 :: Number) -> String:
  doc: "chooses outfit based on temp"
  add-glasses(choose-hat(temp1))
end 

fun choose-hat-or-visor(temp-F :: Number, has-visor :: Boolean) -> String:
  doc: "if temp is above 95 and person has visor it will tell them to wear it"
  if (temp-F > 95) and (has-visor == true):
      "wear visor" 
    else:
      choose-hat(temp-F)
    end 
end 