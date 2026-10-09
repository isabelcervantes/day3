use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun strip-hash(word :: String) -> String:
  if string-substring(word, 0, 1) == "#":
    string-substring(word, 1, string-length(word))
  else:
    word 
  end 
where: 
  strip-hash("#hello") is "hello"
  strip-hash("world") is "world"
end

fun normalize(word :: String) -> String:
  string-to-lower(strip-hash(word))
where:
  normalize("#HEllo") is "hello"
  normalize("subject") is "subject"
end 

fun is-valid-tag(word :: String) -> Boolean:
  if (string-length(strip-hash(word)) > 20) or (string-length(strip-hash(word)) < 1) or (string-contains(strip-hash(word), " ")):
    false 
  else:
    true 
  end 
  
where:
  is-valid-tag("#hellothere") is true
  is-valid-tag("hi there") is false
end 

fun tag(word :: String) -> String:
  if is-valid-tag(word) == false:
    "invalid"
  else:
    "#" + normalize(word)
  end 
where:
  tag("#Cats") is "#cats"
  tag("HUSKY") is "#husky"
  tag("#") is "invalid"
end
  
fun tag-pill(word :: String) -> Image:
  if tag(word) == "invalid":
    overlay(text(tag(word), 30, "white"), rectangle(100, 40, "solid", "red"))
  else:
    overlay(text(tag(word), 30, "white"), rectangle(100, 40, "solid", "blue"))
  end 
end 