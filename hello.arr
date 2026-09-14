use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

"hello CS2000!"
circle1 = circle(5, "solid", "red")
green-sq = square(40, "solid", "green")
above(green-sq, green-sq)

above(square(40, "solid", "green"),
  square(40, "solid", "green"))

Twox-rect = above(green-sq, green-sq)
