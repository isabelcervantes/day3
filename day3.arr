use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

green-sq = square(40, "solid", "green")
rect-2x = above(green-sq, green-sq)

ortri = triangle(35, "solid", "orange")

leng = 20
shade = "blue"

squ = square(leng, "solid", shade)

rad = 10
hue1 = "yellow"
hue2 = "black"
length1 = 80
width1 = 90
small = circle(rad, "solid", hue1)
large = rectangle(length1, width1, "solid", hue2)

above(small, large)

twocircles = beside(small, small)

above(twocircles, large)

star-size = 20
star-points = 5

flag-star = star-polygon(star-size, star-points, 3, "solid", "white")

rect-length = 200
rect-width = 50

rect1 = rectangle(rect-length, rect-width, "solid", "blue")
rect2 = rectangle(rect-length, rect-width, "solid", "red")
rect3 = rectangle(rect-length, rect-width, "solid", "white")

stars = beside(flag-star, flag-star)

rect1
overlay(stars, rect2)
rect3

above(rect1, overlay(stars, rect2))

above(rect1, (above(overlay(stars, rect2), rect3)))
  