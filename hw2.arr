use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#Problem 1
fun tick(second :: Number) -> Number:
  doc: "Takes a seconds and returns the next seconds"
  if second == 59:
    0
  else:
    second + 1
  end 
where:
  tick(3) is 4
  tick(59) is 0
end 

#Problem 2
fun seconds-to-image(second :: Number) -> Image:
  doc: "returns image of where second hand is on clock"
  hand-angle = 90 - (second * 6)
  clock = circle(100, "outline", "black")
  hand = line(80, 0, "red")
  correct-hand = rotate(hand-angle, hand)
  put-image(correct-hand, 100, 100, clock)
end 
