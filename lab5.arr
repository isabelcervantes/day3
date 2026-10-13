use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
# with Polina Smolyanskiy
include image
include reactors

HUSKY-URL =
  "https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/img/lab5-husky.png"
DOGHOUSE-URL =
  "https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/img/lab5-doghouse.png"
BACKGROUND-URL =
  "https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/img/lab5-background.png"

husky = scale(0.6, image-url(HUSKY-URL))
doghouse = scale(0.6, image-url(DOGHOUSE-URL))
background = image-url(BACKGROUND-URL)

BACK = 40
HEIGHT = 400
WIDTH = 750
DOGHOUSE-X = WIDTH - 120
GROUND-Y = HEIGHT - 90


house = place-image(doghouse, DOGHOUSE-X, GROUND-Y, background)
dog = place-image(husky, 100, GROUND-Y, house)

#we wouold have to change the x coordinate at placing the husky

#How can we stop the dog at the doghouse

fun draw-husky(n :: Number) -> Image:
  if n < 600:
    place-image(husky, n, GROUND-Y, house)
  else:
    house
  end
end 

fun next-x(x :: Number) -> Number:
  doc: "generate x coordinate for the next frame"
  x + 5
end


#to slow it down we have to decrease the plus 20 in next-x 

fun back-husky(x :: Number, key :: String) -> Number:
  doc: "if the key is 'b', move left by BACK; otherwise return x as given"
  if key == "b":
    x - 10
  else:
    x
  end
where: back-husky(20, "b") is 10
end

fun at-doghouse(x :: Number) -> Boolean:
  if x >= 600:
    true
  else:
    false
  end
end
  

husky-reactor = reactor:
  init: 0,
  to-draw: draw-husky,
  on-tick: next-x,
  on-key: back-husky,
  stop-when: at-doghouse
end
interact(husky-reactor)


#it seems harder to produce examples for functions that generate images
